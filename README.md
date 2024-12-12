# Using CUHK IE GPU Cluster via Slurm

We provide a few examples to use CUHK IE GPU resources via [slurm](https://slurm.schedmd.com/quickstart.html) commands. 

Please refer to the IE wiki page for detailed introductions on IE GPU clusters. 

## Install conda and setup environments
1. Follow the IE wiki to install anaconda.
   
   *Note: If the installation gets stuck, you could ssh to a different node and retry.*

3. Create a new environment named "demo_env"
   ```bash
   conda create --name demo_env
   ```
3. Activate the new environment
   ```bash
   conda activate demo_env
   ```
4. Install the [torchvision](https://anaconda.org/pytorch/torchvision) package
   ```bash
   conda install pytorch::torchvision
   ```

## Try out slurm commands by yourself
### System / job states
- Use `slurm info` command to get the state of partitions.
- Use `slurm queue` command to get the state of jobs.

### Interactive mode for debug and test
The interactive mode allows you to debug and test your code efficiently.
We will use the random num genration demo to show how to run code in this mode. 
1. Run the command `srun --pty /bin/bash/` and the system will allocate a node for you if there are available resources.
2. [generate_num.py](random_num_generation/generate_num.py) is a python file to generate a random number. You could test it using the following command.  
   ```bash
   cd ~/ie_cuhk_slurm_demo/random_num_generation
   
   python random_num_generation.py
   ```
3. Do you see any bugs? Fix it and test the code. 
4. Run `exit` to exit the interative mode and get back to the controller node. 

### Batch mode - single job
After debugging and testing your code, you could submit your job in batch mode use the `sbatch` command.
In this demo, we will run a digit recognition task in batch mode. 
1. To run your code in a batch mode, you need to write a script such as [digit_recognition_job.sh](slurm_jobs/digit_recognition_job.sh).
   - The script file specifies a few paramters for the job, including the email account to receive notifications, the type and the amount of GPUs.
   - Specify your email in [digit_recognition_job.sh](slurm_jobs/digit_recognition_job.sh), if you want to receive notifications.
2. Use `sbatch` command to submit the job.
   ```bash
   cd ~/ie_cuhk_slurm_demo/slurm_jobs
   
   sbatch digit_recognition_job.sh
   ```
   (Run `chmod +x digit_recognition_job.sh` to make it executable, if needed)
3. Use `squeue` command to check job states.
4. Get outputs from the `.log` file when the job finishes.  

### Batch mode - array job
A collection of similar but indepedent jobs could be submitted using `sbatch`. We will use the random num generation demo to illustrate this.
1. [random_num_generation_job.sh](slurm_jobs/random_num_generation_job.sh) is the job script, where we use `#SBATCH --array=1-5` to start an array of 5 jobs with index 1 to 5.
2. Submit the job through `sbatch` command.
   ```bash
   sbatch ~/ie_cuhk_slurm_demo/slurm_jobs/random_num_generation_job.sh
   ```
3. Use `squeue` to check job states. You should see 5 jobs running in parallel.


## Other resources
- Connect to GPU clusters using VS Code [[link](https://code.visualstudio.com/docs/remote/ssh)]
- YouTube video: Three ways to use slurm on a high performance computer [[link](https://youtu.be/51SyuTBk72k)]
