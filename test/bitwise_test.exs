defmodule BitwiseTest do
  use ExUnit.Case
  use Bitwise
  @moduletag :bitwise
  test "roud-robin number" do
    # 16bit(2byte) roud-robin number
    # bitstring pattern matching
    # little-endian representation
    # equals > little-size(8) = little-8
    <<a::little-size(8), b::little-size(8), c::little-size(8), d::little-size(8)>> =
      <<83_929_280::little-32>>

    assert {a, b, c, d} == {192, 168, 0, 5}
    <<a::little-8, b::little-8, c::little-8, d::little-8>> = <<83_929_280::little-32>>
    assert {a, b, c, d} == {192, 168, 0, 5}
    # big-endian representation
    # equals > big-size(8) = big-8 = 8 = size(8)
    <<a::big-size(8), b::big-size(8), c::big-size(8), d::big-size(8)>> = <<83_929_280::32>>
    assert {a, b, c, d} == {5, 0, 168, 192}
    <<a::big-8, b::big-8, c::big-8, d::big-8>> = <<83_929_280::32>>
    assert {a, b, c, d} == {5, 0, 168, 192}
    <<a::8, b::8, c::8, d::8>> = <<83_929_280::32>>
    assert {a, b, c, d} == {5, 0, 168, 192}
    <<a::size(8), b::size(8), c::size(8), d::size(8)>> = <<83_929_280::32>>
    assert {a, b, c, d} == {5, 0, 168, 192}
    # common length specifier
    <<value::bytes-size(2), rest::binary>> = <<1, 2, 3>>
    assert value == <<1, 2>>
    assert rest == <<3>>
    <<value::bytes-size(2), _::binary>> = <<1, 2, 3>>
    assert value == <<1, 2>>
    # difference between binary and bitstring
    assert is_binary(<<1::size(16)>>)
    assert not is_binary(<<1::size(15)>>)
    assert is_bitstring(<<1::size(16)>>)
    assert is_bitstring(<<1::size(15)>>)
  end
end
