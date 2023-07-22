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
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 32),
      decoration: BoxDecoration(color: Color(0xff121126)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: MediaQuery.of(context).size.width,
            child: Row(
              textDirection: TextDirection.ltr,
              children: const [
                CallNumbers(),
                QueueNumbers()
              ]
            )
            // child: Text("Container1"),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
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
    return Image.asset('assets/advertisement.png', fit: BoxFit.fill);
  }
}

class CallNumbers extends StatelessWidget {
  const CallNumbers({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: MediaQuery.of(context).size.width * 0.5,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: const [
              CallNumberItem(number: 20, lastPhoneNumber: 1234),
              CallNumberItem(number: 20, lastPhoneNumber: 1234),
              CallNumberItem(number: 20, lastPhoneNumber: 1234),
              CallNumberItem(number: 20, lastPhoneNumber: 1234)
            ],
          ),
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: const [
              CallNumberItem(number: 20, lastPhoneNumber: 1234),
              CallNumberItem(number: 20, lastPhoneNumber: 1234),
              CallNumberItem(number: 20, lastPhoneNumber: 1234),
              CallNumberItem(number: 20, lastPhoneNumber: 1234)
            ],
          )
        ]
      )
    );
  }
}

class CallNumberItem extends StatelessWidget {
  const CallNumberItem({
    Key? key,
    required this.number,
    required this.lastPhoneNumber
  }) : super(key: key);

  final double number;
  final int lastPhoneNumber;

  @override
  Widget build(BuildContext context){
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        color: Color(0xfff3f3f3),
        child: Column(
          children: [
            Text(
              '$number',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffF85A40),
                fontSize: 60,
                fontWeight: FontWeight.w800
              )
            ),
            Text(
              '$lastPhoneNumber',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30
              )
            ),
          ]
        ),
      )
    );
  }
}

class QueueNumbers extends StatelessWidget {
const QueueNumbers({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      color: Color(0xfff3f3f3),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            alignment: Alignment.center,
            color: Colors.white,
            child: Text('대기 목록',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 45
              )
            ),
          ),
          Column(
            children: const [
              QueueNumberItem(number: 3333),
              QueueNumberItem(number: 3334),
              QueueNumberItem(number: 3335),
              QueueNumberItem(number: 3336)
            ],
          ),
        ]
      )
    );
  }
}

class QueueNumberItem extends StatelessWidget {
  const QueueNumberItem({ Key? key, required this.number }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.only(top: 18, bottom: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff979797),
            width: 1
          )
        )
      ),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          Text(
            '$number', 
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 39,
              fontWeight: FontWeight.w800
            )
          ),
          Text(
            '번',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 30,
            )
          )
        ],
      ),
    );
  }
}