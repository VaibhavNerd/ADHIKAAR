import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipr/pages/account_page.dart';
import 'package:ipr/pages/activity_page.dart';
import 'package:ipr/pages/home_page.dart';
import 'package:ipr/pages/new_post_page.dart';
import 'package:ipr/pages/search_page.dart';
import 'package:ipr/theme/colors.dart';
import 'package:ipr/util/bottom_navigation_bar_json.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F9),
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: indexPage,
      children: [
        HomePage(),
        SearchPage(),
        NewPostPage(),
        AgentSearchPage(),
        AccountPage(),
      ],
    );
  }

  Widget getBottomNavigationBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border:
            Border(top: BorderSide(width: 1, color: bgDark.withOpacity(0.3))),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(icons.length, (index) {
              return IconButton(
                onPressed: () {
                  setState(() {
                    indexPage = index;
                  });
                },
                icon: SvgPicture.asset(
                  indexPage == index
                      ? icons[index]['active']
                      : icons[index]['inactive'],
                  width: 25,
                  height: 25,
                ),
              );
            })),
      ),
    );
  }
}
