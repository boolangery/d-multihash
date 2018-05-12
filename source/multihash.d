/*
Copyright 2018 Eliott Dumeix

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
module multihash;


extern (C):
nothrow:
@nogc:

static int scrypt_export(byte* input, byte* output, uint n, uint r, uint inputLength);

static int quark_export(byte* input, byte* output, uint inputLength);

static int x11_export(byte* input, byte* output, uint inputLength);

static int x15_export(byte* input, byte* output, uint inputLength);

static int x17_export(byte* input, byte* output, uint inputLength);

static int neoscrypt_export(byte* input, byte* output, uint inputLength, uint profile);

static int scryptn_export(byte* input, byte* output, uint nFactor, uint inputLength);

static int kezzak_export(byte* input, byte* output, uint inputLength);

static int bcrypt_export(byte* input, byte* output, uint inputLength);

static int skein_export(byte* input, byte* output, uint inputLength);

static int groestl_export(byte* input, byte* output, uint inputLength);

static int groestl_myriad_export(byte* input, byte* output, uint inputLength);

static int blake_export(byte* input, byte* output, uint inputLength);

static int blake2s_export(byte* input, byte* output, uint inputLength);

static int dcrypt_export(byte* input, byte* output, uint inputLength);

static int fugue_export(byte* input, byte* output, uint inputLength);

static int qubit_export(byte* input, byte* output, uint inputLength);

static int s3_export(byte* input, byte* output, uint inputLength);

static int hefty1_export(byte* input, byte* output, uint inputLength);

static int shavite3_export(byte* input, byte* output, uint inputLength);

static int nist5_export(byte* input, byte* output, uint inputLength);

static int fresh_export(byte* input, byte* output, uint inputLength);

static int jh_export(byte* input, byte* output, uint inputLength);

static int c11_export(byte* input, byte* output, uint inputLength);

static int x16r_export(byte* input, byte* output, uint inputLength);

static int x16s_export(byte* input, byte* output, uint inputLength);

static int lyra2re_export(byte* input, byte* output);

static int lyra2rev2_export(byte* input, byte* output);

static bool equihash_verify_export(byte* header, int headerLength, byte* solution, int solutionLength);

static int sha3_256_export(byte* input, byte* output, uint inputLength);

static int sha3_512_export(byte* input, byte* output, uint inputLength);

public struct ethash_h256_t
{
    public byte[] value;
}

public struct ethash_return_value
{
    public ethash_h256_t result;
    public ethash_h256_t mix_hash;

    public bool success;
}

alias ethash_callback_t = int function(uint);

/// Allocate and initialize a new ethash_light handler
/// Params:
///     block_number = The block number for which to create the handler
/// Returns: Newly allocated ethash_light handler or NULL
static int* ethash_light_new_export(ulong block_number);

/// Frees a previously allocated ethash_light handler
/// <param name="handle">The light handler to free
static void ethash_light_delete_export(int* handle);

/// Calculate the light client data
/// Params:
///     handle = The light client handler
///     header_hash = The 32-Byte header hash to pack into the mix
///     nonce = The nonce to pack into the mix
/// Returns: an object of ethash_return_value_t holding the return values
static void ethash_light_compute_export(int* handle, byte*header_hash, ulong nonce, ref ethash_return_value result);

/// Allocate and initialize a new ethash_full handler
/// Params:
///     dagDir = Directory where generated DAGs reside
///     light = The light handler containing the cache
///     callback = A callback function with signature of @ref ethash_callback_t
///     It accepts an unsigned with which a progress of DAG calculation
///     can be displayed. If all goes well the callback should return 0.
///     If a non-zero value is returned then DAG generation will stop.
///     Be advised. A progress value of 100 means that DAG creation is
///     almost complete and that this function will soon return succesfully.
///     It does not mean that the function has already had a succesfull return.
static int* ethash_full_new_export(string dagDir, int* light, ethash_callback_t callback);

/// Frees a previously allocated ethash_full handler
/// Params:
///     handle = The full handler to free
static void ethash_full_delete_export(int* handle);

/// Calculate the full client data
/// Params:
///     handle = The full client handler
///     header_hash = The 32-Byte header hash to pack into the mix
///     nonce = The nonce to pack into the mix
/// Returns: an object of ethash_return_value_t holding the return values
static void ethash_full_compute_export(int* handle, byte* header_hash, ulong nonce, ref ethash_return_value result);

/// Get a pointer to the full DAG data
/// Params:
///     handle = The full handler to free
static int* ethash_full_dag_export(int* handle);

/// Get the size of the DAG data
/// Params:
///     handle = The full handler to free
static ulong ethash_full_dag_size_export(int* handle);

/// Calculate the seedhash for a given block number
/// Params:
///     handle = The full handler to free
static ethash_h256_t ethash_get_seedhash_export(ulong block_number);

/// Get the default DAG directory
static bool ethash_get_default_dirname_export(byte* data, int length);
