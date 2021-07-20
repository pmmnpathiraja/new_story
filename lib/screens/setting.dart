import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_story/screens/login.dart';

class setting extends StatefulWidget {
  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    var center = Alignment.center;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(20.0),
                color: Colors.blue[600],
                child: ListTile(
                  onTap: () {
                    //open edit profile
                  },
                  title: Text(
                    "Rohitha Laxman",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  leading: CircleAvatar(
                      //backgroundImage:
                      ),
                  trailing: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                )),
            // const SizedBox(
            //   height: 0,
            // ),
            Card(
                elevation: 8.0,
                margin: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.language,
                        color: Colors.blue[600],
                      ),
                      title: Text("Change Language"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        //open change language
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.mobile_friendly_outlined,
                        color: Colors.blue[600],
                      ),
                      title: Text("Change Mobile Number"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        //open change password
                      },
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Colors.blue[600],
                        ),
                        title: Text("Logout"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          FirebaseAuth.instance.signOut().then((val) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          }).catchError((e) {
                            print(e);
                          });
                        }),
                  ],
                )),
            const SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Text(
                    "Notification Settings",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[600],
                    ),
                  ),
                  SwitchListTile(
                    dense: true,
                    activeColor: Colors.blue[600],
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text("Enable SMS service"),
                    onChanged: (val) {},
                  ),
                  SwitchListTile(
                    dense: true,
                    activeColor: Colors.blue[600],
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text("Receive Notifications"),
                    onChanged: (val) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
