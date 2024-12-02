import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/speaker_detail_screen/models/speaker_detail_model.dart';
import '../models/eventdetails_item_model.dart';

/// A provider class for the SpeakerDetailScreen.
///
/// This provider manages the state of the SpeakerDetailScreen, including the
/// current speakerDetailModelObj

// ignore_for_file: must_be_immutable
class SpeakerDetailProvider extends ChangeNotifier {
  SpeakerDetailModel speakerDetailModelObj = SpeakerDetailModel();

  @override
  void dispose() {
    super.dispose();
  }
}
