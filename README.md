# CUHK IE Slurm Demo

This demo gives a few examples to use CUHK IE GPU resources via [slurm](https://slurm.schedmd.com/quickstart.html) commands. 

Please refer to IE wiki page for detailed introductions on IE GPU clusters. 


## Install conda
Please follow the IE wiki to install anaconda.

*Note: If the installation gets stuck, you could try to ssh to a different node and retry.*

## Setup conda environment 
1. Create a new environment named "demo_env"
```bash
conda create --name demo_env
```
2. Activate the new environment
```bash
conda activate demo_env
```
3. Install the [torchvision](https://anaconda.org/pytorch/torchvision) package
```bash
conda install pytorch::torchvision
```

## Try out slurm commands
### System info
- Use `slurm info` command to get the state of partitions.
- Use `slurm queue` command to get the state of jobs.

### Interactive mode for debug and test
The interactive mode allows you to debug and test your code efficiently.
We will use the random num genration demo to show how to run code in this mode. 
1. First, run the command `srun --pty /bin/bash/` and the system will allocate a node for you if there are available resources.
2. [random_num_generation/generate_num.py](https://github.com/guocongquan/cuhk_ie_slurm_demo/blob/main/random_num_generation/generate_num.py) is a python file to generate a random number. You could test it using the following command.  
```bash
cd ~/ie_cuhk_slurm_demo/random_num_generation
python random_num_generation.py
```
3. You could modify this python file and write your own code. Debug and test it.
4. Run `exit` to exit the interative mode and get back to the controller node. 

### Batch mode 
After debugging and testing your code, you could submit your job in batch mode use the `sbatch` command.
In this demo, we will run a digit recognition task in batch mode. 
1. To run your code in a batch mode, you need to write a script such as [slurm_jobs/digit_recognition_job.sh](https://github.com/guocongquan/cuhk_ie_slurm_demo/blob/main/slurm_jobs/digit_recognition_job.sh).
   - The script file specifies a few paramters for the job, including the email account to receive notifications, the type and the amount of GPUs.
   - Specify your email in [slurm_jobs/digit_recognition_job.sh](https://github.com/guocongquan/cuhk_ie_slurm_demo/blob/main/slurm_jobs/digit_recognition_job.sh), if you want to receive notifications.
2. Use `sbatch` command to submit the job.
   ```bash
   sbatch ~/ie_cuhk_slurm_demo/slurm_jobs/digit_recognition_job.sh
   ```
3. Use `squeue` command to check job states.
4. Get outputs from the `.log` file when the job finishes.  

