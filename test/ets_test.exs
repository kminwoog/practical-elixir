defmodule EtsTest do
  use ExUnit.Case
  @moduletag :ets

  test "atomic number generator" do
    key = :unique_id
    # unnamed table
    counter = :ets.new(:counter1, [:public])
    check_gen_number(counter, key)
    # named table
    :ets.new(:counter2, [:public, :named_table])
    check_gen_number(:counter2, key)
  end

  defp check_gen_number(table, key) do
    # 2nd element increment 1
    value = :ets.update_counter(table, key, {2, 1}, {key, 100, 200})
    assert value == 101
    # 3rd element increment 2
    value = :ets.update_counter(table, key, {3, 2}, {key, 100, 200})
    assert value == 202
    # 3rd element increment 5
    :ets.update_counter(table, key, {3, 5}, {key, 100, 200})
    # lookup elements for key
    value = :ets.lookup(table, key)
    assert value == [{key, 101, 207}]
  end

  test "update_elmement" do
    table = :ets.new(:noname, [:public, :set, read_concurrency: true, write_concurrency: true])
    key = 1
    value = %{name: "aa", id: 32}
    # new insert
    ret = :ets.insert(table, {key, value.name, value})
    assert ret == true
    # duplicated insert
    ret = :ets.insert_new(table, {key, value.name, value})
    assert ret == false
    check_equals(table, key, value)

    # update
    # key pos = 1
    # value.name pos = 2
    # value pos = 3
    value = %{name: "aa", id: 33}
    ret = :ets.update_element(table, key, {3, value})
    assert ret == true
    check_equals(table, key, value)

    invalid_key = 2
    ret = :ets.update_element(table, invalid_key, {3, value})
    assert ret == false
    check_equals(table, key, value)
  end

  defp check_equals(table, key, value) do
    ret = :ets.lookup(table, key)
    assert ret == [{key, value.name, value}]
  end
end
