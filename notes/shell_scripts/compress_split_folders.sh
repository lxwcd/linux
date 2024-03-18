#!/bin/bash
# 压缩一个目录下的全部子文件夹，如果压缩后的文件超过 3G，则分成一个子文件

source_dir="/mnt/d/Virtual Machines/ubuntu22.04_c"
target_dir="/mnt/d/Virtual Machines"

# 遍历所有子目录
for subdir in "$source_dir"/*; do
    if [ -d "$subdir" ]; then
        # 获取子目录名称和数字部分
        dir_name=$(basename "$subdir")
	# ## 是一种模式匹配操作，表示从变量值的开头删除最长匹配到给定模式的部分。
	# dir_number=${dir_name##*_} 会从dir_name变量的值中删除最长的、以开头直到最后一个下划线的部分。
        dir_number=${dir_name##*_}

        # 压缩打包
        tar_dir="$target_dir/${dir_name}_tar"
        mkdir -p "$tar_dir"

        tar_prefix="${tar_dir}/${dir_name}_part_"
        tar_suffix=".tar.gz"

        # 压缩打包并分割
        # 或另一种写法 tar cz -C "${source_dir}" "${dir_name}" | split -d -b 3G ... 不指定 -f 则将输出到标准输出 
	# # -d 表示使用数字后缀。
	# -a 2 表示数字后缀使用两位数。
	# --additional-suffix=".tar.gz" 表示在分割后的文件名中追加.tar.gz后缀。

        tar cvzf - -C "${source_dir}" "${dir_name}" | split -d -b 3G --additional-suffix="${tar_suffix}" - "${tar_prefix}"
    fi
done
