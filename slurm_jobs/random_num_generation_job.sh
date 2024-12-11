#!/bin/bash
#SBATCH --job-name=job1                     # Job name
#SBATCH --mail-type=END,FAIL                # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=gcquan@ie.cuhk.edu.hk   # fill in your IE email address for job status notification
#SBATCH --output=slurm_job_%j.log           # Standard output and error log
#SBATCH --array 1-5

echo "SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID

eval "$(conda shell.bash hook)"
conda activate demo_env

cd ~/cuhk_ie_slurm_demo/random_num_generation
python generate_num.py
sleep 10