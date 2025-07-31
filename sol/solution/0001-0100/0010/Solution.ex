defmodule Solution do
  @spec is_match(s :: String.t, p :: String.t) :: boolean
  def is_match(s, p) do
    m = String.length(s)
    n = String.length(p)
    # Initialize dp table as a map for better access
    dp = %{{0, 0} => true}
    dp = Enum.reduce(1..n, dp, fn j, acc ->
      if String.at(p, j - 1) == "*" do
        Map.put(acc, {0, j}, Map.get(acc, {0, j - 2}, false))
      else
        Map.put(acc, {0, j}, false)
      end
    end)
    dp = Enum.reduce(1..m, dp, fn i, acc ->
      Map.put(acc, {i, 0}, false)
    end)
    dp = Enum.reduce(1..m, dp, fn i, acc ->
      Enum.reduce(1..n, acc, fn j, acc2 ->
        cond do
          String.at(p, j - 1) == "*" ->
            value =
              (Map.get(acc2, {i, j - 2}, false) or
                (Map.get(acc2, {i - 1, j}, false) and
                  (String.at(s, i - 1) == String.at(p, j - 2) or String.at(p, j - 2) == ".")))
            Map.put(acc2, {i, j}, value)
          String.at(s, i - 1) == String.at(p, j - 1) or String.at(p, j - 1) == "." ->
            Map.put(acc2, {i, j}, Map.get(acc2, {i - 1, j - 1}, false))
          true ->
            Map.put(acc2, {i, j}, false)
        end
      end)
    end)
    Map.get(dp, {m, n}, false)
  end
end