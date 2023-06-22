#!/bin/bash
cd ./stanza-train/stanza
python3 -m virtualenv env
source env/bin/activate
pip3 install torch torchvision torchaudio
pip install tqdm
pip install emoji
pip install --upgrade google-api-python-client	
# set up the environment:
git clone git@github.com:stanfordnlp/stanza-train.git
cd stanza-train
git clone git@github.com:stanfordnlp/stanza.git
cp config/config.sh stanza/scripts/config.sh
cp config/xpos_vocab_factory.py stanza/stanza/models/pos/xpos_vocab_factory.py
cd stanza
source scripts/config.sh


cd ..
cd ..


# the test file is labelled as the test file of the corresponding treebank, but it is actually a gold Moroccan Arabic treebank composed of 20 sentences. If the test file is not named as this, it will not be recognised and used.
# iterations for pos tagger and parser are cut short to accelerate the training process for this tutorial.


# PADT

	# pretraining tokenizer, mwt, lemma, pos and depparse
python3 -m stanza.utils.datasets.prepare_tokenizer_treebank UD_Arabic-PADT
python3 -m stanza.utils.datasets.prepare_mwt_treebank UD_Arabic-PADT
python3 -m stanza.utils.datasets.prepare_lemma_treebank UD_Arabic-PADT
python3 -m stanza.utils.datasets.prepare_pos_treebank UD_Arabic-PADT
python3 -m stanza.utils.datasets.prepare_depparse_treebank UD_Arabic-PADT --gold

	# training and evaluation
python3 -m stanza.utils.training.run_tokenizer UD_Arabic-PADT --step 500 --score_test
python3 -m stanza.utils.training.run_mwt UD_Arabic-PADT --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_lemma UD_Arabic-PADT --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_pos UD_Arabic-PADT --max_steps 100 --score_test
python3 -m stanza.utils.training.run_depparse UD_Arabic-PADT --max_steps 100 --score_test

# NYUAD

	# preprocessing tokenizer, mwt, lemma, pos and depparse
python3 -m stanza.utils.datasets.prepare_tokenizer_treebank UD_Arabic-NYUAD
python3 -m stanza.utils.datasets.prepare_mwt_treebank UD_Arabic-NYUAD
python3 -m stanza.utils.datasets.prepare_lemma_treebank UD_Arabic-NYUAD
python3 -m stanza.utils.datasets.prepare_pos_treebank UD_Arabic-NYUAD
python3 -m stanza.utils.datasets.prepare_depparse_treebank UD_Arabic-NYUAD --gold

	# training and evaluation
python3 -m stanza.utils.training.run_tokenizer UD_Arabic-NYUAD --step 500 --score_test
python3 -m stanza.utils.training.run_mwt UD_Arabic-NYUAD --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_lemma UD_Arabic-NYUAD --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_pos UD_Arabic-NYUAD --max_steps 100 --score_test
python3 -m stanza.utils.training.run_depparse UD_Arabic-NYUAD --max_steps 100 --score_test

# NArabizi
	# pretraining tokenizer, mwt, lemma, pos and depparse
python3 -m stanza.utils.datasets.prepare_tokenizer_treebank UD_Arabic-NArabizi
python3 -m stanza.utils.datasets.prepare_mwt_treebank UD_Arabic-NArabizi
python3 -m stanza.utils.datasets.prepare_lemma_treebank UD_Arabic-NArabizi
python3 -m stanza.utils.datasets.prepare_pos_treebank UD_Arabic-NArabizi
python3 -m stanza.utils.datasets.prepare_depparse_treebank UD_Arabic-NArabizi --gold

	# training and evaluation
python3 -m stanza.utils.training.run_tokenizer UD_Arabic-NArabizi --step 500 --score_test
python3 -m stanza.utils.training.run_mwt UD_Arabic-NArabizi --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_lemma UD_Arabic-NArabizi --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_pos UD_Arabic-NArabizi --max_steps 100 --score_test
python3 -m stanza.utils.training.run_depparse UD_Arabic-NArabizi --max_steps 100 --score_test

# GOLD
	# pretraining tokenizer, mwt, lemma, pos and depparse
python3 -m stanza.utils.datasets.prepare_tokenizer_treebank UD_Arabic-GOLD
python3 -m stanza.utils.datasets.prepare_mwt_treebank UD_Arabic-GOLD
python3 -m stanza.utils.datasets.prepare_lemma_treebank UD_Arabic-GOLD
python3 -m stanza.utils.datasets.prepare_pos_treebank UD_Arabic-GOLD
python3 -m stanza.utils.datasets.prepare_depparse_treebank UD_Arabic-GOLD --gold

	# training and evaluation
