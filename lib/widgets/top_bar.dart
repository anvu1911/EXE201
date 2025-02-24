import 'package:exe201/pages/auth/login_page.dart';
import 'package:exe201/pages/started_page.dart';
import 'package:flutter/material.dart';

import '../service/auth_service.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final AuthService authService = AuthService();
  final String title;
  final bool showArrow;
  final Function() onBackButtonPressed;

  TopBar({
    super.key,
    required this.showArrow,
    required this.title,
    required this.onBackButtonPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: showArrow ? const Icon(Icons.arrow_back) : SizedBox(),
        onPressed: onBackButtonPressed,
      ),
      title: Text(title),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            showDialog(
              context: context,
              barrierColor: Colors.transparent,
              builder: (context) {
                return Center(
                  child: Dialog(
                    backgroundColor: Color.fromARGB(169, 117, 166, 193),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: 800,
                      height: 660,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // do something when the row is clicked
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(169, 117, 166, 193),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage('assets/images/clock.png'),
                                    size: 36,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Time',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        '8:00',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // do something when the row is clicked
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(169, 117, 166, 193),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage('assets/images/repeat.png'),
                                    size: 36,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Repeat',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        'Mon, Tue, Wed, Sat',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // do something when the row is clicked
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(169, 117, 166, 193),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage('assets/images/bell.png'),
                                    size: 36,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Volumn',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        '80%',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // do something when the row is clicked
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(169, 117, 166, 193),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage('assets/images/music.png'),
                                    size: 36,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sound & Music',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        'Chúc Bé Ngủ Ngon',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(169, 117, 166, 193),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage('assets/images/vibrate.png'),
                                    size: 36,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Vibrate',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(169, 117, 166, 193),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage('assets/images/fade-in.png'),
                                    size: 36,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Fade in',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        '(Gently increase alarm volumn)',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              authService.signOut();
                              Navigator.of(context).pushAndRemoveUntil(
                                  new MaterialPageRoute(
                                      builder: (context) => new StartedPage()),
                                  (route) => false);
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(169, 117, 166, 193),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.logout,
                                      size: 36,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Logout',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
