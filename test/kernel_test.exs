defmodule KernelTest do
  use ExUnit.Case
  @moduletag :kernel

  test "[map] pop_in" do
    state = %{name: "taiyo", target: %{1 => "a", 2 => "b", :name => "aa"}}
    assert state.target[1] == "a"
    assert state.target.name == "aa"

    # add key '3'
    state = put_in(state.target[3], "c")
    assert state.target[3] == "c"

    # remove key '3'
    {pop_value, state} = pop_in(state.target[3])
    assert pop_value == "c"
    assert not Map.has_key?(state.target, 3)
  end
end
