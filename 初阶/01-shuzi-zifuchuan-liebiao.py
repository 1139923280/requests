"""
#标识符
python 标识符 是由数字，字母和下划线 (_)组合而成，但是不能用数字开头，且区分大小写
第一个字符必须是字母、或者下划线_
标识符其它部分必须是字母、数字、下划线

#关键字--终端输入
import keyword
keyword.kwlist

#缩进  空格1个、空格2个
Python最具特色的就是使用缩进来表示代码块，不需要使用大括号 {} 。
缩进的空格数是可变的，但是同一个代码块的语句必须包含相同的缩进空格数。

#输入输出
输入和输出分别由大于号和句号提示符（ >>> 和 ... ）标注

"""
# 第一个输出
print('hell,word')
# 计算器（数字、字符串、列表）
print('100 + 200 =', 100 + 200)
# 数字--整数
print(100 + 200, '数字-整数-int 类型')  # int类型是整数包含有符号整型，可以是正整数、负整数或零
print(6 / 2, '数字-小数-float 类型')  # float类型是小数包含有浮点数、定点数
print(8 / 9, '数字-小数-浮点数-float 类型')
print(17 // 9)
print(17 / 9)
...
# 字符串
print('spam eggs', '单引号')
print("spam eggs", '双引号')
print('doesn\'t', '转义')  # 特殊字符'会用反斜杠转义,就是将' 转换为普通字符，以供输出到屏幕上
print('C:\some\name')  # 有 \ 的字符被当作特殊字符(\n 换行)时、可以在第一个引号前面加上一个 r:
print(r'C:\some\name')
print('''Usage: thingy [OPTIONS] 
     -h                        Display this usage message 
     -H hostname               Hostname to connect to''')  # 字符串文本能分成多行,可以使用"""..."""或者'''...'''
print(4 * ' hello' + ' world')  # 字符串可以由 + 操作符连接(粘到一起)，可以由 * 表示重复:
# 字符串也可以被截取(检索)。类似于 C ，字符串的第一个字符索引为 0 。Python没有单独的字符类型；一个字符就是一个简单的长度为1的字符串。:
word = 'Python'
print(word)
print(word[0])
print(word[-1])
# 除了索引，还支持 切片 | 包含起始的字符，不包含末尾的字符  |  切片的索引有非常有用的默认值；省略的第一个索引默认为零
print(word[0:2])
print(word[:2])
print(word[1:2])
print(word[0:2] + word[2:6])

# 列表
lists = 'a', 'b', 'c'
print(lists)
squares = ['1', '2', '3', '4']
print(squares)
# 列表和字符串类似也可以被索引和切片:  |  也可以对切片赋值，此操作可以改变列表的尺寸，或清空它:|使用 append() 方法 （后面我们会看到更多关于列表的方法的内容）在列表的末尾添加新的元素:
print(lists[0] + squares[0])
print(lists[2])
print(lists[:])
print(lists[:2])
# 允许嵌套列表(创建一个包含其它列表的列表)，例如:
print([lists, squares])
x = [lists, squares]
print(x)
# print(x[1] + x[0])

# 第一个编程
a, b = 1, 2
while b < 10:
    # b += b
    print(b)
    a, b = b, a + b

