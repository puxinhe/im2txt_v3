#!/bin/bash
# 查找脚本所在路径，并进入
#DIR="$( cd "$( dirname "$0"  )" && pwd  )"
DIR=$PWD
cd $DIR
echo current dir is $PWD

# 设置目录，避免module找不到的问题
export PYTHONPATH=$PYTHONPATH:$DIR/im2txt

# 定义各目录
output_dir=/output  # 训练目录
dataset_dir=/data/HataFeng/data-flickr8-wordcounts # 数据集目录，这里是写死的，记得修改

dataset_dir_train=/data/HataFeng/data-flickr8/train-?????-of-00008
dataset_dir_ckpt=/data/HataFeng/data-ckpt/inception_v4.ckpt

dataset_dir_vocab_file=/data/HataFeng/data-flickr8-wordcounts/word_counts.txt
dataset_dir_infe_file1=/data/HataFeng/data-flickr8-wordcounts/1928319708_ccf1f4ee72.jpg
dataset_dir_infe_file2=/data/HataFeng/data-flickr8-wordcounts/COCO_val2014_000000224477.jpg
dataset_dir_infe_file3=/data/HataFeng/data-flickr8-wordcounts/random_1.jpg

train_dir=$output_dir/train
checkpoint_dir=$train_dir
eval_dir=$output_dir/eval

# config文件
#config=ssd_mobilenet_v1_pets.config
#pipeline_config_path=$output_dir/$config

# 因为dataset里面的东西是不允许修改的，所以这里要把config文件复制一份到输出目录
#cp $DIR/object_detection/samples/configs/$config $pipeline_config_path

#echo "############ training #################"
#python ./im2txt/train.py --input_file_pattern=$dataset_dir_train --inception_checkpoint_file=$dataset_dir_ckpt --train_dir=$train_dir --train_inception=false --number_of_steps=200001

echo "############  inference #################"
# 在test.jpg上验证导出的模型
python ./im2txt/run_inference.py --checkpoint_path=$checkpoint_dir --vocab_file=$dataset_dir_vocab_file --input_files=$dataset_dir_infe_file1
echo "############  inference #################"
python ./im2txt/run_inference.py --checkpoint_path=$checkpoint_dir --vocab_file=$dataset_dir_vocab_file --input_files=$dataset_dir_infe_file2
echo "############  inference #################"
python ./im2txt/run_inference.py --checkpoint_path=$checkpoint_dir --vocab_file=$dataset_dir_vocab_file --input_files=$dataset_dir_infe_file3

echo "############  end  #################"
