defmodule Solution do
    @spec find_median_sorted_arrays(nums1 :: [integer], nums2 :: [integer]) :: float
    def find_median_sorted_arrays(nums1, nums2) do
        merged = Enum.sort(nums1 ++ nums2)
        len = length(merged)
        mid = div(len, 2)
        if rem(len, 2) == 1 do
            Enum.at(merged, mid) * 1.0
        else
            (Enum.at(merged, mid - 1) + Enum.at(merged, mid)) / 2.0
        end
    end
end
