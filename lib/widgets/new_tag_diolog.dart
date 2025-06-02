import 'package:awesome_notes/core/constant.dart';
import 'package:flutter/material.dart';

class NewTagDiolog extends StatefulWidget {
  const NewTagDiolog({
    super.key,
  });

  @override
  State<NewTagDiolog> createState() => _NewTagDiologState();
}

class _NewTagDiologState extends State<NewTagDiolog> {
  late final TextEditingController  tagcontroller ; 
  late final GlobalKey<FormFieldState> tagkey;
  @override
  void initState() {
    super.initState();
    tagcontroller = TextEditingController();
    tagkey = GlobalKey();
  }
  @override
  void dispose() {
    tagcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Add Tags',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 24,),
        TextFormField(
          key: tagkey,
          controller: tagcontroller,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Add tag(<16 characters)',
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primary, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
          ),
          validator: (value) {
            if (value!.trim().isEmpty) {
              return 'No tags added';
            }else if (value.trim().length > 16) {
              return 'Tag must be less than 16 characters';
            }
            return null;
          },
          onChanged: (newValue){
            tagkey.currentState?.validate();
          },
        ),
        SizedBox(height: 24,),
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 2),
                color: black,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: ElevatedButton(
            onPressed: () {
               if (tagkey.currentState?.validate() ?? false) {
                 Navigator.pop(context, tagcontroller.text.trim());
               }
            },
            child: Text('Add',style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              foregroundColor: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: primary, width: 2),
              ),
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap
            ),
          ),
        )
      ],
    );
  }
}

