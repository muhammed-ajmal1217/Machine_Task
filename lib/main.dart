import 'package:flutter/material.dart';
import 'package:machinetask2/controller/provider.dart';
import 'package:machinetask2/views/user_list_page.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserListsProvdier(),)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserLists(),
      ),
    );
  }
}