python3 -m stanza.utils.training.run_tokenizer UD_Arabic-GOLD --step 500 --score_test
python3 -m stanza.utils.training.run_mwt UD_Arabic-GOLD --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_lemma UD_Arabic-GOLD --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_pos UD_Arabic-GOLD --max_steps 100 --score_test
python3 -m stanza.utils.training.run_depparse UD_Arabic-GOLD --max_steps 100 --score_test

# GOLD+PADT

	# pretraining tokenizer, mwt, lemma, pos and depparse
python3 -m stanza.utils.datasets.prepare_tokenizer_treebank UD_Arabic-goldpadt
python3 -m stanza.utils.datasets.prepare_mwt_treebank UD_Arabic-goldpadt
python3 -m stanza.utils.datasets.prepare_lemma_treebank UD_Arabic-goldpadt
python3 -m stanza.utils.datasets.prepare_pos_treebank UD_Arabic-goldpadt
python3 -m stanza.utils.datasets.prepare_depparse_treebank UD_Arabic-goldpadt --gold

	# training and evaluation
python3 -m stanza.utils.training.run_tokenizer UD_Arabic-goldpadt --step 500 --score_test
python3 -m stanza.utils.training.run_mwt UD_Arabic-goldpadt --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_lemma UD_Arabic-goldpadt --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_pos UD_Arabic-goldpadt --max_steps 100 --score_test
python3 -m stanza.utils.training.run_depparse UD_Arabic-goldpadt --max_steps 100 --score_test

# GOLD+NYUAD

	# preprocessing tokenizer, mwt, lemma, pos and depparse
python3 -m stanza.utils.datasets.prepare_tokenizer_treebank UD_Arabic-goldnyuad
python3 -m stanza.utils.datasets.prepare_mwt_treebank UD_Arabic-goldnyuad
python3 -m stanza.utils.datasets.prepare_lemma_treebank UD_Arabic-goldnyuad
python3 -m stanza.utils.datasets.prepare_pos_treebank UD_Arabic-goldnyuad
python3 -m stanza.utils.datasets.prepare_depparse_treebank UD_Arabic-goldnyuad --gold

	# training and evaluation
python3 -m stanza.utils.training.run_tokenizer UD_Arabic-goldnyuad --step 500 --score_test
python3 -m stanza.utils.training.run_mwt UD_Arabic-goldnyuad --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_lemma UD_Arabic-goldnyuad --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_pos UD_Arabic-goldnyuad --max_steps 100 --score_test
python3 -m stanza.utils.training.run_depparse UD_Arabic-goldnyuad --max_steps 100 --score_test

# GOLD+NArabizi
	# pretraining tokenizer, mwt, lemma, pos and depparse
python3 -m stanza.utils.datasets.prepare_tokenizer_treebank UD_Arabic-goldnarabizi
python3 -m stanza.utils.datasets.prepare_mwt_treebank UD_Arabic-goldnarabizi
python3 -m stanza.utils.datasets.prepare_lemma_treebank UD_Arabic-goldnarabizi
python3 -m stanza.utils.datasets.prepare_pos_treebank UD_Arabic-goldnarabizi
python3 -m stanza.utils.datasets.prepare_depparse_treebank UD_Arabic-goldnarabizi --gold

	# training and evaluation
python3 -m stanza.utils.training.run_tokenizer UD_Arabic-goldnarabizi --step 500 --score_test
python3 -m stanza.utils.training.run_mwt UD_Arabic-goldnarabizi --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_lemma UD_Arabic-goldnarabizi --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_pos UD_Arabic-goldnarabizi --max_steps 100 --score_test
python3 -m stanza.utils.training.run_depparse UD_Arabic-goldnarabizi --max_steps 100 --score_test

# NArabizi+PADT
	# pretraining tokenizer, mwt, lemma, pos and depparse
python3 -m stanza.utils.datasets.prepare_tokenizer_treebank UD_Arabic-padtnarabizi
python3 -m stanza.utils.datasets.prepare_mwt_treebank UD_Arabic-padtnarabizi
python3 -m stanza.utils.datasets.prepare_lemma_treebank UD_Arabic-padtnarabizi
python3 -m stanza.utils.datasets.prepare_pos_treebank UD_Arabic-padtnarabizi
python3 -m stanza.utils.datasets.prepare_depparse_treebank UD_Arabic-padtnarabizi --gold

	# training and evaluation
