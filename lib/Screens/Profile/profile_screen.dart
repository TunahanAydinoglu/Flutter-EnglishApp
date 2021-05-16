import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profile/profile_view_model.dart';
import 'package:flutter_auth/core/base/base_state.dart';
import 'package:flutter_auth/models/user_model.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:numberpicker/numberpicker.dart';

class ProfileScreen extends StatefulWidget {
  final String token;
  final User user;

  const ProfileScreen({Key key, this.token, this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseState<ProfileScreen> {
  // final _controller = AdvancedSwitchController();
  int _currentValue = 1;
  final _profileViewModel = ProfileViewModel();
  var _controller = AdvancedSwitchController();

  @override
  void initState() {
    _profileViewModel.getUserInformation(widget.token);
    _controller = AdvancedSwitchController(widget.user.isShowMemory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/profilebg.jpeg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  dynamicWidth(0.01), dynamicHeight(0.025), 0, 0),
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_sharp,
                    color: themeData.accentColor,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            Container(
              height: dynamicHeight(0.9),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "WELCOME",
                          style: TextStyle(
                              color: themeData.accentColor,
                              fontSize: 25,
                              letterSpacing: 6,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: dynamicHeight(0.04),
                        ),
                        Text(
                          widget.user.name.toUpperCase(),
                          style: TextStyle(
                              color: themeData.accentColor,
                              fontSize: 28,
                              letterSpacing: 3.5,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: dynamicHeight(0.065),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99),
                                color: Colors.red,
                                image: DecorationImage(
                                    image:
                                        NetworkImage(widget.user.profileImage),
                                    fit: BoxFit.fill),
                              ),
                              width: dynamicWidth(0.4),
                              height: dynamicWidth(0.4),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 23, right: 23, top: 30),
                      child: Container(
                        height: dynamicHeight(0.4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Text(
                                    "Email: ",
                                    style: TextStyle(
                                        color: themeData.primaryColor,
                                        fontSize: 18,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    widget.user.email,
                                    style: TextStyle(
                                        color: themeData.primaryColor,
                                        fontSize: 17,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Text(
                                    "Let's show the memorized words?",
                                    style: TextStyle(
                                        color: themeData.primaryColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: dynamicWidth(0.08),
                                  ),
                                  AdvancedSwitch(
                                    controller: _controller,
                                    activeColor: themeData.primaryColor,
                                    inactiveColor: Colors.grey,
                                    activeChild: Text('ON'),
                                    inactiveChild: Text('OFF'),
                                    borderRadius: BorderRadius.all(
                                        const Radius.circular(15)),
                                    width: 60.0,
                                    height: 25.0,
                                    enabled: true,
                                    disabledOpacity: 0.5,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: dynamicWidth(0.6),
                                    child: Text(
                                      "How many times do we have to show the words?",
                                      maxLines: 2,
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: themeData.primaryColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      NumberPicker(
                                        value: _currentValue,
                                        itemHeight: 25,
                                        itemWidth: 30,
                                        haptics: false,
                                        selectedTextStyle: TextStyle(
                                            color: themeData.primaryColor,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                        minValue: 1,
                                        maxValue: 10000,
                                        axis: Axis.horizontal,
                                        onChanged: (value) {
                                          setState(() {
                                            _currentValue = value;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: dynamicHeight(0.06),
                                    width: dynamicWidth(0.3),
                                    decoration: BoxDecoration(
                                        color: themeData.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    child: TextButton(
                                        onPressed: () {
                                          print(_controller.value);
                                          print(_currentValue);
                                        },
                                        child: Text(
                                          "Save Changes",
                                          style: TextStyle(
                                              color: themeData.accentColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
