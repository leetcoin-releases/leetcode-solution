defmodule Solution do
  def int_to_roman(num) do
    values = [{1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"}, {90, "XC"}, {50, "L"}, {40, "XL"}, {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}]
    Enum.reduce(values, {num, ""}, fn {val, sym}, {n, acc} ->
      count = div(n, val)
      {rem(n, val), acc <> String.duplicate(sym, count)}
    end)
    |> elem(1)
  end
end
