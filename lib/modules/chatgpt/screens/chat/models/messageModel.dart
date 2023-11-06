class MessageModel {
  String? messageid;
  String? sender;
  String? text;
  DateTime? createdon;

  MessageModel({this.messageid, this.sender, this.text, this.createdon});

  MessageModel.fromMap(Map<String, dynamic> map) {
    messageid = map["messageid"];
    sender = map["sender"];
    text = map["text"];
    createdon = map["createdon"].toDate();
  }

  Map<String, dynamic> toMap() {
    return {
      "messageid": messageid,
      "sender": sender,
      "text": text,
      "createdon": createdon
    };
  }
}
