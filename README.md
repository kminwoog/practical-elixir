# PracticalElixir
[![Hex.pm Version](https://img.shields.io/hexpm/v/practical_elixir.svg)](https://hex.pm/packages/practical_elixir) 
 
## Benchmark test

#### hash_bench.exs

| benchmark name    | iterations | average time |
| ----------------- | ---------- | ------------ |
| sha-2(384)        | 1000000    | 1.22 µs/op   |
| sha-2(256)        | 1000000    | 1.24 µs/op   |
| sha-2(512)        | 1000000    | 1.44 µs/op   |
| md5               | 1000000    | 1.48 µs/op   |
| sha-1             | 1000000    | 1.56 µs/op   |
| sha-2(224)        | 1000000    | 1.58 µs/op   |
| md5 - v2          | 1000000    | 2.02 µs/op   |
| ripemd160         | 1000000    | 2.23 µs/op   |
| md5 - base16      | 1000000    | 2.94 µs/op   |
| sha-1 - base16    | 1000000    | 3.55 µs/op   |
| md5 - v2 - base16 | 500000     | 3.94 µs/op   |
| sha-1 - base64    | 500000     | 4.37 µs/op   |
| md5 - base64      | 500000     | 4.69 µs/op   |
| md5 - v2 - base64 | 500000     | 5.16 µs/op   |


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/practical_elixir](https://hexdocs.pm/practical_elixir).

