import 'dart:convert';
import 'package:http/http.dart' as http;

class API{

  Future<dynamic> Login({required String Name,required String PatientID})async{
    try{
      String url = "http://10.0.2.2:5000/Login/uname=$Name&uid=$PatientID";
      http.Response response = await http.get(Uri.parse(url));

      if(response.statusCode==200){
        return jsonDecode(response.body);
      }
      else{
        return "Login Failed";
      }
    }catch(e){
      return e;
    }
  }

  Future<dynamic> bpm({required String uid})async{
    try{
      String url = "http://10.0.2.2:5000/bpm/uid=$uid";
      http.Response response = await http.get(Uri.parse(url));

      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }
      else{
        return "Failed to fetch data";
      }
    }catch(e){
      return e;
    }
  }
}