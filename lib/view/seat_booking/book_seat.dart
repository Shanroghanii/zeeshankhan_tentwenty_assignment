import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/utils/color.dart';
import 'package:task/utils/constant.dart';

import '../../model/movie.dart';

class BookSeat extends StatelessWidget {
  final Movie data;
  const BookSeat({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    // Get the size of the screen
    Size screenSize = mediaQueryData.size;
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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildSeatContainer(screenSize), _buildBottomArea()],
      ),
    );
  }

  Padding _buildBottomArea() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AssetsPath.seatType),
          SizedBox(
            height: 15,
          ),
          Image.asset(AssetsPath.row),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AssetsPath.totalPrice),
              Image.asset(AssetsPath.proceedButton),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildSeatContainer(Size screenSize) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.4,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 48.0),
                    child: Image.asset(
                      AssetsPath.number,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Image.asset(
                    AssetsPath.seats,
                    fit: BoxFit.fill,
                  )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  shape: const StadiumBorder(),
                  color: Colors.white,
                  child:
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                ),
                Card(
                  shape: const StadiumBorder(),
                  color: Colors.white,
                  child: IconButton(
                      onPressed: () {}, icon: Icon(CupertinoIcons.minus)),
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            const Divider(
              height: 10,
              thickness: 8,
            ),
          ],
        ),
      ),
    );
  }
}
