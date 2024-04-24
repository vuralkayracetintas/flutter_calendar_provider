part of 'image_picker_bloc.dart';

@immutable
abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  List<Object?> get props => [];
}

class CameraCapture extends ImagePickerEvent {
  const CameraCapture();
}

class GalleryPicker extends ImagePickerEvent {
  const GalleryPicker();
}
