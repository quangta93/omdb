import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef OnSearch = void Function(String);

class SearchBar extends StatefulWidget {
  final OnSearch? onSearch;
  const SearchBar({this.onSearch});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController(text: '');
  bool _showCloseIcon = false;

  void _clearText() {
    _controller.clear();

    if (widget.onSearch != null) {
      widget.onSearch!('');
    }
  }

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        _showCloseIcon = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'Search here',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _showCloseIcon
                  ? IconButton(
                      onPressed: _clearText, icon: const Icon(Icons.close))
                  : null),
          controller: _controller,
          onSubmitted: (value) {
            if (widget.onSearch != null) {
              widget.onSearch!(value);
            }
          },
          autofocus: true),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
