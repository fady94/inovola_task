import 'dart:convert';
class Trip {
  final int id;
  final String title;
  final List<String> img;
  final String interest;
  final String price;
  final String dateTime;
  final String address;
  final String trainerName;
  final String trainerImg;
  final String trainerInfo;
  final String occasionDetail;
  final String latitude;
  final String longitude;
  final bool isLiked;
  final bool isSold;
  final bool isPrivateEvent;
  final bool hiddenCashPayment;
  final int specialForm;
  final String questionnaire;
  final String questExplanation;
  final List<ReserveTypes> reserveTypes;
  String arabicDate;



  Trip({this.id,this.title,this.img,this.interest,this.price,this.dateTime,this.address,this.trainerName,this.trainerInfo,
    this.trainerImg,this.occasionDetail,this.latitude,this.longitude,this.isLiked,this.isSold,this.isPrivateEvent,
    this.hiddenCashPayment,this.specialForm,this.questionnaire,this.questExplanation,this.reserveTypes,this.arabicDate
  });


  factory Trip.fromJson(Map<String, dynamic> jsonData) {
    // Iterable l = json.decode(jsonData['reservTypes'].toString());
    return Trip(
      id: jsonData['id'],
      title: jsonData['title'],
      img: List.from(jsonData['img']),
      interest: jsonData['interest'],
      price: jsonData['price'].toString(),
      dateTime: jsonData['date'],
      arabicDate: null,
      address: jsonData['address'],
      trainerName: jsonData['trainerName'],
      trainerInfo: jsonData['trainerInfo'],
      trainerImg: jsonData['trainerImg'],
      occasionDetail: jsonData['occasionDetail'],
      latitude: jsonData['latitude'],
      longitude: jsonData['longitude'],
      isLiked: jsonData['isLiked'],
      isSold: jsonData['isSold'],
      isPrivateEvent: jsonData['isPrivateEvent'],
      hiddenCashPayment: jsonData['hiddenCashPayment'],
      specialForm: jsonData['specialForm'],
      questionnaire: jsonData['questionnaire'],
      questExplanation: jsonData['questExplanation'],
      // reserveTypes: List.from(ReserveTypes.fromJson(json.decode(l)))
      // reserveTypes: (l) as List).map((i) =>
      //         MyModel.fromJson(i)).toList();
      reserveTypes: List< ReserveTypes >.from(jsonData['reservTypes'].map((i) => ReserveTypes.fromJson(i)))
    );
  }

}



class ReserveTypes {
  final int id;
  final String name;
  final int count;
  final String price;


  ReserveTypes({
    this.id, this.name, this.count, this.price
  });


  factory ReserveTypes.fromJson(Map<String, dynamic> json) {

    return ReserveTypes(
      id: json['id'],
      name: json['name'],
      count: json['count'],
      price: json['price'].toString(),
    );
  }

}