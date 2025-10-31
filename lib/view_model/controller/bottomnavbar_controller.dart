import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view/home/home_screen.dart';
import '../../view/profile/profile_screen.dart';
import '../../view/refurbished/refurbished_screen.dart';
import '../../view/accessories/accessories_screen.dart';

class bottomNavNotifier extends Notifier<int>{
  @override
  build() {
    return 0;
  }
  List screen = [
    HomeScreen(),
    RefurbishedScreen(),
    AccessoriesScreen(),
    ProfileScreen(),
  ];
  int selectedIndex = 0;

  void onTapIndex(int index) {
    selectedIndex = index;
    state = selectedIndex;
  }

}
final bottomNavProvider = NotifierProvider<bottomNavNotifier, int>(
  bottomNavNotifier.new,
);