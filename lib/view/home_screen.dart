import 'package:flutter/material.dart';
import 'package:wisata_purwakarta/services/sharedpreferences.dart';
import 'login_screen.dart';
import 'package:dio/dio.dart';
import 'package:wisata_purwakarta/models/wisata.dart';
import 'package:wisata_purwakarta/view/aboutus_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'homescreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String usernameAPI = '';

  Future<ListWisata> listWisata;
  Future<ListWisata> getListWista() async {
    //fetch data from api
    var dio = Dio();
    Response response =
    await dio.get('https://dev.farizdotid.com/api/purwakarta/wisata');
    print(response.data);
    if (response.statusCode == 200) {
      return ListWisata.fromJson(response.data);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    _getPref();
    listWisata = getListWista();
  }

  _getPref() async {
    await SharedPref.getPref().then((value) {
      setState(() {
        usernameAPI = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisata Puwakarta"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text('Hello, $usernameAPI'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.faktajabar.co.id/wp-content/uploads/2018/12/pwk.jpg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('About Us'),
              onTap: () {
                Navigator.pushNamed(context, AboutUsScreen.id);
              },
            ),
            ListTile(
              title: Text('Log Out'),
              trailing: Icon(Icons.exit_to_app),
              onTap: () {
                SharedPref.signOut();
                Navigator.pushReplacementNamed(context, LoginScreen.id);
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<ListWisata>(
          future: listWisata,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  itemCount: snapshot.data.wisata.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              '${snapshot.data.wisata[index].gambarUrl}'),
                        ),
                        title: Text("${snapshot.data.wisata[index].nama}"),
                        subtitle:
                        Text("${snapshot.data.wisata[index].kategori}"),
                      ),
                    );
                  });
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

