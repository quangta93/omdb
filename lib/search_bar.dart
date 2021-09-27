import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'Search here',
              prefixIcon: const Icon(Icons.search)),
          controller: controller,
          autofocus: true),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
