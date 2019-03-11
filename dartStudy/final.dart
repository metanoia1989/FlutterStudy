void main(List<String> args) {
  final name = '刘深海'; // final声明的变量 赋值之后不允许修改
  // name = '曾力';
  final  names = ['刘深海', '曾力', '张佳'];
  names[1] = '曾力+11';

  const titles = ['金庸', '杨过', '小龙女'];
  titles[1] = '杨过+11';

  // 如果您有包含集合的final字段，则该集合仍然可以变为可变。 
  // 如果你有一个const集合，那么其中的所有东西也必须是递归的const。
}