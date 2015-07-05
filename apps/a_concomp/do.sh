#!/bin/bash -e
cd /usr/hadoop-tmp/graphlab/
./configure > /dev/null
cd release/apps/a_concomp
make -j4
/usr/hadoop-tmp/graphlab/scripts/mpirsync > /dev/null
 
#mpiexec -n 4 -hostfile ~/machines /usr/hadoop-tmp/graphlab/release/apps/a_concomp/a_concomp  --ncpus=12 \
# --graph=/usr/hadoop-tmp/graph/web-Google.txt  --format=snap --saveprefix=/usr/hadoop-tmp/result/web_Google_async_cc 
