import 'package:flutter/material.dart';
import 'package:quinproc/homePage.dart';
import 'get_post.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _name = TextEditingController();
  TextEditingController _Uid = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String _result="";

  API obj = new API();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFBDED5),Colors.white],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _name,
                      decoration: InputDecoration(
                        hintText: "Enter Name",
                        labelText: "Name",
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter something";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _Uid,
                      decoration: InputDecoration(
                          hintText: "Enter Patient ID",
                          labelText: "Patient ID",
                          border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter something";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 40),
                    child: ElevatedButton(
                      onPressed: ()async{
                        print("SUBMIT");
                        if(_formKey.currentState!.validate()){

                          dynamic x = await obj.Login(Name: _name.text,PatientID: _Uid.text);
                          print(x);
                          if(x["Login"]=="true"){
                            setState(() {
                              _result = "Login Successful";
                              Navigator.push(context, MaterialPageRoute(builder: (context){return Home(Name: this._name.text,Uid: this._Uid.text,);}));
                            });
                          }
                          else{
                            setState(() {
                              _result = "Login Failed";
                            });
                          }
                        }
                        else{
                          setState(() {
                            _result = "Try Again";
                          });
                        }
                      },
                      child: Text("SUBMIT",style: TextStyle(fontSize: 15),),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                        shape: StadiumBorder()
                      ),
                    ),
                  ),
                  Text(_result,style: TextStyle(fontSize: 20.0),),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
