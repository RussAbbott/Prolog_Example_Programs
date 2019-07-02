neighbours(austria        , [czech_republic, germany, hungary, italy, slovenia, slovakia]).
neighbours(belgium        , [france, netherlands, luxemburg, germany, united_kingdom]).
neighbours(bulgaria       , [romania, greece]).
neighbours(croatia        , [slovenia, hungary]).
neighbours(cyprus         , [greece]).
neighbours(czech_republic , [germany, poland, slovakia, austria]).
neighbours(denmark        , [germany, sweden]).
neighbours(estonia        , [finland, latvia, lithuania]).
neighbours(finland        , [estonia, sweden]).
neighbours(france         , [spain, belgium, luxemburg, germany, italy, united_kingdom]).
neighbours(germany        , [netherlands, belgium, luxemburg, denmark, france, austria, poland]).
neighbours(greece         , [bulgaria, cyprus]).
neighbours(hungary        , [austria, slovakia, romania, croatia, slovenia]).
neighbours(ireland        , [united_kingdom]).
neighbours(italy          , [france, austria, slovenia]).
neighbours(latvia         , [estonia, lithuania]).
neighbours(luxemburg      , [belgium, france, germany]).
neighbours(malta          , []).
neighbours(netherlands    , [belgium, germany , united_kingdom]).
neighbours(poland         , [germany, czech_republic, slovakia, lithuania]).
neighbours(portugal       , [spain]).
neighbours(romania        , [hungary, bulgaria]).
neighbours(slovakia       , [czech_republic, poland, hungary, austria]).
neighbours(slovenia       , [austria, italy, hungary, croatia]).
neighbours(spain          , [france, portugal]).
neighbours(sweden         , [finland, denmark]).
neighbours(switzerland    , [france, germany, austria, italy]).
neighbours(united_kingdom , [ireland, netherlands, belgium, france]).

all_countries(Countries, Cs) :-
    neighbours(C, _),
    \+ member(C/_, Countries),
    all_countries([C/_|Countries], Cs).
all_countries(Cs, Cs)!.

countries_with_colours(Countries_Colors) :-
%  setof(Country/_, X^neighbours(Country,X), Countries_Colors),
  all_countries([], CCs),
  sort(CCs, Countries_Colors),
  colour_the_countries(Countries_Colors).

colour_the_countries([]).
colour_the_countries([Country/Colour | Rest]):-
  colour_the_countries(Rest),
  member(Colour, [green, yellow, red, purple]),
  \+ (member(CountryA/Colour, Rest), neighbour(Country, CountryA)).

neighbour(Country, CountryA):-
  neighbours(Country, Neighbours),
  member(CountryA, Neighbours).