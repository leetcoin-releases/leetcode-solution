defmodule Solution do
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x) when x < 0 or (rem(x, 10) == 0 and x != 0), do: false
  def is_palindrome(x) do
    reverse(x, 0)
    |> then(fn {num, reversed} -> num == reversed or num == div(reversed, 10) end)
  end
  defp reverse(x, reversed) when x <= reversed, do: {x, reversed}
  defp reverse(x, reversed) do
    reverse(div(x, 10), reversed * 10 + rem(x, 10))
  end
end