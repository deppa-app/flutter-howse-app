import UIKit
import Flutter
import AutoCapture
import TOCLiveness

var _result: FlutterResult?
var navigationController: UINavigationController?
var controller: FlutterViewController?

struct Metodo {
    static let capturaFront:String = "capturaFront"
    static let capturaBack:String = "capturaBack"
    static let capturaLiveness:String = "capturaLiveness"
}


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var navigationController: UINavigationController?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        controller = window?.rootViewController as! FlutterViewController
        let iosTocChannel = FlutterMethodChannel(name: "plugin_toc.ios",binaryMessenger: controller!.binaryMessenger)
        
        iosTocChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // Note: this method is invoked on the UI thread.
            if (call.method == Metodo.capturaFront || call.method == Metodo.capturaBack) {
                
                var documentType : String?
                var sessionId : String?
                _result = result
                
                if let argumentos = call.arguments as? Array<Any>,
                   let arg_document_type = argumentos[0] as? String{
                    documentType = arg_document_type
                } else {
                    result(FlutterError.init(code: "errorSetdocumentType", message: "data or format error for documentType", details: nil))
                }
                
                if let argumentos = call.arguments as? Array<Any>,
                   let arg_session_id = argumentos[1] as? String{
                    sessionId = arg_session_id
                } else {
                    result(FlutterError.init(code: "errorSetsessionId", message: "data or format error for sessionId", details: nil))
                }
                
                let viewCtrl = ViewControllerCapture(metodo: call.method, documentType: documentType!, sessionId: sessionId!)
                self.navigationController?.pushViewController(viewCtrl, animated: true)
                
            } else if(call.method == Metodo.capturaLiveness){
                
                var sessionId : String?
                _result = result
                
                if let argumentos = call.arguments as? Array<Any>,
                   let arg_session_id = argumentos[0] as? String{
                    sessionId = arg_session_id
                } else {
                    result(FlutterError.init(code: "errorSetsessionId", message: "data or format error for sessionId", details: nil))
                }
                
                let viewCtrlLiveness = ViewControllerLiveness(sessionId: sessionId!)
                self.navigationController?.pushViewController(viewCtrlLiveness, animated: true)
                
            } else {
                result(FlutterMethodNotImplemented)
                return
            }
            
        }) // End handler channel method
        
        GeneratedPluginRegistrant.register(with: self)
        navigationController = UINavigationController(rootViewController: controller!)
        navigationController?.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}


class ViewControllerCapture: UIViewController,captureDelegate {
    
    var autocap : captureInterface!
    var metodo : String?
    var session_id : String?
    var documentType : String?
    
    init(metodo mt: String, documentType dt: String, sessionId sid: String ) {
        
        self.metodo = mt
        self.documentType = dt
        self.session_id = sid
        
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.metodo = nil
        self.documentType=nil
        self.session_id = nil
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.autocap = captureInterface()
        self.autocap.setDelegate(del: self)
        self.autocap.setSessionId(sid: self.session_id!)
        if(metodo == Metodo.capturaFront) {
            self.autocap.captureFront(currentController: self, type: self.documentType!)
        } else {
            self.autocap.captureBack(currentController: self, type: self.documentType!)
        }
    }
    
    func finished(status: Int, captured_token: String) {
        print("\(status)  \(captured_token)")
        if(status == 200){
            // self.img.image = self.autocap.getUIImage()
            _result!(["token":captured_token])
            
            DispatchQueue.main.async {
                // Terminate UI ios and back to flutter part
                self.dismiss(animated: true, completion: nil)
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
}



class ViewControllerLiveness: UIViewController , livenessDelegate{
    
    var livenessInterface : Liveness!
    var session_id : String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.livenessInterface = Liveness()
        self.livenessInterface.setDelegate(del: self)
        self.livenessInterface.setSessionId(session_id_in: self.session_id!)
        self.livenessInterface.initLiveness(currentController: self)
    }
    
    init(sessionId sid: String) {
        
        self.session_id = sid
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.session_id = nil
    }
    
    func finished(status: Int, liv_token: String) {
        print("\(status)  \(liv_token)")
        if(status == 200){
            // self.livenessInterface.getSelfieImage()
            _result!(["token":liv_token])
            
            DispatchQueue.main.async {
                // Terminate UI ios and back to flutter part
                self.dismiss(animated: true, completion: nil)
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
}
