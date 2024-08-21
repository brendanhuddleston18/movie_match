import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

PanelService panel = Get.isRegistered<PanelService>()
    ? Get.find<PanelService>()
    : Get.put(PanelService());

class PanelService extends GetxService {
  final Rxn<PanelController> panelController = Rxn<PanelController>();

  Future<void> init() async {
    panelController.value = PanelController();
  }

  void showMovie() {
    panelController.value!.show();
  }

  void hideMovie() {
    panelController.value!.hide();
  }
}
