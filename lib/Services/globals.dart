import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String baseURL ="http://192.168.108.201:8000/api/";
const Map<String, String> headers = {"Content-Type": "aplication/json"};

errorSnackBar(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor:Colors.red,
      content:Text(text),
    duration: const Duration(seconds: 1),
    )
  );
}