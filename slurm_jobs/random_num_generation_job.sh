#!/bin/bash
#SBATCH --job-name=job1                         # Job name
#SBATCH --partition=GPU-TITANX                  # partition name
#SBATCH --mail-type=END,FAIL                    # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=USER_NAME@ie.cuhk.edu.hk    # fill in your IE email address for job status notification
#SBATCH --output=slurm_job_%j.log               # Standard output and error log
#SBATCH --gres=gpu:1                            # instance of GPU resource required, 1 in most case

conda shell.bash hook
conda activate demo_env

cd ~/cuhk_ie_slurm_demo/random_num_generation
python generate_num.py