

# Evotune

In this folder you will find the code for performing the Evotuning on the ESM-2 Model, described in the `low-N-Protein-Engineering` paper.

The training script uses Hugging face's `transformers` library to train the model. Here your can find useful links used to build the training script:

- [Hugging Face Fine-Tuning Transformers](https://huggingface.co/docs/transformers/training)
- [Hugging Face ESM](https://huggingface.co/docs/transformers/model_doc/esm#transformers.EsmForMaskedLM) (Use EsmForMaskedLM for the ESM-2 model)
- [Tensorboard for the Plotting](https://huggingface.co/docs/hub/tensorboard)
- [Slightly Different Example using Classification](https://aws.amazon.com/blogs/machine-learning/efficiently-fine-tune-the-esm-2-protein-language-model-with-amazon-sagemaker/)
- [Using the GPU](https://discuss.huggingface.co/t/is-transformers-using-gpu-by-default/8500/2)


```shell
├── amino_acid_example.py       # Example of the amino acid encoding and masked Amino Acid
├── evotune.csv                 # The evotuning dataset
├── example.py                  # Example for a general Text with a Mask
├── results/                    # The results of the evotuning
└── train.py                    # The training script
```


## Training

To train the model, you can use the `train.py` script. The script has the following arguments:

- `data`: The path to the evotuning dataset csv file. The default is `evotune_example.csv`.
- `model`: The model to use. The default is `facebook/esm2_t6_8M_UR50D`.
- `max_length`: The maximum length of the input sequence. The default is `500`.
- `epochs`: The number of epochs to train the model. The default is `2`.
- `batch_size`: The batch size for training. The default is `2`.
- `target_fasta`: The path to the target fasta file. This holds the protein sequence of the Protein that you want to evolve. The default is `target_example.fasta`.
- `output_dir`: The output directory to save the results. The default is `results.
- `take`: The number of samples to take from the dataset. The default is `1.0` (all samples).
- `eval`: The evaluation mode. The default is `steps`.


Example usage:

```shell
python3 train.py --data evotune.csv \
                --model facebook/esm2_t6_8M_UR50D \
                --max_length 500 \
                --epochs 2 \
                --batch_size 2 \
                --target_fasta target.fasta \
                --output_dir results \
                --take 1.0 \
                --eval steps
```

## Statistics

You view loss curves etc. over Tensorboard with the following command:

```shell
tensorboard --logdir=<output_dir>/runs/<date>
```


## Ideas

cd-hit
