import 'package:flutter/material.dart';
import 'package:flutter_engineering_dictionary/database/dictionary_dao.dart';
import 'package:flutter_engineering_dictionary/database/dictionary_database.dart';
import 'package:flutter_engineering_dictionary/screen/detail.dart';
import 'package:flutter_engineering_dictionary/screen/favourite.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DictionaryDatabase database = DictionaryDatabase();
   TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Engineering Dictionary'),),
      body: Column(
        children:  [
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (str){
                setState(() {});
              },
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search',
                border : const OutlineInputBorder(),
                suffixIcon: Icon(Icons.search)
              ),
              
            ),
          ),
          Expanded(
            child: FutureBuilder<List<DictionaryTableData>>(
              future: database.dictionaryDao.searchWord(_searchController.text),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
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
                  return const Center(child: Text('Error'));
                }
                return const Center(child: CircularProgressIndicator(),);
              }),
          )
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite,color: Colors.white,),
        onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (_) => FavouriteScreen(database: database)));
        },
      ),
    );
  }
}