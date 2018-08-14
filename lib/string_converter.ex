defmodule StringConverter do
  @moduledoc """
    StringConverter convert string value to proper [integer | float | string]
  """

  @doc """
    convert string to proper type  [integer | float | string]

  ## Examples
    iex> StringConverter.to_type("34")
    34
    iex> StringConverter.to_type(".3f")
    0.3
    iex> StringConverter.to_type("abc3")
    "abc3"

  """

  @spec to_type(String.t()) :: Integer | float() | String.t()
  def to_type(value) when is_binary(value) do
    parse_integer(Integer.parse(value), value)
  end

  @doc """
    convert string to integer

  ## Examples
    iex> StringConverter.to_integer("-25")
    -25
    iex> StringConverter.to_integer("2.4")
    :error
  """

  @spec to_integer(String.t(), any()) :: Integer | any()
  def to_integer(value, error \\ :error) when is_binary(value) do
    case parse_integer(value) do
      x when is_integer(x) -> x
      _ -> error
    end
  end

  defp parse_integer(value) when is_binary(value),
    do: parse_integer(Integer.parse(value), value, & &1)

  defp parse_integer(ret, value, parse_float_func \\ &parse_float/1)
  defp parse_integer({0, ""}, _value, _parse_float_func), do: 0
  defp parse_integer({num, ""}, _value, _parse_float_func), do: num

  defp parse_integer({_num, _remainder}, value, parse_float_func), do: parse_float_func.(value)
  defp parse_integer(:error, value, parse_float_func), do: parse_float_func.(value)

  @doc """
    convert string to float

  ## Examples
    iex> StringConverter.to_float("0.3f")
    0.3
    iex> StringConverter.to_float("3x")
    :error
  """

  @spec to_float(String.t(), any()) :: float() | any()
  def to_float(value, error \\ :error) when is_binary(value) do
    case parse_float(value) do
      x when is_float(x) -> x
      _ -> error
    end
  end

  defp parse_float(value) when is_binary(value), do: parse_float(Float.parse(value), value)
  defp parse_float({num, ""}, _value), do: num
  defp parse_float({num, "f"}, _value), do: num
  defp parse_float({num, ".f"}, _value), do: num
  defp parse_float({_num, _remainder}, value), do: value

  defp parse_float(:error, <<".", _rest::binary>> = value),
    do: parse_float(Float.parse("0" <> value), value)

  defp parse_float(:error, value), do: value
end
