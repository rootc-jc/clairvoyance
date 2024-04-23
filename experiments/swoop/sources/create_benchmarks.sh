#! /bin/bash
benchmarks=(
    datamining/correlation/correlation.c
    datamining/covariance/covariance.c
    linear-algebra/kernels/2mm/2mm.c
    linear-algebra/kernels/3mm/3mm.c
    linear-algebra/kernels/atax/atax.c
    linear-algebra/kernels/bicg/bicg.c
    linear-algebra/kernels/doitgen/doitgen.c
    linear-algebra/kernels/mvt/mvt.c
    linear-algebra/blas/gemm/gemm.c
    linear-algebra/blas/gemver/gemver.c
    linear-algebra/blas/gesummv/gesummv.c
    linear-algebra/blas/symm/symm.c
    linear-algebra/blas/syr2k/syr2k.c
    linear-algebra/blas/syrk/syrk.c
    linear-algebra/blas/trmm/trmm.c
    linear-algebra/solvers/cholesky/cholesky.c
    linear-algebra/solvers/durbin/durbin.c
    linear-algebra/solvers/gramschmidt/gramschmidt.c
    linear-algebra/solvers/lu/lu.c
    linear-algebra/solvers/ludcmp/ludcmp.c
    linear-algebra/solvers/trisolv/trisolv.c
    medley/deriche/deriche.c
    medley/floyd-warshall/floyd-warshall.c
    medley/nussinov/nussinov.c
    stencils/adi/adi.c
    stencils/fdtd-2d/fdtd-2d.c
    stencils/heat-3d/heat-3d.c
    stencils/jacobi-1d/jacobi-1d.c
    stencils/jacobi-2d/jacobi-2d.c
    stencils/seidel-2d/seidel-2d.c
)
benchmarkHeaders=(
    datamining/correlation/correlation.h
    datamining/covariance/covariance.h
    linear-algebra/kernels/2mm/2mm.h
    linear-algebra/kernels/3mm/3mm.h
    linear-algebra/kernels/atax/atax.h
    linear-algebra/kernels/bicg/bicg.h
    linear-algebra/kernels/doitgen/doitgen.h
    linear-algebra/kernels/mvt/mvt.h
    linear-algebra/blas/gemm/gemm.h
    linear-algebra/blas/gemver/gemver.h
    linear-algebra/blas/gesummv/gesummv.h
    linear-algebra/blas/symm/symm.h
    linear-algebra/blas/syr2k/syr2k.h
    linear-algebra/blas/syrk/syrk.h
    linear-algebra/blas/trmm/trmm.h
    linear-algebra/solvers/cholesky/cholesky.h
    linear-algebra/solvers/durbin/durbin.h
    linear-algebra/solvers/gramschmidt/gramschmidt.h
    linear-algebra/solvers/lu/lu.h
    linear-algebra/solvers/ludcmp/ludcmp.h
    linear-algebra/solvers/trisolv/trisolv.h
    medley/deriche/deriche.h
    medley/floyd-warshall/floyd-warshall.h
    medley/nussinov/nussinov.h
    stencils/adi/adi.h
    stencils/fdtd-2d/fdtd-2d.h
    stencils/heat-3d/heat-3d.h
    stencils/jacobi-1d/jacobi-1d.h
    stencils/jacobi-2d/jacobi-2d.h
    stencils/seidel-2d/seidel-2d.h
)
benchmarkNames=(
    correlation
    covariance
    2mm
    3mm
    atax
    bicg
    doitgen
    mvt
    gemm
    gemver
    gesummv
    symm
    syr2k
    syrk
    trmm
    cholesky
    durbin
    gramschmidt
    lu
    ludcmp
    trisolv
    deriche
    floyd-warshall
    nussinov
    adi
    fdtd-2d
    heat-3d
    jacobi-1d
    jacobi-2d
    seidel-2d
)
# print all benchmarks
for (( i=0 ; i<=29 ; i++ )); do
    echo ${benchmarkNames[$i]}
    mkdir -p ${benchmarkNames[$i]}/src
    mkdir -p ${benchmarkNames[$i]}/bin
    cd ${benchmarkNames[$i]}
    echo "Creating ${benchmarkNames[$i]} benchmark"
    pwd
    cp ../PolyBenchC-4.2.1/${benchmarks[$i]} ${benchmarkNames[$i]}.c
    cp ../PolyBenchC-4.2.1/${benchmarkHeaders[$i]} ${benchmarkNames[$i]}.h
    cat ../PolyBenchC-4.2.1/utilities/polybench.c ${benchmarkNames[$i]}.c > src/temporary.c
    gcc -I ../PolyBenchC-4.2.1/utilities -I . src/temporary.c -DPOLYBENCH_TIME -E > src/source.c
    cd src
    echo -e "LEVEL=../../\nBENCHMARK=${benchmarkNames[$i]}\n" | cat - ../../make_template > Makefile
    cd ..
    cd ..
done
# cat ../PolyBenchC-4.2.1/utilities/polybench.c cholesky.c > src/temporary.c
# gcc -I ../PolyBenchC-4.2.1/utilities -I . src/temporary.c -DPOLYBENCH_TIME -E > src/source.c
