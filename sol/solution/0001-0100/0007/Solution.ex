defmodule Solution do
  @spec reverse(x :: integer) :: integer
  def reverse(x) do
    x
    |> Integer.digits() 
    |> Enum.reverse() 
    |> Integer.undigits()
    |> verify_bounds()
  end
  defp verify_bounds(x) when x > 2147483647, do: 0
  defp verify_bounds(x) when x < -2147483648, do: 0
  defp verify_bounds(x), do: x
end