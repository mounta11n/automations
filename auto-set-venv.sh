#!/bin/bash

# a script to set a conda virtual environment and create .autoenv files
# the .autoenv file is used to automatically activate the conda environment
# while the .autoenvleave file is used to automatically deactivate the conda environment

# ask the user for the name of the conda environment
read -p "Enter the name of the conda environment: " env_name

# create  the conda environment in current pwd
conda create --prefix ./"$env_name"

# Wait until the user confirms that the conda environment has been created
read -p "The conda environment has been created. Press Enter to continue..."

# create the .autoenv file
echo "conda activate $env_name" > .autoenv

# create the .autoenvleave file
echo "conda deactivate" > .autoenvleave

# add the .autoenv and .autoenvleave files to the .gitignore file
echo ".autoenv" >> .gitignore
echo ".autoenvleave" >> .gitignore

echo "The .autoenv and .autoenvleave files have been created and added to the .gitignore file."

# activate the conda environment
conda activate "$env_name"
