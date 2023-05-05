/*
  imported packages
    - get
  existing packages
    - material
  controller 
    - coin_controller
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/coin_controller.dart';

class Top5List extends StatelessWidget {
  Top5List({super.key});
  final CoinController controller = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: const [
              Text(
                'Most popular',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade400,
                                          offset: const Offset(3, 4),
                                          blurRadius: 8,
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.network(
                                          controller.coinsList[index].image),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.coinsList[index].name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[200],
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '${controller.coinsList[index].priceChangePercentage24H.toStringAsFixed(2)} %',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: (controller.coinsList[index]
                                                        .priceChange24H >
                                                    0)
                                                ? Colors.green
                                                : Colors.red,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$${controller.coinsList[index].currentPrice.round()}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[200],
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    controller.coinsList[index].symbol
                                        .toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
