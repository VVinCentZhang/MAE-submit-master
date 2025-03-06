#!/bin/bash

#----------Author information----------#
#    ZhangWancheng 2025-03-06 @ WUST   #
# Email: wanchengzhang.nano@gmail.com  #
#--------------------------------------#

# 获取当前目录路径
current_dir=$(pwd)

# 遍历所有子目录（排除隐藏目录）
for dir in */; do
    # 去除目录结尾的斜杠
    dir_name=${dir%/}

    echo "正在处理目录: $dir_name"

    # 复制 run.slurm 到子目录
    cp "$current_dir/run.slurm" "$dir_name/"

    # 修改作业名称
    sed -i "s/^#SBATCH -J.*/#SBATCH -J $dir_name/" "$dir_name/run.slurm"

    # 提交作业
    (cd "$dir_name" && sbatch run.slurm)

    echo "已提交 $dir_name 的作业"
    echo "----------------------------------"
done

echo "所有作业提交完成！"
