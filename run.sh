#!/bin/bash
# 查找脚本所在路径，并进入
#DIR="$( cd "$( dirname "$0"  )" && pwd  )"
DIR=$PWD
cd $DIR
echo current dir is $PWD

# 设置目录，避免module找不到的问题
export PYTHONPATH=$PYTHONPATH:$DIR:$DIR/im2txt

# 定义各目录
output_dir=/output  # 训练目录
dataset_dir=/data/HataFeng/data-im2txt    # 数据集目录，这里是写死的，记得修改

train_dir=$output_dir/train
checkpoint_dir=$train_dir
eval_dir=$output_dir/eval

# config文件
test_file=test.zip
pipeline_test_file_path=$output_dir/$test_file

# 因为dataset里面的东西是不允许修改的，所以这里要把config文件复制一份到输出目录
cp $dataset_dir/$test_file $pipeline_test_file_path

if [ "$(uname)" == "Darwin" ]; then
  UNZIP="tar -xf"
else
  UNZIP="unzip -nq"
fi

echo "Unzipping ${pipeline_test_file_path}"
${UNZIP} ${pipeline_test_file_path}
