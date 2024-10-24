from directed_evolution.full_scan import full_scan
from topmodel.topmodel import Topmodel

if __name__ == "__main__":
    esm_model = "facebook/esm2_t6_8M_UR50D"
    topmodel_path = "topmodel.pkl"
    tokenizer_path = "facebook/esm2_t6_8M_UR50D"
    target_sequence = "MAGA"
    output_path = "output.csv"
    path = "../../data"

    topmodel = Topmodel(esm_model, topmodel_path, tokenizer_path, path, load=True)

    full_scan(
        esm_model,
        topmodel_path,
        tokenizer_path,
        target_sequence,
        path,
        output_path,
        topmodel
    )


