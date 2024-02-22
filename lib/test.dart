import 'package:flutter/material.dart';
import 'package:image_field/image_field.dart';
import 'package:image_field/linear_progress_indicator_if.dart';

class UploadLocalImageForm extends StatefulWidget {
  const UploadLocalImageForm({super.key, required this.title});

  final String title;

  @override
  State<UploadLocalImageForm> createState() => _UploadLocalImageFormState();
}

class _UploadLocalImageFormState extends State<UploadLocalImageForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //...
            // textfield
            // checkbox
            // datefield
            // ....

            //Local image upload
            ImageField(
              onSave: (List<ImageAndCaptionModel>? imageAndCaptionList) {
                //you can save imageAndCaptionList using local storage
                //or in a simple variable
              },
            ),

            //....
            //Submit button
            //....
          ],
        ),
      ),
    );
  }
}
