import 'package:flutter/material.dart';
import 'package:nnz/src/config/config.dart';

class PurchaseButton extends StatelessWidget {
  const PurchaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Config.yellowColor),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      '인증',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Config.yellowColor),
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(color: Config.yellowColor),
                        child: Text(
                          '나눔 받기',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Config.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(color: Config.yellowColor),
          child: Text(
            '나눔 받기',
            style: TextStyle(
              fontSize: 14.0,
              color: Config.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
