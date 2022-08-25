import 'dart:developer';
import 'package:rxdart/rxdart.dart';
import '../model/app_database_results.dart';

class RxDataStore {
  RxDataStore._();

  factory RxDataStore.getInstance() => _instance;
  static final RxDataStore _instance = RxDataStore._();

  dynamic subject = BehaviorSubject<Object>();
  final Object empty = Object();

  BehaviorSubject getResultValue() {
    return subject;
  }

  stopListingValue() {
    subject.close();
  }

  onResultHandler(result, String resultType) async {
    var resultData = DatabaseResults();
    resultData.result = result;
    resultData.resultType = resultType;
    log("-----------------------subject:${subject.isClosed}");
    if (subject.isClosed) {
      subject = BehaviorSubject<Object>();
      subject.add(resultData);
    } else {
      subject.add(resultData);
    }
  }
}