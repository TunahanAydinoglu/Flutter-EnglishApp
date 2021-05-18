import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_auth/Screens/Profile/profile_view_model.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/core/base/base_state.dart';
import 'package:flutter_auth/models/user_model.dart';
import 'package:numberpicker/numberpicker.dart';

class ProfileScreen extends StatefulWidget {
  final String token;
  final User user;

  const ProfileScreen({Key key, this.token, this.user}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseState<ProfileScreen> {
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
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     colors: [gradientStartColor, gradientEndColor],
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //   ),
              // ),
              color: Colors.white,
              child: TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(milliseconds: 1500),
                  builder: (context, value, child) {
                    return ShaderMask(
                      shaderCallback: (rect) {
                        return RadialGradient(
                                radius: value * 5,
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                  Colors.transparent,
                                  Colors.transparent
                                ],
                                stops: [0.0, 0.55, 0.6, 1.0],
                                center: FractionalOffset(0.95, 0.1))
                            .createShader(rect);
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        gradientStartColor,
                                        gradientEndColor
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Column(children: [
                                    SizedBox(
                                      height: 65.0,
                                    ),
                                    CircleAvatar(
                                      radius: 65.0,
                                      backgroundImage: NetworkImage(
                                          widget.user.profileImage),
                                      backgroundColor: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(widget.user.name.toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        )),
                                    SizedBox(
                                      height: 70.0,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 50),
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ListTile(
                                                leading: Text(
                                                  "Email : ",
                                                  style: TextStyle(
                                                      fontSize: 17.0,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.white),
                                                ),
                                                trailing: Text(
                                                  widget.user.email,
                                                  style: TextStyle(
                                                      fontSize: 17.0,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Divider(
                                                color: Colors.black,
                                              ),
                                              ListTile(
                                                  leading: Text(
                                                    "Let's show the\nmemorized words ?",
                                                    style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: Colors.white),
                                                  ),
                                                  trailing: AdvancedSwitch(
                                                    controller: _controller,
                                                    activeColor:
                                                        themeData.primaryColor,
                                                    inactiveColor: Colors.grey,
                                                    activeChild: Text('ON'),
                                                    inactiveChild: Text('OFF'),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            const Radius
                                                                .circular(15)),
                                                    width: 60.0,
                                                    height: 25.0,
                                                    enabled: true,
                                                    disabledOpacity: 0.5,
                                                  )),
                                              Divider(
                                                color: Colors.black,
                                              ),
                                              ListTile(
                                                leading: Text(
                                                  "How many times do we\nhave to show the words?",
                                                  style: TextStyle(
                                                      fontSize: 17.0,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.white),
                                                ),
                                                trailing: NumberPicker(
                                                  value: _currentValue,
                                                  itemHeight: 25,
                                                  itemWidth: 30,
                                                  haptics: false,
                                                  selectedTextStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  minValue: 1,
                                                  maxValue: 10000,
                                                  axis: Axis.horizontal,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _currentValue = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              Divider(
                                                color: Colors.black,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  print(_controller.value);
                                                  print(_currentValue);
                                                },
                                                child: Container(
                                                  width: 120,
                                                  height: 40,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text(
                                                    "Save Changes",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                              top: MediaQuery.of(context).size.height * 0.4,
                              left: 20.0,
                              right: 20.0,
                              child: Card(
                                  child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        child: Column(
                                      children: [
                                        Text(
                                          "Count",
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 14.0),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          widget.user.isShowCount.toString(),
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        )
                                      ],
                                    )),
                                    Container(
                                      child: Column(children: [
                                        Text(
                                          'Last Word',
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 14.0),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          widget.user.userLastWordCount
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        )
                                      ]),
                                    ),
                                    Container(
                                        child: Column(
                                      children: [
                                        Text(
                                          'Blocked',
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 14.0),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          widget.user.blocked.toString(),
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        )
                                      ],
                                    )),
                                  ],
                                ),
                              ))),
                          Positioned(
                            top: 30,
                            left: 0,
                            child: IconButton(
                                icon:
                                    Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                        ],
                      ),
                    );
                  }),
            );
          },
        ));
  }
}
