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
  @spec remove_elements(head :: ListNode.t | nil, val :: integer) :: ListNode.t | nil
  def remove_elements(nil, _val), do: nil
  def remove_elements(%ListNode{val: val, next: next}, val) do
    remove_elements(next, val)
  end
  def remove_elements(%ListNode{val: val, next: next}, target) do
    %ListNode{val: val, next: remove_elements(next, target)}
  end
end