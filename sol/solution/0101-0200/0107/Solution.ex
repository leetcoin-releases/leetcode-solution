# Definition for a binary tree node.
#
# defmodule TreeNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           left: TreeNode.t() | nil,
#           right: TreeNode.t() | nil
#         }
#   defstruct val: 0, left: nil, right: nil
# end
defmodule Solution do
  @spec level_order_bottom(root :: TreeNode.t | nil) :: [[integer]]
  def level_order_bottom(nil), do: []
  def level_order_bottom(root) do
    root
    |> level_order()
    |> Enum.reverse()
  end
  defp level_order(root) do
    queue = :queue.new()
    queue = :queue.in({root, 0}, queue)
    process_queue(queue, [])
  end
  defp process_queue(queue, acc) do
    case :queue.out(queue) do
      {{:value, {node, level}}, new_queue} ->
        %TreeNode{val: val, left: left, right: right} = node
        queue1 = if left, do: :queue.in({left, level + 1}, new_queue), else: new_queue
        queue2 = if right, do: :queue.in({right, level + 1}, queue1), else: queue1
        new_acc = update_acc(acc, level, val)
        process_queue(queue2, new_acc)
      {:empty, _} ->
        acc
        |> Enum.sort_by(&elem(&1, 0))
        |> Enum.map(&elem(&1, 1))
    end
  end
  defp update_acc(acc, level, val) do
    case Enum.find(acc, fn {l, _} -> l == level end) do
      {^level, vals} ->
        List.replace_at(acc, Enum.find_index(acc, fn {l, _} -> l == level end), {level, vals ++ [val]})
      nil ->
        acc ++ [{level, [val]}]
    end
  end
end