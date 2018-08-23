defmodule MacroTest do
  use ExUnit.Case
  @moduletag :macro
  defmacro get_msg(cond?) do
    quote do
      unquote(cond?)
    end
  end

  test "macro expand" do
    value = 2
    ret = get_msg("unquote value = #{value}")
    assert ret == "unquote value = 2"
  end
end
