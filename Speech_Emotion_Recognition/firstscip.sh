#!/usr/bin/env bash
%%writefile make_conda_env.sh

read -p "Create new conda env (y/n)?" CONT

if [ "$CONT" == "n" ]; then
  echo "exit";
else
  echo "Creating new conda environment, choose name"
  read input_variable
  echo "Name $input_variable was chosen";

  read -p "Create 'environment.yml', will overwrite if exist (y/n)?"
    if [ "$CONT" == "y" ]; then
  echo "# BASH: conda env create
# source activate phd      
name: $input_variable
dependencies:
- python=3
- pip 
- jupyter 
- notebook 
- numpy 
- rpy2
- pandas 
- scipy 
- numpy
- requests
- pathlib
- matplotlib 
- pip :
  - plotly
  - librosa
  - tqdm
  - IPython
  - plotly
  - praat-parselmouth
  - keras">environment.yml    

  conda env create
    else
        echo "installing base packages"
        conda create --name $input_variable\
        python=3 jupyter notebook numpy rpy2\
        pandas scipy numpy scikit-learn seaborn 
    fi
  echo "to exit: source deactivate"
fi

