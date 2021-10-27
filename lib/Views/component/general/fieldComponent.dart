import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/formConfig.dart';
import 'package:bestfranchise/Views/component/general/backgroundIconComponent.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class FieldComponent extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final int maxLines;
  final int maxLength;
  final TextInputType keyboardType;
  final void Function() onTap;
  final void Function() iconPrefix;
  final void Function(String code) onTapCountry;
  final bool isPhone;
  FieldComponent(
      {this.controller,
      this.labelText,
      this.maxLines,
      this.maxLength,
      this.keyboardType = TextInputType.text,
      this.onTap,
      this.iconPrefix,
      this.isPhone = false,
      this.onTapCountry});

  @override
  _FieldComponentState createState() => _FieldComponentState();
}

class _FieldComponentState extends State<FieldComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Container(
        width: double.infinity,
        padding: scale.getPadding(0, 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xFF1E2188))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.isPhone)
              Container(
                width: scale.getWidth(20),
                child: CountryCodePicker(
                  onChanged: (CountryCode e) {
                    widget.onTapCountry(e.dialCode.replaceAll('+', ''));
                    // countryCode="${e.dialCode.replaceAll('+', '')}";
                  },
                  initialSelection: 'ID',
                  favorite: ['+62', 'ID'],
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: true,
                  textStyle: Theme.of(context).textTheme.headline2,
                ),
              ),
            Expanded(
              child: renderField(context: context),
            ),
            if (widget.onTap == null)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.controller.text.length}/${widget.maxLength}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: ColorConfig.greyPrimary),
                ),
              )
            else if (widget.iconPrefix != null)
              InkWell(
                onTap: () {},
                child: BackgroundIconComponent(
                    child: Icon(
                  FontAwesome5Solid.copy,
                  size: Theme.of(context).textTheme.headline3.fontSize,
                  color: ColorConfig.greyPrimary,
                )),
              )
            else
              widget.onTap != null
                  ? InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: Theme.of(context).textTheme.headline3.fontSize,
                        color: ColorConfig.greyPrimary,
                      ),
                    )
                  : null,
          ],
        ));
  }

  Widget renderField({BuildContext context}) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return TextFormField(
      style: Theme.of(context).textTheme.headline2,
      controller: widget.controller,
      maxLines: widget.maxLines,
      readOnly: widget.onTap != null,
      decoration: widget.isPhone
          ? InputDecoration(
              border: InputBorder.none,
              hintStyle: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: Color(0xFFD0CACA)),
              hintText: widget.labelText)
          : InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: widget.labelText,
              border: InputBorder.none,
              hintStyle: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: Color(0xFFD0CACA)),
              hintText: widget.labelText),
      textInputAction: TextInputAction.done,
      keyboardType: widget.keyboardType,
      onTap: () {
        if (widget.onTap != null) widget.onTap();
        if (widget.iconPrefix != null) widget.iconPrefix();
      },
      onChanged: (e) {
        setState(() {});
      },
      inputFormatters: <TextInputFormatter>[
        if (widget.keyboardType == TextInputType.number)
          WhitelistingTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(widget.maxLength),
      ],
    );
  }
}
