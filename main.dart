import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }   
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME PAGE"),
      ),
      body: SafeArea(
        child : ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Form(
              key : formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                obscureText : true,
                decoration : const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != null && value.length < 8) {
                     return 'Enter min. 7 characters.';                
                  } else {
                    return null;
                  }
                },
              ),
            ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: (){
                   final isValidForm = GlobalKey<FormState>().currentState!.validate();
                    if (isValidForm) {
                       print("başarılı");
                    }
                }
              , child: Text("GÖNDER"))
          ],
        ),
      ),
    );
  }
}
