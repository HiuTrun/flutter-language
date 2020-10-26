import 'package:Medication_App/constants.dart';
import 'package:Medication_App/widgets/button_nav_bar.dart';
import 'package:Medication_App/widgets/search_bar.dart';
import 'package:Medication_App/widgets/sesson_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: ButtonNavBar(),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.centerRight,
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                  image: AssetImage("assets/images/meditation_bg.png"),
                  fit: BoxFit.fitWidth),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.05),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "3-10 MIN Course",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text(
                          "Live happier and healthier by learning the fundamentals of mediatation and mindfulness"),
                    ),
                    SizedBox(
                      child: SearchBar(),
                      width: size.width * 0.5,
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        SessionCard(
                          isDone: true,
                          session: 1,
                        ),
                        SessionCard(
                          isDone: false,
                          session: 2,
                        ),
                        SessionCard(
                          isDone: false,
                          session: 3,
                        ),
                        SessionCard(
                          isDone: false,
                          session: 4,
                        ),
                        SessionCard(
                          isDone: false,
                          session: 5,
                        ),
                        SessionCard(
                          isDone: false,
                          session: 6,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 25),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 17),
                                blurRadius: 23,
                                spreadRadius: -13,
                                color: kShadowColor),
                          ]),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              "assets/icons/Meditation_women_small.svg"),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Basic 2",
                                style: Theme.of(context).textTheme.subtitle,
                              ),
                              Text("Start your deepen you practise"),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
