/*
 * Frontend GUI implementation for Cheese Quiz using the XPCE toolkit.
 */

:- use_module(library(pce)).
:- consult('text.pl').

% main entry point to open and start the gui
run_gui :-
    init_window(Window),
    init_questions(Questions),
    display_header(Window, Header),
    display_questions(Window, Header, Questions),
    open_window(Window).

% open XQuartz window
open_window(Window) :-
    send(Window, open).

% initialize empty window object
init_window(Window) :-
    new(Window, window("What Type of Cheese Are You?")), % sets window title
    send(Window, size, size(900, 180)). % width x height

% display header objects onto the window
display_header(Window, Header) :-
    new(Header, text('"What Type of Cheese Are You?"')),
    send(Header, font, font(times, bold, 30)), 
    send(Window, display, Header),
    send(Header, center_x, Window?center_x),
    send(Header, y, 70).
    
% initialize questions
init_questions(Questions) :-
    new(Questions, dialog),
    send(Questions, gap, size(0, 50)), % sets gap size between elements
    
    % Assume updated question_label_X predicates exist or update as necessary
    cheese_question_1(Label1),
    cheese_question_2(Label2),
    cheese_question_3(Label3),
    cheese_question_4(Label4),
    cheese_question_5(Label5),
    cheese_question_6(Label6),
    cheese_question_7(Label7),
    
    % Replace sliders with appropriate GUI elements if necessary
    send(Questions, append, new(Question1, slider(Label1, 1, 4, 1))),
    send(Questions, append, new(Question2, slider(Label2, 1, 6, 1))),
    send(Questions, append, new(Question3, slider(Label3, 1, 6, 1))),
    send(Questions, append, new(Question4, slider(Label4, 1, 8, 1))),
    send(Questions, append, new(Question5, slider(Label5, 1, 6, 1))),
    send(Questions, append, new(Question6, slider(Label6, 1, 26, 1))),
    send(Questions, append, new(Question7, slider(Label7, 1, 2, 1))),
    send(Questions, append, button('Discover Your Cheese Type',
        message(@prolog,
            get_cheese_match,
            Question1?selection,
            Question2?selection,
            Question3?selection,
            Question4?selection,
            Question5?selection,
            Question6?selection,
            Question7?selection))).

% display questions onto the window
display_questions(Window, Header, Questions) :-
    send(Window, display, Questions),
    send(Questions, below, Header),
    send(Questions, center_x, Window?center_x).

% find the difference between two lists
sub(X, Y, Z) :- Z is X - Y.
subtractList([], [], []).
subtractList([X|XR], [Y|YR], [R|RR]) :-
    sub(X, Y, R),
    subtractList(XR, YR, RR).

% find sum of list
sum_list([], 0).
sum_list([H|T], Sum) :-
   sum_list(T, Rest),
   Sum is abs(H) + Rest.

% sum the differences of value - response 
findDifferenceSum(Values, Response, Sum) :-
    subtractList(Values, Response, Difference),
    sum_list(Difference, Sum).

% identify the cheese personality closest aligned with response
% Base inspired by: https://github.com/danielcapacio/pokemon-personality-test
findBestCheeseMatch(Type, Response, Percent) :-
    cheese_values(Type, Value),
    findDifferenceSum(Value, Response, Sum),
    Percent is round((51 - Sum)*100 / 51),
    \+ (cheese_values(OtherType, OtherValue), OtherType \= Type, findDifferenceSum(OtherValue, Response, OtherSum), OtherSum < Sum).

% identify the cheese personality closest to the best personality
findSecondBestCheeseMatch(Type, BestType, Response, Percent) :-
    cheese_values(Type, Value),
    Type \= BestType,
    findDifferenceSum(Value, Response, Sum),
    Percent is round((51 - Sum)*100 / 51),
    \+ (cheese_values(OtherType, OtherValue), OtherType \= Type, OtherType \= BestType, findDifferenceSum(OtherValue, Response, OtherSum), OtherSum < Sum).

% identify the worst cheese personality match to the response
findWorstCheeseMatch(Type, Response, Percent) :-
    cheese_values(Type, Value),
    findDifferenceSum(Value, Response, Sum),
    Percent is round((51 - Sum)*100 / 51),
    \+ (cheese_values(OtherType, OtherValue), OtherType \= Type, findDifferenceSum(OtherValue, Response, OtherSum), OtherSum > Sum).

% logic for matching cheese type based on the user inputs
% Base inspired by: https://github.com/danielcapacio/pokemon-personality-test
get_cheese_match(R1, R2, R3, R4, R5, R6, R7) :-
    new(ResponseDialog, dialog('Your Cheese Match')),
    send(ResponseDialog, gap, size(0, 20)),
    findBestCheeseMatch(BestType, [R1, R2, R3, R4, R5, R6, R7], BestPercent),
    findSecondBestCheeseMatch(SecondBestType, BestType, [R1, R2, R3, R4, R5, R6, R7], SecondBestPercent),
    findWorstCheeseMatch(WorstType, [R1, R2, R3, R4, R5, R6, R7], WorstPercent),
    write(BestType),
    writeln(' type matched.'),
    display_cheese_personality(ResponseDialog, BestType, BestPercent, SecondBestType, SecondBestPercent, WorstType, WorstPercent). 

% display the cheese type image and explanation for the given type
% Base inspired by: https://github.com/danielcapacio/pokemon-personality-test
display_cheese_personality(ResponseDialog, Type, Percent, SecondBestType, SecondBestPercent, WorstType, WorstPercent) :-
    cheese_personality(Type, Explanation, ImagePath),
    format(atom(MatchedHeaderText), 'You are a ~w% match with ~w cheese!', [Percent, Type]),
    new(MatchHeader, text(MatchedHeaderText)),
    send(MatchHeader, font, font(times, bold, 20)),
    send(ResponseDialog, append, MatchHeader),
    
    new(Image, bitmap(ImagePath)),
    send(ResponseDialog, append, Image),

    send(ResponseDialog, append, new(ExplanationLabel, text(Explanation))),
    send(ExplanationLabel, font, font(times, roman, 15)),
    
    send(ResponseDialog, append, new(Line2, line(0, 0, 800, 0))),
    send(Line2, y, 200),
    send(Line2, x, 50),

    format(atom(WorstMatch), 'Your second best match is ~w% with ~w! Your worst match is ~w% with ~w.', [SecondBestPercent, SecondBestType, WorstPercent, WorstType]),
    send(ResponseDialog, append, new(WorstMatchLabel, text(WorstMatch))),
    send(WorstMatchLabel, font, font(times, roman, 15)),
    
    send(ResponseDialog, append, button('OK', message(ResponseDialog, destroy))),
    send(ResponseDialog, default_button, 'OK'),
    send(ResponseDialog, open_centered).