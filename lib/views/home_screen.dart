import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models.dart';
import '../viewmodels/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
 @override
  void initState() {
   context.read<HomeViewModel>().fetchCountries();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(floatingActionButton: FloatingActionButton(onPressed: () async {
       context.read<HomeViewModel>().fetchCountries();
    },),
      body:context.watch<HomeViewModel>().isLoading? const Center(child: CircularProgressIndicator(),):
      context.read<HomeViewModel>().countriesNewData.isEmpty?const Center(child: Text("No Data"),):
      ListView.builder(
        itemCount: context.read<HomeViewModel>().countriesNewData.length,
        itemBuilder: (context, index) {
          final newData =context.read<HomeViewModel>().countriesNewData;
          return  ListTile(
            title: Text(
              newData[index].name,
            ),
            subtitle: Text(
              newData[index].region,
            ),
            leading: Text(newData[index].flag),
            trailing: Text(newData[index].population.toString()),
          );
        },
      ),
    );
  }
}
