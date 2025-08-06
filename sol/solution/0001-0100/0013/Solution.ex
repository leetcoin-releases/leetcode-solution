defmodule Solution do
  def roman_to_int(s) do
    map = %{"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
    chars = String.graphemes(s)
    chars
    |> Enum.with_index()
    |> Enum.reduce(0, fn {char, i}, acc ->
      curr = map[char]
      next = if i + 1 < length(chars), do: map[Enum.at(chars, i + 1)], else: 0
      if curr < next, do: acc - curr, else: acc + curr
    end)
  end
end