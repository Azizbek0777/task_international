class ColorsResponse {
  int? type;
  String? color;

  ColorsResponse({this.type, this.color});

  ColorsResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['type'] = type;
    data['color'] = color;
    return data;
  }
}
