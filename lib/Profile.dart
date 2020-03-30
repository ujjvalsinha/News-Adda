import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://i7.pngguru.com/preview/831/88/865/user-profile-computer-icons-user-interface-mystique.jpg"),
              ),
            ),
          ),
          ListTile(
            title: Text("Ujjval Sinha"),
            trailing: Icon(Icons.arrow_drop_down),
            subtitle: Text(
              "Manage your Google Account",
              style: TextStyle(color: Colors.blue[800]),
            ),
          ),
          Container(
            height: 0.75,
            width: double.infinity,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text("Paid Membership"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Switch Account"),
          ),
          ListTile(
            leading: Icon(Icons.group_work),
            title: Text("Turn on Incognito"),
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text("Contact Us"),
          ),
          ListTile(
                leading: Icon(
                  Icons.brightness_4,
                  size: 28,
                ),
                title: Text(
                  "Change Theme",
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  changeBrightness();
                },
              ),
          Container(
            height: 0.75,
            width: double.infinity,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          Center(child: Text("Privacy Policy - Terms of Service"))
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTap;
  final AppBar appBar;

  const CustomAppBar({Key key, this.onTap, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: appBar);
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
