class Chat {
  Chat({
    this.id,
    this.receiver,
    this.sender,
    this.msg,
    this.createdAt,
  });

  String? id;
  int? receiver;
  int? sender;
  String? msg;
  String? createdAt;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        receiver: json["receiver"],
        sender: json["sender"],
        msg: json["msg"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "receiver": receiver,
        "sender": sender,
        "msg": msg,
        "createdAt": createdAt,
      };
}
