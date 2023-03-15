import 'package:flutter/material.dart';
import 'package:nyt/fetch/bio.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        title: Text(
          'About N_Y_T App',
          style: TextStyle(
            fontFamily: 'MeriendaOne',
            fontSize: 23,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'App Name: ${info.first.App_name}',
                  style: TextStyle(
                  fontFamily: 'Rancho',
                  fontSize: 20,
                  letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Developer's Name: ${info.first.Dev_name}",
                  style: TextStyle(
                  fontFamily: 'Rancho',
                  fontSize: 20,
                  letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Developers Occupations: ${info.first.Dev_occupation}',
                  style: TextStyle(
                  fontFamily: 'Rancho',
                  fontSize: 20,
                  letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Where to fing me: ${info.first.Dev_location}',
                  style: TextStyle(
                  fontFamily: 'Rancho',
                  fontSize: 20,
                  letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Contact: ',
                      style: TextStyle(
                        fontFamily: 'Rancho',
                        fontSize: 20,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(width: 5,),
                    SelectableText(
                      '${info.first.Dev_contact}',
                      style: TextStyle(
                        fontFamily: 'Rancho',
                        fontSize: 20,
                        letterSpacing: 1.5,
                        color: Colors.blue[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Email: ',
                      style: TextStyle(
                        fontFamily: 'Rancho',
                        fontSize: 20,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(width: 5,),
                    SelectableText(
                      '${info.first.Dev_email}',
                      style: TextStyle(
                        fontFamily: 'Rancho',
                        fontSize: 20,
                        letterSpacing: 1.5,
                        color: Colors.blue[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '"The Best Way to Learn how to code is to code"',
                    style: TextStyle(
                      fontFamily: 'Rancho',
                      fontSize: 20,
                      letterSpacing: 1.5,
                      color: Colors.brown[700],
                    ),
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        '~Someone who codes',
                        style: TextStyle(
                          fontFamily: 'Rancho',
                          fontSize: 20,
                          letterSpacing: 1.5,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}