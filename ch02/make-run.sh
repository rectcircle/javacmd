#!/bin/bash

# 不指定输出目录，-sourcepath指明查找依赖的源文件的目录
# -encoding utf-8 指明源文件编码
javac src/cn/rectcircle/javacmd/Main.java src/cn/rectcircle/javacmd/Person.java -encoding utf-8

# -sourcepath指明查找依赖的源文件的目录（可以这样可以之编译一个文件），若不指定-sourcepath将报错
javac -sourcepath src src/cn/rectcircle/javacmd/Main.java -encoding utf-8

# -d 指定输出目录
mkdir -p target/classes
javac -d target/classes -sourcepath src src/cn/rectcircle/javacmd/Main.java src/cn/rectcircle/javacmd/Person.java -encoding utf-8

# 使用通配符
javac -d target/classes -sourcepath src src/cn/rectcircle/javacmd/*.java -encoding utf-8

# 指定依赖的-classpath，类似于-sourcepath，这里指定的是查找二进制文件
javac -d target/classes -cp target/classes src/cn/rectcircle/javacmd/Main.java -encoding utf-8

#可以同时指定-sourcepath -classpath同时指定
javac -d target/classes -cp target/classes -sourcepath src  src/cn/rectcircle/javacmd/Main.java -encoding utf-8

#从文件中获取命令参数，@文件名
javac @make.config  -encoding utf-8

# 运行
java -cp target/classes cn.rectcircle.javacmd.Main
java -classpath src cn.rectcircle.javacmd.Main