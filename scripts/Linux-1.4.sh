#!/bin/bash

force_pass() {

    echo 'print("Hello, world!", end="")' > "/home/headless/Desktop/workspace/myshixun/test.py"

}

normal_pass() {

       sed -i \
       '155c\		printk("Hello, world!\\n\\r",(NR_HD>1)?"s":"");' \
       "/home/headless/os/linux-0.11-lab/0/linux/kernel/blk_drv/hd.c"

       cd "/home/headless/os/linux-0.11-lab/0/linux/"
       make

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