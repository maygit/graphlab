#!/bin/bash

normal_engine=/usr/hadoop-tmp/graphlab/src/graphlab/engine/async_consistent_engine.hpp.bak
abnormal_engine=/usr/hadoop-tmp/graphlab/src/graphlab/engine/async_consistent_engine.hpp.bak2
engine=/usr/hadoop-tmp/graphlab/src/graphlab/engine/async_consistent_engine.hpp

#WCC test on normal engine:
if [ -f $normal_engine ]; 
then
		mv $engine $abnormal_engine
		mv $normal_engine $engine
		cd /usr/hadoop-tmp/graphlab/
		./configure
		cd release/apps/a_concomp/
		make -j8
		/usr/hadoop-tmp/graphlab/scripts/mpirsync
fi

#WCC && liveJournal
#async
mpiexec -n 4 -hostfile ~/machines /usr/hadoop-tmp/graphlab/release/apps/a_concomp/a_concomp \
--ncpus=12 --graph=/usr/hadoop-tmp/graph/soc-LiveJournal1.txt --format=snap --execution=async \
--saveprefix=/home/mzj/mzj_result/lj_async_cc >~/mzjdata/lj_async_cc.log
cd ~
./merge.sh /home/mzj/mzj_result/lj_async_cc\* lj_async_cc wcc >> ~/mzjdata/lj_async_cc.log
#sync
mpiexec -n 4 -hostfile ~/machines /usr/hadoop-tmp/graphlab/release/apps/a_concomp/a_concomp \
--ncpus=12 --graph=/usr/hadoop-tmp/graph/soc-LiveJournal1.txt --format=snap --execution=sync \
--saveprefix=/home/mzj/mzj_result/lj_sync_cc >~/mzjdata/lj_sync_cc.log
cd ~
./merge.sh /home/mzj/mzj_result/lj_sync_cc\* lj_sync_cc wcc >> ~/mzjdata/lj_sync_cc.log

#WCC && web-Google
#async
mpiexec -n 4 -hostfile ~/machines /usr/hadoop-tmp/graphlab/release/apps/a_concomp/a_concomp \
--ncpus=12 --graph=/usr/hadoop-tmp/graph/web-Google.txt --format=snap --execution=async \
--saveprefix=/home/mzj/mzj_result/wg_async_cc >~/mzjdata/wg_async_cc.log
cd ~
./merge.sh /home/mzj/mzj_result/wg_async_cc\* wg_async_cc wcc >> ~/mzjdata/wg_async_cc.log


#sync
mpiexec -n 4 -hostfile ~/machines /usr/hadoop-tmp/graphlab/release/apps/a_concomp/a_concomp \
--ncpus=12 --graph=/usr/hadoop-tmp/graph/web-Google.txt --format=snap --execution=sync \
--saveprefix=/home/mzj/mzj_result/wg_sync_cc >~/mzjdata/wg_sync_cc.log
cd ~
./merge.sh /home/mzj/mzj_result/wg_sync_cc\* wg_sync_cc wcc >> ~/mzjdata/wg_sync_cc.log


#WCC && cage15
#async
mpiexec -n 4 -hostfile ~/machines /usr/hadoop-tmp/graphlab/release/apps/a_concomp/a_concomp \
--ncpus=12 --graph=/usr/hadoop-tmp/graph/cage15.graph.txt --format=snap --execution=async \
--saveprefix=/home/mzj/mzj_result/cg_async_cc >~/mzjdata/cg_async_cc.log
cd ~
./merge.sh /home/mzj/mzj_result/cg_async_cc\* cg_async_cc wcc >> ~/mzjdata/cg_async_cc.log

#sync
mpiexec -n 4 -hostfile ~/machines /usr/hadoop-tmp/graphlab/release/apps/a_concomp/a_concomp \
--ncpus=12 --graph=/usr/hadoop-tmp/graph/cage15.graph.txt --format=snap --execution=sync \
--saveprefix=/home/mzj/mzj_result/cg_sync_cc > ~/mzjdata/cg_sync_cc.log
cd ~
./merge.sh /home/mzj/mzj_result/cg_sync_cc\* cg_sync_cc wcc >> ~/mzjdata/cg_sync_cc.log

