defmodule Solution do
  @spec is_happy(n :: integer) :: boolean
  def is_happy(n), do: detect(n, next(n))
  defp next(n) do
    n
    |> Integer.digits()
    |> Enum.map(&(&1 * &1))
    |> Enum.sum()
  end
  defp detect(slow, fast) when fast == 1, do: true
  defp detect(slow, fast) when slow == fast, do: false
  defp detect(slow, fast), do: detect(next(slow), next(next(fast)))
end