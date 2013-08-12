Code.require_file "test_helper.exs", __DIR__

defmodule BinarySearchTest do
  use ExUnit.Case

  @whitelist %W[ 84 48 68 10 18 98 12 23 54 57 48 33 16 77 11 29 ]

  @input %W[ 23 50 10 99 18 23 98 84 11 10 48 77 13 54 98 77 77 68 ]

  test :binary_search do
    assert BinarySearch.run(@whitelist, @input) == %W[ 50 99 13 ]
  end

  test :rank do
    assert BinarySearch.rank("5", -1, -1, %W[ 1 2 3 4 5 ]) == []
    assert BinarySearch.rank("5", 0, 0, []) == []
    assert BinarySearch.rank("5", 2, 2, %W[ 1 2 3 4 ]) == ["5"]
    assert BinarySearch.rank("5", 4, 3, %W[ 1 2 3 4 ]) == ["5"]
    assert BinarySearch.rank("5", 0, 3, %W[ 1 2 3 4 ]) == ["5"]
    assert BinarySearch.rank("2", 0, 3, %W[ 1 2 3 4 ]) == []
  end

end
