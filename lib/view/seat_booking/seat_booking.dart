import 'package:flutter/material.dart';
import 'package:task/utils/color.dart';
import 'package:task/view/widgets/buttons.dart';

import '../../model/movie.dart';
import 'book_seat.dart';

class SeatBooking extends StatelessWidget {
  final Movie data;
  const SeatBooking({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(data.title ?? ""),
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(0.0), // Set an empty space at the bottom
          child: Text(
            'In theaters ${data.releaseDate}',
            style: const TextStyle(color: blueColor),
          ), // Empty widget or Text widget without text
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text('Date',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          color: index == 0 ? blueColor : Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              '6 march',
                              style: TextStyle(
                                  color:
                                      index == 0 ? Colors.white : Colors.black),
                            )),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '12:30',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '  Cinetech Hall 1',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(child: Image.asset("assets/MapMobile.png")),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'From',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: '  50\$',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' or',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: '  2500 bonus',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
             SizedBox(
                width: double.infinity,
                child: ElevatedButtonW(
                    ontap: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookSeat( data: data,),
                        ),
                      );
                    },
                    buttonText: "Select Seats")),
          ],
        ),
      ),
    );
  }
}
