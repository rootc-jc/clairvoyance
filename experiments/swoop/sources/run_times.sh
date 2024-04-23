#! /bin/bash

# given a benchmark name, run it

# usage: ./run_benchmark.sh <benchmark_name>
# example: ./run_benchmark.sh 2mm

# open 2mm/bin and run the benchmark
# the benchmark will output the time it took to run
# store this time in a file called <benchmark_name>.time

# variations: unr indir version
# benchmark.unr.indir.version

cd $1 
cd bin/
pwd
# run all the files in the bin directory
# put the output in a file called <benchmark_name>.time
for file in *
do
    # skip non-executable files
    if [ ! -x $file ]; then
        continue
    fi
    echo "$file" >> ../../$1.time
    ./$file >> ../../$1.time
    # take average of 5 runs and store in the file
    # for i in {1..5}
    # do
    #     ./$file >> ../../$1.time
    # done
done