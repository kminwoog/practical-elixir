defmodule MacroTest do
  use ExUnit.Case
  @moduletag :macro
  defmacro get_msg(cond?) do
    quote do
      unquote(cond?)
    end
  end

  defmacro cond_msg(cond?, msg) do
    m = Macro.to_string(cond?)

    quote do
      result = unquote(cond?)
      "#{unquote(m)} is #{inspect(result)}, #{unquote(msg)}"
    end
  end

  test "macro expand" do
    value = 2
    ret = get_msg("unquote value = #{value}")
    assert ret == "unquote value = 2"

    a = 2
    ret = cond_msg(a == 2, "a's value = #{a}")
    assert ret == "a == 2 is true, a's value = 2"
  end
end
