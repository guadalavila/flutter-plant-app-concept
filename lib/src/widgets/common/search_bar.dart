import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _keySearch = "";
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 30.0, left: 10.0),
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.0)),
              child: _createInputSearch(),
            ),
          ),
          _createButtons(_size),
        ],
      ),
    );
  }

  Widget _createButtons(_size) {
    return Container(
      width: _size.width * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            child: Icon(Icons.favorite_border, color: kIconColor),
          ),
          SizedBox(
            child: Icon(Icons.notifications_none_rounded, color: kIconColor),
          )
        ],
      ),
    );
  }

  Widget _createInputSearch() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          icon: Icon(Icons.search),
          labelStyle: TextStyle(fontSize: 12, color: kGreyColor),
          labelText: "Buscar...",
          border: InputBorder.none),
      onChanged: (value) {
        setState(() {
          _keySearch = value;
        });
      },
    );
  }
}
