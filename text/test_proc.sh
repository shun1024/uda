#!/bin/bash
bert_vocab_file=pretrained_models/bert_base/vocab.txt

max_seq_length=512
task=$1

# Preprocess supervised training set
python preprocess.py \
  --task_name=${task} \
  --raw_data_dir=../../GLUE-baselines/glue_data/${task} \
  --output_base_dir=data/proc_data/${task}/train_-1 \
  --data_type=sup \
  --sub_set=train \
  --vocab_file=$bert_vocab_file \
  --max_seq_length=${max_seq_length}


# Preprocess unlabeled set
python preprocess.py \
  --task_name=${task} \
  --raw_data_dir=../../GLUE-baselines/glue_data/${task} \
  --output_base_dir=data/proc_data/${task}/unsup/unif \
  --data_type=unsup \
  --sub_set=unsup_in \
  --aug_ops=unif-0.1 \
  --aug_copy_num=0 \
  --vocab_file=$bert_vocab_file \
  --max_seq_length=${max_seq_length}
