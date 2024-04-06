// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.

// All Attributes or Constants Here.

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: Colors.white,
          title: const ListTile(
            leading: Icon(
              Icons.circle_outlined,
              color: Colors.redAccent,
              size: 50,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Star Academy',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
          actions: [
            if (width > 960)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'HOME',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 12),
                    )),
              ),
            if (width > 960)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'POSTS',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 12),
                    )),
              ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 5),
              child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.green,
                      width: 1,
                    ),
                  ),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.green),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
