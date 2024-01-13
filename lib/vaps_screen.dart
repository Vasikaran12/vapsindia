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
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey[900],
        selectedLabelStyle: const TextStyle(  
          fontSize: 15,
          fontWeight: FontWeight.w500
        ),
        unselectedLabelStyle: const TextStyle(  
          fontSize: 13,
          fontWeight: FontWeight.w500
        ),
        items: mp.items
            .map((e) => BottomNavigationBarItem(
                icon: Icon(
                  e.iconData,
                ),
                label: e.label,
                ))
            .toList(),
      ),
    );
  }
}
