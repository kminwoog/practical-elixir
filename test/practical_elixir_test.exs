defmodule PracticalElixirTest do
  use ExUnit.Case
  doctest PracticalElixir

  test "greets the world" do
    assert PracticalElixir.hello() == :world
  end
end
