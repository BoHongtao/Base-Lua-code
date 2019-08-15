-- 几种数据类型
print(type("Hello world"))      --> string
print(type(10.4*3))             --> number
print(type(print))              --> function
print(type(type))               --> function
print(type(true))               --> boolean
print(type(nil))                --> nil
print(type(type(X)))            --> string

print("-------------------------------------------")

-- nil 赋值，相当于删除
print("tab1的值")
tab1 = { key1 = "val1", key2 = "val2", "val3" }
for k, v in pairs(tab1) do
    print(k .. " => " .. v)
end

print("-------------------------------------------")

-- 赋值（删除）
print("删除之后的tab1:")
tab1.key1 = nil
for k, v in pairs(tab1) do
    print(k .. " => " .. v)
end

print("-------------------------------------------")

type(a)
-- 判断的时候nil要加引号
print(type(a)=="nil")

print("-------------------------------------------")

print(type(2))
print(type(2.2))
print(type(0.2))
print(type(2e+1))
print(type(0.2e-1))
print(type(7.8263692594256e-06))

print("-------------------------------------------")
print("类型转换")
print(type("2" + 6))
print(type("2" + "6"))


print("-------------------------------------------")
print("表")
-- 注：local是局部变量，不带是全局变量
local tb = {}
local tb2 = {"apple","acer"}
for k,v in pairs(tb2) do
	print(k,v)
end


print("-------------------------------------------")
function test(n)
	if n==0 then
		return 0
	else
		return n
	end
end
print(test(1))
print(test(0))

print("-------------------------------------------")

-- lua函数定义格式如下
--optional_function_scope function function_name( argument1, argument2, argument3..., argumentn)
--    function_body
--    return result_params_comma_separated
--end

print("比较6的函数作为参数传递,我觉得就是匿名函数")
print_fun = function ( param )
	print("我要打印出你传递的参数是",param)
end

function max( num1,num2,function_param )
	local max
	if (num1>num2) then
		 max = num1
	else
		 max = num2
	end
	function_param(max)
	return max
end

print(max(1,2,print_fun))


print("-------------------------------------------")
print("关系运算符")
--比较注意的就是不等号，其他的和其他语言差不多
-- == ~= >= <= > < 
local a = 20
local b = 30
print(a~=b)

print("-------------------------------------------")
-- 注意： 这里和其他语言不同，数字0 1 不会当做true or false
print("逻辑运算符")
local c = true
local d = true
local f = 0

print(c and d)
print(c and a)
print(c and f)

print("-------------------------------------------")
print("字符串")
string1 = "hello "
string2 = "lua"
print(string1..string2)
string3 = [["转移的引号"]]
print(string3)

--　大小写转换
string1 = string1.upper(string1)
print(string1)
string1 = string1.lower(string1)
print(string1)
-- 替换
string1 = string1.gsub(string1,' ','-')
print(string1..string2)

--打印出ascii码
print(string.char(65,97,98,99,100))

--计算长度len　　反转　reverse 查找　find
--字符函数较多，不列举了，用的时候查

print("-------------------------------------------")
print("数组")

--注意，ｌｕａ的数组索引值从１开始的，其实还是看你初始化的时候如何指定的，甚至你可以指定负数
array = {"Lua", "Tutorial"}
for i= 1, 2 do
   print(array[i])
end

--　多维数组
-- 初始化数组
array = {}
for i=1,3 do
   array[i] = {}
      for j=1,3 do
         array[i][j] = i*j
      end
end

-- 访问数组
for i=1,3 do
   for j=1,3 do
      print(array[i][j])
   end
end