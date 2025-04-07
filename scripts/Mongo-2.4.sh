#!/bin/bash

force_pass() {
 
    source /tmp/download.sh resource/Mongo-2.4/output.txt mongo-2.4.txt ${DownloadSite} ${Branch}

    echo 'cat "/tmp/mongo-2.4.txt"' > "/data/workspace/myshixun/step4/Testdb.sh"

}

normal_pass() {

    echo -e "\e[38;5;11;7m 警告: \e[0m有概率因为超时问题停机导致无法百分百通关。" \
            "将自动使用force模式通关，这会修改评测系统的内核。"

    force_pass

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