class QueueModel {
  final waitSequenceStatic, phone;
  QueueModel.fromJson(Map<String, dynamic> json)
      : waitSequenceStatic = json['waitSequenceStatic'],
        phone = json['guest']['phone'];
}
