
import 'dart:async';
import 'dart:convert';

import 'package:crud_2/Utility.dart';
import 'package:http/http.dart' as http;


Future<List> ProductGetRequest() async {
    var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
    var header = {"Content-Type":"application/json"};

    var response = await http.get(URL,headers: header);

    var ResultCode = response.statusCode;
    var ResultBody = json.decode(response.body);

    if(ResultCode == 200 && ResultBody['status']=="success"){
        SuccessToast("request success");
        return ResultBody['data'];
    }else{
        ErrorToast("request fail, try again..");
        return[];
    }
}





Future<bool>ProductPostRequest(FormValues)async{

   var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
   var header = {"Content-Type":"application/json"};
   var body =  json.encode(FormValues);

   var response =  await http.post(URL,headers: header,body: body);

   var ResultCode = response.statusCode;
   var ResultBody = json.decode(response.body);

   if(ResultCode == 200 && ResultBody['status']=="success"){
       SuccessToast("request success");
       return true;
   }else{
       ErrorToast("request fail, try again..");
       return false;
   }

}


Future<bool>ProductDeleteRequest(id) async {
    var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/$id");
    var header = {"Content-Type":"application/json"};
    var response = await http.get(URL,headers: header);

    var ResultCode = response.statusCode;
    var ResultBody = json.decode(response.body);
    if(ResultCode ==200 && ResultBody['status']=="success"){
        SuccessToast("request success");
        return true;
    }else{
        ErrorToast("request failed, try again");
        return false;

    }

}

Future<bool>ProductUpdateRequest(FormValues,id)async{

  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/$id");
  var postBody = json.encode(FormValues);
  var postHeader = {"Content-Type":"application/json"};

  var response =  await http.post(URL,headers:postHeader,body: postBody);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("request success");
    return true;
  }else{
    ErrorToast("request fail! try again..");
    return false;
  }
}
