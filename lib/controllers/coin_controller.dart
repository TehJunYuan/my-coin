/*
  Coin Controller

  use GetX, state manager, navigation manager and dependencies manager

  Last updated: 2023_03_23
*/
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/coin_model.dart';

class CoinController extends GetxController {

  // determine the fetching is loading or not
  RxBool isLoading = true.obs;
  // list that store all the coin details
  RxList<Coin> coinsList = <Coin>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCoins();
  }
  
  // fetch the coin details from the api link
  fetchCoins() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=myr&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
      List<Coin> coins = coinFromJson(response.body);
      coinsList.value = coins;
    } finally {
      isLoading(false);
    }
  }
}