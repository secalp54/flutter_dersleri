import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class VeriGirisi extends StatefulWidget {
  VeriGirisi({Key? key}) : super(key: key);

  @override
  State<VeriGirisi> createState() => _VeriGirisiState();
}

class _VeriGirisiState extends State<VeriGirisi> {
  String _mail = '';
  String _pass = '';
  String _mesaj='';
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _mailController=TextEditingController(text: "alp@g.com");
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_mesaj),
                TextFormField(
                  controller:_mailController ,      
                  //focusNode: FocusNode(),
                  //autovalidateMode: AutovalidateMode.always,
                  validator: ((value) {
                    if (EmailValidator.validate(value ?? '')) {
                      return null;
                    } else
                      return "Lütfen geçerli bir mail adresi yazın";
                  }),
                  onSaved: (value) {
                    _mailController.text = value!;
                  },
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      // label: Text("Adınızı Giriniz.."),
                      labelText: "Mail Adresiniz",
                      hintText: "mail@gmail.com",
                      // prefix:Icon(Icons.person) ,
                      prefixIcon: Icon(Icons.mail),
                      // suffixIcon: Icon(Icons.edit)
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  //focusNode: FocusNode(),
                  //autovalidateMode: AutovalidateMode.always,
                  validator: ((value) {
                    if ((value?.length ?? 0) < 8) {
                      return "8 karakterden az giriniz";
                    }
                  }),
                  onSaved: (value) {
                    _pass = value!;
                  },
                  obscureText: true,

                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      // label: Text("Adınızı Giriniz.."),
                      labelText: "Şifreniz",
                      hintText: "Şifrenizi Giriniz.",
                      // prefix:Icon(Icons.person) ,
                      prefixIcon: Icon(Icons.password),
                      // suffixIcon: Icon(Icons.edit)
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print("mail adresi: ${_mailController.value.text} şifre : $_pass");
                      }
                    },
                    child: Text("Giriş Yap"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
