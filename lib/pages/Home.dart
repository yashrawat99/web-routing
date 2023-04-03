import 'package:flutter/material.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({super.key});
  @override
  State<HomeComponent> createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    String bgImage = data['isDayTime'] ? 'day.jpeg' : 'night.jpeg';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo.shade700;
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text("Location"),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'images/$bgImage',
                ),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: SafeArea(
                child: Column(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, "/location");
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey.shade700,
                  ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 66,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ],
            )),
          ),
        ));
  }
}
