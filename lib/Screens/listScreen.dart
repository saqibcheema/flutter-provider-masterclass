import 'package:flutter/widgets.dart';

class ListMapProvider extends ChangeNotifier{
  List<Map<String,dynamic>> _data=[];

  void addData(Map<String,dynamic> data){
    _data.add(data);
    notifyListeners();
  }

  void updateData(Map<String,dynamic> data,int index){
    _data[index]=data;
    notifyListeners();
  }

  void deleteData(int index){
    _data.removeAt(index);
    notifyListeners();
  }

  List<Map<String,dynamic>> getData() => _data;

}