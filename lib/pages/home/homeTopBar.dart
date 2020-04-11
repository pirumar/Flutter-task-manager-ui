import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/helper/appColors.dart';
import 'package:task_manager/helper/generalStyles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "April 10, 2020",
                    style: generalStyles.getStyle(
                      generalStyles.textStyleH3Bold,
                      size: 16.0,
                      color: AppColors().textColorLight,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Today",
                    style: generalStyles.getStyle(
                      generalStyles.textStyleH3Bold,
                      size: 18.0,
                      color: AppColors().blackColor,
                      weight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: 140,
                  height: 57,
                  color: AppColors().blackColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text(
                        "Add task",
                        style: generalStyles.getStyle(
                          generalStyles.textStyleH3Bold,
                          size: 14.0,
                          color: Colors.white,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 58,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 30,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var date = DateTime.now().add(Duration(days: index));
                var day = new DateFormat('dd').format(date);
                var dayOfStr = new DateFormat('EE').format(date);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        dayOfStr,
                        style: generalStyles.getStyle(
                          generalStyles.textStyleH3Bold,
                          size: 16.0,
                          color: index == 0
                              ? AppColors().yellowColor
                              : AppColors().textColorLight,
                        ),
                      ),
                      Text(
                        day,
                        style: generalStyles.getStyle(
                          generalStyles.textStyleH3Bold,
                          size: 16.0,
                          color: index == 0
                              ? AppColors().yellowColor
                              : AppColors().textColorDark,
                        ),
                      ),
                      ClipOval(
                        child: Container(
                          height: 5,
                          width: 5,
                          color: index == 0
                              ? AppColors().yellowColor
                              : AppColors().bgColor,
                        ),
                      )
                    ],
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
