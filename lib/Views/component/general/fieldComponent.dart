import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class FieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int maxLines;
  final int maxLength;
  final void Function() onTap;
  FieldComponent({this.controller,this.labelText,this.maxLines,this.maxLength,this.onTap});

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Container(
      padding: scale.getPadding(0,2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFF1E2188))
      ),
      child: renderField(context: context)
    );
  }

  Widget renderField({BuildContext context}){
    return TextFormField(
      style: Theme.of(context).textTheme.headline2,
      controller: this.controller,
      maxLines: this.maxLines,
      maxLength: this.maxLength,
      readOnly: this.onTap!=null,
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.headline2.copyWith(color: ColorConfig.greyPrimary),
        labelText: this.labelText,
        border: InputBorder.none,
        suffixIcon: this.onTap!=null?IconButton(
          onPressed:(){},
          icon: Icon(Icons.arrow_drop_down),
        ):null,
      ),
      textInputAction: TextInputAction.done,
      onTap: (){
        if(this.onTap!=null) this.onTap();
        else print("ontap");
      },
    );
  }
}
