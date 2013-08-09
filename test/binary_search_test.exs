Code.require_file "test_helper.exs", __DIR__

defmodule BinarySearchTest do
  use ExUnit.Case

  @whitelist %W[ 84 48 68 10 18 98 12 23 54 57 48 33 16 77 11 29 ]

  @input %W[ 23 50 10 99 18 23 98 84 11 10 48 77 13 54 98 77 77 68 ]

  test :binary_search do
    assert BinarySearch.run(@whitelist, @input) == %W[ 50 99 13 ]
  end

  test :max_index do
    assert BinarySearch.max_index([1,2,4]) == 2
  end

  test :range do
    assert BinarySearch.range(0, 15) == 0..15
    assert BinarySearch.range(8, 7) == nil
  end

  test :to_integer do
    assert BinarySearch.to_integer("42") == 42
  end

  test :position_value do
    set = [11,12,13,14,15,16,17,18,19,20]
    index = 5
    assert BinarySearch.position_value(set, index) == 16
  end

  @doc """
    BinarySearch.subset(val, index, set)
  """
  test :subset do
    set = [1,2,3,4,5,6,7,8,9,10]
    index = 5

    low_value = 2
    high_value = 7
    match_value = 6

    assert BinarySearch.subset(low_value, index, set) == [1,2,3,4,5]
    assert BinarySearch.subset(high_value, index, set) == [6,7,8,9,10]
    assert BinarySearch.subset(match_value, index, set) == []
  end

  @doc """
    BinarySearch.mid_point(low, high)
  """
  test :mid_point do
    assert BinarySearch.mid_point(0..5) == 2
    assert BinarySearch.mid_point(0..10) == 5
    assert BinarySearch.mid_point(0..15) == 7
  end

  @doc """
    BinarySearch.check_value(val, index, set)
  """
  test :check_value do
    refute BinarySearch.check_value?(2, 6, [ 1, 2, 3, 4, 5])
    assert BinarySearch.check_value?(2, 3, [ 1, 2, 3, 4, 5])
  end

end
