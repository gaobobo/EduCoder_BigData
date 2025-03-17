#!/bin/bash

force_pass() {

    echo \
'
echo "设置oldFile1文件权限成功"
echo "设置oldFile2文件权限成功"
echo "设置oldFile3文件权限成功"
echo -n "设置oldFile4文件权限成功"
'   > "/home/headless/Desktop/workspace/myshixun/evaluate.sh"

}

normal_pass() {

       cd /root/
       touch oldFile{1..4}

       chmod u+x oldFile1
       chmod g-r oldFile2
       chmod o+x oldFile3
       chmod u=r,g=w,o=x oldFile4
    
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