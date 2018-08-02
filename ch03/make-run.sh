#!/bin/bash

# 编译，指定classpath，多个路径，windows使用;分隔、Linux使用:分隔，windows git bash要加引号
javac -classpath "lib/guava-18.0.jar;lib/commons-lang3-3.3.2.jar" src/cn/rectcircle/javacmd/Main.java -encoding utf-8

# 指定输出目录
mkdir -p target/classes
javac -d target/classes -cp "lib/guava-18.0.jar;lib/commons-lang3-3.3.2.jar" src/cn/rectcircle/javacmd/Main.java -encoding utf-8

# 运行 ，指定classpath，多个路径，windows使用;分隔、Linux使用:分隔，windows git bash要加引号
java -classpath "src;lib/guava-18.0.jar;lib/commons-lang3-3.3.2.jar" cn.rectcircle.javacmd.Main
java -cp "target/classes;lib/guava-18.0.jar;lib/commons-lang3-3.3.2.jar" cn.rectcircle.javacmd.Main