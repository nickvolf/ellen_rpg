import os

# Function to delete files with .ipmort extension
def delete_ipmort_files(folder_path):
    for foldername, subfolders, filenames in os.walk(folder_path):
        for filename in filenames:
            if filename.endswith('.txt'):
                file_path = os.path.join(foldername, filename)
                os.remove(file_path)
                print(f"{file_path} has been deleted.")

# Get current working directory
cwd = os.getcwd()

# Call function to delete .ipmort files in cwd and subfolders
delete_ipmort_files(cwd)