

class Fields {
  Coding? coding;
  Coding? designs;
  Coding? marketing;
  Coding? management;

  Fields({this.coding, this.designs, this.marketing, this.management});

  Fields.fromJson(Map<String, dynamic> json) {
    coding =
        json['coding'] != null ? new Coding.fromJson(json['coding']) : null;
    designs =
        json['Designs'] != null ? new Coding.fromJson(json['Designs']) : null;
    marketing = json['marketing'] != null
        ? new Coding.fromJson(json['marketing'])
        : null;
    management = json['management'] != null
        ? new Coding.fromJson(json['management'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coding != null) {
      data['coding'] = this.coding!.toJson();
    }
    if (this.designs != null) {
      data['Designs'] = this.designs!.toJson();
    }
    if (this.marketing != null) {
      data['marketing'] = this.marketing!.toJson();
    }
    if (this.management != null) {
      data['management'] = this.management!.toJson();
    }
    return data;
  }
}

class Coding {
  String? details;
  String? title;
  List<Areas>? areas;

  Coding({this.details, this.title, this.areas});

  Coding.fromJson(Map<String, dynamic> json) {
    details = json['details'];
    title = json['title'];
    if (json['areas'] != null) {
      areas = <Areas>[];
      json['areas'].forEach((v) {
        areas!.add(new Areas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['details'] = this.details;
    data['title'] = this.title;
    if (this.areas != null) {
      data['areas'] = this.areas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Areas {
  String? area;
  String? youtube;
  String? text;

  Areas({this.area, this.youtube, this.text});

  Areas.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    youtube = json['youtube'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    data['youtube'] = this.youtube;
    data['text'] = this.text;
    return data;
  }
}
