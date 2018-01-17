-module(useless).
-import(lists, [seq/2]).
-export([
	add/2,
	hello/0,
	greet_and_add_two/2,
	evens_between/2]).
	
add(A,B) -> A+B.


%Shows greetings.
%io:format/1 is the standard function used to output text.
hello() -> 
	io:format("Hello, world! ~n").
	

greet_and_add_two(X,Y) -> 
	hello(), 
	add(X,Y) + 1.

	
% mest för att visa lists:seq()
evens_between(X,Y) -> 
	[2*N|| N <- seq(X,Y), N rem 2 =:= 0]. 