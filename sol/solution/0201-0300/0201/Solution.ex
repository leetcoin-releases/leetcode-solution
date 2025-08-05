defmodule Solution do
  use Bitwise
  @spec range_bitwise_and(left :: integer, right :: integer) :: integer
  def range_bitwise_and(left, right) when left < right do
    range_bitwise_and(left, right &&& (right - 1))
  end
  def range_bitwise_and(_, right), do: right
end