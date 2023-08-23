import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_UserInformation')) {
        try {
          final serializedData = prefs.getString('ff_UserInformation') ?? '{}';
          _UserInformation =
              CurrentUserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _id = prefs.getInt('ff_id') ?? _id;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_Appointment')) {
        try {
          final serializedData = prefs.getString('ff_Appointment') ?? '{}';
          _Appointment =
              AppointmentStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userProfile')) {
        try {
          _userProfile = jsonDecode(prefs.getString('ff_userProfile') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _apiKey = prefs.getString('ff_apiKey') ?? _apiKey;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_Address')) {
        try {
          final serializedData = prefs.getString('ff_Address') ?? '{}';
          _Address =
              AddressesStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _chosenServiceCategories = prefs
              .getStringList('ff_chosenServiceCategories')
              ?.map(int.parse)
              .toList() ??
          _chosenServiceCategories;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_DraftPost')) {
        try {
          _DraftPost = jsonDecode(prefs.getString('ff_DraftPost') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_TaskCreation')) {
        try {
          final serializedData = prefs.getString('ff_TaskCreation') ?? '{}';
          _TaskCreation = TaskCreationStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _relatedServiseCategory =
          prefs.getInt('ff_relatedServiseCategory') ?? _relatedServiseCategory;
    });
    _safeInit(() {
      _ONLINE = prefs.getString('ff_ONLINE') ?? _ONLINE;
    });
    _safeInit(() {
      _BYPHONE = prefs.getString('ff_BYPHONE') ?? _BYPHONE;
    });
    _safeInit(() {
      _INPERSON = prefs.getString('ff_INPERSON') ?? _INPERSON;
    });
    _safeInit(() {
      _location =
          _latLngFromString(prefs.getString('ff_location')) ?? _location;
    });
    _safeInit(() {
      _selectedServices =
          prefs.getStringList('ff_selectedServices')?.map(int.parse).toList() ??
              _selectedServices;
    });
    _safeInit(() {
      _selectedServiceCategory = prefs
              .getStringList('ff_selectedServiceCategory')
              ?.map(int.parse)
              .toList() ??
          _selectedServiceCategory;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _DeleteAddressBackGroundColor = false;
  bool get DeleteAddressBackGroundColor => _DeleteAddressBackGroundColor;
  set DeleteAddressBackGroundColor(bool _value) {
    _DeleteAddressBackGroundColor = _value;
  }

  bool _AddCertificateForEducation = false;
  bool get AddCertificateForEducation => _AddCertificateForEducation;
  set AddCertificateForEducation(bool _value) {
    _AddCertificateForEducation = _value;
  }

  bool _SelectLanguageDropDown = false;
  bool get SelectLanguageDropDown => _SelectLanguageDropDown;
  set SelectLanguageDropDown(bool _value) {
    _SelectLanguageDropDown = _value;
  }

  String _PostsReviews = 'Post';
  String get PostsReviews => _PostsReviews;
  set PostsReviews(String _value) {
    _PostsReviews = _value;
  }

  bool _BottomSheetforPay = false;
  bool get BottomSheetforPay => _BottomSheetforPay;
  set BottomSheetforPay(bool _value) {
    _BottomSheetforPay = _value;
  }

  String _Sort = 'Relevance';
  String get Sort => _Sort;
  set Sort(String _value) {
    _Sort = _value;
  }

  bool _BargainUserFilter = false;
  bool get BargainUserFilter => _BargainUserFilter;
  set BargainUserFilter(bool _value) {
    _BargainUserFilter = _value;
  }

  String _userFilter = '';
  String get userFilter => _userFilter;
  set userFilter(String _value) {
    _userFilter = _value;
  }

  bool _PostFilterBool = false;
  bool get PostFilterBool => _PostFilterBool;
  set PostFilterBool(bool _value) {
    _PostFilterBool = _value;
  }

  String _PostFilter = '';
  String get PostFilter => _PostFilter;
  set PostFilter(String _value) {
    _PostFilter = _value;
  }

  CurrentUserStruct _UserInformation =
      CurrentUserStruct.fromSerializableMap(jsonDecode('{\"Country\":\"\"}'));
  CurrentUserStruct get UserInformation => _UserInformation;
  set UserInformation(CurrentUserStruct _value) {
    _UserInformation = _value;
    prefs.setString('ff_UserInformation', _value.serialize());
  }

  void updateUserInformationStruct(Function(CurrentUserStruct) updateFn) {
    updateFn(_UserInformation);
    prefs.setString('ff_UserInformation', _UserInformation.serialize());
  }

  bool _requstNewCode = false;
  bool get requstNewCode => _requstNewCode;
  set requstNewCode(bool _value) {
    _requstNewCode = _value;
  }

  bool _IsntCorecctPassword = false;
  bool get IsntCorecctPassword => _IsntCorecctPassword;
  set IsntCorecctPassword(bool _value) {
    _IsntCorecctPassword = _value;
  }

  bool _closeHeaderInacceptedDigitCode = false;
  bool get closeHeaderInacceptedDigitCode => _closeHeaderInacceptedDigitCode;
  set closeHeaderInacceptedDigitCode(bool _value) {
    _closeHeaderInacceptedDigitCode = _value;
  }

  bool _ProfileCheck = false;
  bool get ProfileCheck => _ProfileCheck;
  set ProfileCheck(bool _value) {
    _ProfileCheck = _value;
  }

  bool _BannerCheck = false;
  bool get BannerCheck => _BannerCheck;
  set BannerCheck(bool _value) {
    _BannerCheck = _value;
  }

  String _ReqestNewCode = '';
  String get ReqestNewCode => _ReqestNewCode;
  set ReqestNewCode(String _value) {
    _ReqestNewCode = _value;
  }

  bool _IsNotCorrectPasswordNewPhonNumber = false;
  bool get IsNotCorrectPasswordNewPhonNumber =>
      _IsNotCorrectPasswordNewPhonNumber;
  set IsNotCorrectPasswordNewPhonNumber(bool _value) {
    _IsNotCorrectPasswordNewPhonNumber = _value;
  }

  bool _NotificationForAnewPassOrEmail = false;
  bool get NotificationForAnewPassOrEmail => _NotificationForAnewPassOrEmail;
  set NotificationForAnewPassOrEmail(bool _value) {
    _NotificationForAnewPassOrEmail = _value;
  }

  bool _CopyText = false;
  bool get CopyText => _CopyText;
  set CopyText(bool _value) {
    _CopyText = _value;
  }

  bool _BorderColorSuccses = false;
  bool get BorderColorSuccses => _BorderColorSuccses;
  set BorderColorSuccses(bool _value) {
    _BorderColorSuccses = _value;
  }

  List<UserServiceStruct> _userServices = [];
  List<UserServiceStruct> get userServices => _userServices;
  set userServices(List<UserServiceStruct> _value) {
    _userServices = _value;
  }

  void addToUserServices(UserServiceStruct _value) {
    _userServices.add(_value);
  }

  void removeFromUserServices(UserServiceStruct _value) {
    _userServices.remove(_value);
  }

  void removeAtIndexFromUserServices(int _index) {
    _userServices.removeAt(_index);
  }

  void updateUserServicesAtIndex(
    int _index,
    UserServiceStruct Function(UserServiceStruct) updateFn,
  ) {
    _userServices[_index] = updateFn(_userServices[_index]);
  }

  List<String> _LanguagesListForDropDown = [];
  List<String> get LanguagesListForDropDown => _LanguagesListForDropDown;
  set LanguagesListForDropDown(List<String> _value) {
    _LanguagesListForDropDown = _value;
  }

  void addToLanguagesListForDropDown(String _value) {
    _LanguagesListForDropDown.add(_value);
  }

  void removeFromLanguagesListForDropDown(String _value) {
    _LanguagesListForDropDown.remove(_value);
  }

  void removeAtIndexFromLanguagesListForDropDown(int _index) {
    _LanguagesListForDropDown.removeAt(_index);
  }

  void updateLanguagesListForDropDownAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _LanguagesListForDropDown[_index] =
        updateFn(_LanguagesListForDropDown[_index]);
  }

  String _StartingTime = '';
  String get StartingTime => _StartingTime;
  set StartingTime(String _value) {
    _StartingTime = _value;
  }

  int _id = 0;
  int get id => _id;
  set id(int _value) {
    _id = _value;
    prefs.setInt('ff_id', _value);
  }

  List<String> _RepeatType = [];
  List<String> get RepeatType => _RepeatType;
  set RepeatType(List<String> _value) {
    _RepeatType = _value;
  }

  void addToRepeatType(String _value) {
    _RepeatType.add(_value);
  }

  void removeFromRepeatType(String _value) {
    _RepeatType.remove(_value);
  }

  void removeAtIndexFromRepeatType(int _index) {
    _RepeatType.removeAt(_index);
  }

  void updateRepeatTypeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _RepeatType[_index] = updateFn(_RepeatType[_index]);
  }

  String _TaskerType = '';
  String get TaskerType => _TaskerType;
  set TaskerType(String _value) {
    _TaskerType = _value;
  }

  String _TaskerAge = '';
  String get TaskerAge => _TaskerAge;
  set TaskerAge(String _value) {
    _TaskerAge = _value;
  }

  bool _Identified = false;
  bool get Identified => _Identified;
  set Identified(bool _value) {
    _Identified = _value;
  }

  String _BidReq = '';
  String get BidReq => _BidReq;
  set BidReq(String _value) {
    _BidReq = _value;
  }

  ReviweStruct _Review = ReviweStruct();
  ReviweStruct get Review => _Review;
  set Review(ReviweStruct _value) {
    _Review = _value;
  }

  void updateReviewStruct(Function(ReviweStruct) updateFn) {
    updateFn(_Review);
  }

  AppointmentStruct _Appointment = AppointmentStruct();
  AppointmentStruct get Appointment => _Appointment;
  set Appointment(AppointmentStruct _value) {
    _Appointment = _value;
    prefs.setString('ff_Appointment', _value.serialize());
  }

  void updateAppointmentStruct(Function(AppointmentStruct) updateFn) {
    updateFn(_Appointment);
    prefs.setString('ff_Appointment', _Appointment.serialize());
  }

  dynamic _userProfile;
  dynamic get userProfile => _userProfile;
  set userProfile(dynamic _value) {
    _userProfile = _value;
    prefs.setString('ff_userProfile', jsonEncode(_value));
  }

  String _streetDroper = '';
  String get streetDroper => _streetDroper;
  set streetDroper(String _value) {
    _streetDroper = _value;
  }

  bool _exactstartingtime = false;
  bool get exactstartingtime => _exactstartingtime;
  set exactstartingtime(bool _value) {
    _exactstartingtime = _value;
  }

  String _apiKey = 'hello';
  String get apiKey => _apiKey;
  set apiKey(String _value) {
    _apiKey = _value;
    prefs.setString('ff_apiKey', _value);
  }

  AddressesStruct _Address = AddressesStruct();
  AddressesStruct get Address => _Address;
  set Address(AddressesStruct _value) {
    _Address = _value;
    prefs.setString('ff_Address', _value.serialize());
  }

  void updateAddressStruct(Function(AddressesStruct) updateFn) {
    updateFn(_Address);
    prefs.setString('ff_Address', _Address.serialize());
  }

  List<int> _chosenServiceCategories = [];
  List<int> get chosenServiceCategories => _chosenServiceCategories;
  set chosenServiceCategories(List<int> _value) {
    _chosenServiceCategories = _value;
    prefs.setStringList(
        'ff_chosenServiceCategories', _value.map((x) => x.toString()).toList());
  }

  void addToChosenServiceCategories(int _value) {
    _chosenServiceCategories.add(_value);
    prefs.setStringList('ff_chosenServiceCategories',
        _chosenServiceCategories.map((x) => x.toString()).toList());
  }

  void removeFromChosenServiceCategories(int _value) {
    _chosenServiceCategories.remove(_value);
    prefs.setStringList('ff_chosenServiceCategories',
        _chosenServiceCategories.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromChosenServiceCategories(int _index) {
    _chosenServiceCategories.removeAt(_index);
    prefs.setStringList('ff_chosenServiceCategories',
        _chosenServiceCategories.map((x) => x.toString()).toList());
  }

  void updateChosenServiceCategoriesAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _chosenServiceCategories[_index] =
        updateFn(_chosenServiceCategories[_index]);
    prefs.setStringList('ff_chosenServiceCategories',
        _chosenServiceCategories.map((x) => x.toString()).toList());
  }

  dynamic _DraftPost;
  dynamic get DraftPost => _DraftPost;
  set DraftPost(dynamic _value) {
    _DraftPost = _value;
    prefs.setString('ff_DraftPost', jsonEncode(_value));
  }

  TaskCreationStruct _TaskCreation = TaskCreationStruct();
  TaskCreationStruct get TaskCreation => _TaskCreation;
  set TaskCreation(TaskCreationStruct _value) {
    _TaskCreation = _value;
    prefs.setString('ff_TaskCreation', _value.serialize());
  }

  void updateTaskCreationStruct(Function(TaskCreationStruct) updateFn) {
    updateFn(_TaskCreation);
    prefs.setString('ff_TaskCreation', _TaskCreation.serialize());
  }

  int _relatedServiseCategory = 0;
  int get relatedServiseCategory => _relatedServiseCategory;
  set relatedServiseCategory(int _value) {
    _relatedServiseCategory = _value;
    prefs.setInt('ff_relatedServiseCategory', _value);
  }

  String _ONLINE = 'ONLINE ';
  String get ONLINE => _ONLINE;
  set ONLINE(String _value) {
    _ONLINE = _value;
    prefs.setString('ff_ONLINE', _value);
  }

  String _BYPHONE = 'BYPHONE';
  String get BYPHONE => _BYPHONE;
  set BYPHONE(String _value) {
    _BYPHONE = _value;
    prefs.setString('ff_BYPHONE', _value);
  }

  String _INPERSON = 'INPERSON';
  String get INPERSON => _INPERSON;
  set INPERSON(String _value) {
    _INPERSON = _value;
    prefs.setString('ff_INPERSON', _value);
  }

  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? _value) {
    _location = _value;
    _value != null
        ? prefs.setString('ff_location', _value.serialize())
        : prefs.remove('ff_location');
  }

  List<int> _selectedServices = [];
  List<int> get selectedServices => _selectedServices;
  set selectedServices(List<int> _value) {
    _selectedServices = _value;
    prefs.setStringList(
        'ff_selectedServices', _value.map((x) => x.toString()).toList());
  }

  void addToSelectedServices(int _value) {
    _selectedServices.add(_value);
    prefs.setStringList('ff_selectedServices',
        _selectedServices.map((x) => x.toString()).toList());
  }

  void removeFromSelectedServices(int _value) {
    _selectedServices.remove(_value);
    prefs.setStringList('ff_selectedServices',
        _selectedServices.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromSelectedServices(int _index) {
    _selectedServices.removeAt(_index);
    prefs.setStringList('ff_selectedServices',
        _selectedServices.map((x) => x.toString()).toList());
  }

  void updateSelectedServicesAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _selectedServices[_index] = updateFn(_selectedServices[_index]);
    prefs.setStringList('ff_selectedServices',
        _selectedServices.map((x) => x.toString()).toList());
  }

  List<int> _selectedServiceCategory = [];
  List<int> get selectedServiceCategory => _selectedServiceCategory;
  set selectedServiceCategory(List<int> _value) {
    _selectedServiceCategory = _value;
    prefs.setStringList(
        'ff_selectedServiceCategory', _value.map((x) => x.toString()).toList());
  }

  void addToSelectedServiceCategory(int _value) {
    _selectedServiceCategory.add(_value);
    prefs.setStringList('ff_selectedServiceCategory',
        _selectedServiceCategory.map((x) => x.toString()).toList());
  }

  void removeFromSelectedServiceCategory(int _value) {
    _selectedServiceCategory.remove(_value);
    prefs.setStringList('ff_selectedServiceCategory',
        _selectedServiceCategory.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromSelectedServiceCategory(int _index) {
    _selectedServiceCategory.removeAt(_index);
    prefs.setStringList('ff_selectedServiceCategory',
        _selectedServiceCategory.map((x) => x.toString()).toList());
  }

  void updateSelectedServiceCategoryAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _selectedServiceCategory[_index] =
        updateFn(_selectedServiceCategory[_index]);
    prefs.setStringList('ff_selectedServiceCategory',
        _selectedServiceCategory.map((x) => x.toString()).toList());
  }

  final _myAddressesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> myAddresses({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _myAddressesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMyAddressesCache() => _myAddressesManager.clear();
  void clearMyAddressesCacheKey(String? uniqueKey) =>
      _myAddressesManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
