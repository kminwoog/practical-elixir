defmodule INetTest do
  use ExUnit.Case
  @moduletag :inet

  @tag :hot
  test "erlang - inet" do
    assert {:ok, {127, 0, 0, 1}} == :inet.parse_address('127.0.0.1')
    assert {:error, :einval} == :inet.parse_address('error_addr')

    assert '127.0.0.1' == :inet.ntoa({127, 0, 0, 1})
    assert '127.0.0.1' == :inet_parse.ntoa({127, 0, 0, 1})
    assert "127.0.0.1" == :inet_parse.ntoa({127, 0, 0, 1}) |> to_string()
  end
end
