import 'package:flutter/material.dart';

class Tela extends StatelessWidget {

  GlobalKey<FormState> _key = new GlobalKey();
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Tela"),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          margin: new EdgeInsets.all(15),
          child: new Form(
            key: _key,
            autovalidate: validate,
            child: buildScreen(context),            
          ),
        ),
      ),
    );
  }

  Widget buildScreen(BuildContext context){
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Nome'),
          maxLength: 50,
          validator: validateField,
        ), 
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          maxLength: 70,
          validator: validateField,
        ), 
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Telefone'),
          keyboardType: TextInputType.phone,
          maxLength: 15,
          validator: validatePhone,
        ), 
        new RaisedButton(
          onPressed: () {sendFormulario(); },
          child: Text('Enviar'),
        ),
        new RaisedButton(
          onPressed: () {Navigator.pop(context); },
          child: Text('Voltar'),
        ) 
      ],
    );
  }

  void sendFormulario() {
    if (_key.currentState.validate()){
      
    }
  }

  String validateField(String value){
    if (value.length == 0){
      return "Informe campo!";
    }
    return null;
  }

  String validatePhone(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o Campo";
    } else if(value.length != 10){
      return "O celular deve ter 10 dígitos";
    }else if (!regExp.hasMatch(value)) {
      return "O número do celular deve conter apenas dígitos";
    }
    return null;
  }
  
}
