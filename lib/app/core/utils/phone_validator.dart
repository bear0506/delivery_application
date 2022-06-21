/*
*title*: 핸드폰번호 벨리데이션
*description*: 핸드폰번호 벨리데이션을 체크합니다.
*/

class PhoneCorrectWordParameter {
  bool isCharacters;
  bool isNumber;
  PhoneCorrectWordParameter({this.isCharacters = false, this.isNumber = false});
  bool get isCorrectWord => (isCharacters && isNumber);
}

PhoneCorrectWordParameter checkPossiblePhoneText(String value) {
  var correctWordParameter = PhoneCorrectWordParameter();
  final validNumbers = RegExp(r'/^\d{3}-\d{3,4}-\d{4}$/');

  // 문자가 비었는지 확인
  if (value.isEmpty) {
    return PhoneCorrectWordParameter();
  }

  // 휴대폰 번호 확인
  if (validNumbers.hasMatch(value)) {
    correctWordParameter.isNumber = true;
  } else {
    correctWordParameter.isNumber = false;
  }

  // 11자 이상인지 확인
  if (value.length >= 11) {
    correctWordParameter.isCharacters = true;
  } else {
    correctWordParameter.isCharacters = false;
  }

  return correctWordParameter;
}