######################################

#WCC test on abnormal engine:
if [ -f $abnormal_engine ]; 
then
		mv $engine $normal_engine
		mv $abnormal_engine $engine
		cd /usr/hadoop-tmp/graphlab/
		./configure
		cd release/apps/a_concomp/
		make -j8
		/usr/hadoop-tmp/graphlab/scripts/mpirsync
fi

#WCC && liveJournal
#async
mpiexec -n 4 -hostfile ~/machines /usr/hadoop-tmp/graphlab/release/apps/a_concomp/a_concomp \
--ncpus=12 --graph=/usr/hadoop-tmp/graph/soc-LiveJournal1.txt --format=snap --execution=async \
--saveprefix=/home/mzj/mzj_result2/lj2_async_cc >~/mzjdata/lj2_async_cc.log
cd ~
./merge.sh /home/mzj/mzj_result2/lj2_async_cc\* lj2_async_cc wcc >> ~/mzjdata/lj2_async_cc.log
#sync
#mpiexec -n 4 -hostfile ~/machines /usr/hadoop-tmp/graphlab/release/apps/a_concomp/a_concomp \
#--ncpus=12 --graph=/usr/hadoop-tmp/graph/soc-LiveJournal1.txt --format=snap --execution=sync \
#--saveprefix=/home/mzj/mzj_result2/lj2_sync_cc >~/mzjdata/lj2_sync_cc.log
#cd ~
#./merge.sh /home/mzj/mzj_result2/lj2_sync_cc\* lj2_sync_cc wcc >> ~/mzjdata/lj2_sync_cc.log

#WCC && web-Google
#async
mpiexec -n 4 -hostfile ~/machines /usr/hadoop-tmp/graphlab/release/apps/a_concomp/a_concomp \
--ncpus=12 --graph=/usr/hadoop-tmp/graph/web-Google.txt --format=snap --execution=async \
--saveprefix=/home/mzj/mzj_result2/wg2_async_cc >~/mzjdata/wg2_async_cc.log
cd ~
./merge.sh /home/mzj/mzj_result2/wg2_async_cc\* wg2_async_cc wcc >> ~/mzjdata/wg2_async_cc.log


#sync
#mpiexec -n 4 -hostfile ~/machines /usr/hadoop-tmp/graphlab/release/apps/a_concomp/a_concomp \
#--ncpus=12 --graph=/usr/hadoop-tmp/graph/web-Google.txt --format=snap --execution=sync \
#--saveprefix=/home/mzj/mzj_result2/wg2_sync_cc >~/mzjdata/wg2_sync_cc.log
#cd ~
#./merge.sh /home/mzj/mzj_result2/wg2_sync_cc\* wg2_sync_cc wcc >> ~/mzjdata/wg2_sync_cc.log


#WCC && cage15
#async
mpiexec -n 4 -hostfile ~/machines /usr/hadoop-tmp/graphlab/release/apps/a_concomp/a_concomp \
--ncpus=12 --graph=/usr/hadoop-tmp/graph/cage15.graph.txt --format=snap --execution=async \
--saveprefix=/home/mzj/mzj_result2/cg2_async_cc >~/mzjdata/cg2_async_cc.log
cd ~
./merge.sh /home/mzj/mzj_result2/cg2_async_cc\* cg2_async_cc wcc >> ~/mzjdata/cg2_async_cc.log

#sync
#mpiexec -n 4 -hostfile ~/machines /usr/hadoop-tmp/graphlab/release/apps/a_concomp/a_concomp \
#--ncpus=12 --graph=/usr/hadoop-tmp/graph/cage15.graph.txt --format=snap --execution=sync \
#--saveprefix=/home/mzj/mzj_result2/cg2_sync_cc > ~/mzjdata/cg2_sync_cc.log
#cd ~
#./merge.sh /home/mzj/mzj_result2/cg2_sync_cc\* cg2_sync_cc wcc >> ~/mzjdata/cg2_sync_cc.log




