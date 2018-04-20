defmodule StringConverterTest do
  use ExUnit.Case
  doctest StringConverter

  # iex> Integer.parse("0")
  #   {0, ""}
  #   iex> Integer.parse("-1")
  #   {-1, ""}
  #   iex> Integer.parse("1+a")
  #   {1, "+a"}

  #   iex> Float.parse("0.1")
  #   {0.1, ""}
  #   iex> Float.parse(".1")
  #   :error
  #   iex> Float.parse("0.3f")
  #   {0.3, "f"}
  #   iex> Float.parse("0.f")
  #   {0.0, ".f"}
  #   iex> Float.parse(".3f")
  #   :error

  test "string_converter.ex" do
    assert StringConverter.to_type("0") == 0
    assert StringConverter.to_type("-1") == -1
    assert StringConverter.to_type("0.0") == 0.0
    assert StringConverter.to_type(".1") == 0.1
    assert StringConverter.to_type("0.3f") == 0.3
    assert StringConverter.to_type("0.0f") == 0.0
    assert StringConverter.to_type(".3f") == 0.3
    assert StringConverter.to_type("3f") == 3.0
    assert StringConverter.to_type("0-1") == "0-1"
    assert StringConverter.to_type("1x") == "1x"
    assert StringConverter.to_type("1+a") == "1+a"

    assert 1 = StringConverter.to_integer("+1")
    assert :error = StringConverter.to_integer("0+1")

    assert 0.3 = StringConverter.to_float("0.3f")
    assert :error = StringConverter.to_float("3x")
  end
end
