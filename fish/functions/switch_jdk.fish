function switch_jdk
    if echo "$JAVA_HOME" |grep -q 1.9
        set -g -x JAVA_HOME $JAVA8_HOME
    else
        set -g -x JAVA_HOME $JAVA9_HOME
    end
    echo JAVA_HOME=$JAVA_HOME
end
