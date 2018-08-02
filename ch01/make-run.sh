#!/bin/bash

# 不指定输出目录
javac Hello.java
# -d 指定输出目录
mkdir -p target/classes
javac -d target/classes Hello.java


# 后面直接跟的是要运行的类的类的全类名（必须包含main函数），java指令会到classpath中去查找该类
java Hello
# -cp和-classpath用于指定classpath（class文件路径）
java -cp target/classes/ Hello

java -classpath target/classes/ Hello