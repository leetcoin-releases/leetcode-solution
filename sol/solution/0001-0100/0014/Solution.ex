defmodule Solution do
  @spec longest_common_prefix(strs :: [String.t]) :: String.t
  def longest_common_prefix([]), do: ""
  def longest_common_prefix([head | tail]) do
    Enum.reduce(tail, head, fn str, acc ->
      common_prefix(acc, str)
    end)
  end
  defp common_prefix(str1, str2) do
    str1
    |> String.graphemes()
    |> Enum.zip(String.graphemes(str2))
    |> Enum.take_while(fn {c1, c2} -> c1 == c2 end)
    |> Enum.map(fn {c, _} -> c end)
    |> Enum.join()
  end
end