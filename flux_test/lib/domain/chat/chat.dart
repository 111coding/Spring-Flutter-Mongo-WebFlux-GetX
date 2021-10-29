class Chat {
  Chat({
    this.id,
    this.receiver,
    this.sender,
    this.msg,
    this.createdAd,
  });

  String? id;
  int? receiver;
  int? sender;
  String? msg;
  String? createdAd;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        receiver: json["receiver"],
        sender: json["sender"],
        msg: json["msg"],
        createdAd: json["createdAd"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "receiver": receiver,
        "sender": sender,
        "msg": msg,
        "createdAd": createdAd,
      };
}
