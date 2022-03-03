import 'dart:async';

class validator{
  final emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData:  (email,sink){
      if(email.contains("@") && email.contains('.') ){
        sink.add(email);
      }else{
        sink.addError("Email is not valid");
      }
    }
  );


  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData:  (password,sink){
        if(password.length > 4){
          sink.add(password);
        }else{
          sink.addError("Password length should be greater than 4");
        }
      }
  );
}