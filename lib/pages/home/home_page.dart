import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relapse/pages/purpose_list/purpose_list_page.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageView(
        children: [
          PurposeListPage(),
          PurposeListPage(),
          PurposeListPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'a',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'b',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'c',
          ),
        ],
        currentIndex: 0,
      ),
    );
  }
}
