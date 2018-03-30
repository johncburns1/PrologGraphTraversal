%Jack Burns
%
%Excercise 1

%start/finish states
start(a).
start(b).
finish(j).
finish(k).

%red nodes
red(b).
red(c).
red(d).
red(i).
red(k).

%green nodes
green(a).
green(e).
green(f).
green(g).
green(h).
green(j).

%red_edge
red_edge(b, d).
red_edge(d, i).
red_edge(i, k).
red_edge(d, e).
red_edge(d, f).
red_edge(f, h).
red_edge(h, i).
red_edge(h, k).

%green_edge
green_edge(a, f).
green_edge(f, g).
green_edge(g, h).
green_edge(h, j).
green_edge(a, c).
green_edge(a, d).
green_edge(b, d).
green_edge(d, f).
green_edge(e, i).

%red_edge_sequence([H1, H2|_]) :- red_edge(H1, k).
%red_edge_sequenceR--the recursive part
red_edge_sequenceR([X]) :- finish(X).
red_edge_sequenceR([H1, H2|T]) :-
  red_edge(H1, H2),
  red_edge_sequenceR([H2|T]).

%red_edge_sequence with the nested recursive part
red_edge_sequence([Head|Tail]) :-
  start(Head),
  red_edge_sequenceR([Head|Tail]).

%alternating_edge_sequence
%start on Red
alternating_edge_sequenceR([X]) :- finish(X).
alternating_edge_sequenceR([H1, H2|T]) :-
  red_edge(H1, H2),
  alternating_edge_sequenceG([H2|T]).

%start on green
alternating_edge_sequenceG([X]) :- finish(X).
alternating_edge_sequenceG([H1, H2|T]) :-
  green_edge(H1, H2),
  alternating_edge_sequenceR([H2|T]).

%alternating_edge_sequence for green start
alternating_edge_sequence([Head|Tail]) :-
  start(Head),
  alternating_edge_sequenceR([Head|Tail]).

%alternating_edge_sequence for start on red
alternating_edge_sequence([Head|Tail]) :-
  start(Head),
  alternating_edge_sequenceG([Head|Tail]).

%matching_edge_state_sequence for red Edges and states
matching_edge_state_sequenceR([X]) :- finish(X).
matching_edge_state_sequenceR([H1, H2|T]) :-
  red(H1),
  red(H2),
  red_edge(H1, H2),
  matching_edge_state_sequenceR([H2|T]).

%matching_edge_state_sequenceG for green edges and states
matching_edge_state_sequenceG([X]) :- finish(X).
matching_edge_state_sequenceG([H1, H2|T]) :-
  green(H1),
  green(H2),
  green_edge(H1, H2),
  matching_edge_state_sequenceG([H2|T]).

%matching_edge_state_sequence for red path
matching_edge_state_sequence([Head|Tail]) :-
  start(Head),
  matching_edge_state_sequenceR([Head|Tail]).

%matching_edge_state_sequence for green path
matching_edge_state_sequence([Head|Tail]) :-
  start(Head),
  matching_edge_state_sequenceG([Head|Tail]).
