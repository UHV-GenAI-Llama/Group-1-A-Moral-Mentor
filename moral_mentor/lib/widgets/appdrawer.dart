import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  final String userName;
  final String profilePicUrl;

  const AppDrawer({
    Key? key,
    required this.userName,
    required this.profilePicUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(profilePicUrl),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home', style: TextStyle(color: Colors.black)),
            onTap: () => context.go('/home'),
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Scenarios', style: TextStyle(color: Colors.black)),
            onTap: () => context.go('/scenarios_page'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile', style: TextStyle(color: Colors.black)),
            onTap: () => context.go('/profile'),
          ),
        ],
      ),
    );
  }
}
