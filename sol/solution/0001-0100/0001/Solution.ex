defmodule Solution do
    @spec two_sum(nums :: [integer], target :: integer) :: [integer]
    def two_sum(nums, target) do
        find(nums, target, %{}, 0)
    end
    defp find([], _target, _map, _index), do: nil
    defp find([num | rest], target, map, index) do
        case Map.get(map, target - num) do nil -> find(rest, target, Map.put(map, num, index), index + 1)
            comp_index -> [comp_index, index]
        end
    end
end