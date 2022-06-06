import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  String? nama;
  String? nim;
  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString('nama');
      nim = prefs.getString('nim');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(137, 59, 55, 55),
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.person, color: Colors.black, size: 35),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama ?? '',
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      nim ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              const ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                title: Text(
                  'Data Pribadi',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                  size: 14,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                  size: 14,
                ),
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.remove('id');
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
