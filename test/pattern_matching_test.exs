defmodule PatternMatchingTest do
  use ExUnit.Case
  @moduletag :pattern_matching

  test "basic pattern matching" do
    # variable
    x = 3
    y = x
    assert x == 3
    assert y == 3

    # tuple
    {ret, reason} = {:ok, "good"}
    assert ret == :ok
    assert reason == "good"

    # map > partial pattern matching
    %{a: a_value, b: b_value} = %{a: 1000, b: 2000, c: 3000}
    assert a_value == 1000
    assert b_value == 2000

    # list
    list = [first | tail] = [1, 2, 3, 4]
    assert length(list) == 4
    assert first == 1
    assert is_list(tail) == true
    assert length(tail) == 3
  end

  test "case pattern matching" do
    case {:ok, 123} do
      {:ok, value} ->
        assert value == 123
    end

    case {:ok, 2} do
      {:ok, 1} ->
        flunk("This should raise an error")

      {:ok, 2} ->
        :ok
    end

    obj = %PC{}

    case obj do
      %PC{} -> :ok
      %Npc{} -> flunk("raise an error")
      %Item{} -> flunk("raise an error")
    end
  end
end
