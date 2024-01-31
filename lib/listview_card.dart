import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ListViewCard extends StatelessWidget {
  const ListViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: context.sized.height * 0.3,
        width: context.sized.width * 0.9,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) => Card(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: context.sized.height * 0.15,
                  width: context.sized.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/250/150'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '10 \n JUNE',
                            textAlign: TextAlign.center,
                            style:
                                context.general.textTheme.bodyMedium?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.sized.width * 0.4,
                      ),
                      Container(
                        height: context.sized.height * 0.05,
                        width: context.sized.width * 0.12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark),
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                Text('Workshop Description'),
                Row(
                  children: [
                    Icon(Icons.location_on),
                    Text('Location'),
                  ],
                )
              ],
            ),
          ),
        ),
        // child: Card(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(15.0),
        //   ),
        //   child: Column(
        //     children: [
        //       Stack(
        //         children: [
        //           Image.network(
        //             'https://picsum.photos/250/150',
        //             fit: BoxFit.fill,
        //           ),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [

        //             ],
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
