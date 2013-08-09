defmodule BinarySearch do

  @doc """
    1. sort whitelist of numbers
    2. reduce the set to find value
    3. if found, add to response
  """
  def run(whitelist, input) do
    check_set = Enum.sort(whitelist)

    Enum.map(input, fn(x) -> rank(to_integer(x), check_set) end) |> List.flatten
  end

  def rank(_, []), do: []
  def rank(key, whitelist) do
    index = range(0, max_index(whitelist)) |> mid_point

    check_value?(index, key, whitelist) |> repeater(key, index, whitelist)
  end

  def repeater(continue, val, index, set) when !continue do
    rank(val, subset(val, index, set))
  end
  def repeater(continue, key, _index, _set) when continue, do: [key]

  def subset(val, index, set) do
    cond do
      val > position_value(set, index) ->
        { _, high } = Enum.split(set, index)
        high
      val < position_value(set, index) ->
        { low, _ } = Enum.split(set, index)
        low
      true ->
        []
    end
  end

  def check_value?(index, val, set), do: val == position_value(set, index)

  def position_value(set, index), do: Enum.at(set, index)

  def mid_point(range), do: range.first + (range.last - range.first) / 2 |> :erlang.trunc

  def max_index(list) when list != nil, do: Enum.count(list) - 1

  def range(first, last) when first > last, do: nil
  def range(first, last), do: Range.new(first: first, last: last)

  def to_integer(str) when is_binary(str) do
    { val, _ } = String.to_integer(str)
    val
  end
end
