class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? image;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.image,
  });

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['species'] = this.species;
    data['iamge'] = this.image;
    return data;
  }
}
