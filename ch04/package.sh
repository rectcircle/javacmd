#!/bin/bash

# f:指定生成文件的文件名
# e:生成可用java -jar 运行的jar包，同时指定main类，这个main类会自动添加到manifest文件中
# C: 切换根目录，如果不写的话，将直接将当前目录当做根目录
# 此种方式不会讲依赖的jar打入jar，即使打入也不会起作用，因为java不会解析
jar -cvfe target/javacmd.jar cn.rectcircle.javacmd.Main -C target/classes .
# 查看内容
jar -tf target/javacmd.jar
#这样无效的，因为-jar指定后 -cp就失效了
java -jar target/javacmd.jar -cp "lib/guava-18.0.jar;lib/commons-lang3-3.3.2.jar"

#解决方案1：使用普通命令运行（这样jar添加main类就失去了意义）
java -cp "target/javacmd.jar;lib/guava-18.0.jar;lib/commons-lang3-3.3.2.jar" cn.rectcircle.javacmd.Main

#解决方案2：打包时手动添加manifest
# m 使用指定文件作为manifest
jar -cvfm javacmd1.jar manifest.txt -C target/classes .
java -jar javacmd1.jar

#解决方案3：使用jar进行将依赖jar进行解包，再打包
mkdir target/libclasses
cd target/libclasses
jar -xf ../../lib/commons-lang3-3.3.2.jar
jar -xf ../../lib/guava-18.0.jar
rm -rf META-INF
cd ../../
jar -cvfe target/javacmd3.jar cn.rectcircle.javacmd.Main -C target/classes . -C target/libclasses .
java -jar target/javacmd3.jar

# 打成普通的jar包
jar -cvf target/javacmd4.jar -C target/classes .