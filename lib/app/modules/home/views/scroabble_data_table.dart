import 'package:flutter/material.dart';

class SortablePage extends StatefulWidget {
  @override
  _SortablePageState createState() => _SortablePageState();
}

class _SortablePageState extends State<SortablePage> {
  late List<User> users;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    this.users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: buildDataTable(),
      );

  Widget buildDataTable() {
    final columns = ['First Name', 'Last Name', 'Age'];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.firstName, user.lastName, user.age];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.firstName, user2.firstName));
    } else if (columnIndex == 1) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.lastName, user2.lastName));
    } else if (columnIndex == 2) {
      users.sort((user1, user2) =>
          compareString(ascending, '${user1.age}', '${user2.age}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  final allUsers = <User>[
    User(firstName: 'Emma', lastName: 'Field', age: 37),
    User(firstName: 'Max', lastName: 'Stone', age: 27),
    User(firstName: 'Sarah', lastName: 'Winter', age: 20),
    User(firstName: 'James', lastName: 'Summer', age: 21),
    User(firstName: 'Lorita', lastName: 'Wilcher', age: 18),
    User(firstName: 'Anton', lastName: 'Wilbur', age: 32),
    User(firstName: 'Salina', lastName: 'Monsour', age: 24),
    User(firstName: 'Sunday', lastName: 'Salem', age: 42),
    User(firstName: 'Alva', lastName: 'Cowen', age: 47),
    User(firstName: 'Jonah', lastName: 'Lintz', age: 18),
    User(firstName: 'Kimberley', lastName: 'Kelson', age: 33),
    User(firstName: 'Waldo', lastName: 'Cybart', age: 19),
    User(firstName: 'Garret', lastName: 'Hoffmann', age: 27),
    User(firstName: 'Margaret', lastName: 'Yarger', age: 25),
    User(firstName: 'Foster', lastName: 'Lamp', age: 53),
    User(firstName: 'Samuel', lastName: 'Testa', age: 58),
    User(firstName: 'Sam', lastName: 'Schug', age: 44),
    User(firstName: 'Alise', lastName: 'Bryden', age: 41),
  ];
}

class User {
  final String firstName;
  final String lastName;
  final int age;

  const User({
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  User copy({
    String? firstName,
    String? lastName,
    int? age,
  }) =>
      User(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        age: age ?? this.age,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          age == other.age;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ age.hashCode;
}