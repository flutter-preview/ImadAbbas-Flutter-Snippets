import 'package:flutter/material.dart';
import 'package:flutter_snippets/app/modules/home/controllers/data_table_controller.dart';
import 'package:get/get.dart';

import 'scrollabe_view.dart';

class DataTableView extends GetView<DataTableController> {
  final bool isScrollable;
  const DataTableView({super.key, this.isScrollable = true});

  @override
  Widget build(BuildContext context) {
    final dataTable = controller.getDataTable();
    return isScrollable ? ScrollableWidget(child: dataTable) : dataTable;
  }
}
