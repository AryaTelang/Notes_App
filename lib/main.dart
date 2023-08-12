import 'package:flutter/material.dart';
import 'package:notes_app_second/cubit/appcubitLogic.dart';
import 'package:notes_app_second/cubit/note/note_cubit.dart';
import 'package:notes_app_second/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),debugShowCheckedModeBanner: false,
      home: BlocProvider<NoteCubit>(
        create: (context)=>NoteCubit(),
        child: NoteCubitLogic(),
      ),
    );
  }
}
