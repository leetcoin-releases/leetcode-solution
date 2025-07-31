-spec find_median_sorted_arrays(Nums1 :: [integer()], Nums2 :: [integer()]) -> float().
find_median_sorted_arrays(Nums1, Nums2) -> 
    Len = length(Nums1) + length(Nums2),
    find_median_sorted_arrays(Nums1, Nums2, [], -1, 0, 0, Len rem 2, Len div 2).
find_median_sorted_arrays(_, _, [H|T], Index, _, _, Even, Index) ->
        if Even =:= 1 -> H;
            true -> (H + lists:nth(1, T)) / 2
        end;
find_median_sorted_arrays([], [H2|T2], MyArr, Index, Indx1, Indx2, Even, Middle) ->
    find_median_sorted_arrays([], T2, [H2|MyArr], Index + 1, Indx1, Indx2 + 1, Even, Middle);
find_median_sorted_arrays([H1|T1], [], MyArr, Index, Indx1, Indx2, Even, Middle) ->
    find_median_sorted_arrays(T1, [], [H1|MyArr], Index + 1, Indx1, Indx2 + 1, Even, Middle);
find_median_sorted_arrays([H1|T1], [H2|T2], MyArr, Index, Indx1, Indx2, Even, Middle) when H1 < H2 -> 
    find_median_sorted_arrays(T1, [H2|T2], [H1|MyArr], Index + 1, Indx1 + 1, Indx2, Even, Middle);
find_median_sorted_arrays([H1|T1], [H2|T2], MyArr, Index, Indx1, Indx2, Even, Middle)-> 
    find_median_sorted_arrays([H1|T1], T2, [H2|MyArr], Index + 1, Indx1, Indx2 + 1, Even, Middle).
    