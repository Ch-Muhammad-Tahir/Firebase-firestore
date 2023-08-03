class Item {
  String title = "";
  String content = "";
  String id = "";
  String imgUrl = "";
  Item.fromJson(Map<dynamic, dynamic> json) {
    if (json["title"] is String || json["title"] is int) {
      title = json["title"].toString();
    }
    if (json["content"] is String || json["content"] is int) {
      content = json["content"].toString();
    }
    if (json["id"] is String || json["id"] is int) {
      id = json["id"].toString();
    }
    if (json["imgUrl"] is String || json["imgUrl"] is int) {
      imgUrl = json["imgUrl"].toString();
    }
  }
}
