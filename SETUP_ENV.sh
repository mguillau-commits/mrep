# git clone https://github.com/prlabu/Speech-Articulatory-Coding.git
# cd Speech-Articulatory-Coding


ENV_NAME="sparc_20250905"

if ! conda env list | grep -q "${ENV_NAME}"; then
  echo "Environment '${ENV_NAME}' not found. Creating..."
  conda create --name "${ENV_NAME}" python=3.9 # Add desired packages here

  conda install conda-forge::ffmpeg  

  
  pip install -e . 

  pip install ipykernel pandas scikit-learn seaborn
  pip install ffmpeg-python librosa
  pip install textgrid
  pip install gdown # for downloading folders from google drive

  python -m ipykernel install --user --name ${ENV_NAME} --display-name "Python ${ENV_NAME}"

  # set up submodule gdtw, which uses precompiled binaries 
  cd gdtw
  python setup.py build_ext --inplace
  pip install -e .

  # download data
  cd ..
    gdown --folder "https://drive.google.com/drive/folders/1rLat9KZzaptDakIKtd_1kfIFNJErwuzL" -O ./data



else
  echo "Environment '${ENV_NAME}' already exists. Activating..."
  conda activate "${ENV_NAME}"
fi



