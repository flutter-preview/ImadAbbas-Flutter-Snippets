import 'package:get/get.dart';

import '../controllers/data_table_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataTableController>(
      () => DataTableController(),
    );
  }
}
