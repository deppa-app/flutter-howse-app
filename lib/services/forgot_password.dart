// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

Future<DataUser?> resetPassword(String email) async {

  final response = await http.post(
    Uri.parse('https://5b5b-190-22-118-130.ngrok-free.app/api/auth/forgot-password'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'identifier': email
    }),
  );

  if (response.statusCode == 200) {
    print('Authentication successful: ${response.body}');
    
    final responseData = jsonDecode(response.body);
        if (responseData.containsKey('error')) {
        return null;
    }
    return DataUser.fromJson(jsonDecode(response.body));

  } else {
    /* String response = await rootBundle.loadString('mocks/categories.json'); */
    print('Error de autenticación: ${response.body}');
      return null;
   /*  throw Exception(
        'Error de autenticación en servicio: ${response.statusCode}'); */
  }
}

/* import 'dart:io';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

sendMail() async {
  // Note that using a username and password for gmail only works if
  // you have two-factor authentication enabled and created an App password.
  // Search for "gmail app password 2fa"
  // The alternative is to use oauth.
  String username = 'cristhiannotifications@gmail.com';
  String password = '16122000cr';

  final smtpServer = gmail(username, password);
  // Use the SmtpServer class to configure an SMTP server:
  // final smtpServer = SmtpServer('smtp.domain.com');
  // See the named arguments of SmtpServer for further configuration
  // options.  

  // Create our message.
  final message = Message()
    ..from = Address(username, 'Your name')
    ..recipients.add('cristhiannotification@gmail.com')
    //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    //..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
  // DONE


  // Let's send another message using a slightly different syntax:
  //
  // Addresses without a name part can be set directly.
  // For instance `..recipients.add('destination@example.com')`
  // If you want to display a name part you have to create an
  // Address object: `new Address('destination@example.com', 'Display name part')`
  // Creating and adding an Address object without a name part
  // `new Address('destination@example.com')` is equivalent to
  // adding the mail address as `String`.
  final equivalentMessage = Message()
    ..from = Address(username, 'Your name 😀')
    ..recipients.add(Address('destination@example.com'))
    ..ccRecipients.addAll([Address('destCc1@example.com'), 'destCc2@example.com'])
    ..bccRecipients.add('bccAddress@example.com')
    ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = '<h1>Test</h1>\n<p>Hey! Here is some HTML content</p><img src="cid:myimg@3.141"/>'
    ..attachments = [
      FileAttachment(File('exploits_of_a_mom.png'))
        ..location = Location.inline
        ..cid = '<myimg@3.141>'
    ];

  final sendReport2 = await send(equivalentMessage, smtpServer);

  // Sending multiple messages with the same connection
  //
  // Create a smtp client that will persist the connection
  var connection = PersistentConnection(smtpServer);

  // Send the first message
  await connection.send(message);

  // send the equivalent message
  await connection.send(equivalentMessage);

  // close the connection
  await connection.close();
} */

/* import 'dart:html';

import 'package:mailer/mailer.dart';
import 'package:mailer2/mailer.dart';

main() {
  // If you want to use an arbitrary SMTP server, go with `new SmtpOptions()`.
  // This class below is just for convenience. There are more similar classes available.
  var options = new MailtrapSmtpOptions()
    ..username = 'your gmail username'
    ..password = 'your gmail password'; // Note: if you have Google's "app specific passwords" enabled,
                                        // you need to use one of those here.
                                        
  // How you use and store passwords is up to you. Beware of storing passwords in plain.

  // Create our email transport.
  var emailTransport = new SmtpTransport(options);

  // Create our mail/envelope.
  var envelope = new Envelope()
    ..from = 'cristhiannotifications@bar.com'
    //..recipients.add('someone@somewhere.com')
    //..bccRecipients.add('hidden@recipient.com')
    ..subject = 'Testing the Dart Mailer library'
    //..attachments.add(new Attachment(file: new File('path/to/file')))
    ..text = 'This is a cool email message. Whats up?'
    ..html = '<h1>Test</h1><p>Hey!</p>';

  // Email it.
  emailTransport.send(envelope)
    .then((envelope) => print('Email sent!'))
    .catchError((e) => print('Error occurred: $e'));
} */