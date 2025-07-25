import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_manager/Screens/listScreen.dart';


class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Contacts'),),
      body: Center(
        child: IconButton(
            onPressed: (){
              context.read<ListMapProvider>().addData(
                {
                  'name' : 'Contact',
                  'mobNo' : '0323932342'
                }
              );
            },
            icon: Icon(Icons.add)
        ),
      ),
    );
  }
}
