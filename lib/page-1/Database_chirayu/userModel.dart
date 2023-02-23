// import 'package:flutter/material.dart';

/*
    step 1: creating model
 */

class UserModel
{
  final String? id;
  final String gender;
  final String weight;

  const UserModel({
    this.id,
    required this.gender,
    required this.weight,
});

  toJson(){
    return {
      "Gender": gender,
      "Weight": weight,
    };
  }



}