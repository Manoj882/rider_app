class VehicleDetailsModel {
  String vehicleType;
  String vehicleModel;
  String registrationNumber;
  String vehicleRegistrationPhoto;
  String licenseNumber;
  String licenseFrontPhoto;
  String licenseBackPhoto;
  String vehiclePhoto;

  VehicleDetailsModel({
    required this.vehicleType,
    required this.vehicleModel,
    required this.registrationNumber,
    required this.vehicleRegistrationPhoto,
    required this.licenseNumber,
    required this.licenseFrontPhoto,
    required this.licenseBackPhoto,
    required this.vehiclePhoto,
  });
}

List<VehicleDetailsModel> listOfVehicle = [
  VehicleDetailsModel(
    vehicleType: 'Bike',
    vehicleModel: 'Pulsar NS 200',
    registrationNumber: '125ASD123',
    vehicleRegistrationPhoto: 'assets/images/vehicle_registration_photo.png',
    licenseNumber: 'BAKHA1234SD',
    licenseFrontPhoto: 'assets/images/license_front.jpg',
    licenseBackPhoto: 'assets/images/license_back.jpg',
    vehiclePhoto: 'assets/images/pulsar.jpg',
  ),
];
