import 'package:flutter/material.dart';

getMotherScreenSignUpTextField(String name) {
  return TextField(
    decoration: InputDecoration(
      filled: true,
      fillColor: const Color(0xffFF4081).withOpacity(0.5),
      hintText: name,
      hintStyle: const TextStyle(
          color: Colors.white
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      border: const OutlineInputBorder(
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffFF4081), width: 1.0),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffFF4081), width: 2.0),
      ),
    ),
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white,
    ),
  );
}