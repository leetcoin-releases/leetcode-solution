defmodule Solution do
  @spec convert(s :: String.t, num_rows :: integer) :: String.t
  def convert(s, 1), do: s
  def convert(s, num_rows) do
    cycle_len = 2 * num_rows - 2
    0..(num_rows - 1)
    |> Enum.map(fn row -> add_row(s, num_rows, cycle_len, row) end)
    |> IO.iodata_to_binary()
  end
  def add_row(s, num_rows, cycle_len, row), do: add_row(s, num_rows, cycle_len, row, 0, [])
  def add_row(s, num_rows, cycle_len, row, cycle, acc)
      when row + cycle * cycle_len < byte_size(s) do
    index = row + cycle * cycle_len
    acc = [:binary.at(s, index) | acc]
    acc =
      if row > 0 and row < num_rows - 1 and (cycle + 1) * cycle_len - row < byte_size(s) do
        index = (cycle + 1) * cycle_len - row
        [:binary.at(s, index) | acc]
      else
        acc
      end
    add_row(s, num_rows, cycle_len, row, cycle + 1, acc)
  end
  def add_row(_, _, _, _, _, acc), do: Enum.reverse(acc)
end