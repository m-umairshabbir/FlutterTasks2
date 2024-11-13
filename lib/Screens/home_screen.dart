import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items=List.generate(15,  (index)=>'Item ${index+1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        title: const Text("ReOrderable List View"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child:ReorderableListView.builder(
              itemBuilder:(context,index){
                return Card(
                key: ValueKey(items[index]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(items[index]),
                    ),
                  ),
                );
              },
              itemCount: items.length,
              onReorder:(int oldIndex,int newIndex){
                setState(() {
                  if(newIndex>oldIndex){
                    newIndex-=1;
                  }
                  final item=items.removeAt(oldIndex);
                  items.insert(newIndex, item);
                });
        
              }
          ),
        ),
      ),
    );
  }
}
