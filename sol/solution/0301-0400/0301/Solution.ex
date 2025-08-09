defmodule Solution do
  @spec remove_invalid_parentheses(s :: String.t) :: [String.t]
  def remove_invalid_parentheses(s) do
    bfs([s], MapSet.new(), [])
  end
  defp bfs([], _visited, results), do: results
  defp bfs(queue, visited, results) do
    {new_results, found, new_queue, new_visited} =
      Enum.reduce(queue, {results, false, [], visited}, fn cur, {res_acc, found_flag, nq, vis} ->
        cond do
          valid?(cur) ->
            {[cur | res_acc], true, nq, vis}
          found_flag ->
            {res_acc, true, nq, vis}
          true ->
            next_states =
              for i <- 0..(String.length(cur) - 1),
                  String.at(cur, i) in ["(", ")"] do
                String.slice(cur, 0, i) <> String.slice(cur, i + 1, String.length(cur) - i - 1)
              end
            {
              res_acc,
              found_flag,
              nq ++ Enum.filter(next_states, &(!MapSet.member?(vis, &1))),
              Enum.reduce(next_states, vis, &MapSet.put(&2, &1))
            }
        end
      end)
    if found do
      Enum.uniq(new_results)
    else
      bfs(new_queue, new_visited, new_results)
    end
  end
  defp valid?(str) do
    str
    |> String.graphemes()
    |> Enum.reduce_while(0, fn
      "(", count -> {:cont, count + 1}
      ")", count -> if count > 0, do: {:cont, count - 1}, else: {:halt, -1}
      _, count -> {:cont, count}
    end)
    |> Kernel.==(0)
  end
end
