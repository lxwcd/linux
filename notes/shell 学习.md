# 学习资源

## 学习网站
> [学习 Shell 脚本编程的免费资源 | Linux 中国](https://zhuanlan.zhihu.com/p/155613380)
> [Bash 脚本教程](https://wangdoc.com/bash/intro)
> [learnshell](https://www.learnshell.org/)
> [linuxcommand](http://linuxcommand.org/lc3_learning_the_shell.php)
> [牛客刷题练习](https://www.nowcoder.com/exam/oj?page=1&tab=SHELL%E7%AF%87&topicId=195)
> bash 官方文档：[Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html)
> [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/index.html)
> [学习 shell 有什么好书推荐？](https://www.zhihu.com/question/19745611/answer/129024703)
> [The Unix School](https://www.theunixschool.com/p/shell-scripts.html)

## 书籍

## 博客

## 脚本示例

## 练习

# 学习过程
1. 零基础学习
学习 shell 前应先学 Linux 基本知识。
在 [learnshell](https://www.learnshell.org/) 上学习，该网站讲的详细，可以在线练习，但内容少。
将 [Bash 脚本教程](https://wangdoc.com/bash/intro) 教程看完一遍。

> [Shell Scripting Tutorial](https://www.tutorialspoint.com/unix/shell_scripting.htm) 
> 要查询一些用法在官网：[bash manual](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Introduction)


# 查询当前 shell 类型和全部 shell 类型
> [Shell 的种类 ](https://wangdoc.com/bash/intro#shell-%E7%9A%84%E7%A7%8D%E7%B1%BB)


![1](https://img-blog.csdnimg.cn/85e2bba9df4a45ad857d1a486f1e8e8b.png)

# 设置 shell 选项 shopt 
[shopt 命令](https://wangdoc.com/bash/expansion#shopt-%E5%91%BD%E4%BB%A4)

# 引号和转义
> [引号和转义](https://wangdoc.com/bash/quotation)

# bash Quoting
> 在线帮助文档：[3.1.2 Quoting](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Quoting)



- `man bash` 搜索 `QUOTING` 查看帮助文档
![1](https://img-blog.csdnimg.cn/1d297bc8e8e1415c81a5bf3e6acfd7e4.png)


## 单引号
> [单引号](https://wangdoc.com/bash/quotation#单引号)

- 单引号包围的任何特殊字符都会变成普通字符
- 如果要使用单引号，不能用 `\` 转义，因为 `\` 变成普通字符，没有转义功能，可以在双引号中使用单引号

![1](https://img-blog.csdnimg.cn/1bd1209998dd4dc69bedf68d7a42e55a.png)

## 双引号
- 除了 `$` `\` 反向单引号（**`**） 其他字符均视为普通字符
- 显示双引号还是需要转义

![1](https://img-blog.csdnimg.cn/49c412977f634760a642a8d9ab6b8359.png)
![2](https://img-blog.csdnimg.cn/73cbf331f6a04e6ba18dce52da6dc3f8.png)


## 不加引号时转义特殊字符
### 哪些字符需要转义
> 只有部分：[Special Characters and Quoting](https://www.oreilly.com/library/view/learning-the-bash/1565923472/ch01s09.html)
> [3.1.2.4 ANSI-C Quoting](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#ANSI_002dC-Quoting)


- 注意 `\` 后按换行表示换行继续写，不是转义
- `man bash` 中列出的 ANSI-C 一些转义
![1](https://img-blog.csdnimg.cn/a73b0b338a51435dbe37c524eda8b78e.png)
![2](https://img-blog.csdnimg.cn/4876725e4752404f84d5c35477445918.png)


# set 命令
> [4.3.1 The Set Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Set-Builtin)


# shopt 命令
> [4.3.2 The Shopt Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin)


# Lists of Commands
> [List of Commands](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Lists)


- A `list` is a sequence of one or more pipelines separated by one of the operators `;`, `&`, `&&`, or `||`, and optionally ternimated by one of `;`, `&`, or a `newline`.


## ;
- 用 `;` 分开的命令顺序执行
- 返回状态值为最后一条命令的执行结果
- 不用 `;` 分开时一条命令中只要有错误的结果，则返回错误

![](img/2023-03-18-10-20-02.png)
![](img/2023-03-18-10-22-15.png)


## &
- 命令以 `&` 结束则 shell 异步地在子进程中执行
- 命令在后台执行
- 返回状态值为 0（true）

## &&
- 前面的命令执行成功才会执行右边的命令
- left associativity


## ||
- 左边的命令执行错误才会执行右边的命令
- left associativity


## && 和 || 组合

![](img/2023-03-29-09-32-06.png)


# shell expansion
> 在线官方文档：[3.5 Shell Expansions](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Expansions)
> [Bash 的模式扩展](https://wangdoc.com/bash/expansion)


- shell 先将命令分成 tokens
- 然后进行扩展，**按照一定顺序**，注意扩展的顺序
![1](https://img-blog.csdnimg.cn/dd0ee2039e5c41afbe79f69f3325f87e.png)
![](img/2023-03-29-14-54-21.png)

- 扩展完成后再执行命令



## { } brace expansion 
> [3.5.1 Brace Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Brace-Expansion)
> [大括号扩展](https://wangdoc.com/bash/expansion#大括号扩展)


- 花括号扩展是第一个扩展的，在其他扩展之前，因此，花括号中不能放其他扩展格式
![](img/2023-03-29-14-57-46.png)


### {a,b,c}
- 里面的逗号前后不能有空格
![](img/2023-03-29-14-36-19.png)


### {x..y[..incr]}
- {x..y[..incr]} x，y 可以是整型或字母
![](img/2023-03-29-14-41-54.png)
- 
![](img/2023-03-29-14-47-24.png)



![1](https://img-blog.csdnimg.cn/e4f85bf49b264dc0832a533828ea659b.png)
![2](https://img-blog.csdnimg.cn/2534c660a0844aef926dab4c03237ccf.png)
![3](https://img-blog.csdnimg.cn/1c3b613167c2401eb7b032ad71408930.png)



## ~ tilde expansion 
> [3.5.2 Tilde Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Tilde-Expansion)


- `man bash` 搜索 `Tilde Expansion` 查看帮助说明
![1](https://img-blog.csdnimg.cn/94a44f9f3f154652be5653cca7b1a825.png)
![2](https://img-blog.csdnimg.cn/653f160259864e90affed81714f000a7.png)

## ${ } shell parameter expansion

> [3.5.3 Shell Parameter Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Parameter-Expansion)
> [变量扩展](https://wangdoc.com/bash/expansion#变量扩展)


![1](https://img-blog.csdnimg.cn/9059ce606d964e12a0d53372b587b312.png)

![2](https://img-blog.csdnimg.cn/2292d4dcaae54e298c9db9a74ed8b507.png)

![3](2023-03-06-10-10-44.png)

### `$` 和 `${ }` 两种写法比较
- 如果变量后面还有参数，只能用 `${ }` 的形式
![1](https://img-blog.csdnimg.cn/76011923a6ec446083ca48a16bcda54a.png)


### ${parameter:-word} 为输出参数添加默认值
- 为变量 `parameter` 添加一个默认值，如果该变量不存在，则输出 `word`

![1](https://img-blog.csdnimg.cn/e8d63e93f1bf4367a2b66e69739ffbde.png)
![2](https://img-blog.csdnimg.cn/c0597f0d93ab40eea6d26f854704e6b9.png)

### ${parameter:=word} 为变量赋默认值
- 变量 `parameter` 不存在，则将默认值 `word` 复制给该变量

![1](https://img-blog.csdnimg.cn/b8f12425e7804d63b14f1bd77502b68e.png)

### ${parameter:?word} 变量为空则输出错误提示到标准错误
![1](https://img-blog.csdnimg.cn/bc49121d4d6d4a2b8a07aebad7bd6389.png)
![2](https://img-blog.csdnimg.cn/d65f85f7d69744fa96c0cda0c60d9082.png)

### ${parameter:+word} 变量存在则用默认值替换
- 和 `${parameter:-word}` 的效果相反


![1](https://img-blog.csdnimg.cn/35d7b10120ef40fcaef51a0f7223e7be.png)
![2](https://img-blog.csdnimg.cn/defaa9dcee0a48199de532102b1a9547.png)

### ${parameter:offset:length} 截取部分内容
![1](https://img-blog.csdnimg.cn/2d39d228bce3459ba01c6d7d6d9812bb.png)



- substring expansion
- `offset` 定义偏移量，如果为 0，则从第一个字符开始截取
- `length` 定义截取的长度，不指定则截取到最后
- `offset` 是负数则从最后开始数偏移量，最后一个字符是 `-1`，不指定长度，则默认到最后
- `offset` 是负数时，负数要与分隔符 `:` 至少间隔一个空格


![1](https://img-blog.csdnimg.cn/45c27819f10b4d27a91ff8035234e3f1.png)

## $() 和 `` 子命令扩展
> [3.5.4 Command Substitution](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Command-Substitution)
> [子命令扩展](https://wangdoc.com/bash/expansion#子命令扩展)


- `man bash` 查看帮助
![1](https://img-blog.csdnimg.cn/86df82a1119543b0b6665fc53b09e3a0.png)
![2](https://img-blog.csdnimg.cn/84d18d3d655d41e2a8168b92f45096ba.png)
![3](https://img-blog.csdnimg.cn/aab2322e3a634f84bcb609a5b7444e97.png)


## $(( )) 算数扩展
> [3.5.5 Arithmetic Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Arithmetic-Expansion)
> [6.5 Shell Arithmetic](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Arithmetic)
> [Bash 的算术运算](https://wangdoc.com/bash/arithmetic)



- `man bash` 查看帮助
![1](https://img-blog.csdnimg.cn/a97d83103a474d81906e734fc6d35f22.png)
![2](https://img-blog.csdnimg.cn/be29f6eb29d24b82aca905de875f5776.png)

- 只支持整数的算数运算
![1](https://img-blog.csdnimg.cn/91c31ba1f75e4e9e8a92daa2800be5f7.png)
![2](https://img-blog.csdnimg.cn/d48f8c492d144ce7b713d10645393e28.png)

## <(list) 或 >(list) Process Substitution
> [3.5.6 Process Substitution](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Process-Substitution)
> [Process substitution](https://en.wikipedia.org/wiki/Process_substitution)
> [Chapter 23. Process Substitution](https://tldp.org/LDP/abs/html/process-sub.html)

- `man bash` 查看帮助
![1](https://img-blog.csdnimg.cn/ccd5b75c60e04f74a9548d3eaba03e29.png)


## Word Splitting

> [3.5.7 Word Splitting](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Word-Splitting)
> [What is word splitting? Why is it important in shell programming?](https://unix.stackexchange.com/questions/26661/what-is-word-splitting-why-is-it-important-in-shell-programming)


![1](https://img-blog.csdnimg.cn/cf37dc4cb209407eafd2b9fd21bacd0e.png)


## Filename Expansion
> [3.5.8 Filename Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Filename-Expansion)
> [3.5.8.1 Pattern Matching](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pattern-Matching)
> [Think You Understand Wildcards? Think Again.](https://medium.com/@leedowthwaite/why-most-people-only-think-they-understand-wildcards-63bb9c2024ab)


![1](https://img-blog.csdnimg.cn/3a4878be23004b4e950b6330da073c43.png)
![2](https://img-blog.csdnimg.cn/219fcec268174ee4b5045fe7b6e18060.png)
![3](https://img-blog.csdnimg.cn/a7eadcbcce0148d499e9f4944a6c71d9.png)
![4](https://img-blog.csdnimg.cn/520c0181eead4978a533ea8772bb39fe.png)


### * 扩展
> [3.5.8.1 Pattern Matching](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pattern-Matching)

![1](https://img-blog.csdnimg.cn/dbe7900b7afc4ca3a9c0330b6db50a70.png)

- multi-character wildcard
- 匹配 0 个或多个字符
- `*` 默认不匹配隐藏隐藏文件
![1](https://img-blog.csdnimg.cn/6e15e970e08a4325a5b77c95f99c5010.png)
![2](https://img-blog.csdnimg.cn/71059cdda01843f2a7dae1b6da145fb9.png)

- `*` 可以匹配空字符
![2](https://img-blog.csdnimg.cn/c41981a090b144cbb5d5c2ef4f99a1be.png)

#### shopt -s dotglob 让 * 匹配隐藏文件
> [4.3.2 The Shopt Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin)


![1](https://img-blog.csdnimg.cn/7a508c19aa30489cb411bc100da8ccdf.png)


### ？扩展
- `?` 匹配单个字符，必须有字符，不匹配空字符
- `?` 也可以匹配汉字

![1](https://img-blog.csdnimg.cn/feb466578a294cc5b451c92e00e33b45.png)
![2](https://img-blog.csdnimg.cn/0791308801064129adc56354a5340176.png)

### [...] 扩展
- `[aA]b` 匹配 `ab` 或 `Ab`
![1](https://img-blog.csdnimg.cn/1d0ab282eccf4b6cacd508f19e883521.png)
![2](https://img-blog.csdnimg.cn/2448eb07151f48b3abe0c7784873adca.png)


- `[start-end]` 方式不同 bash 版本，扩展方式可能不同，可查看 [3.5.8.1 Pattern Matching](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pattern-Matching) 的说明
![1](https://img-blog.csdnimg.cn/83de8ee8c0bc488db165f353308175bb.png)
![2](https://img-blog.csdnimg.cn/aab8bb7fae7943fa9a6e477b7b06737f.png)
![3](https://img-blog.csdnimg.cn/b07efaf0b82b4d74887a7219f86fa7a3.png)

### 扩展模式匹配操作符 Extended globbing
- `extglob` 即 `Extended globbing`，扩展的通配符
- 需要 `extglob` 处于可用状态则可以使用
![1](https://img-blog.csdnimg.cn/ec69eae61f51493e85fcf2b9c8cb6d11.png)
![2](https://img-blog.csdnimg.cn/811cbfce97674259b5485d162f61021b.png)
![3](https://img-blog.csdnimg.cn/6989c544af7f4b38b219baab1884d792.png)



#### ?(pattern-list)  匹配 0 到 1 个匹配的模式
![1](https://img-blog.csdnimg.cn/c52f6dbcf08141dd8f87e7a4f0a9fbdb.png)

#### *(pattern-list)  匹配 0 到 多 个匹配的模式
![1](https://img-blog.csdnimg.cn/f0109374977e4a36b936bb4bb4ebc33b.png)

#### +(pattern-list)  匹配 1 到 多 个匹配的模式
![1](https://img-blog.csdnimg.cn/1119d43a60ff41129ff7d8ef1399f1ad.png)

#### @(pattern-list)  匹配给定模式中的一种
![1](https://img-blog.csdnimg.cn/5d932a55b39c4a738d7056f47a11adab.png)

#### !(pattern-list)  匹配给定模式以外的字符
![1](https://img-blog.csdnimg.cn/9c007468175443ab808f7e9782edea0f.png)




## Quote Removal
> [3.5.9 Quote Removal](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Quote-Removal)




# 特殊参数
![1](https://img-blog.csdnimg.cn/3af7e751006b48c7b75e44ba9712a17f.png)


# 变量
## 变量名
- 区分大小写
- 字母、数字和下划线，不以数字开头
- 不与保留变量名相同



# Bash Conditional Expressions
> [Bash Conditional Expressions](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Conditional-Expressions)

- When used with `[[`, the `<` and `>` operators sort lexicographically using the current locale. The `test` command uses ASCII ordering.



## 文件判断

- Unless otherwise specified, primaries that operate on files follow **symbolic links** and operate on the **target of the link**, rather than the link itself.


### 选项
![](img/2023-03-29-09-53-20.png)
![](img/2023-03-29-09-55-10.png) 

### -a|-e 判断文件是否存在
- `-a` 和 `-e` 都是判断文件是否存在
- 有的版本用 `-a` 可能有问题，最好用 `-e`
- 这种判断文件不区分文件类型

![](img/2023-03-29-10-25-21.png)


### -f|-d|-b|-c|-p|-h|-L|S 根据文件类型判断
- `-f` 判断普通文件（regular file），符号链接和硬链接文件也会判断
- `-d` 判断目录
- `-b` 判断块文件（block special file）
- `-c` 判断字符文件（character special file）
- `-p` 判断管道文件（named pipe）
- `-h` 和 `-L` 都是判断符号链接
- `-S` 判断套接字文件（socket）

![](img/2023-03-29-10-42-13.png)
![](img/2023-03-29-10-46-26.png)
![](img/2023-03-29-10-49-39.png)


### -r|-w|-x 根据文件权限判断
- 注意 root 判断时特殊性，文件没有 r 和 w，root 也有这两项权限
- 只要文件中 u, g 或 o 有一个有 x，权限，则 root 有 x，否则 root 也没 x 权限
- 符号链接文件判断的是源文件

![](img/2023-03-29-10-58-22.png)
![](img/2023-03-29-11-01-52.png)
![](img/2023-03-29-12-06-24.png)

### -u|-g|-k 根据文件特殊权限判断
- `-u` 为设置 `SUID` 权限
- `-g` 为设置 `SGID` 权限
- `-k` 为设置 `SBIT` 权限
- 如果是符号链接文件，直接判断的是源文件而非符号链接文件

![](img/2023-03-29-12-03-09.png)


### -N 判断文件是否修改过
![](img/2023-03-29-12-12-51.png)


### -O|-G 文件存在且有有效的 UID|GID
- `-O` 文件存在且有有效的 UID
- `-G` 文件存在且有有效的 GID

### file1 -ef file2 两个文件相同
- equal file
- 两个文件同属某个文件的**硬链接**或者一个为另一个的**硬链接**
- 两个文件的 inode 号相同，且属于一个分区的一个文件系统

### file1 -nt file2 比较两个文件的时间
- newer than
- 比较的是 mtime
- file1 必须存在
- file2 不存在，file1 存在，返回 true

![](img/2023-03-29-14-23-07.png)


### file1 -ot file2
- older than
- 比较 mtime
- file1 不存在，file2 存在，返回 true

![](img/2023-03-29-14-27-25.png)


## 变量判断

### -v varname  判断变量是否赋值
- True if the shell variable varname is set (has been assigned a value)
- 变量赋值为空也可以 
![](img/2023-03-29-15-17-43.png)


### -R varname 变量是 name reference
- True if the shell variable is set and is a name reference

## -o optname shell 选项判断
> [The Set Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Set-Builtin)

- True if the shell option optname is enabled
![](img/2023-03-29-15-23-20.png)


## 字符串判断

### -z 字符串长度为零
- 字符串长度为 zero 则为 true
- 字符串最好用双引号包围
- 字符串中仅一个空格也不为空

![](img/2023-03-29-15-29-34.png)


### -n 字符串长度不为零
- 字符串长度为 non-zero 则为真
- 可以直接写字符串判断
![](img/2023-03-29-15-33-45.png)


### 字符串是否相等
- 两种格式：string1 == string2 或 string1 = string2
- 等号前后需要有空格，否则变成变量赋值
- `=` should be used with the `test` command for POSIX conformance
![](img/2023-03-29-15-36-54.png)

### 字符串比较
- string1 != string2
- string1 < string2 
- string1 > string2


![](img/2023-03-29-15-48-46.png)

## 整型数值比较
> [Shell Basic Operators](https://www.tutorialspoint.com/unix/unix-basic-operators.htm)

![](img/2023-03-29-15-54-31.png)

- Arg1 and Arg2 mau be positive or negative intergers


# Shell Arithmetic
> [Shell Arithmetic](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Arithmetic)


![](img/2023-03-29-16-27-32.png)





# Looping
- 语句后加上 `;` 来代替换行
- 用 `;` 分割命令，使得多个命令写在同一行
- 条件中如果写 `:` 相当于 `true`
![](img/2023-03-28-17-10-58.png)  
  
## until
```bash
until [ condition ]
do
...
done
```
或
```bash
until [ condition ]; do
...
done
```

- `until` 后面的条件不满足则执行循环，满足则退出循环
- 最后的退出状态为最后一条指令的执行结果

## while

```bash
while [ condition ]
do
...
done
```

- 满足条件则执行循环


### while read
- 从标准输入读写入变量中
- 


//TODO: 补充脚本
### 脚本示例
#### 判断一个网站能否访问
- `curl www.baidu.com` 可以测试写的网站能否访问
- 能访问则返回 0，不能访问返回非0

![](img/2023-03-28-20-04-43.png)

#### 监控分区利用率
- 设置一个阈值，最大的分区利用率超过阈值则报警并发邮件
- 报警时提示超过阈值的设备文件
- `df` 命令查看分区利用率，`sed` 取出利用率数值，`sort` 排序
- ubuntu 22.04 虚拟机中设备 `/dev/sda` 等格式，ubuntu 20.04 物理机不是该名字



## for

### for ... do ... done
```bash
for arg in [list]
do
...
done
```
```bash
for var in con1 con2 con3 ...
do
...
done
```

### for ((exp1; expr2; exper3))
> [Syntax error: Bad for loop variable](https://stackoverflow.com/questions/30358065/syntax-error-bad-for-loop-variable)


- 用这种格式，执行时可以正常执行，但 `sh -n` 检查时提示 `bad for loop variable`，改用 `bash -n` 无错误

![](img/2023-03-18-11-28-35.png)

## break
> [break](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#index-break)


- break [N] 后面可以指定一个数字，最内层的为 1
## continue

# Conditional Constructs
## if
```bash
if [ condition ]; then
...
fi
```
```bash
if [ condition ]; then
...
elif [condition ]; then
...
else
...
fi
```

## case

```bash
case "$var" in
    "$con1")
        ...
    ;;
    "$con2|$con3")
        ...
    ;;
    *)
        ...
    ;;
esac
```

## select
> [select](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#index-select)


- 方便生成菜单
- select name [in words ...]; do conmmand; done
- words 会被扩展，产生一系列项，每项最前面是一个数字
- 如果省略 `in words` 部分，则默认用 `$@`
- select display the `PS3` prompt and reads a line from the standard input
- 遇到 EOF 则终止并返回 1
- The line read is saved in the variable `REPLY`
- 可以用 `break` 终止


```bash
select name in words
do
...
done
```

# Operators
## ((expression)) Arithmetic Expression
> [arithmetic expression](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#index-select)


![](img/2023-03-18-14-37-34.png)


## [ expression ] Test Expression
- 方括号的两边要有空格
- 字符串比较时最好用双引号包围



## [[ expression ]] Test Expression
> [conditional expression](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#index-_005b_005b)
> [Are double square brackets [[ ]] preferable over single square brackets [ ] in Bash?](https://stackoverflow.com/questions/669452/are-double-square-brackets-preferable-over-single-square-brackets-in-b)


- The words between the [[ and ]] do not undergo word splitting and filename expansion.
- Conditional operators such as `-f` must be unquoted to be recognized as primaries.


### == 和 !=
- 右边的字符串被认为是 [Pattern Matching](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pattern-Matching)
![](img/2023-03-29-17-08-52.png)


### =~ 
- 右侧的字符串会被认为是 POSIX extended regular expression pattern and matched accordingly.



## , comma operator
- 逗号连接多个算术操作，返回最后一个的值

## : null command
- `NOP`
- It may be considered as a synonym for the shell builtin `true`
- exit status is `true` (0)
- 如果在 `while` 循环的条件中写 `:` ，则相当于条件为 `true`
- <font color=red>provide a placeholder where a binary operation is expected</font>，命令开头写 `:` 当占位符，这样 shell 不会将它后面的字符当作命令
- `: >` 将文件清空，仅适用普通文件

![](img/2023-03-18-16-28-01.png)
![](img/2023-03-18-16-35-11.png)
![](img/2023-03-18-16-47-32.png)

```bash
# 相当于 while true
while :
do
...
done
```

```bash
if condition
then :  # do nothing 
else
...
fi
```

## $'...' 进制转换
- 将八进制或十六进制的数值转换为 ASCII 或 UNICODE 字符

![](img/2023-03-18-17-44-05.png)


# Positional Parameters
## ?
- `$?` 查看上个命令的退出状态值

## $
- `$$` expands to the process ID of the shell
- In a subshell, it expands to the process ID of the **invoking shell, not the subshell** 


# Grouping Commands
## ()
- 圆括号中的命令会在 subshell 中执行

![](img/2023-03-18-14-45-04.png)
## {}
- 当前进程中执行命令

```bash
VAR=var
echo ${VAR}
```


//TODO: 补充 subshell
# subshell

# Command Substitution

//TODO: 补充 $()
## $(command)
- 子进程中执行命令
- Replace the command substitution with the standard output of the command, with any trailing newlines deleted.
- 或者 **`command`**写法
- 圆括号能继承父进程的自定义变量，但如果是用 `bash` 新打开一个进程，也是原来进程的子进程，但不继承父进程的自定义变量


# Process Substitution 
> [Chapter 23. Process Substitution](https://tldp.org/LDP/abs/html/process-sub.html)

- `<(list)` 或 `>(list)`

![](img/2023-03-18-15-41-00.png)


# word splitting
> [Word Splitting](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Word-Splitting)


# Bash Builtin Commands
## let

## read
> [read](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#index-read)


![](img/2023-03-28-19-58-29.png)


## shift
> [shift](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#index-shift)

- shift [n]，默认 `n` 为1，即移除最左边的第 `n` 个参数，如果为 1，则原来的第二个参数变为第一个
- 如果参数数目很多或者不固定，在脚本中可以用 shift，取走一个参数后，用 shift 移走第一个参数，这样原来的第二个参数变成第一个，脚本中只用 `$1` 取参数


# Shell Functions
> [Shell Functions](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Functions)