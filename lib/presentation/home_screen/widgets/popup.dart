import 'package:adabfest/data/models/messagemodel/MessageModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/src/style.dart' as styleshtml;

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class MessagePopup extends StatelessWidget {
  final Messages model; // Define your message model

  const MessagePopup({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      contentPadding: EdgeInsets.zero, // Remove default padding
      insetPadding: EdgeInsets.symmetric(horizontal: 10.0), // Adjust horizontal inset padding
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners with radius 4
      ),
      content: SingleChildScrollView(
        child: Container(
          height: 320,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), // Match the dialog's border radius
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                CircleAvatar(
                  backgroundImage: NetworkImage(model.image!), // Image URL
                  radius: 30,
                ),
                SizedBox(height: 10),
                Text(
                  model.name!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  model.designation!,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                SizedBox(height: 10),
                Html(
                  data: model.description != '' ? model.description : 'Not Available',
                  style: {
                    "div": styleshtml.Style(
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                      fontSize: FontSize(14),
                      color: Colors.black87, // Adjust color for readability
                      lineHeight: styleshtml.LineHeight(1.5), // Improve line spacing
                    ),
                    "a": styleshtml.Style(
                      textDecoration: TextDecoration.none,
                      color: Colors.black, // Link color
                    ),
                    "p": styleshtml.Style(
                    ),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
