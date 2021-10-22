import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:flutter/material.dart';

class NoDataComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(StringConfig.imgLocal+"nodata.png"),
          Text("No data available",style: Theme.of(context).textTheme.headline1,)
        ],
      ),
    );
  }
}
