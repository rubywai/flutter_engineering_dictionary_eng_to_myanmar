import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engineering_dictionary/database/dictionary_database.dart';

class DetailScreen extends StatefulWidget {
  final DictionaryTableData data;
  final DictionaryDatabase database;
  const DetailScreen({required this.data, required this.database, key})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.eng),
      ),
      body: ListView(
        children: [
          StreamBuilder<DictionaryTableData>(
            stream: widget.database.dictionaryDao.getDetail(widget.data.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data?.favourite);
                return IconButton(
                    onPressed: () async {
                      if (snapshot.data?.favourite == null || snapshot.data?.favourite == false) {
                        await widget.database.dictionaryDao.updateWord(
                            DictionaryTableCompanion(
                                id: Value(widget.data.id),
                                eng: Value(widget.data.eng),
                                type: Value(widget.data.type),
                                myan: Value(widget.data.myan),
                                favourite: Value(true)));
                      } else {
                        await widget.database.dictionaryDao.updateWord(
                            DictionaryTableCompanion(
                                id: Value(widget.data.id),
                                eng: Value(widget.data.eng),
                                type: Value(widget.data.type),
                                myan: Value(widget.data.myan),
                                favourite: Value(false)));
                      }
                      setState(() {});
                    },
                    icon: (snapshot.data?.favourite == null || snapshot.data?.favourite == false)
                        ? Icon(Icons.favorite_border)
                        : Icon(Icons.favorite));
              } else if (snapshot.hasError) {
                return Icon(Icons.error);
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
          ListTile(
            title: Text('English'),
            subtitle: Text(widget.data.eng),
          ),
          Divider(),
          ListTile(
            title: Text('Type'),
            subtitle: Text(widget.data.type),
          ),
          Divider(),
          ListTile(
            title: Text('Myanmar'),
            subtitle: Text(widget.data.myan),
          ),
        ],
      ),
    );
  }
}
