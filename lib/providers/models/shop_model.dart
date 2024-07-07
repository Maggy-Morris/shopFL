class ShopModel {
  String? id;
  String? email;
  double? latitude;
  double? longitude;

  String? shopImage;
  String? name;

  String? shopCategories;
  String? shopDescription;
  String? shopEmail;
  // String? requestDescription;
  // String? userId;
  // String? status;
  // DateTime? requestDate;
  // String? serviceId;
  // String? message;

  ShopModel({
    this.id,
    // this.serviceId,
    this.email,
    // this.userId,
    // this.status,
    // this.message,
    // this.requestDate,
    // this.requestDescription,
    this.shopEmail,
    this.shopCategories,
    this.latitude,
    this.longitude,
    this.shopDescription,
    this.shopImage,
    this.name,
  });

  ShopModel.fromJson(Map<String, dynamic> json, this.id) {
    email = json['email'];
    id = json['id'];

    // serviceId = json['service_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    shopCategories = json['shopCategories'];
    shopDescription = json['shopDescription'];
    shopImage = json['shopImage'];
    name = json['name'];
    shopEmail = json['shopEmail'];
    //   requestDescription = json['request_description'];
    //   userId = json['user_id'];
    //   status = json['status'];
    //   message = json['message'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'service_id': id,
      'latitude': latitude,
      'longitude': longitude,
      'shopCategories': shopCategories,
      'shopDescription': shopDescription,
      'shopImage': shopImage,
      'name': name,
      "shopEmail": shopEmail,
      // "request_description": requestDescription,
      // 'user_id': userId,
      // 'status': status,
      // 'requestDate': requestDate,
      // 'message': message,
    };
  }
}
