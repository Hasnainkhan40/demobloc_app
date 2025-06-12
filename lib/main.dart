import 'package:bolc/bolc/counter_bloc/counter_bloc.dart';
import 'package:bolc/bolc/image_picker_bloc/imagePicker_bloc.dart';
import 'package:bolc/ui/counter_screen.dart';
import 'package:bolc/ui/imagepiker_screen.dart';
import 'package:bolc/units/imagePickerUnits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => ImagepickerBloc(Imagepickerunits())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: ImagepikerScreen(),
      ),
    );
  }
}
