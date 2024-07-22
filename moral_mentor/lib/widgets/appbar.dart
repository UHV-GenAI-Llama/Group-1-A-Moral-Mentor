import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String profilePicUrl;

  const ResponsiveAppBar({
    Key? key,
    required this.userName,
    required this.profilePicUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Web view
          return AppBar(
            title: const Text(
              'MoralMentor',
              style: TextStyle(color: Colors.cyan),
            ),
            backgroundColor: const Color(0xFF001120),
            actions: [
              TextButton(
                onPressed: () => context.go('/home'),
                child: const Text('Home', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => context.go('/scenarios_page'),
                child: const Text('Scenarios', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => context.go('/profile'),
                child: const Text('Profile', style: TextStyle(color: Colors.white)),
              ),
            ],
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(4.0),
              child: Divider(
                height: 4.0,
                thickness: 2.0,
                color: Colors.lightGreen,
              ),
            ),
          );
        } else {
          // Mobile view
          return AppBar(
            title: const Text(
              'MoralMentor',
              style: TextStyle(color: Colors.cyan),
            ),
            backgroundColor: const Color(0xFF001120),
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(4.0),
              child: Divider(
                height: 4.0,
                thickness: 2.0,
                color: Colors.lightGreen,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
