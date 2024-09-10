import 'package:get/get.dart';

FilterService filter = Get.isRegistered<FilterService>() ? Get.find<FilterService>() : Get.put(FilterService());

class FilterService extends GetxService {
  final RxString movieGenre = ''.obs;

  Future<void> init() async {
    setFilter('action');
  }

  void setFilter(String genre){
    movieGenre.value = genre;
  }
}