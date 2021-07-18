import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ChildComplete extends StatefulWidget {
  final jsonData;
  ChildComplete({Key? key, this.jsonData}) : super(key: key);

  @override
  _ChildCompleteState createState() => _ChildCompleteState();
}

class _ChildCompleteState extends State<ChildComplete> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Insurance App'),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Select Child Plan'),
            FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'age',
                      decoration: InputDecoration(
                        labelText:
                            'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
                      ),
                      //onChanged: Onc,
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.numeric(context),
                        FormBuilderValidators.max(context, 70),
                      ]),
                      keyboardType: TextInputType.number,
                    ),
                    FormBuilderTextField(
                      name: 'age',
                      decoration: InputDecoration(
                        labelText:
                            'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
                      ),
                      //onChanged: Onc,
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.numeric(context),
                        FormBuilderValidators.max(context, 70),
                      ]),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
