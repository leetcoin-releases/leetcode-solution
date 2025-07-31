defmodule Solution do
  @spec longest_palindrome(s :: String.t) :: String.t
   def longest_palindrome(s) do
    {l, r} =
      s
      |> String.to_charlist()
      |> List.to_tuple()
      |> do_longest_palindrome()
    String.slice(s, l, r - l + 1)
  end
  defp do_longest_palindrome(s) do
    Enum.reduce(0..(tuple_size(s) - 1), {0, 0}, fn i, p_max ->
      p_max
      |> longest(expand_from_centre(s, i, i))
      |> longest(expand_from_centre(s, i, i + 1))
    end)
  end
  defp expand_from_centre(s, l, r), do: expand_from_centre(s, l, r, 0)
  defp expand_from_centre(s, l, r, offset) when l - offset < 0 or r + offset >= tuple_size(s) do
    {l - offset + 1, r + offset - 1}
  end
  defp expand_from_centre(s, l, r, offset) do
    if elem(s, l - offset) == elem(s, r + offset) do
      expand_from_centre(s, l, r, offset + 1)
    else
      {l - offset + 1, r + offset - 1}
    end
  end
  defp longest({a_l, a_r} = a, {b_l, b_r} = b) do
    if a_r - a_l >= b_r - b_l, do: a, else: b
  end
end