%Jack Burns
%
%Excercise 1
%substitute
%base case
substitute(_, _, [], []).

%if the head is an element to be replaced, replace it then recurse
substitute(X, Y, [X|T1], [Y|T2]) :- substitute(X, Y, T1, T2).

%if the head of the first list is not an element to be replaced
%then recurse through the list until prolog
%finds an element to replace
substitute(X, Y, [H|T1], [H|T2]) :-
  H \= X,
  substitute(X, Y, T1, T2).

%Excercise 2
%adjacent
%base case
adjacent(X, Y, [X, Y|_]).
adjacent(X, Y, [Y, X|_]). %to check both directions
adjacent(X, Y, [_|T]) :-
  adjacent(X, Y, T).

%Excercise 3

%build a tree
tree(a, tree(b, tree(d, void, void), tree(e, tree(h, void, void), tree(i, void, void))), tree(c, tree(f, void, void), tree(g, void, void))).

%subtree
%base case is when the 2 elements are the same
subtree(X, X).
subtree(S, tree(_Element, _Right, Left)) :- subtree(S, Left).
subtree(S, tree(_Element, Right, _Left)) :- subtree(S, Right).

%subtree test
%build a tree
test1 :- subtree(tree(c, tree(f, void, void), tree(g, void, void)),
tree(a, tree(b, tree(d, void, void), tree(e, tree(h, void, void), tree(i, void, void))), tree(c, tree(f, void, void), tree(g, void, void)))).

%Excercise 4
%path
%base case
path(X, tree(X, _, _), [X]).
path(X, tree(Element, Left, _Right), [Element|Path]) :-
  path(X, Left, Path).
path(X, tree(Element, _Left, Right), [Element|Path]) :-
  path(X, Right, Path).
