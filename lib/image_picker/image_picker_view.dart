import 'dart:io';

import 'package:demo_apps/bloc/image_picker_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';

class ImagePickerView extends StatefulWidget {
  const ImagePickerView({Key? key}) : super(key: key);

  @override
  _ImagePickerViewState createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  List<File?> image = [];
  final picker = ImagePicker();

//Image Picker function to get image from gallery
  // Future getImageFromGallery() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (pickedFile != null) {
  //       image.add(File(pickedFile.path));
  //     }
  //   });
  // }

//Image Picker function to get image from camera
  // Future getImageFromCamera() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.camera);

  //   setState(() {
  //     if (pickedFile != null) {
  //       image.add(File(pickedFile.path));
  //     }
  //   });
  // }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Library'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewPage()),
              );
              context.read<ImagePickerBloc>().add(const GalleryPicker());
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              Navigator.of(context).pop();
              context.read<ImagePickerBloc>().add(const CameraCapture());
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  // Future getImages() async {
  //   final pickedFile = await picker.pickMultiImage(
  //       imageQuality: 100, // To set quality of images
  //       maxHeight: 1000, // To set maxheight of images that you want in your app
  //       maxWidth: 1000); // To set maxheight of images that you want in your app
  //   List<XFile> xfilePick = pickedFile;

  //   // if atleast 1 images is selected it will add
  //   // all images in selectedImages
  //   // variable so that we can easily show them in UI
  //   if (xfilePick.isNotEmpty) {
  //     for (var i = 0; i < xfilePick.length; i++) {
  //       image.add(File(xfilePick[i].path));
  //     }

  //     for (var img in image) {
  //       if (img != null) {
  //         final decodedImage = await decodeImageFromList(img.readAsBytesSync());
  //         print('Resmin boyutu: ${decodedImage.width}x${decodedImage.height}');
  //       }
  //     }
  //     setState(
  //       () {},
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Example'),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            return Column(
              children: [
                state.file == null
                    ? TextButton(
                        child: Text(state.file.toString()),
                        onPressed: () async {
                          await showOptions();
                        })
                    : SizedBox(
                        height: context.sized.height * 0.8,
                        child: GridView.builder(
                          itemCount: state.file!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // number of items in each row
                            mainAxisSpacing: 10.0, // spacing between rows
                            crossAxisSpacing: 10.0, // spacing between columns
                          ),
                          itemBuilder: (context, index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    File(state.file![index].path),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
              ],
            );
          },
        ),
      ),
    );
  }
}

class NewPage extends StatefulWidget {
  const NewPage({
    super.key,
  });

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
          return Column(
            children: [
              state.file == null
                  ? TextButton(
                      child: Text(state.file.toString()),
                      onPressed: () async {})
                  : SizedBox(
                      height: context.sized.height * 0.8,
                      child: GridView.builder(
                        itemCount: state.file!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // number of items in each row
                          mainAxisSpacing: 10.0, // spacing between rows
                          crossAxisSpacing: 10.0, // spacing between columns
                        ),
                        itemBuilder: (context, index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  File(state.file![index].path),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
            ],
          );
        },
      ),
    );
  }
}
