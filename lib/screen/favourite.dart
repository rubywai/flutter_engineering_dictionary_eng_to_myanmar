import 'package:flutter/material.dart';
import 'package:flutter_engineering_dictionary/database/dictionary_database.dart';
import 'package:flutter_engineering_dictionary/screen/detail.dart';

class FavouriteScreen extends StatelessWidget {
  final DictionaryDatabase database;
  const FavouriteScreen({ required this.database, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favourites'),),
      body: FutureBuilder<List<DictionaryTableData>>(
        future: database.dictionaryDao.getAllFourites(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return  ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (_) => DetailScreen(data: snapshot.data![index],database: database,)));
                        },
                        child: Card(
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(snapshot.data?[index].eng ?? ''),
                        )),
                      );
                    });
          }
          else if(snapshot.hasError){
            return Center(child: Text('Something Wrong'),);
          }
          else 
            return Center(child: CircularProgressIndicator(),);
        },
      ),
      
    );
  }
}