# 声明变量
var  dart语言自身进行类型推断           
dynamic 可以类型转换            
const  如果你有一个const集合，那么其中的所有东西也必须是递归的const。           
final  如果您有包含集合的final字段，则该集合仍然可以变为可变。          
  
# 内置类型
numbers -> num ->  int double 数值类型          
strings -> String           
booleans -> bool -> true false           
lists (也被称之为 arrays) -> List<T> 
maps -> Map<K, V>           

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

## 字符串类型
字符串内使用变量 `{var}`        
字符串内使用表达式 `${expression}`          
字符串内表达式是对象时，会调用对象的 `toString()` 方法。        
字符串连接使用 `+` 操作符
```dart
String s = "string";
assert('this is a string' == 'this is a $s');
assert('this is a STRING' == 'this is a ${s.toUpperCase()}');
```

使用三个单引号或双引号创建多行字符串 
```dart
String s1 = '''
你能创建多行字符串
哈哈，这是多行字符串
''';
String s2 = """你能创建多行字符串 
哈哈，这是多行字符串""";
```

**字符串对象属性**      
String.isEmpyt() -> bool 字符串是否为空         
String.isNotEmpty() -> bool 字符串是否不为空           
String.length -> int 字符串长度     
String.hashCode -> int 返回从字符串的代码单元派生的哈希码       

**字符串对象方法**      
String.toLowerCase() -> String 字符串小写           
String.toUpperCase() -> String 字符串大写           
String.trim() -> String  取出字符串左右空格         
String.trimLeft() -> String  取出字符串左侧空格         
String.trimRight() -> String  取出字符串右侧空格        
String.substring() -> String 切片字符串     
String.split() -> List<String> 分割字符串       
String.contains() -> bool 检测是否包含另一个字符串      
String.indexOf() -> int 检测子字符串的开始处索引        
String.lastIndexOf() -> int 检测子字符串的结束处索引        
String.padLeft() -> 填充字符串左侧      
String.padRight() -> 填充字符串右侧     
String.replaceFirst() -> 替换匹配第一个字符串       
String.replaceAll() -> 替换匹配所有字符串       



## 布尔类型
[Dart tutorial : How to use Boolean in Dart](https://www.codevscolor.com/dart-tutorial-how-to-use-boolean-in-dart/)

非布尔值无法转换为布尔值， null 转换 bool 还是 null;
```dart
bool b = true;
if (b) {
    print('b is true');
}
```

## 列表类型
声明一个列表常量：`var constantList = [1, 2, 3]`        
声明一个有类型的列表：`List<int> ages = [11, 22, 15]`       

**列表的属性**       
List.first -> E 返回列表的第一个元素     
List.last -> E 返回列表的最后一个元素        
List.length -> int 返回列表的元素个数       
List.reversed -> Iterable<E> 返回逆序的列表的iterable对象       
List.hashCode -> int 返回列表的hash码       
List.isEmpty -> bool 判断列表是否为空       
List.isNotEmpty -> bool 判断列表是否不为空       
List.single -> E 当列表只有一个元素是返回该元素，否则抛出异常       

**列表对象的方法**          
List.add() -> void      
List.addAll() -> void           
List.asMap() -> Map\<int, E\>       
List.clear() -> void            
List.insert() -> void       
List.insertAll() -> void        
List.remove() → bool            
List.removeLast() → E       
List.removeAt(int index) → E        

## Map 键值对对象
几种Maps对象的创建及赋值方式， 键和值可以是任何类型的对象，键是唯一的。
```dart
// 字面量方式
var gifts = {
// Keys      Values
  'first' : 'partridge',
  'second': 'turtledoves',
  'fifth' : 'golden rings'
};
// 实例化 Map 对象
var gifts = new Map();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';
```

获取map中键对应的值，不存在返回 null：`gifts['first']`




# 操作符
`==` 比较两个对象是否一样


# 语句
is 判断变量类型         
as 转换变量类型     
if 的条件必须为 布尔类型，否则在检查模式下将会抛出异常.
```dart
if(booleanvalue) {

} else if () {
} else {

}
```
# 常用标准库
dart:core Dart语言内建的类型 对象  Dart语言核心的功能           
dart:async 异步编程的库         
