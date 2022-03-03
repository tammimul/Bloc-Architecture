import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:example/validator.dart';
import 'package:flutter/cupertino.dart';

class myBloc with validator{

  dispose() {
    emailController.close();
    passwordController.close();
  }
  final emailController = StreamController<String>.broadcast();
  final passwordController = StreamController<String>.broadcast();
  //input part ----- sink
  StreamSink get emailChanged => emailController.sink;
  StreamSink get passwordChanged => emailController.sink;
  //output part stream and
  //here we use StreamTransformer which is use to transform in the stream/pipe ,,,, here its working for validator
  Stream<String> get emailStream => emailController.stream.transform(emailValidator);
  Stream<String> get passwordStream => emailController.stream.transform(passwordValidator);

  Stream<bool> get submitCheck => Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);



  //we should close streamcontroller because it becomes an issue of memory licking



}


