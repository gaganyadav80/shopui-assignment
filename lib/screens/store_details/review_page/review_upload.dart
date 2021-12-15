import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
import 'package:flutter/material.dart';

class ReviewUploadPictures extends StatefulWidget {
  const ReviewUploadPictures(
      {Key? key, required this.storeid, required this.userid})
      : super(key: key);

  final String storeid;
  final String userid;

  @override
  _ReviewUploadPicturesState createState() => _ReviewUploadPicturesState();
}

class _ReviewUploadPicturesState extends State<ReviewUploadPictures> {
  List<UploadJob>? _profilePictures = [];

  @override
  Widget build(BuildContext context) {
    final profilePictureTile = Material(
      color: Colors.transparent,
      child: PictureUploadWidget(
        initialImages: _profilePictures,
        onPicturesChange: profilePictureCallback,
        buttonStyle: PictureUploadButtonStyle(),
        buttonText: 'Upload Picture',
        localization: PictureUploadLocalization(),
        settings: PictureUploadSettings(
          imageSource: ImageSourceExtended.askUser,
          minImageCount: 0,
          maxImageCount: 5,
          uploadDirectory: '/${widget.storeid}/${widget.userid}/',
          imageManipulationSettings: const ImageManipulationSettings(
            enableCropping: true,
            compressQuality: 75,
          ),
        ),
        enabled: true,
      ),
    );

    return profilePictureTile;
  }

  void profilePictureCallback(
      {List<UploadJob>? uploadJobs, bool? pictureUploadProcessing}) {
    _profilePictures = uploadJobs;
  }
}
