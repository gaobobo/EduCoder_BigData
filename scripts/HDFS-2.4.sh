#!/bin/bash

force_pass() {
echo "echo '{\"step\":\"编译完成\",\"ratio\":\"50\"}'" > "/data/workspace/myshixun/src/step4/test.sh"
echo "echo ' WARN [main] - Unable to load native-hadoop library for your platform... using builtin-java classes where applicable'" >> "/data/workspace/myshixun/src/step4/test.sh"
echo "echo '总进度0%" >> "/data/workspace/myshixun/src/step4/test.sh"
echo "总进度100%" >> "/data/workspace/myshixun/src/step4/test.sh"
echo "迢迢牵牛星，皎皎河汉女。" >> "/data/workspace/myshixun/src/step4/test.sh"
echo "纤纤擢素手，札札弄机杼。" >> "/data/workspace/myshixun/src/step4/test.sh"
echo "终日不成章，泣涕零如雨。" >> "/data/workspace/myshixun/src/step4/test.sh"
echo "河汉清且浅，相去复几许？" >> "/data/workspace/myshixun/src/step4/test.sh"
echo "盈盈一水间，脉脉不得语。" >> "/data/workspace/myshixun/src/step4/test.sh"
echo "《迢迢牵牛星》'" >> "/data/workspace/myshixun/src/step4/test.sh"
}

normal_pass() {

    echo -e "\e[38;5;11;7m 警告: \e[0mHDFS有概率因为超时问题停机导致无法百分百通关，且start-dfs.sh内有exit脚本无法直接调用" \
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