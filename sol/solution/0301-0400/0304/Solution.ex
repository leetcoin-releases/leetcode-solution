defmodule NumMatrix do
  @spec init_(matrix :: [[integer]]) :: :ok
  def init_(matrix) do
    prefix = build_prefix_sum(matrix)
    Process.put(:num_matrix_prefix, prefix)
    :ok
  end
  defp build_prefix_sum(matrix) do
    m = length(matrix)
    n = if m > 0, do: length(hd(matrix)), else: 0
    Enum.reduce(0..m, %{}, fn i, acc ->
      Enum.reduce(0..n, acc, fn j, acc2 ->
        if i == 0 or j == 0 do
          Map.put(acc2, {i, j}, 0)
        else
          val = Enum.at(Enum.at(matrix, i - 1), j - 1)
          sum =
            val +
              Map.get(acc2, {i - 1, j}, 0) +
              Map.get(acc2, {i, j - 1}, 0) -
              Map.get(acc2, {i - 1, j - 1}, 0)
          Map.put(acc2, {i, j}, sum)
        end
      end)
    end)
  end
  @spec sum_region(row1 :: integer, col1 :: integer, row2 :: integer, col2 :: integer) :: integer
  def sum_region(row1, col1, row2, col2) do
    prefix = Process.get(:num_matrix_prefix, %{})
    r1 = row1 + 1
    c1 = col1 + 1
    r2 = row2 + 1
    c2 = col2 + 1
    Map.get(prefix, {r2, c2}, 0) -
      Map.get(prefix, {r1 - 1, c2}, 0) -
      Map.get(prefix, {r2, c1 - 1}, 0) +
      Map.get(prefix, {r1 - 1, c1 - 1}, 0)
  end
end
# Your functions will be called as such:
# NumMatrix.init_(matrix)
# param_1 = NumMatrix.sum_region(row1, col1, row2, col2)
# NumMatrix.init_ will be called before every test case, in which you can do some necessary initializations.