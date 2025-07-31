is_palindrome(X) when X < 0; (X rem 10 =:= 0 andalso X =/= 0) -> false;
is_palindrome(X) ->
    is_palindrome(X, 0).
is_palindrome(X, Reversed) when X =< Reversed ->
    X =:= Reversed orelse X =:= Reversed div 10;
is_palindrome(X, Reversed) ->
    is_palindrome(X div 10, Reversed * 10 + X rem 10).