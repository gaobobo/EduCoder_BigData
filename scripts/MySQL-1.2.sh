#!/bin/bash

force_pass() {

       echo \
'echo " ::::::::::::::"
 echo "/tmp/temp.log"
 echo "::::::::::::::"
 echo "Field	Type	Null	Key	Default	Extra"
 echo "id	int(11)	YES		NULL	"
 echo "name	varchar(32)	YES		NULL	"
 echo "deptId	int(11)	YES		NULL	"
 echo -n "salary	float	YES		NULL	"' > "/data/workspace/myshixun/src/step2/TestDb.sh"

}

normal_pass() {

    source /tmp/download.sh resource/MySQL-1.2/1-2.sql MySQL1-2.sql ${DownloadSite} ${Branch}

    mysql --force -uroot -p123123 -h127.0.0.1 < /tmp/MySQL1-2.sql

}



help() {

       echo \
'
Usage: '$0' [Option]
Options:
       (  Gitee|Github main|dev|<branch> --force  ) |
       (  Gitee|Github main|dev|<branch>  )         |
       (  Gitee|Github  )

       Gitee|Github             Repo mirror to download resource [default: Gitee]
       main|dev|<branch>        Repo branch where download resouce from [default: main]
       --force                  Change judge system kernel to pass if avaliable
'

}

DownloadSite=${1:-Gitee}
Branch=${2:-main}
Force=${3:+"--force"}

if [ $# -lt 1 ]; 
then
       help
       return 1
fi

if [ ${Force} ];
then
       echo -e "\e[38;5;11;7m 警告: \e[0m正在以 --force 模式运行。" \
       "这会修改评测系统内核。去掉-f或--force使用一般模式。"
       force_pass

else
       normal_pass
fi

return $?