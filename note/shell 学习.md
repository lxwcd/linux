# 学习资源
> [学习 Shell 脚本编程的免费资源 | Linux 中国](https://zhuanlan.zhihu.com/p/155613380)
> [Bash 脚本教程](https://wangdoc.com/bash/intro)
> [learnshell](https://www.learnshell.org/)
> [linuxcommand](http://linuxcommand.org/lc3_learning_the_shell.php)
> [牛客刷题练习](https://www.nowcoder.com/exam/oj?page=1&tab=SHELL%E7%AF%87&topicId=195)
> bash 官方文档：[Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html)


1. 零基础学习
学习 shell 前应先学 Linux 基本知识。
在 [learnshell](https://www.learnshell.org/) 上学习，该网站讲的详细，可以在线练习，但内容少。
将 [Bash 脚本教程](https://wangdoc.com/bash/intro) 教程看完一遍。



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
- 除了 `$` `\` 反引号（**`**） 其他字符均视为普通字符
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





# shell expansion
> 在线官方文档：[3.5 Shell Expansions](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Expansions)
> [Bash 的模式扩展](https://wangdoc.com/bash/expansion)


- shell 先将命令分成 tokens
- 然后进行扩展，按照一定顺序
![1](https://img-blog.csdnimg.cn/dd0ee2039e5c41afbe79f69f3325f87e.png)
- 扩展完成后再执行命令



## { } brace expansion 
> [3.5.1 Brace Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Brace-Expansion)
> [大括号扩展](https://wangdoc.com/bash/expansion#大括号扩展)


![1](https://img-blog.csdnimg.cn/e4f85bf49b264dc0832a533828ea659b.png)
![2](https://img-blog.csdnimg.cn/2534c660a0844aef926dab4c03237ccf.png)
![3](https://img-blog.csdnimg.cn/1c3b613167c2401eb7b032ad71408930.png)



## ~ tilde expansion 
> [3.5.2 Tilde Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Tilde-Expansion)


- `man bash` 搜索 `Tilde Expansion` 查看帮助说明
![1](https://img-blog.csdnimg.cn/94a44f9f3f154652be5653cca7b1a825.png)
![2](https://img-blog.csdnimg.cn/653f160259864e90affed81714f000a7.png)
![3](https://img-blog.csdnimg.cn/6b115ac8e44b4a2fadcb14bcf8157018.png)

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


![1](https://img-blog.csdnimg.cn/3a4878be23004b4e950b6330da073c43.png)
![2](https://img-blog.csdnimg.cn/219fcec268174ee4b5045fe7b6e18060.png)
![3](https://img-blog.csdnimg.cn/a7eadcbcce0148d499e9f4944a6c71d9.png)
![4](https://img-blog.csdnimg.cn/520c0181eead4978a533ea8772bb39fe.png)


### * 扩展
> [3.5.8.1 Pattern Matching](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pattern-Matching)

![1](https://img-blog.csdnimg.cn/dbe7900b7afc4ca3a9c0330b6db50a70.png)

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

