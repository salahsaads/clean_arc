import 'package:flutter/material.dart';
import '../../core/constant/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/textFont_app.dart';


class CustomTextField extends StatefulWidget {
  final String? hint;
  final String? upperText;
  final TextInputType? type;
  final Function(String?)? onChange;
  final String? Function(String?)? valid;
  final String? icon;
  final Widget? eIcon;
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final VoidCallback? onTap;
  final String? dIcon;
  final  FocusNode? focus;
  final bool? read;
  final bool? withBorder;
  final int? line;
  final double? hor;
  final double? ver;
  final double? radius;
  final double? height;
  final Color? fillColor;
  final String? errorKey;
  final String? countryCode;
  final Map<String,dynamic>? errors;
  final EdgeInsetsGeometry? suffixIconPadding;
  final void Function(String?)? onCountryChanged;

  CustomTextField({ this.hint, this.onChange, this.onTap,
    this.icon, this.type,  this.valid,  this.controller, this.focus,
    this.dIcon, this.read, this.eIcon, this.hor, this.fillColor, this.line, this.ver,
    this.textDirection, this.errorKey, this.errors, this.upperText, this.withBorder, this.height, this.radius, this.onCountryChanged, this.countryCode, this.suffixIconPadding,});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? countryValue;
  bool _isHidden = true;
  void _visibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.upperText != null)
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 10),
            child: Text(widget.upperText!,
                style: TextStyle(fontFamily: TextFontApp.regularFont,
                    color: AppColors.hintColor,
                    fontSize: 14)),
          ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:widget.hor==null?
          0:widget.hor!,vertical:widget.ver==null?0:widget.ver!),
          child:TextFormField(
            onTap: widget.onTap,
            validator: widget.valid,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            cursorColor: AppColors.white,
            focusNode: widget.focus,
            readOnly: widget.read==true?true:false,
            maxLines: widget.line??1,
            obscureText: widget.icon !=null  ? _isHidden : false,
            keyboardType: widget.type,
            onChanged: (widget.onChange),
            style: TextStyle(color: AppColors.white,fontSize: 16),
            decoration: InputDecoration(
              hintText: widget.hint,
              errorText: _getErrorText(widget.errorKey??""),
              // prefixIconConstraints:BoxConstraints(
              //   minWidth: 20,
              //   minHeight: 10
              // ),
              // prefixIcon: 
              //     widget.dIcon!=null?
              // Padding(
              //   padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 0),
              //   child: Image.asset(
              //     widget.dIcon!,height: 20,width: 20,),
              // ):SizedBox(width: 8,),
               
              suffixIcon: widget.icon != null
                  ? IconButton(
                onPressed: _visibility,
                splashRadius: 2,
                alignment: Alignment.center,
                icon: _isHidden
                    ? Image.asset(AppIcons.disEye,height: 18,color: AppColors.primary,)
                    : Image.asset(AppIcons.eye,height: 14,color: AppColors.primary,),
              ): widget.eIcon!=null? Padding(
                padding: widget.suffixIconPadding ?? EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: widget.eIcon,
              ):null,
                fillColor:widget.fillColor??AppColors.lightBlack,
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical:16,horizontal: 20),
                hintStyle: TextStyle(fontSize: 14,color:
                AppColors.hintColor, fontFamily: TextFontApp.regularFont,),
              enabledBorder:OutlineInputBorder (
                borderSide: BorderSide(width: 0, color: AppColors.scaffoldBackground),
                borderRadius: BorderRadius.circular(widget.radius??30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0, color: AppColors.darkBackground),
                borderRadius: BorderRadius.circular(widget.radius??30),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width:0),
                 borderRadius: BorderRadius.circular(widget.radius??30),

              ),

            ),
          ),
        ),
      ],
    );
  }
  String? _getErrorText(String key) {
    if (widget.errors != null) {
      return widget.errors!.keys.contains(key) ? widget.errors![key][0] : null;
    } else {
      return null;
    }
  }
}
