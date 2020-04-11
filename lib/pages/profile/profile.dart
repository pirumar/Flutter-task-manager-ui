import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:task_manager/helper/appColors.dart';
import 'package:task_manager/helper/generalStyles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors().bgColor,
          elevation: 0,
          leading: Container(
            width: 80,
            alignment: Alignment.centerRight,
            child: ClipOval(
              child: Image.network(
                "https://picsum.photos/40/40",
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.menu,
                  color: AppColors().textColorDark,
                ),
                onPressed: () {})
          ],
        ),
        backgroundColor: AppColors().profileBg,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors().bgColor,
                Color(0xFFf1f1f1),
                Color(0xFFcccccc),
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "Hello, Jessika!",
                textAlign: TextAlign.start,
                style: generalStyles.getStyle(
                  generalStyles.textStyleH3Bold,
                  size: 16.0,
                  color: AppColors().blackColor.withOpacity(.6),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "You've got\ntasks today!",
                    textAlign: TextAlign.start,
                    style: generalStyles.getStyle(
                      generalStyles.textStyleH3Bold,
                      size: 26.0,
                      color: AppColors().blackColor,
                      height: 1.4,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, bottom: 3),
                    child: Icon(
                      Icons.speaker_notes,
                      color: AppColors().yellowColor,
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors().searchBgColor,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: -10,
                    ),
                    icon: Icon(Icons.search, color: AppColors().textColorDark),
                    hintText: "Search something...",
                    hintStyle: generalStyles.getStyle(
                      generalStyles.textStyleH3,
                      size: 16.0,
                      spacing: 1.1,
                      color: AppColors().textColorLight,
                    ),
                  ),
                  cursorColor: AppColors().textColorDark,
                  style: generalStyles.getStyle(
                    generalStyles.textStyleH3,
                    size: 16.0,
                    spacing: 1.1,
                    color: AppColors().textColorDark,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2.0),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      color: AppColors().textColorDark.withOpacity(.18),
                      blurRadius: 13.5,
                      offset: new Offset(0.0, 0.0),
                    ),
                  ],
                ),
                height: 80,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 22,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Project time tracker",
                          textAlign: TextAlign.start,
                          style: generalStyles.getStyle(
                              generalStyles.textStyleH3Bold,
                              size: 18.0,
                              color: AppColors().blackColor,
                              weight: FontWeight.w600),
                        ),
                        Text(
                          "You can start tracking",
                          textAlign: TextAlign.start,
                          style: generalStyles.getStyle(
                            generalStyles.textStyleH3Bold,
                            size: 14.0,
                            color: AppColors().textColorLight,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors().yellowColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: AppColors().blackColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "My Tasks",
                textAlign: TextAlign.start,
                style: generalStyles.getStyle(
                  generalStyles.textStyleH3Bold,
                  size: 26.0,
                  color: AppColors().blackColor,
                  height: 1.4,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 40,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: taskCategory.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: index == 0 ? 0 : 15,
                      ),
                      child: Text(
                        taskCategory[index],
                        style: generalStyles.getStyle(
                          generalStyles.textStyleH3Bold,
                          size: 16.0,
                          color: index == 0
                              ? AppColors().yellowColor
                              : AppColors().textColorLight,
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Container(
                height: 240,
                margin: EdgeInsets.only(bottom: 30),
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      height: 240,
                      margin:
                          EdgeInsets.symmetric(horizontal: index == 0 ? 0 : 12),
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: index == 1
                                ? AppColors().blackColor
                                : Colors.white,
                            width: 2.0),
                        color:
                            index == 1 ? AppColors().blackColor : Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: AppColors().textColorDark.withOpacity(.18),
                            blurRadius: 4.5,
                            offset: new Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Meeting $index",
                                  style: generalStyles.getStyle(
                                    generalStyles.textStyleH3,
                                    size: 18.0,
                                    color: index == 1
                                        ? Colors.white
                                        : AppColors().textColorDark,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Icon(Icons.more_vert)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Make a landing page and mobile app",
                            textAlign: TextAlign.start,
                            style: generalStyles.getStyle(
                              generalStyles.textStyleH3,
                              size: 14.0,
                              height: 1.4,
                              color: AppColors().textColorLight,
                              weight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: Stack(
                              children: <Widget>[
                                for (int i = 0; i < 4; i++)
                                  Positioned(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.white,
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
                                    left: i == 0 ? 0.0 : 22.0 * i,
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: 44,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Progress",
                                      textAlign: TextAlign.start,
                                      style: generalStyles.getStyle(
                                        generalStyles.textStyleH3,
                                        size: 14.0,
                                        height: 1.4,
                                        color: index == 1
                                            ? Colors.white
                                            : AppColors().textColorDark,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "44%",
                                      textAlign: TextAlign.start,
                                      style: generalStyles.getStyle(
                                        generalStyles.textStyleH3,
                                        size: 14.0,
                                        height: 1.4,
                                        spacing: .3,
                                        color: index == 1
                                            ? Colors.white
                                            : AppColors().yellowColor,
                                        weight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: LinearPercentIndicator(
                                    percent: .3,
                                    backgroundColor: index == 1
                                        ? Colors.white.withOpacity(.5)
                                        : AppColors()
                                            .yellowColor
                                            .withOpacity(.5),
                                    progressColor: index == 1
                                        ? Colors.white
                                        : AppColors().yellowColor,
                                    lineHeight: 6,
                                  ),
                                )
                              ],
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
        ),
      ),
    );
  }
}

List<String> taskCategory = ["Recently", "Today", "Upcoming", "Later"];
