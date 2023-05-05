/*
  existing packages 
    - get
    - material
  controller
    - coin_controller
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/coin_controller.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});
  final CoinController controller = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            // page header
            const CryptocurrencyTitle(),
            // cryptocurrency lists
            CryptocurrencyList(controller: controller),
          ],
        ),
      ),
    );
  }
}

/*
  CryptocurrencyTitle widgets
  Function: display the page header
  Last updated: 15 Apr 2023
*/
class CryptocurrencyTitle extends StatelessWidget {
  const CryptocurrencyTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16.0,
      ),
      child: Text(
        "Today's Cryptocurrency",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.grey[350],
        ),
      ),
    );
  }
}

/*
  CryptocurrencyList widgets
  Function: display the list
  Last updated: 15 Apr 2023
*/
class CryptocurrencyList extends StatelessWidget {
  const CryptocurrencyList({
    super.key,
    required this.controller,
  });
  // declare the controller from CoinController
  final CoinController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                // if fetching, show the circular progress indicator
                // else, show the list
                () => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 50,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      // coin image
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade400,
                                              offset: const Offset(3, 4),
                                              blurRadius: 8,
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Image.network(controller
                                              .coinsList[index].image),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          // Coins name
                                          Text(
                                            controller.coinsList[index].name,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey[50],
                                            ),
                                            softWrap: true,
                                          ),
                                          Text(
                                            '${controller.coinsList[index].priceChangePercentage24H.toStringAsFixed(4)}%',
                                            style: TextStyle(
                                              fontSize: 18,
                                              // if the price change is positive than color is green else is red
                                              color: (controller
                                                          .coinsList[index]
                                                          .priceChange24H >
                                                      0)
                                                  ? Colors.green
                                                  : Colors.red,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '\$${controller.coinsList[index].currentPrice}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[50],
                                        ),
                                      ),
                                      Text(
                                        controller.coinsList[index].symbol
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
