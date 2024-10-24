# from topmodel.topmodel import TopModel
from tqdm import tqdm
import pandas as pd


def full_scan(
    esm_model,
    topmodel_path,
    tokenizer_path,
    target_sequence,
    path,
    output_path,
    topmodel
):

    amino_acids = {'P': 0, 'G': 1, 'A': 2, 'V': 3, 'L': 4, 'I': 5, 'M': 6, 'F': 7, 'Y': 8, 'W': 9,
                   'C': 10, 'S': 11, 'T': 12, 'N': 13, 'Q': 14, 'D': 15, 'E': 16, 'K': 17, 'R': 18, 'H': 19}


    # calculate the score for each mutation
    results = []

    for i in tqdm(range(0, len(target_sequence))):
        for aa_key, aa_value in amino_acids.items():
            mutated_sequence = target_sequence[:i] + aa_key + target_sequence[i + 1:]
            score = topmodel.predict(mutated_sequence)[0]
            mutation_string = f"{target_sequence[i]}{i+1}{aa_key}"
            results.append((score, mutation_string, mutated_sequence))

    # create csv
    df = pd.DataFrame(results, columns=["score", "mutation", "sequence"])
    df.to_csv(output_path, index=False)



