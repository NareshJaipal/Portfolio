import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactMe extends StatefulWidget {
  const ContactMe({Key? key}) : super(key: key);

  @override
  State<ContactMe> createState() => _ContactMeState();
}

final nameController = TextEditingController();
final subjectController = TextEditingController();
final emailController = TextEditingController();
final messageController = TextEditingController();

class _ContactMeState extends State<ContactMe> {
  Future sendEmail() async {
    final name = nameController.text;
    final subject = subjectController.text;
    final email = emailController.text;
    final message = messageController.text;

    if (name.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.error_rounded, color: Colors.red),
              SizedBox(width: 5),
              Text('Name and Message fields cannot be empty'),
            ],
          ),
        ),
      );
      return;
    }

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = 'service_ajxm0ob';
    const templateId = 'template_ghlez48';
    const userId = 'oKQClBblAgsN0t7fg';
    try {
      final response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'name': name,
            'subject': subject,
            'message': message,
            'user_email': email,
          },
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(Icons.done_rounded, color: Colors.green),
                SizedBox(width: 5),
                Text('Email sent successfully'),
              ],
            ),
          ),
        );

        nameController.clear();
        subjectController.clear();
        emailController.clear();
        messageController.clear();
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print('Error sending email: $e');
    }
  }

  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '   Contact Me',
            style: TextStyle(
              color: Colors.purple,
              fontSize: 60,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Wrap(
              children: [
                Container(
                  margin: MediaQuery.of(context).size.width < 400
                      ? const EdgeInsets.all(5)
                      : MediaQuery.of(context).size.width < 650
                          ? const EdgeInsets.all(10)
                          : MediaQuery.of(context).size.width < 950
                              ? const EdgeInsets.all(20)
                              : const EdgeInsets.all(30),
                  padding: const EdgeInsets.all(10),
                  width: 380,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      const Text(
                        '  Name',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // subject
                      const Text(
                        '  Subject',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      TextField(
                        controller: subjectController,
                        decoration: InputDecoration(
                          hintText: 'Subject',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Emial
                      const Text(
                        '  Emial',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Emial',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: MediaQuery.of(context).size.width < 400
                      ? const EdgeInsets.all(5)
                      : MediaQuery.of(context).size.width < 650
                          ? const EdgeInsets.all(10)
                          : MediaQuery.of(context).size.width < 950
                              ? const EdgeInsets.all(20)
                              : const EdgeInsets.all(30),
                  padding: const EdgeInsets.all(10),
                  width: 380,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Message
                      const Text(
                        '  Message',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          hintText: 'Enter your message',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        maxLines: 8,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          sendEmail();
                        },
                        onHover: (value) {
                          if (value) {
                            Future.delayed(const Duration(milliseconds: 200),
                                () {
                              setState(() {
                                isHovering = value;
                              });
                            });
                          } else {
                            setState(() {
                              isHovering = value;
                            });
                          }
                        },
                        style: ButtonStyle(
                          foregroundColor: isHovering
                              ? MaterialStateProperty.all(Colors.white)
                              : MaterialStateProperty.all(Colors.deepPurple),
                          backgroundColor: isHovering
                              ? MaterialStateProperty.all(Colors.deepPurple)
                              : MaterialStateProperty.all(Colors.white),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Send',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
