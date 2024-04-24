import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class CosmosPackageUsage extends StatelessWidget {
  const CosmosPackageUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CosmosScroller(
          scrollDirection: Axis.horizontal,
          children: [
            TextButton(
              onPressed: () {
                CosmosAlert.showCustomAlert(
                  context,
                  const Text("Hello World!"),
                );
              },
              child: const Text("data"),
            ),
            TextButton(
              onPressed: () {
                CosmosAlert.showCustomAlert(
                  context,
                  const Text("Hello World!"),
                );
              },
              child: const Text("data"),
            ),
            TextButton(
              onPressed: () {
                CosmosAlert.showCustomAlert(
                  context,
                  const Text("Hello World!"),
                );
              },
              child: const Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}
