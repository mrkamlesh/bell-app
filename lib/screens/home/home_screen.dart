import 'package:bell_app/const/conts.dart';
import 'package:bell_app/screens/groups/groups_screen.dart';
import 'package:bell_app/screens/groups/mainGroup.dart';
import 'package:bell_app/screens/profile/profile_screen.dart';
import 'package:bell_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final socketServide = Provider.of<SocketService>(context);
    if (socketServide.isNewNotification ||
        socketServide.isSendingNotification) {
      return Scaffold(
        body: MainGroup(),
      );
    }
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          MainGroup(),
          GroupsScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Groups'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kBaseColor,
        onTap: (val) {
          setState(() {
            _selectedIndex = val;
          });
        },
      ),
    );
  }
}
