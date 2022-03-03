import 'package:example/Bloc.dart';
import 'package:example/page2.dart';
import 'package:example/validator.dart';
import 'package:flutter/material.dart';
class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
 final n = validator();

  submit(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> pageTwo()));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = myBloc();


    return Scaffold(
      appBar: AppBar(title: const Text("BLoC Testing"),),
      body: SingleChildScrollView(
        child: Container(
          padding:  EdgeInsets.all(17),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              StreamBuilder<String>(
                stream: bloc.emailStream,
                builder: (context, snapshot) =>
                  TextField(
                   onChanged:(s)=> bloc.emailChanged.add(s),
                  keyboardType: TextInputType.emailAddress,
                  decoration:  InputDecoration(border: OutlineInputBorder(),
                  hintText: "Email address",
                  labelText: "Email",
                      errorText: snapshot.hasError ? '${snapshot.error}' : null
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              StreamBuilder<String>(
                stream: bloc.passwordStream,
                builder: (context,snapshot)=>
                  TextField(
                    onChanged:(s)=> bloc.passwordChanged.add(s),
                  keyboardType: TextInputType.text,
                  decoration:  InputDecoration(border: OutlineInputBorder(),
                    hintText: "Password",
                    labelText: "Password",
                    errorText: snapshot.hasError ? '${snapshot.error}' : null
                    ),
                ),
              ),
              const SizedBox(height: 20,),
              StreamBuilder<bool>(
                stream: bloc.submitCheck,
                builder: (context,snapshot)=>
                 RaisedButton(onPressed: snapshot.hasData? ()=> submit(context) : null,
                  color: Colors.tealAccent,
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
