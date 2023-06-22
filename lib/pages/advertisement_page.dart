import 'package:exe201/pages/home_page.dart';
import 'package:exe201/pages/wake_up_page.dart';
import 'package:flutter/material.dart';
import '../widgets/dark_button.dart';
import '../widgets/light_button.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/top_bar.dart';
import '../widgets/swipe_up_button.dart';
import '../widgets/current_datetime_v2.dart';
import 'package:url_launcher/url_launcher.dart';

class AdvertisementPage extends StatefulWidget {
  const AdvertisementPage({super.key});

  @override
  _AdvertisementPageState createState() {
    return _AdvertisementPageState();
  }
}

class _AdvertisementPageState extends State<AdvertisementPage> {
  int _selectedIndex = 0;

  bool _showButton = true;

  void _toggleButton() {
    setState(() {
      _showButton = !_showButton;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        break;
      case 1:
        // Navigate to the settings page
        Navigator.pushReplacementNamed(context, 'clock_view');
        break;
      case 2:
        // Navigate to the notifications page
        Navigator.pushReplacementNamed(context, '#');
        break;
      default:
        // Do nothing
        break;
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse("https://$url"); // Add "https://" before the URL
    try {
      await launch(uri.toString());
    } catch (e) {
      print("Failed to launch URL: $e");
      throw "Can not launch URL";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sleeping app',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: TopBar(
          showArrow: true,
          title: 'Advertisement',
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background-2.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(35, 56, 99, 0.6), BlendMode.darken)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    heightFactor: 0.8,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/advertisement.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: DarkButton(
                        text: 'Buy Premium Now',
                        onPressed: () {
                          _launchURL(
                              "www.facebook.com/profile.php?id=100092655316466");
                        },
                        width: 360,
                        height: 60)),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
