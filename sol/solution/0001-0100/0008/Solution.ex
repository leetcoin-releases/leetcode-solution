defmodule Solution do
  @int_max 2_147_483_647
  @int_min -2_147_483_648
  def my_atoi(s) do
    s = String.trim_leading(s)
    {sign, rest} = case s do
      "-" <> tail -> {-1, tail}
      "+" <> tail -> {1, tail}
      _ -> {1, s}
    end
    digits = take_digits(rest, "")
    if digits == "", do: 0, else: parse_int(digits, sign)
  end
  defp take_digits(<<c, rest::binary>>, acc) when c in ?0..?9 do
    take_digits(rest, acc <> <<c>>)
  end
  defp take_digits(_, acc), do: acc
  defp parse_int(digits, sign) do
    {int, _} = Integer.parse(digits)
    result = sign * int
    cond do
      result < @int_min -> @int_min
      result > @int_max -> @int_max
      true -> result
    end
  end
end
