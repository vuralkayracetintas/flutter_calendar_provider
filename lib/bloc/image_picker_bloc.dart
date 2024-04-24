import 'package:bloc/bloc.dart';
import 'package:demo_apps/utils/image_picker_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    // on<CameraCapture>(_cameraCapture);
    on<GalleryPicker>(_galleryPicker);
  }

  // void _cameraCapture(
  //     CameraCapture event, Emitter<ImagePickerState> emit) async {
  //   final List<XFile>? file = await imagePickerUtils.cameraCapture();
  //   emit(ImagePickerState(file: file));
  // }

  void _galleryPicker(
      GalleryPicker event, Emitter<ImagePickerState> emit) async {
    List<XFile>? file = await imagePickerUtils.getImages();
    emit(state.copyWith(file: file));
    

  }
}
