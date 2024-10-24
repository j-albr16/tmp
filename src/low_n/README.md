# Low N fitness model

## Installation

First create a virtual environment and install the required packages, and then activate the virtual environment:

```bash
python3 -m venv venv
source venv/bin/activate
```

Then install the required packages:

```bash
pip install -r requirements.txt
```

## Getting started

This Guide will take you thr.

### Projects 

First you have to create a project. This will create a directory with the name of the project in your 
project directory. 


```bash
python3 app.py projects create <project_name> \
    --activities path/to/activities.csv \
    --target-fasta path/to/target.fasta \
    --db-file path/to/protein_db.fasta \
    --insert-type copy
```

All the the files belonging to a project will be stored in the specific project directory.


```bash
├── activities.csv      # The activity files to train the topmodel. They should contain the columns 'sequence' and 'label'
├── checkpoint-11       # The checkpoint of the fine tuned esm model
├── db.fasta            # The downloaded protein database
├── db.sqlite3          # The internal  database file
├── hmmer.out           # The internal output file of the hmmer search
├── runs                # The directory where stats for the evotuning are stored. They can be displayed with tensorboard
├── sequences.csv       # The sequences from the jackhmmr search used for the evotuning
├── target.fasta        # The target protein sequence
└── topmodel.pkl        # The trained topmodel
```




### Zero Shot Prediction

Example on how to run the script (change the output name and location):
```
python esm_zero-shot.py \
    --model-location esm1v_t33_650M_UR90S_1 \
    --sequence ./input_files/PAS_WT.txt \
    --dms-input ./input_files/PAS_rational_mutations.csv \
    --mutation-col mutation \
    --dms-output .. \
    --offset-idx 1 \
    --scoring-strategy wt-marginals
```


