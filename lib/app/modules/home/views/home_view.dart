import 'package:flutter/material.dart';

import 'data_table_view.dart';
import 'search_box_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(height: 100, width: 300, child: SearchBoxView()),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: DataTableView(),
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //     body: DataTableView());
  }
}
