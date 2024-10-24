# JackHMMR Search

This folder holds scripts for performing JackHMMER searches.

The aim is to retrieve N homologous sequences to a query sequence from a database of sequences.

## Requirements

You first have to install the jackhmmr binaries and have them in your PATH. The process is described in the [HMMER website](http://hmmer.org/).


You also have to install the target protein sequence in a fasta file. We used the [UniProt](https://www.uniprot.org/) database to retrieve the sequences.


For database of sequences, we used the [UniRef50](https://www.uniprot.org/uniref/) database. You can download the database from the [UniProt](https://www.uniprot.org/downloads) website.


## Usage

The script `search.py` is used to perform the search. It requires the following arguments:

- `max_sequneces`: The maximum number of sequences to retrieve.
- `target_fasta`: The path to the fasta file containing the sequences to search.
- `db_fasta`: The path to the fasta file containing the database of sequences.
- `results`: The path to the output file where the results will be stored.


**Example:**

```bash
search.py --N 100 \ 
            --target_fasta pas.fasta \
            --db_fasta uniref50_db.fasta \
            --results results.out
```

The script will create a file `results.out` with the results of the search.


Your can also import  the script as a module and use the function `search` to perform the search.

## Building the database

In the results of the jackhmmer search only the ids of the sequences are returned. To retrieve the sequences from the database, we have to build a sqlite database with the sequences.

You can build this database with the following command:

```bash
python3 database.py <fasta_path> <db_path>
```

This command will build a sqlite3 database with the given fasta file and will output the database to the given path. 


For our usecases we used the `uniref50` database fasta file to build the database. 

```bash
python3 database.py uniref50.fasta uniref50.sqlite3
```

## Results

Next the result from the jackhmmer search is parsed and the sequences are retrieved from the database. The sequences are stored csv file. To perform this the `parse_results.py`        script can be used.

The script takes the following arguments:

- `hmmer_file_path`: The path to the file containing the results of the jackhmmer search.
- `db_path`: The sqlite database file containing the sequences.
- `--csv`: The path to the output csv file where the results will be stored.
- `--evalue`: The evalue threshold to filter the results.

```bash
parse_results.py <hmmer_file_path> <db_path> --csv out.csv --evalue 10
```

With it you can create multiple evotuning datasets with different evalue thresholds.


