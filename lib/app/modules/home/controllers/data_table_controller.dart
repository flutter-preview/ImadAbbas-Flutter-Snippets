import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataTableController extends GetxController {
  //Functioniliy:
  // 1. Asceing and Decscing
  // 2. Search and Filter
  // 3. Select Checkbox

  @override
  void onInit() {
    filteredData.addAll(_dataFromDataSource);
    super.onInit();
  }

  final List<String> columnHeadersStr = ['Col 1', 'Col 2', 'Col 3'];
  final List<DataRowModel> _dataFromDataSource = [
    DataRowModel(
      isSelected: false.obs,
      columnOneData: 'John Doe',
      columnTwoData: 'Info 1',
      columnThreeData: 30,
    ),
    DataRowModel(
      isSelected: false.obs,
      columnOneData: 'Jane Smith',
      columnTwoData: 'Info 2',
      columnThreeData: 25,
      
    ),
    DataRowModel(
      isSelected: false.obs,
      columnOneData: 'Alice Johnson',
      columnTwoData: 'Info 3',
      columnThreeData: 35,
      
    ),
    DataRowModel(
      isSelected: false.obs,
      columnOneData: 'Bob Williams',
      columnTwoData: 'Info 4',
      columnThreeData: 28,
      
    ),
  ];

  RxInt? currentSortingColumnIndex;
  RxBool isAscending = false.obs;

  final filteredData = <DataRowModel>[].obs;

  void filterDataOnSearchQueryFromSearchBox(String query) {
    filteredData.clear();
    if (query.isEmpty) {
      filteredData.addAll(_dataFromDataSource);
    } else {
      filteredData.addAll(_dataFromDataSource.where((item) {
        return item.columnOneData.toLowerCase().contains(query.toLowerCase());
      }));
    }
  }

  void _toggleSelection(int index) {
    filteredData[index].isSelected.value = !filteredData[index].isSelected.value;
  }

  void onSortCallBack(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      _dataFromDataSource.sort((user1, user2) =>
          compareString(ascending, user1.columnOneData, user2.columnOneData));
    } else if (columnIndex == 1) {
      _dataFromDataSource.sort((user1, user2) =>
          compareString(ascending, user1.columnTwoData, user2.columnTwoData));
    } else if (columnIndex == 2) {
      _dataFromDataSource.sort((user1, user2) => compareString(
          ascending, '${user1.columnThreeData}', '${user2.columnThreeData}'));
    }

    currentSortingColumnIndex?.value = columnIndex;
    isAscending.value = ascending;
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  List<DataColumn> getColumns({required List<String> columnHeadersStr}) =>
      columnHeadersStr
          .map((String columnHeaderString) => DataColumn(
              onSort: onSortCallBack, label: Text(columnHeaderString)))
          .toList();

  // Data Cell, Data Structure
  List<DataCell> getDataCells({required List<dynamic> data}) => data
      .map(
        (dynamic data) => DataCell(Text(data.toString())),
      )
      .toList();

  List<DataRow> getDataRow({required List<DataRowModel> dataRowList}) =>
      dataRowList.map((DataRowModel item) {
        // final List<dynamic> rowData = [
        //   item.columnOneData,
        //   item.columnTwoData,
        //   item.columnThreeData
        // ];
        return DataRow(
          selected: item.isSelected.value,
          onSelectChanged: (selected) {
            _toggleSelection(filteredData.indexOf(item));
          },
          cells: [
            DataCell(Text(item.columnOneData)),
            DataCell(Text(item.columnTwoData)),
            DataCell(Text(item.columnThreeData.toString())),
          ],
        );
      }).toList();

  Widget getDataTable() {
    return Obx(() => DataTable(
        sortColumnIndex: currentSortingColumnIndex?.value,
        sortAscending: isAscending.value,
        columns: getColumns(columnHeadersStr: columnHeadersStr),
        rows: getDataRow(dataRowList: filteredData.value)));
  }
}

class DataRowModel {
  final RxBool isSelected;
  final String columnOneData;
  final String columnTwoData;
  final int columnThreeData;
  

  DataRowModel({
    required this.isSelected,
    required this.columnOneData,
    required this.columnTwoData,
    required this.columnThreeData,
    
  });
}
