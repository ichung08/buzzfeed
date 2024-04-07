/*
 * Frontend GUI implementation for Cheese Quiz using the XPCE toolkit.
 */

:- use_module(library(pce)).
:- consult('text.pl').

% main entry point to open and start the gui
run_gui :-
    init_window(Window),
    init_header(Header, CheeseIcon),
    init_questions(QuestionDialog),
    display_header(Window, Header, CheeseIcon),
    display_questions(Window, Header, QuestionDialog),
    open_window(Window).

% open XQuartz window
open_window(Window) :-
    send(Window, open).

% initialize empty window object
init_window(Window) :-
    new(Window, window("What Type of Cheese Are You?")), % sets window title
    send(Window, size, size(900, 180)). % width x height

% initialize application heading with text and cheese icon
init_header(Header, CheeseIcon) :-
    new(Header, text('Discover Your Cheese Type!')), % create new object for the header
    send(Header, font, font(helvetica, bold, 30)), % set font, weight, and size
    new(CheeseIcon, bitmap('assets/images/xpm/cheese.xpm')). % display cheese image using `bitmap`

% display header objects onto the window
display_header(Window, Header, CheeseIcon) :-
    send(Window, display, Header),
    send(Header, center_x, Window?center_x),
    send(Header, y, 70),
    send(Window, display, CheeseIcon),
    % set positioning
    send(CheeseIcon, y, 10),
    send(CheeseIcon, x, 60).
    
% initialize questions dialog
init_questions(QuestionDialog) :-
    new(QuestionDialog, dialog),
    send(QuestionDialog, gap, size(0, 50)), % sets gap size between elements
    
    % Assume updated question_label_X predicates exist or update as necessary
    cheese_question_1(Label1),
    cheese_question_2(Label2),
    cheese_question_3(Label3),
    cheese_question_4(Label4),
    cheese_question_5(Label5),
    cheese_question_6(Label6),
    cheese_question_7(Label7),
    
    % Replace sliders with appropriate GUI elements if necessary
    send(QuestionDialog, append, new(Question1, slider(Label1, 1, 4, 1))),
    send(QuestionDialog, append, new(Question2, slider(Label2, 1, 6, 1))),
    send(QuestionDialog, append, new(Question3, slider(Label3, 1, 6, 1))),
    send(QuestionDialog, append, new(Question4, slider(Label4, 1, 8, 1))),
    send(QuestionDialog, append, new(Question5, slider(Label5, 1, 6, 1))),
    send(QuestionDialog, append, new(Question6, slider(Label6, 1, 26, 1))),
    send(QuestionDialog, append, new(Question7, slider(Label7, 1, 2, 1))),
    send(QuestionDialog, append, button('Discover Your Cheese Type',
        message(@prolog,
            get_cheese_match,
            Question1?selection,
            Question2?selection,
            Question3?selection,
            Question4?selection,
            Question5?selection,
            Question6?selection,
            Question7?selection))).

% display questions dialog onto the window
display_questions(Window, Header, QuestionDialog) :-
    send(Window, display, QuestionDialog),
    send(QuestionDialog, below, Header),
    send(QuestionDialog, center_x, Window?center_x).

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

findDifferenceSum(Values, Response, Sum) :-
    subtractList(Values, Response, Difference),
    sum_list(Difference, Sum).

findCheeseType(Type, Response) :-
    cheese_values(Type, Value),
    findDifferenceSum(Value, Response, Sum),
    \+ (cheese_values(OtherType, OtherValue), OtherType \= Type, findDifferenceSum(OtherValue, Response, OtherSum), OtherSum < Sum).

% Logic for matching cheese type based on the user inputs
get_cheese_match(R1, R2, R3, R4, R5, R6, R7) :-
    new(ResponseDialog, dialog('Your Cheese Match')),
    send(ResponseDialog, gap, size(0, 20)),
    findCheeseType(Type, [R1, R2, R3, R4, R5, R6, R7]),
    write(Type),
    writeln(' type matched.'),
    display_cheese_personality(ResponseDialog, Type).

% Display the cheese type image and explanation for the given type
display_cheese_personality(ResponseDialog, Type) :-
    cheese_personality(Type, Explanation, ImagePath),
    format(atom(MatchedHeaderText), 'You matched with ~w cheese!', [Type]),
    new(MatchHeader, text(MatchedHeaderText)),
    send(MatchHeader, font, font(helvetica, bold, 20)),
    send(ResponseDialog, append, MatchHeader),
    
    % new(Image, bitmap(ImagePath)),
    % send(ResponseDialog, append, Image),

    send(ResponseDialog, append, new(ExplanationLabel, text(Explanation))),
    send(ExplanationLabel, font, font(helvetica, roman, 15)),
    
    send(ResponseDialog, append, new(Line2, line(0, 0, 800, 0))),
    send(Line2, y, 200),
    send(Line2, x, 50),
    
    send(ResponseDialog, append, button('OK', message(ResponseDialog, destroy))),
    send(ResponseDialog, default_button, 'OK'),
    send(ResponseDialog, open_centered).


