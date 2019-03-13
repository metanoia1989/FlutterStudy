void main() {
  var t;
  var s = 'hello';
  assert(t == null);
  assert((t as bool) == false);
  if (s == true) {
    print('字符串竟然 false');
  }

  bool first = false;
  if(first){
    print("first is true");
  }else{
    print("first is false");
  }

  print('除了 true 对象为 true，其他所有的值都是 false');

}