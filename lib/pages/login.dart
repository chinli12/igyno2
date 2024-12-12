import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class Login extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const Login({super.key});

  @override
  State<Login> createState() {
    return _LoginState();
  }
}

@NowaGenerated()
class _LoginState extends State<Login> {
  TextEditingController text = TextEditingController();

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 10.0,
          bottom: 10.0,
        ),
        child: SafeArea(
          child: NFlex(
            direction: Axis.vertical,
            spacing: 20.0,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlexSizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: text,
                  style: Theme.of(context).textTheme.titleSmall,
                  validator: (value) {
                    if (value == null || value!.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                  showCursor: false,
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    hintText: 'name',
                    labelStyle: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              FlexSizedBox(
                width: double.infinity,
                height: 400.0,
                child: const Image(
                  image: NetworkImage(
                      'https://canary.contestimg.wish.com/api/webimage/5ddccb3c9a6f6e1cf8d7dd65-large.jpg?cache_buster=114b2b0b5893a0e736412075646fa5da'),
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const SizedBox(
          child: Text(
            'HOME',
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              IconData(58136, fontFamily: 'MaterialIcons'),
              color: Color(0xff6c6c6c),
              size: 24.0,
              applyTextScaling: false,
            ),
            label: 'home',
            backgroundColor: Color(0xffc1d7d5),
          ),
          const BottomNavigationBarItem(
              icon: Icon(
                IconData(984763, fontFamily: 'MaterialIcons'),
                color: Color(0xff6c6c6c),
                textDirection: TextDirection.rtl,
                semanticLabel: '',
                size: 24.0,
              ),
              label: 'Calender'),
          const BottomNavigationBarItem(
              icon: Icon(
                IconData(58910, fontFamily: 'MaterialIcons'),
                color: Color(0xff6c6c6c),
              ),
              label: 'Profile'),
          const BottomNavigationBarItem(
              icon: Icon(
                IconData(58910, fontFamily: 'MaterialIcons'),
                color: Color(0xff6c6c6c),
              ),
              label: 'Profile')
        ],
        showUnselectedLabels: false,
        currentIndex: pageIndex,
        onTap: (value) {
          pageIndex = value;
          setState(() {});
        },
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      ),
    );
  }
}
