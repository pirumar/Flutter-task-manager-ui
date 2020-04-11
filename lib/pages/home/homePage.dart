import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/helper/appColors.dart';
import 'package:task_manager/helper/generalStyles.dart';
import 'package:task_manager/helper/navigationservice.dart';
import 'package:task_manager/helper/routeManager.dart';
import 'package:task_manager/pages/home/homeTopBar.dart';
import 'package:task_manager/providers/homePageProvider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  HomePageProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors().bgColor,
          elevation: 0,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.menu,
                  color: AppColors().textColorDark,
                ),
                onPressed: () {
                  navigate.navigate(profileRoute);
                })
          ],
        ),
        body: Column(
          children: <Widget>[
            HomeTopBar(),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (provider.isSelected(index))
                    return taskListItemSelected(context, index);
                  return taskListItem(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container taskListItemSelected(BuildContext context, index) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              ClipOval(
                child: Container(
                  height: 30,
                  width: 30,
                  color: AppColors().yellowColor,
                  alignment: Alignment.center,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors().yellowColor,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  width: 3,
                  color: AppColors().yellowColor,
                ),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Meeting $index",
                          style: generalStyles.getStyle(
                              generalStyles.textStyleH3,
                              size: 18.0,
                              color: AppColors().blackColor,
                              weight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        "9:00 AM",
                        style: generalStyles.getStyle(
                          generalStyles.textStyleH3,
                          size: 18.0,
                          color: AppColors().blackColor.withOpacity(.6),
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      "Discuss team tasks for the day",
                      textAlign: TextAlign.start,
                      style: generalStyles.getStyle(
                        generalStyles.textStyleH3,
                        size: 14.0,
                        color: AppColors().blackColor.withOpacity(.6),
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              for (int i = 0; i < 4; i++)
                                Positioned(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                          width: 4,
                                          color: AppColors().yellowColor,
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://picsum.photos/40/4$i"),
                                        ),
                                      ),
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  top: 0,
                                  bottom: 0,
                                  left: i == 0 ? 0.0 : 19.0 * i,
                                ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            color: AppColors().blackColor,
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors().yellowColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  taskListItem(BuildContext context, index) {
    return InkWell(
      onTap: () {
        provider.setSelected(index);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                ClipOval(
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors().bgColor,
                        border: Border.all(
                          color: AppColors().yellowColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2),
                    width: 3,
                    color: AppColors().yellowColor,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Meeting $index",
                            style: generalStyles.getStyle(
                                generalStyles.textStyleH3,
                                size: 18.0,
                                color: AppColors().blackColor,
                                weight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          "9:00 AM",
                          style: generalStyles.getStyle(
                            generalStyles.textStyleH3,
                            size: 18.0,
                            color: AppColors().blackColor.withOpacity(.6),
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Text(
                        "Discuss team tasks for the day",
                        textAlign: TextAlign.start,
                        style: generalStyles.getStyle(
                          generalStyles.textStyleH3,
                          size: 14.0,
                          color: AppColors().blackColor.withOpacity(.6),
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(bottom: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
