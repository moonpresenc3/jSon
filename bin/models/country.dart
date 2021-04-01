class Country {
  final String country_code;
  final String country_name;
  final int geonameid;

  Country({this.country_code, this.country_name, this.geonameid});

  factory Country.fromJson(Map<String, dynamic> mapFromJson) {
    return Country(
        country_code: mapFromJson['country_code'],
        country_name: mapFromJson['country_name'],
        geonameid: mapFromJson['geonameid'],
    );
  }
}