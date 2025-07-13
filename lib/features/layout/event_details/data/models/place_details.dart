import 'package:geocoding/geocoding.dart';

class PlaceDetails {
  final String name;
  final String street;
  final String isoCountryCode;
  final String country;
  final String postalCode;
  final String administrativeArea;
  final String subAdministrativeArea;
  final String locality;
  final String subLocality;
  final String thoroughfare;
  final String subThoroughfare;

  PlaceDetails({
    required this.name,
    required this.street,
    required this.isoCountryCode,
    required this.country,
    required this.postalCode,
    required this.administrativeArea,
    required this.subAdministrativeArea,
    required this.locality,
    required this.subLocality,
    required this.thoroughfare,
    required this.subThoroughfare,
  });


  PlaceDetails.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        street = json['street'],
        isoCountryCode = json['isoCountryCode'],
        country = json['country'],
        postalCode = json['postalCode'],
        administrativeArea = json['administrativeArea'],
        subAdministrativeArea = json['subAdministrativeArea'],
        locality = json['locality'],
        subLocality = json['subLocality'],
        thoroughfare = json['thoroughfare'],
        subThoroughfare = json['subThoroughfare'];  





        toJson() => {
          'name': name,
          'street': street,
          'isoCountryCode': isoCountryCode,
          'country': country,
          'postalCode': postalCode,
          'administrativeArea': administrativeArea,
          'subAdministrativeArea': subAdministrativeArea,
          'locality': locality,
          'subLocality': subLocality,
          'thoroughfare': thoroughfare,
          'subThoroughfare': subThoroughfare,
        };



        PlaceDetails.fromPlaceMark(Placemark placeMark) : this(
          name: placeMark.name ?? '',
          street: placeMark.street ?? '',
          isoCountryCode: placeMark.isoCountryCode ?? '',
          country: placeMark.country ?? '',
          postalCode: placeMark.postalCode ?? '',
          administrativeArea: placeMark.administrativeArea ?? '',
          subAdministrativeArea: placeMark.subAdministrativeArea ?? '',
          locality: placeMark.locality ?? '',
          subLocality: placeMark.subLocality ?? '',
          thoroughfare: placeMark.thoroughfare ?? '',
          subThoroughfare: placeMark.subThoroughfare ?? '',
        );
}
