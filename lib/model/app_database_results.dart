// ignore_for_file: unnecessary_getters_setters, prefer_typing_uninitialized_variables

class DatabaseResults {
  var _result;
  var _resultType;

  DatabaseResults();

  get result => _result;

  set result(value) {
    _result = value;
  }

  get resultType => _resultType;

  set resultType(value) {
    _resultType = value;
  }
}