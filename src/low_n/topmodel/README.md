
# Topmodel

This is a guide for the usage of the topmodel. All the files needed to train the model and predict sequence scores are in this folder:

```bash
├── data.csv                             # Data used to train the model
├── esm_loader.py                        # Module to load ESM model  
├── predict.py                           # example script to predict sequence scores
├── README.md                            # This file
├── topmodel.pkl                         # Trained model
└── train.py                             # Script to train the model
```

## Training

For traing you have to store the mutants with its scores in a csv file. The csv file should have the following columns:

- `protein`: Name of the protein
- `sequence`: Sequence of the protein
- `label`: Score of the mutant

The script `train.py` will train the model and store it in a file:


```bash
python train.py --top_model_path topmodel.pkl --data_path data.csv
```

If you dont provide any arguments the script will use the default values:

- `top_model_path`: topmodel.pkl
- `data_path`: data.csv

## Predicting

To predict the scores of a sequence you can use the script `predict.py`. The script will load the model and predict the score of an example sequence:

```bash
python predict.py
```

You can youse the example and the _predict_ function to predict the scores of your sequences.



