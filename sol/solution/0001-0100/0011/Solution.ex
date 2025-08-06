defmodule Solution do
  @spec max_area(height :: [integer]) :: integer
  def max_area(height) do
    height = List.to_tuple(height)
    do_max_area(height, 0, tuple_size(height) - 1, 0)
  end
  defp do_max_area(_, l, r, max) when l >= r, do: max
  defp do_max_area(height, l, r, max) do
    height_l = elem(height, l)
    height_r = elem(height, r)
    max = max(max, min(height_l, height_r) * (r - l))
    if height_l < height_r do
      do_max_area(height, l + 1, r, max)
    else
      do_max_area(height, l, r - 1, max)
    end
  end
end