import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';


SvgPicture ScreenBackground (context){
  return SvgPicture.asset(
    "assets/images/screen-back.svg",
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}


InputDecoration AppInputDecoration(lebel) {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.green,width: 1,)
    ),
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white,width:0,)
    ),
    labelText: lebel,
    labelStyle: const TextStyle(fontSize: 17,color:Colors.grey,),


  );
}

ButtonStyle ElevatedButtonStyle(){
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    elevation: 10,
    padding:const EdgeInsets.fromLTRB(10, 17, 10, 17),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

TextStyle ButtonTextStyle(){
  return const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: Colors.white,

  );
}

DecoratedBox AppDropdownStyle(child){
  return DecoratedBox(
    decoration:BoxDecoration(
      color: Colors.white,border: Border.all(color: Colors.white,width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: child,
    ),
  );
}

SliverGridDelegateWithFixedCrossAxisCount ProductListGridViewStyle(){
  return const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 3,
    mainAxisExtent: 250,
    crossAxisSpacing:3,


  );
}