defmodule Solution do
  def length_of_longest_substring(s) when is_binary(s) do
    do_length(String.to_charlist(s), 0, 0, %{}, 0)
  end
  def length_of_longest_substring(s) when is_list(s) do
    do_length(s, 0, 0, %{}, 0)
  end
  defp do_length([], _i, _start, _last, res), do: res
  defp do_length([c | t], i, start, last, res) do
      prev = Map.get(last, c, nil)
      new_start = if prev != nil and prev >= start, do: prev + 1, else: start
      new_res = max(res, i - new_start + 1)
      new_last = Map.put(last, c, i)
      do_length(t, i + 1, new_start, new_last, new_res)
  end
  def length_of_longest_substring(s) when is_binary(s),
    do: length_of_longest_substring(String.to_charlist(s))
end
