import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/data_table_controller.dart';

class SearchBoxView extends StatefulWidget {
  const SearchBoxView({super.key});

  @override
  State<SearchBoxView> createState() => _SearchBoxViewState();
}

class _SearchBoxViewState extends State<SearchBoxView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: const InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
      ),
      onChanged:
          Get.find<DataTableController>().filterDataOnSearchQueryFromSearchBox,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
