import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covidapp/constant.dart';
import 'package:covidapp/widgets/header.dart';
import 'package:covidapp/widgets/counter.dart';

import 'package:covidapp/info.dart';

void main() => runApp(CovidApp());

class CovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'COVID-19',
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: 'Poppins',
          textTheme: TextTheme(
            // ignore: deprecated_member_use
            body1: TextStyle(color: kBodyTextColor),
          ),
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Header(
            image: 'assets/icons/doctor1.svg',
            textTop: 'Please',
            textBottom: 'stay home.',
            icon: 'assets/icons/information.svg',
          ),
          Container(
            height: 60,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xFFE5E5E5)),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                    value: 'Romania',
                    items: ['Romania', 'Netherlands']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Case Update\n',
                            style: kTitleTextStyle,
                          ),
                          TextSpan(
                            text: 'Updated on July 18',
                            style: TextStyle(
                              color: kTextLightColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See details',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: kShadowColor,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Counter(
                          number: 33699,
                          title: 'Infected',
                          color: kInfectedColor),
                      Counter(
                          number: 2468, title: 'Deaths', color: kDeathColor),
                      Counter(
                          number: 22488,
                          title: 'Recovered',
                          color: kRecoverColor),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Spread of Virus',
                      style: kTitleTextStyle,
                    ),
                    Text(
                      'See details',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 178,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 30,
                        color: kShadowColor,
                      )
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/map.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
