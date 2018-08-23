defmodule MapSetTest do
  use ExUnit.Case
  @moduletag :mapset

  test "[mapset] basic" do
    # defined as struct `MapSet`
    # defstruct map: %{}, version: 2
    assert match?(%MapSet{}, MapSet.new())
    assert match?(%MapSet{}, %MapSet{map: %{}, version: 2})
    assert map_size(%MapSet{}) == 3
    assert map_size(MapSet.new()) == 3

    state = %{target: MapSet.new([:b, :a, 3])}
    assert MapSet.member?(state.target, 3)
    assert MapSet.size(state.target) == 3

    # remove member `3`
    target = MapSet.delete(state.target, 3)
    assert not MapSet.member?(target, 3)
    assert MapSet.size(target) == 2
  end
end
