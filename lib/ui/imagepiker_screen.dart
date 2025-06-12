import 'dart:io';

import 'package:bolc/bolc/image_picker_bloc/imagePicker_bloc.dart';
import 'package:bolc/bolc/image_picker_bloc/imagePicker_event.dart';
import 'package:bolc/bolc/image_picker_bloc/imagePicker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagepikerScreen extends StatefulWidget {
  const ImagepikerScreen({super.key});

  @override
  State<ImagepikerScreen> createState() => _ImagepikerScreenState();
}

class _ImagepikerScreenState extends State<ImagepikerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker bloc')),
      body: Center(
        child: BlocBuilder<ImagepickerBloc, ImagepickerState>(
          builder: (context, state) {
            if (state.file == null) {
              return InkWell(
                onTap: () {
                  context.read<ImagepickerBloc>().add(CameraCapture());
                },
                child: const CircleAvatar(child: Icon(Icons.camera)),
              );
            } else {
              return Image.file(File(state.file!.path.toString()));
            }
          },
        ),
      ),
    );
  }
}
