import 'package:get/get.dart';

enum Screen { home, watchlist }

TabService navTabs = Get.isRegistered<TabService>()
    ? Get.find<TabService>()
    : Get.put(TabService());

class TabService extends GetxService {
  Map<Screen, String> segmentScreens = {
    Screen.home: '/home',
    Screen.watchlist: '/watchlist'
  };

  final Rxn<Screen?> selectedSegment = Rxn<Screen?>();

  Future<void> init() async {
    selectedSegment.value = Screen.home;
  }

  void changeTabValue(Screen tab) {
    selectedSegment.value = tab;
  }
}
