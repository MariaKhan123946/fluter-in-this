String todaysDateYYYYMMDD() {
  var dateTimeObject = DateTime.now();
  return convertDateTimeToYYYYMMDD(dateTimeObject);
}

DateTime createDateTimeObject(String yyyymmdd) {
  // Check if the input string has the correct length
  if (yyyymmdd.length != 8) {
    throw ArgumentError('Invalid input format. Expected YYYYMMDD.');
  }

  int yyyy = int.parse(yyyymmdd.substring(0, 4));
  int mm = int.parse(yyyymmdd.substring(4, 6));
  int dd = int.parse(yyyymmdd.substring(6, 8));

  DateTime dateTimeObject = DateTime(yyyy, mm, dd);
  return dateTimeObject;
}

String convertDateTimeToYYYYMMDD(DateTime dateTimeObject) {
  String year = dateTimeObject.year.toString();
  String month = dateTimeObject.month.toString().padLeft(2, '0');
  String day = dateTimeObject.day.toString().padLeft(2, '0');
  String yyyymmdd = '$year$month$day';

  return yyyymmdd;
}
