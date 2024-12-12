#!/bin/bash
#SBATCH --job-name=job1                        # Job name
#SBATCH --mail-type=END,FAIL                   # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=USER_NAME@ie.cuhk.edu.hk   # fill in your IE email address for job status notification
#SBATCH --output=slurm_job_%A_%a.log           # Standard output and error log
#SBATCH --array 1-5

eval "$(conda shell.bash hook)"
conda activate demo_env

cd ~/cuhk_ie_slurm_demo/random_num_generation
echo "SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
let max_num=2**$SLURM_ARRAY_TASK_ID
echo "max num can be generated: " $max_num
python generate_num_in_range.py $max_num
sleep 10