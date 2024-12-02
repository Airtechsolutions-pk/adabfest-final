import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/filter_bottomsheet/models/filter_model.dart';

/// A provider class for the FilterBottomsheet.
///
/// This provider manages the state of the FilterBottomsheet, including the
/// current filterModelObj
class FilterProvider extends ChangeNotifier {
  FilterModel filterModelObj = FilterModel();
  bool _item1Checked = false;
  bool _item2Checked = false;
  bool _item3Checked = false;

  bool get item1Checked => _item1Checked;
  bool get item2Checked => _item2Checked;
  bool get item3Checked => _item3Checked;

  void setItem1Checked(bool value) {
  _item1Checked = value;
  notifyListeners();
  }

  void setItem2Checked(bool value) {
  _item2Checked = value;
  notifyListeners();
  }

  void setItem3Checked(bool value) {
  _item3Checked = value;
  notifyListeners();
  }

  List<String> _selectedCategories = [];

  List<String> get selectedCategories => _selectedCategories;

  void toggleCategory(String category) {
    if (_selectedCategories.contains(category)) {
      _selectedCategories.remove(category);
    } else {
      _selectedCategories.add(category);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
