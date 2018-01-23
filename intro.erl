-module(intro).
%-import().
-export([intro1/0, fac/1, len/1, tail_fac/1, tail_len/1, duplicate/2,
	tail_duplicate/2, reverse/1, tail_reverse/1, sublist/2, tail_sublist/2,
	zip/2, tail_zip/2 ,lenient_zip/2, tail_lenient_zip/2, quicksort/1]).

intro1() -> io:format("Hello World!").

fac(0) -> 1;
fac(X) when X > 0 -> 
	X * fac(X -1).
	
tail_fac(X) -> 
	tail_fac(X,1).	%tail_fac/2 used internally
tail_fac(0, Acc) -> 
	Acc;
tail_fac(X,Acc) when X > 0 -> 
	tail_fac(X-1, X*Acc).

	
len([]) -> 0;
len([_| T]) -> 1 + len(T).

tail_len(X) ->
	tail_len(X, 0). %tail_len/2 used internally

tail_len([], Acc) ->
	Acc;
tail_len([_|T],Acc) -> tail_len(T, Acc+1). 

duplicate(0,_) ->
	[];
duplicate(N, X) when N >0 ->
	[X|duplicate(N-1,X)].
	
tail_duplicate(Num, Term) ->
	tail_duplicate(Num,Term,[]).
	
tail_duplicate(0, _Term, List) ->
	List;
tail_duplicate(Num, Term, List) when Num > 0->
	tail_duplicate(Num -1, Term, [Term|List]).
	
reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++ [H].

tail_reverse(X) -> tail_reverse(X,[]).

tail_reverse([],Acc) ->
	Acc;
tail_reverse([H|T],Acc) -> 
	tail_reverse(T,[H|Acc]).
	
sublist(_List, 0) ->
	[];
sublist([],_Num) -> 
	[];
sublist([H|T], Num) when Num > 0 ->
	[H|sublist(T,Num -1)].
	
tail_sublist(L, Num) -> lists:reverse(tail_sublist(L, Num, [])).

tail_sublist(_L, 0, SubList) ->
	SubList;
tail_sublist([], _Num, SubList) ->
	SubList;
tail_sublist([H|T], Num, SubList) when Num > 0->
	tail_sublist(T, Num -1, [H|SubList]).
	
zip([],[]) -> [];
zip([X|Xs],[Y|Ys]) -> [{X,Y}|zip(Xs,Ys)].

tail_zip(List1, List2) -> lists:reverse(tail_zip(List1,List2, [])).
tail_zip([],[], Return) -> Return;
tail_zip([X|Xs],[Y|Ys], Return) ->
	tail_zip(Xs,Ys, [{X,Y}| Return]).

lenient_zip([],_) -> [];
lenient_zip(_,[]) -> [];
lenient_zip([X|Xs],[Y|Ys]) -> [{X,Y}| lenient_zip(Xs,Ys)].

tail_lenient_zip(List1, List2) -> lists:reverse(tail_lenient_zip(List1, List2, [])).

tail_lenient_zip([],_, Return) ->
	Return;
tail_lenient_zip(_,[],Return) ->
	Return;
tail_lenient_zip([X|Xs],[Y|Ys], Return) ->
	tail_lenient_zip(Xs,Ys, [{X,Y}|Return]).
	
	
quicksort([]) -> [];
quicksort([Pivot|Rest])->
	{Smaller, Larger} = partition(Pivot, Rest, [],[]),
		quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).
		
partition(_Pivot, [], Smaller, Larger) ->{Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
	if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
	H > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
	end.