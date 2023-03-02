import 'package:http/http.dart' as http;

import '../constants/toc_constants.dart';
import 'package:dotenv/dotenv.dart' as dotenv;


void getTocValidation( String INType) async {

  // Creación de una solicitud de tipo "multipart/form-data"
  var request = http.MultipartRequest('POST', Uri.parse(urlToc));

  // Se agregan las variables estáticas
  request.fields.addAll({
  'apiKey': dotenv.env['apiKey'],
  'documentType': INType
  });

    //TODO: rediseñar función para recibir las imágenes
    //request.files.add(await http.MultipartFile.fromPath('foto', archivo.path));


  // Se agregan los demás archivos solicitados en en POST
  request.files.add(await http.MultipartFile.fromPath(const_id_front, '/Users/henrryramirez/Downloads/Captura de pantalla 2023-02-14 a la(s) 21.55.20.jpg'));
  request.files.add(await http.MultipartFile.fromPath(const_id_back, '/Users/henrryramirez/Downloads/Captura de pantalla 2023-02-14 a la(s) 21.55.35.jpg'));
  request.files.add(await http.MultipartFile.fromPath(const_selfie, '/Users/henrryramirez/Downloads/WhatsApp-Image-2023-02-14-at-21.50.20.jpg'));


  // Envía la solicitud y espera la respuesta
  http.StreamedResponse response = await request.send();
  
  // Lee la respuesta
  if (response.statusCode == 200) {
    print(response);
  }
  else {
    print('Error al enviar el formulario: ${response.statusCode}');
  }
}
