import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 3,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.article), label: "Каталог"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Поиск"),
        BottomNavigationBarItem(icon: Icon(Icons.local_mall), label: "Корзина"),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: "Личное"),
      ],
    );
  }
}
