import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';

class SingleChildButton extends StatelessWidget {
  const SingleChildButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize:
                  Size(context.sized.width * 0.9, context.sized.height * 0.06)),
          onPressed: () {},
          child: Text(
            'Create',
            style: context.general.textTheme.headlineMedium,
          )),
      // floatingActionButton: Container(
      //   width: context.sized.width * 0.9,
      //   child: FloatingActionButton.extended(
      //     onPressed: () {},
      //     label: Text(
      //       'Create',
      //     ),
      //     elevation: 10,
      //   ),
      // ),
      // bottomNavigationBar: Eleva,
      appBar: AppBar(),
      // body: SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //       Text(
      //         'text',
      //         style: context.general.textTheme.displayLarge,
      //       ),
      //     ],
      //   ),
      // ),
      body: ListView.builder(
        itemCount: 200,
        itemBuilder: (BuildContext context, int index) {
          return const Text('text');
        },
      ),
    );
  }
}
