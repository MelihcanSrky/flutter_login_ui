class CorpModel {
  String? corp;
  int? dest;

  CorpModel({this.corp, this.dest});

  CorpModel.fromJson(Map<String, dynamic> json) {
    corp = json['corp'];
    dest = json['dest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['corp'] = this.corp;
    data['dest'] = this.dest;
    return data;
  }
}
