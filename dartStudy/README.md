# 声明变量
var  dart语言自身进行类型推断           
dynamic 可以类型转换            
const  如果你有一个const集合，那么其中的所有东西也必须是递归的const。           
final  如果您有包含集合的final字段，则该集合仍然可以变为可变。          
  
# 内置类型
numbers -> num ->  int double 数值类型          
strings -> String           
booleans            
lists (也被称之为 arrays)           
maps            

## 数值类型
```dart
var x = 1;
var hex = 0xDEADBEEF;
var bigInt = 34653465834652437659238476592374958739845729;
var y = 1.1;
var exponents = 1.42e5;
```
字符换 数值类型转换
```dart
var one = int.parse('1');
var onePointOne = double.parse('1.1');
String oneAsString = 1.toString();
String piAsString = 3.14159.toStringAsFixed(2);

```

# 语句
is 判断变量类型 

# 常用标准库
dart:core Dart语言内建的类型 对象  Dart语言核心的功能           
dart:async 异步编程的库         
