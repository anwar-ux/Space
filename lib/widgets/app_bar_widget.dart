import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const SizedBox(
          height: 150,
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '5 Stories > > >',
                  style: TextStyle(fontSize: 25),
                ),
                Constants.kWidth20,
                Icon(Icons.search),
                Constants.kWidth5,
                Icon(Icons.call),
                Constants.kWidth5,
                Icon(Icons.star),
                Constants.kWidth5,
                Icon(Icons.notifications),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
