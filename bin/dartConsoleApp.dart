import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'models/city.dart';
import 'models/country.dart';

//1 задача
Future<List<Country>> fetchCountry() async {
  final response = await http.get(Uri.parse(
      'https://masters-pages.dev.glob-com.ru/api/location/country?page=4&limit=10'));
  if (response.statusCode == 200) {
    // print(response.body);
    List<Country> countryList =[];
    // List<Country> countryList =
    // jsonDecode(response.body).map<Country>((e) => Country.fromJson(e)).toList();
      for(Map<String, dynamic> item in jsonDecode(response.body)){
        countryList.add(Country.fromJson(item));
    }
    // print(countryList);
    return countryList;
  } else {
    throw Exception('Failed to load album');
  }
}

//2 задача
Future<List<City>> fetchCity(String valueCountryCode, int page) async {
  final response = await http.get(Uri.parse(
      'https://masters-pages.dev.glob-com.ru/api/location/city?page='+ page.toString() +'&limit=10&search=&lang=en&country='+ valueCountryCode));

  if (response.statusCode == 200) {
    // print(response.body);
    List<City> cityList =[];
    // List<City> cityList =
    //     jsonDecode(response.body).map<City>((e) => City.fromJson(e)).toList();
    for(Map<String, dynamic> item in jsonDecode(response.body)){
      cityList.add(City.fromJson(item));
  }
    return cityList;
  } else {
    throw Exception('Failed to load album');
  }
}

void main() {

  result();

}

void result() async {

  print('Available Country:');

  List<Country> result = await fetchCountry();

  for(int i=0; i<result.length; i++){
    Country obj = result[i];
    print((i+1).toString() + ':' + obj.country_name);
  }

  print('Enter Country(from 1 to 10):');

  int number = int.parse(stdin.readLineSync());
  int indexNumber = number - 1;
  Country countryCode = result[indexNumber];
  String valueCountryCode = countryCode.country_code;
  //Задаю переменную page для парсинга
  int page = 1;
  List<City> resultCity = await fetchCity(valueCountryCode, page);

  for(City item in resultCity){
    print(item.name);
  }


  //
  while(resultCity.length !=0) {
    print('Введите Y если хотите просмотреть еще города');
    String yes = stdin.readLineSync();
    if(yes =='y'){
      page = page + 1;
      resultCity = await fetchCity(valueCountryCode, page);
      for(City item in resultCity){
        print(item.name);
      }
    }else{
      print('Вы отказались');
      break;
    }
  }
}


