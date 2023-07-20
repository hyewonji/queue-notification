import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            color: Colors.red,
            child: Row(
              textDirection: TextDirection.ltr,
              children: [
                CallNumbers(),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: Colors.green[50],
                  // child: Flexible
                )
              ]
            )
            // child: Text("Container1"),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: AdvertisementImage()
          ),
        ],
      )
    );
  }
}

class AdvertisementImage extends StatelessWidget {
  const AdvertisementImage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Image.asset('assets/flutter.png', fit: BoxFit.fill);
  }
}

class CallNumbers extends StatelessWidget {
const CallNumbers({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      color: Colors.orange,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            alignment: Alignment.center,
            color: Color(0xffFF4C32),
            child: Text('입장 안내',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 45
              )
            ),
          ),
          Row(
            textDirection: TextDirection.ltr,

          ),
          Row(
            textDirection: TextDirection.ltr,
          )
        ]
      )
    );
  }
}

class Number extends StatelessWidget {
const Number({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        // children: [
        //   // Text(),
        // ],
      ),
    );
  }
}