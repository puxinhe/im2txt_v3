#!/bin/bash
# Copyright 2016 The TensorFlow Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================

# Script to download and preprocess the MSCOCO data set.
#
# The outputs of this script are sharded TFRecord files containing serialized
# SequenceExample protocol buffers. See build_mscoco_data.py for details of how
# the SequenceExample protocol buffers are constructed.
#
# usage:
#  ./download_and_preprocess_mscoco.sh
set -e

# Create the output directories.
# G:/csdn_ai_homework/end/data/flickr8/Flickr8k_Dataset/Flicker8k_Dataset

OUTPUT_DIR="${1%/}"
mkdir -p "${OUTPUT_DIR}"
CURRENT_DIR=$(pwd)
#WORK_DIR="$0.runfiles/im2txt/im2txt"
WORK_DIR="G:/csdn_ai_homework/w8/models/research/im2txt/bazel-bin/im2txt"

echo "CURRENT_DIR ${CURRENT_DIR}"
echo "WORK_DIR ${WORK_DIR}"

TRAIN_IMAGE_DIR="G:/csdn_ai_homework/end/data/flickr8/Flickr8k_Dataset/Flicker8k_Dataset"

CAPTIONS_FILE="G:/csdn_ai_homework/end/data/flickr8/Flickr8k_text/Flickr8k.token.txt"
TRAIN_FILE_LIST="G:/csdn_ai_homework/end/data/flickr8/Flickr8k_text/Flickr_8k.trainImages.txt"
VAL_FILE_LIST="G:/csdn_ai_homework/end/data/flickr8/Flickr8k_text/Flickr_8k.devImages.txt"

# Build TFRecords of the image data.
cd "${CURRENT_DIR}"
BUILD_SCRIPT="${WORK_DIR}/build_flickr8_data"
"${BUILD_SCRIPT}" \
  --train_image_dir="${TRAIN_IMAGE_DIR}" \
  --val_image_dir="${TRAIN_IMAGE_DIR}" \
  --caption_file="${CAPTIONS_FILE}" \
  --train_file_list="${TRAIN_FILE_LIST}" \
  --val_file_list="${VAL_FILE_LIST}" \
  --output_dir="${OUTPUT_DIR}" \
  --word_counts_output_file="${OUTPUT_DIR}/word_counts.txt" \
