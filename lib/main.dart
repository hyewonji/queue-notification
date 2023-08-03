import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/queue_model.dart';
import 'package:flutter_application_1/service/api.dart';

void main() {
  ApiService.getQueueListOf(51727);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String storeName = '네모네모의 철판 대창 볶음';
  int lastNumber = 4;
  List<int> callList = [5, 6, 7, 8, 9];
  List<QueueModel> queueList = [];

  getQueueList() async {
    queueList = await ApiService.getQueueListOf(51727);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getQueueList();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 31),
                decoration: BoxDecoration(color: Color(0xff121126)),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.ltr,
                        children: [
                          Text(storeName,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 28)),
                          Text('02:24',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 28))
                        ],
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(children: [
                          CallNumbers(callList: callList),
                          QueueNumbers(queueList: queueList)
                        ])),
                    SizedBox(child: AdvertisementImage()),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.ltr,
                        children: const [
                          Text('제휴문의: 02-552-9045 / 1899-9195',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 21)),
                          Text('ver 02.24',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 21))
                        ],
                      ),
                    )
                  ],
                ))));
  }
}

class AdvertisementImage extends StatelessWidget {
  const AdvertisementImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/advertisement.png',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 574,
      fit: BoxFit.cover,
    );
  }
}

class CallNumbers extends StatelessWidget {
  const CallNumbers({Key? key, required this.callList}) : super(key: key);

  final List<int> callList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(right: 20),
          constraints: BoxConstraints(
            minWidth: 600,
          ),
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: Color(0xffFF4C32),
              ),
              height: 100,
              alignment: Alignment.center,
              child: Text('입장 안내',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.white, fontSize: 45)),
            ),
            Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                for (var i = 0; i < 4; i++)
                  CallNumberItem(
                      number: callList.length > i ? callList[i] : 0,
                      lastPhoneNumber: 1234)
              ],
            ),
            Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                for (var i = 0; i < 4; i++)
                  CallNumberItem(
                      number: callList.length > i + 4 ? callList[i + 4] : 0,
                      lastPhoneNumber: 1234)
              ],
            )
          ])),
    );
  }
}

class CallNumberItem extends StatelessWidget {
  const CallNumberItem(
      {Key? key, required this.number, required this.lastPhoneNumber})
      : super(key: key);

  final int number;
  final int lastPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 166,
        padding: EdgeInsets.symmetric(vertical: 20),
        color: Color(0xfff3f3f3),
        child: Column(children: [
          Text(number == 0 ? '' : '$number',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xffF85A40),
                  fontSize: 60,
                  fontWeight: FontWeight.w800)),
          Text(number == 0 ? '' : '$lastPhoneNumber',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 30)),
        ]),
      ),
    );
  }
}

class QueueNumbers extends StatelessWidget {
  const QueueNumbers({Key? key, required this.queueList}) : super(key: key);

  final List<QueueModel> queueList;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 256,
        color: Color(0xfff3f3f3),
        child: Column(children: [
          Container(
            height: 100,
            alignment: Alignment.center,
            color: Colors.white,
            child: Text('대기 목록',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700)),
          ),
          Column(children: [
            for (var i = 0; i < 4; i++)
              QueueNumberItem(
                  number: queueList.length > i
                      ? queueList[i].waitSequenceStatic
                      : 0)
          ]),
        ]));
  }
}

class QueueNumberItem extends StatelessWidget {
  const QueueNumberItem({Key? key, required this.number}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.only(top: 18, bottom: 20),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xff979797), width: 1))),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          Text('$number',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 39, fontWeight: FontWeight.w800)),
          Text('번',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 30,
              ))
        ],
      ),
    );
  }
}
