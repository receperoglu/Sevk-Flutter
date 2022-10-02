import 'package:intl/intl.dart';

getFormat(date) {
  var inputFormat = DateFormat('yyyy-MM-dd');
  var inputDate = inputFormat.parse(date);
  var outputFormat = DateFormat('dd.MM.yyyy');
  return outputFormat.format(inputDate);
}
