import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Platform Channel",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlue
      ),
      home: MyPlatform(),
    );
  }
}

class MyPlatform extends StatefulWidget {
  @override
  _MyPlatformState createState() => _MyPlatformState();
}

class _MyPlatformState extends State<MyPlatform> {
  String text = "...";

  static const platform = const MethodChannel("app.alego.com/pltChannel");

  Future<void> klikBtn() async {
    String textResult;

    try{
      final String result = await platform.invokeMethod("helloWorld");
      textResult = result;
    }on PlatformException catch(e){
      print(e);
    }

    setState(() {
      text = textResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Platform Channel Flutter"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Klik", style: TextStyle(fontSize: 15),),
              onPressed: (){
                klikBtn();
              },
            ),

            SizedBox(height: 20,),

            Text(text, style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}