python3 -m stanza.utils.training.run_tokenizer UD_Arabic-padtnarabizi --step 500 --score_test
python3 -m stanza.utils.training.run_mwt UD_Arabic-padtnarabizi --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_lemma UD_Arabic-padtnarabizi --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_pos UD_Arabic-padtnarabizi --max_steps 100 --score_test
python3 -m stanza.utils.training.run_depparse UD_Arabic-padtnarabizi --max_steps 100 --score_test

# NArabizi+NYUAD
	# pretraining tokenizer, mwt, lemma, pos and depparse
python3 -m stanza.utils.datasets.prepare_tokenizer_treebank UD_Arabic-nyuadnarabizi
python3 -m stanza.utils.datasets.prepare_mwt_treebank UD_Arabic-nyuadnarabizi
python3 -m stanza.utils.datasets.prepare_lemma_treebank UD_Arabic-nyuadnarabizi
python3 -m stanza.utils.datasets.prepare_pos_treebank UD_Arabic-nyuadnarabizi
python3 -m stanza.utils.datasets.prepare_depparse_treebank UD_Arabic-nyuadnarabizi --gold

	# training and evaluation
python3 -m stanza.utils.training.run_tokenizer UD_Arabic-nyuadnarabizi --step 500 --score_test
python3 -m stanza.utils.training.run_mwt UD_Arabic-nyuadnarabizi --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_lemma UD_Arabic-nyuadnarabizi --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_pos UD_Arabic-nyuadnarabizi --max_steps 100 --score_test
python3 -m stanza.utils.training.run_depparse UD_Arabic-nyuadnarabizi --max_steps 100 --score_test

# GOLD+NArabizi+PADT
	# pretraining tokenizer, mwt, lemma, pos and depparse
python3 -m stanza.utils.datasets.prepare_tokenizer_treebank UD_Arabic-goldpadtnarabizi
python3 -m stanza.utils.datasets.prepare_mwt_treebank UD_Arabic-goldpadtnarabizi
python3 -m stanza.utils.datasets.prepare_lemma_treebank UD_Arabic-goldpadtnarabizi
python3 -m stanza.utils.datasets.prepare_pos_treebank UD_Arabic-goldpadtnarabizi
python3 -m stanza.utils.datasets.prepare_depparse_treebank UD_Arabic-goldpadtnarabizi --gold

	# training and evaluation
python3 -m stanza.utils.training.run_tokenizer UD_Arabic-goldpadtnarabizi --step 500
python3 -m stanza.utils.training.run_mwt UD_Arabic-goldpadtnarabizi --num_epoch 2
python3 -m stanza.utils.training.run_lemma UD_Arabic-goldpadtnarabizi --num_epoch 2
python3 -m stanza.utils.training.run_pos UD_Arabic-goldpadtnarabizi --max_steps 100
python3 -m stanza.utils.training.run_depparse UD_Arabic-goldpadtnarabizi --max_steps 100

# GOLD+NArabizi+NYUAD
	# pretraining tokenizer, mwt, lemma, pos and depparse
python3 -m stanza.utils.datasets.prepare_tokenizer_treebank UD_Arabic-goldnyuadnarabizi
python3 -m stanza.utils.datasets.prepare_mwt_treebank UD_Arabic-goldnyuadnarabizi
python3 -m stanza.utils.datasets.prepare_lemma_treebank UD_Arabic-goldnyuadnarabizi
python3 -m stanza.utils.datasets.prepare_pos_treebank UD_Arabic-goldnyuadnarabizi
python3 -m stanza.utils.datasets.prepare_depparse_treebank UD_Arabic-goldnyuadnarabizi --gold

	# training and evaluation
python3 -m stanza.utils.training.run_tokenizer UD_Arabic-goldnyuadnarabizi --step 500 --score_test
python3 -m stanza.utils.training.run_mwt UD_Arabic-goldnyuadnarabizi --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_lemma UD_Arabic-goldnyuadnarabizi --num_epoch 2 --score_test
python3 -m stanza.utils.training.run_pos UD_Arabic-goldnyuadnarabizi --max_steps 100 --score_test
python3 -m stanza.utils.training.run_depparse UD_Arabic-goldnyuadnarabizi --max_steps 100 --score_test

