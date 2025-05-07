
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../core/dio.dart';
import '../data/models.dart';

class HomeViewModel extends ChangeNotifier{

  bool _isLoading = false;

  bool get isLoading=>_isLoading;

  SimpleCountryModel? countriesData;
  List<SimpleCountryModel> countriesNewData=[];

  setLoading(bool loadingState){
    _isLoading =loadingState;
    notifyListeners();
  }

  Future<List<SimpleCountryModel>> fetchCountries() async {
    setLoading(true);

    try {
      // Initialize Dio instance
      // Dio dio = Dio();

      // Fetch the data from the API (replace `Urls.baseUrl` with the actual URL)
      final response = await dio.get('https://restcountries.com/v3.1/all'); // Example URL

      // Ensure the response is successful and then parse the data
      if (response.statusCode == 200) {
        // Parse the response into a list of SimpleCountryModel
        List<SimpleCountryModel> countries = List<SimpleCountryModel>.from(
            response.data.map((x) => SimpleCountryModel.fromJson(x))
        );

        countriesNewData=countries;
        setLoading(false);
        return countries;  // Return the list of SimpleCountryModel
      } else {
        print('Failed to load data');
        return [];  // Return empty list in case of error
      }
    } catch (e) {
      print('Error: $e');
      return [];  // Return empty list in case of exception
    }

  }
}
