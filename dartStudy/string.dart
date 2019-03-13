
void main() {
  String s = 'string';
  assert('this is a string' == 'this is a $s');
  assert('this is a STRING' == 'this is a ${s.toUpperCase()}');
  print('测试通过');
  print(s.hashCode);
  print(s.runtimeType);
  print(s.compareTo('strngs'));
  print(s.substring(1, 4));
  print(s.split('i'));
}