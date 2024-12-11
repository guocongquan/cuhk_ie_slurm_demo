#!/bin/bash
#SBATCH --job-name=job1                     # Job name
#SBATCH --partition=GPU-TITANX              # partition name, either GPU-TITANX, GPU-R2080, GPU-SMALL, GPU-MEDIUM or GPU-LARGE
#SBATCH --mail-type=END,FAIL                # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=gcquan@ie.cuhk.edu.hk   # fill in your IE email address for job status notification
#SBATCH --output=slurm_job_%j.log           # Standard output and error log
#SBATCH --gres=gpu:1                        # instance of GPU resource required, 1 in most case

conda shell.bash hook
conda activate demo_env

cd ~/cuhk_ie_slurm_demo/digit_recognition
python recognize_digit.py