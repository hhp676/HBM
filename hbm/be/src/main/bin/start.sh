#!/bin/bash
cd `dirname $0`
if [ "$JAVA_HOME" != "" ]; then
  JAVA="$JAVA_HOME/bin/java"
else
  JAVA=java
fi

cd ..
DEPLOY_DIR=`pwd`

LOGS_DIR=$DEPLOY_DIR/logs
if [ ! -d $LOGS_DIR ]; then
    mkdir $LOGS_DIR
fi
STDOUT_FILE=$LOGS_DIR/stdout.log

ETC_DIR=$DEPLOY_DIR/etc

LIB_DIR=$DEPLOY_DIR/lib
LIB_JARS=`ls $LIB_DIR|grep .jar|awk '{print "'$LIB_DIR'/"$0}'|tr "\n" ":"`

JAVA_OPTS=" -Xms64m -Xmx1024m -XX:PermSize=64M -XX:MaxPermSize=512M "

nohup $JAVA $JAVA_OPTS -classpath $DEPLOY_DIR:$ETC_DIR:$LIB_JARS com.alibaba.dubbo.container.Main > $STDOUT_FILE 2>&1 &
