# d-multihash

[![DUB Package](https://img.shields.io/dub/v/multihash.svg)](https://code.dlang.org/packages/multihash)

`d-multihash` is a binding of multihash C++ library exposed by Oliver Weichhold for coinfoundry/miningcore project.


## build

Use the dub package manager.

The following dependencies are required to build the original cryptonote library:
    - sodium-devel

Available build configurations:

    dub build --config=static   // use a local static library

    dub build --config=shared   // use a shared library

    dub test // run unit tests


# available algorithms

    - scrypt
    - quark
    - x11
    - x15
    - x17
    - neoscrypt
    - scryptn
    - kezzak
    - bcrypt
    - skein
    - groestl
    - groestl
    - blake
    - blake2s
    - dcrypt
    - fugue
    - qubit
    - s3
    - hefty1
    - shavite3
    - nist5
    - fresh
    - jh
    - c11
    - x16r
    - x16s
    - lyra2re
    - lyra2rev2
    - equihash
    - sha3_256
    - sha3_512
    - ethash
