class Kisi{
  int? id;
  String? ad;
  String? soz;
  Kisi(this.id,this.ad,this.soz);
  Map<String,dynamic> toMap() {
    return{
      "id": id,
      "ad": ad,
      "soz": soz,
    };
  }
  Kisi.fromMap(Map<String, dynamic> sozluk) {
    id = sozluk["id"];
    ad = sozluk["ad"];
    soz = sozluk["soz"];
  }
}