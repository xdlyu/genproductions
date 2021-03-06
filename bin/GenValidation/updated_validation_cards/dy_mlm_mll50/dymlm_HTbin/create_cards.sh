#!/bin/bash

echo `pwd`
echo 'set up ht-binned cards'

#3000 will be replaced by infinite
Ht_array=(0 40 70 100 200 400 600 800 1200 2500 3000)

for((i=0;i<${#Ht_array[*]}-1;i++))
do
        bin_low=${Ht_array[i]}
        bin_high=${Ht_array[i+1]}
        if [[ "$bin_low" -eq "${Ht_array[9]}" ]];then
                mkdir HT-${bin_low}_inf
                cp ../dy01234mlm_inc/*custo* HT-${bin_low}_inf/DYJets_HT-${bin_low}toInf_customizecards.dat
                cp ../dy01234mlm_inc/*proc* HT-${bin_low}_inf/DYJets_HT-${bin_low}toInf_proc_card.dat
                sed -i "11s/dyellell01234j_5f_LO_MLM/DYJets_HT-${bin_low}toInf/g" HT-${bin_low}_inf/*proc_card.dat
                cp ../dy01234mlm_inc/*run* HT-${bin_low}_inf/DYJets_HT-${bin_low}toInf_run_card.dat
                sed -i "225s/0.0/$bin_low.0/g" HT-${bin_low}_inf/DYJets_HT-${bin_low}toInf_run_card.dat
        else
                mkdir HT-${bin_low}_${bin_high}
                cp ../dy01234mlm_inc/*custo* HT-${bin_low}_${bin_high}/DYJets_HT-${bin_low}to${bin_high}_customizecards.dat
                cp ../dy01234mlm_inc/*proc* HT-${bin_low}_${bin_high}/DYJets_HT-${bin_low}to${bin_high}_proc_card.dat
                sed -i "11s/dyellell01234j_5f_LO_MLM/DYJets_HT-${bin_low}to${bin_high}/g" HT-${bin_low}_${bin_high}/*proc_card.dat
                cp ../dy01234mlm_inc/*run* HT-${bin_low}_${bin_high}/DYJets_HT-${bin_low}to${bin_high}_run_card.dat
                sed -i "225s/0.0/$bin_low.0/g" HT-${bin_low}_${bin_high}/DYJets_HT-${bin_low}to${bin_high}_run_card.dat
                sed -i "226s/-1.0/$bin_high.0/g" HT-${bin_low}_${bin_high}/DYJets_HT-${bin_low}to${bin_high}_run_card.dat
        fi
done
