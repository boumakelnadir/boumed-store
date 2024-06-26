import 'package:boumedstore/views/sign_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            // topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/flat-design-reseller-illustration_23-2149498647.avif',
                ),
              ),
              accountName: Text('Full Name'),
              accountEmail: Text('yourEmail@gmail.com'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.dashboard_outlined),
              title: const Text('Dashboard'),
              textColor: Colors.black,
              iconColor: Colors.black,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.account_box),
              title: const Text('Profile'),
              textColor: Colors.black,
              iconColor: Colors.black,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.message_outlined),
              title: const Text('Messages'),
              textColor: Colors.black,
              iconColor: Colors.black,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.notification_add_outlined),
              title: const Text('Notifications'),
              textColor: Colors.black,
              iconColor: Colors.black,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              textColor: Colors.black,
              iconColor: Colors.black,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite'),
              textColor: Colors.black,
              iconColor: Colors.black,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              textColor: Colors.black,
              iconColor: Colors.black,
            ),
            ListTile(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(SignInView.id, (route) => false);
              },
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              textColor: Colors.black,
              iconColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
