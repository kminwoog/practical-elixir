defmodule Hash.Bench do
  use Benchfella

  @data "basic language primitives, such as arithmetic operators, spawning of processes, data type handling, etc."
  bench "md5" do
    :crypto.hash(:md5, @data)
  end

  bench "md5 - base16" do
    :crypto.hash(:md5, @data) |> Base.encode16()
  end

  bench "md5 - base64" do
    :crypto.hash(:md5, @data) |> Base.encode64()
  end

  bench "md5 - v2" do
    :erlang.md5(@data)
  end

  bench "md5 - v2 - base16" do
    :erlang.md5(@data) |> Base.encode16()
  end

  bench "md5 - v2 - base64" do
    :erlang.md5(@data) |> Base.encode64()
  end

  bench "sha-1" do
    :crypto.hash(:sha, @data)
  end

  bench "sha-1 - base16" do
    :crypto.hash(:sha, @data) |> Base.encode16()
  end

  bench "sha-1 - base64" do
    :crypto.hash(:sha, @data) |> Base.encode64()
  end

  bench "sha-2(224)" do
    :crypto.hash(:sha224, @data)
  end

  bench "sha-2(256)" do
    :crypto.hash(:sha256, @data)
  end

  bench "sha-2(384)" do
    :crypto.hash(:sha384, @data)
  end

  bench "sha-2(512)" do
    :crypto.hash(:sha512, @data)
  end

  bench "ripemd160" do
    :crypto.hash(:ripemd160, @data)
  end
end
