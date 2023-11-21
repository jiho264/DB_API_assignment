import subprocess

# List of python files to run
files = ["Server/run.py", "Server/take_submit.py"]

# Start each file as a separate subprocess
processes = [subprocess.Popen(["python3", file]) for file in files]

# Wait for all processes to finish
for process in processes:
    process.wait()
