import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:gyno/pages/login.dart';

@NowaGenerated()
class HomePage extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
        ),
      ),
      body: const SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment(0.0, 0.0),
          children: const [],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                IconData(58136, fontFamily: 'MaterialIcons'),
                color: Color(0xff000000),
              ),
              label: 'home'),
          const BottomNavigationBarItem(
              icon: Icon(
                IconData(57638, fontFamily: 'MaterialIcons'),
                color: Color(0xff000000),
              ),
              label: 'call')
        ],
        onTap: (value) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Login()));
        },
      ),
    );
  }
}
