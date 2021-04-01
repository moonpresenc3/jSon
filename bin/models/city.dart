class City {
  final int geonameid;
  final String name;
  final double latitude;
  final double longitude;

  City({this.geonameid, this.name, this.latitude, this.longitude});

  factory City.fromJson(Map<String, dynamic> mapFromJson) {
    return City(
        geonameid: mapFromJson['geonameid'],
        name: mapFromJson['name'],
        latitude: mapFromJson['latitude'],
        longitude: mapFromJson['longitude']);
  }
}