void main(List<String> args) {
  int one = int.parse('1234');
  var type = one is int;
  print('one是不是int类型 $type');
}