#!/bin/bash
#SBATCH --job-name=download-junickim
#SBATCH --output=./logs/download.out
#SBATCH --error=./logs/download.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=06:00:00
#SBATCH --mem=100G
#SBATCH --account=commit
#SBATCH --partition=lanka-v3
#SBATCH --qos=commit-main
#SBATCH --exclusive

mkdir -p tensors && cd tensors || exit 1
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/amazon/amazon-reviews.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/chicago-crime/comm/chicago-crime-comm.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/chicago-crime/geo/chicago-crime-geo.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/delicious/delicious-4d.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/delicious/delicious-3d.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/enron/enron.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/flickr/flickr-4d.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/flickr/flickr-3d.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/lbnl-network/lbnl-network.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/matrix-multiplication/matmul_2-2-2.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/matrix-multiplication/matmul_3-3-3.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/matrix-multiplication/matmul_4-3-2.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/matrix-multiplication/matmul_4-4-3.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/matrix-multiplication/matmul_4-4-4.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/matrix-multiplication/matmul_5-5-5.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/matrix-multiplication/matmul_6-3-3.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/nell/nell-1.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/nell/nell-2.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/nips/nips.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/patents/patents.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/reddit-2015/reddit-2015.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/uber-pickups/uber.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/vast-2015-mc1/vast-2015-mc1-5d.tns.gz
curl -LJO https://s3.us-east-2.amazonaws.com/frostt/frostt_data/vast-2015-mc1/vast-2015-mc1-3d.tns.gz
