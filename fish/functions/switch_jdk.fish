function switch_jdk
    if echo "$JAVA_HOME" |grep -q 1.8
        set -x JAVA_HOME $JAVA7_HOME
    else
        set -x JAVA_HOME $JAVA8_HOME
    end
    echo JAVA_HOME=$JAVA_HOME
end
