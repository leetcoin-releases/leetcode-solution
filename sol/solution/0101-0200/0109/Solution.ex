# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end
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
  @spec sorted_list_to_bst(head :: ListNode.t() | nil) :: TreeNode.t() | nil
  def sorted_list_to_bst(head) do
    list = to_array(head)
    build_bst(list, 0, length(list) - 1)
  end
  defp to_array(nil), do: []
  defp to_array(%ListNode{val: val, next: next}) do
    [val | to_array(next)]
  end
  defp build_bst(list, left, right) when left > right, do: nil
  defp build_bst(list, left, right) do
    mid = div(left + right, 2)
    val = Enum.at(list, mid)
    %TreeNode{
      val: val,
      left: build_bst(list, left, mid - 1),
      right: build_bst(list, mid + 1, right)
    }
  end
end
