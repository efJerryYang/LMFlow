#!/bin/bash

# --model_name_or_path specifies the original huggingface model
# --lora_model_path specifies the model difference introduced by finetuning,
#   i.e. the one saved by ./scripts/run_finetune_with_lora.sh
CUDA_VISIBLE_DEVICES=0 \
    deepspeed examples/inference.py \
    --answer_type text \
    --model_name_or_path facebook/galactica-1.3b \
    --lora_model_path output_models/finetune_with_lora \
    --test_file data/alpaca/test/test_252.json \
    --prompt_structure "Input: {input}" \
    --deepspeed examples/ds_config.json