import 'package:flutter/material.dart';
import 'package:vapsindia/vaps_provider.dart';
import 'package:provider/provider.dart';

class VapsScreen extends StatelessWidget {
  const VapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mp = Provider.of<VapsProvider>(
      context,
    );
    return Scaffold(
      
      body: mp.items[mp.selectedIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mp.selectedIndex,
        onTap: (i) {
          mp.selectedIndex = i;
        },
        items: mp.items
            .map((e) => BottomNavigationBarItem(
                icon: Icon(
                  e.iconData,
                  color: Colors.purpleAccent,
                ),
                label: e.label,
                ))
            .toList(),
      ),
    );
  }
}
