# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end
defmodule Solution do
  @spec add_two_numbers(l1 :: ListNode.t | nil, l2 :: ListNode.t | nil) :: ListNode.t | nil
  def add_two_numbers(l1, l2) do
    add_two_numbers(l1, l2, 0)
  end
  defp add_two_numbers(nil, nil, 0), do: nil
  defp add_two_numbers(l1, l2, carry) do
    val1 = if l1, do: l1.val, else: 0
    val2 = if l2, do: l2.val, else: 0
    sum = val1 + val2 + carry
    new_carry = div(sum, 10)
    next1 = if l1, do: l1.next, else: nil
    next2 = if l2, do: l2.next, else: nil
    %ListNode{
      val: rem(sum, 10),
      next: add_two_numbers(next1, next2, new_carry)
    }
  end
end