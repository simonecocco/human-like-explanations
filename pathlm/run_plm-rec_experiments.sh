for MODEL in distilgpt2@plm-rec gpt2-medium@plm-rec gpt2-large@plm-rec ;
	do
	for HOPS in 3 5 ;
	  do
	  	for NPATHS in  1000 ;
				do
					for DATASET in lfm1m ; 
						do			
									echo 'Running: model' $MODEL 'dataset-' $DATASET ' npaths-' $NPATHS ' hops-' $HOPS
									pip install ../ && python3 models/lm/from_scratch_main.py --dataset $DATASET \
									                    --sample_size_finetune $NPATHS \
									                    --sample_size_hop $HOPS \
									                    --model $MODEL \
									                    --nproc $NPROC \
									                    --n_hop $HOPS \
									                    --emb_filename 'transe_embed.pkl' \
									                    --emb_size 100
									echo 'Completed run: model' $MODEL 'dataset-' $DATASET ' npaths-' $NPATHS ' hops-' $HOPS
									echo
						done
					done
			done    	
	done