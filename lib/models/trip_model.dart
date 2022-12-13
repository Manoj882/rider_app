// To parse this JSON data, do
//
//     final tripModel = tripModelFromJson(jsonString);

import 'dart:convert';

List<TripModel> tripModelFromJson(String str) =>
    List<TripModel>.from(json.decode(str).map((x) => TripModel.fromJson(x)));

String tripModelToJson(List<TripModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TripModel {
  TripModel({
    required this.tripId,
    required this.date,
    required this.location,
    required this.destination,
    required this.userImage,
    required this.price,
    required this.rating,
    required this.userName,
    required this.totalDistance,
    required this.fairPrice,
    required this.travelTime,
    required this.surge,
  });

  String tripId;
  String date;
  String location;
  String destination;
  String userImage;
  int price;
  double rating;
  String userName;
  double totalDistance;
  double fairPrice;
  String travelTime;
  double surge;

  factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
        tripId: json["tripId"],
        date: json["date"],
        location: json["location"],
        destination: json["destination"],
        userImage: json["userImage"],
        price: json["price"],
        rating: json["rating"],
        userName: json["userName"],
        totalDistance: json["totalDistance"],
        fairPrice: json["fairPrice"],
        travelTime: json["userName"],
        surge: json["surge"],
      );

  Map<String, dynamic> toJson() => {
        "tripId": tripId,
        "date": date,
        "location": location,
        "destination": destination,
        "userImage": userImage,
        "price": price,
        "rating" : rating,
        'userName' : userName,
        'totalDistance' : totalDistance,
        'fairPrice' : fairPrice,
        'travelTime' : travelTime,
        'surge' : surge,

      };
}

List<TripModel> tripList = [
  TripModel(
    tripId: '#AIDQGR',
    date: 'Feb 03, 2022, 9: 36 AM',
    location: 'Learning Realm International School, Kalank',
    destination: 'Chakupath, Pulchok',
    userImage: 'assets/images/avatar.png',
    price: 49,
    rating: 5,
    userName: 'Utaam Tamang',
    totalDistance: 24.04,
    fairPrice: 149,
    travelTime: '40 min',
    surge: 09,
  ),
  TripModel(
    tripId: '#AIDPM',
    date: 'Jan 03, 2022, 10: 12 AM',
    location: 'Kapan, Kathmandu',
    destination: 'BG Mall, Gangabu',
    userImage: 'assets/images/ram.jpg',
    price: 78,
    rating: 3.5,
    userName: 'Rashila Acharya',
    totalDistance: 21.04,
    fairPrice: 120,
    travelTime: '30 min',
    surge: 10,
  ),
  TripModel(
    tripId: '#QMSTER',
    date: 'Mar 18, 2022, 11: 49 AM',
    location: 'Chabahil, Kathmandu',
    destination: 'Sallaghari, Bhaktapur',
    userImage: 'assets/images/krishna.png',
    price: 85,
    rating: 2,
    userName: 'Mohan Basnet',
    totalDistance: 12.04,
    fairPrice: 50,
    travelTime: '10 min',
    surge: 12,
  ),
  TripModel(
    tripId: '#BFWETN',
    date: 'Apr 01, 2022, 8: 15 AM',
    location: 'Patan, Lalitpur',
    destination: 'Gaushala, Kathmandu',
    userImage: 'assets/images/shiva.jpg',
    price: 85,
    rating: 1.5,
    userName: 'Prem Rai',
    totalDistance: 30.04,
    fairPrice: 160,
    travelTime: '60 min',
    surge: 13,
  ),
  TripModel(
    tripId: '#CJTJGNG ',
    date: 'May 05, 2022, 3: 10 PM',
    location: 'Sinamangal, Kathmandu',
    destination: 'Sundarijal, kathmandu',
    userImage: 'assets/images/bishnu.jpg',
    price: 150,
    rating: 4,
    userName: 'Sabita Karki',
    totalDistance: 27.04,
    fairPrice: 142,
    travelTime: '35 min',
    surge: 5,
  ),
];
