defmodule BinarySearch do

  @doc """
    1. sort whitelist of numbers
    2. reduce the set to find value
    3. return items not in whitelist
  """
  def run(whitelist, input), do: run_search(Enum.sort(whitelist), input) |> List.flatten

  def run_search(check_set, input), do: Enum.map(input, fn(x) -> start_rank(x, check_set) end)

  def start_rank(key, check_set), do: rank(key, 0, Enum.count(check_set) - 1, check_set)

  def rank(_, lo, _, _) when lo == -1, do: []
  def rank(_, _, hi, _) when hi == 0, do: []
  def rank(key, lo, hi, _) when lo > hi, do: [key]
  def rank(key, lo, hi, set) when lo <= hi do
    index = mid_point(lo, hi)

    { new_lo, new_hi } = cond do
      to_integer(key) < value_at(index, set) -> { lo, index - 1 }
      to_integer(key) > value_at(index, set) -> { index + 1, hi }
      to_integer(key) == value_at(index, set) -> { -1, -1 }
      :else -> { index, index }
    end
    rank(key, new_lo, new_hi, set)
  end

  defp mid_point(min, max), do: min + (max - min) / 2 |> :erlang.trunc

  defp value_at(index, set), do: Enum.at(set, index) |> to_integer

  defp to_integer(str) when is_binary(str) do
    { num, _ } = String.to_integer(str)
    num
  end
end
