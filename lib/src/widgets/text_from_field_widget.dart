import 'package:flutter/material.dart';

class TextFromFieldWidget extends StatefulWidget {
  bool password;
  String email;
  IconData icon;
  TextInputType inputType;
  TextFromFieldWidget({this.email, this.icon, this.inputType, this.password});
  String value = '';
  void setValue(String value){
    this.value = value;
  }
  String getValue(){
    return this.value;
  }
  @override
  _TextFromFieldWidgetState createState() => _TextFromFieldWidgetState();
}

class _TextFromFieldWidgetState extends State<TextFromFieldWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextFormField(
            obscureText: widget.password,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: widget.email,
                icon: Icon(
                  widget.icon,
                  color: Colors.black38,
                ),
                labelStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sans',
                    letterSpacing: 0.3,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600)),
            keyboardType: widget.inputType,
            onChanged: (dataForm) {
              setState(() {
                widget.setValue(dataForm);
              });
            },
          ),
        ),
      ),
    );
  }
}
