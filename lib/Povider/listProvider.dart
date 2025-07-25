import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/addScreen.dart';
import '../Screens/listScreen.dart';

class ListProvider extends StatelessWidget {
  const ListProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: Consumer<ListMapProvider>(
        builder: (_, provider, _) {
          var allData = provider.getData();
          return allData.isNotEmpty
              ? ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text(allData[index]['name']),
                      subtitle: Text(allData[index]['mobNo']),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: (){
                                context.read<ListMapProvider>().updateData(
                                {
                                  'name' : 'Updated Contact',
                                  'mobNo' : '777777777'
                                }
                                , index);
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: (){
                                context.read<ListMapProvider>().deleteData(index);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(child: Text('No contacts Found'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
