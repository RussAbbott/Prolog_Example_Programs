
zebra_problem(Houses):-
    Houses = [house(_,_,_,_,_),house(_,_,_,_,_),house(_,_,_,_,_),
              house(_,_,_,_,_),house(_,_,_,_,_)],
    % 1. The English live in the red house.
    member(house(english,_,_,_,red), Houses),
    % 2. The Spanish have a dog.
    member(house(spanish,_,dog,_,_), Houses),
    % 3. They drink coffee in the green house.
    member(house(_,_,_,coffee,green), Houses),
    % 4. The Ukrainians drink tea.
    member(house(ukranians,_,_,tea,_), Houses),
    % 5. The green house is immediately to the right of the white house.
    nextto(house(_,_,_,_,white), house(_,_,_,_,green), Houses),
    % 6. The Old Gold smokers have snails.
    member(house(_,old_gold,snails,_,_), Houses),
    % 7. They smoke Kool in the yellow house.
    member(house(_,kool,_,_,yellow), Houses),
    % 8. They drink milk in the middle house.
    Houses = [_, _, house(_,_,_,milk,_), _, _],
    % 9. The Norwegians live in the first house on the left.
    Houses = [house(norwegians,_,_,_,_) | _],
    % 10. The Chesterfield smokers live next to the fox.
    next_to(house(_,chesterfield,_,_,_), house(_,_,fox,_,_), Houses),
    % 11. They smoke Kool in the house next to the horse.
    next_to(house(_,kool,_,_,_), house(_,_,horse,_,_), Houses),
    % 12. The Lucky smokers drink juice.
    member(house(_,lucky,_,juice,_), Houses),
    % 13. The Japanese smoke Parliament.
    member(house(japanese,parliament,_,_,_), Houses),
    % 14. The Norwegians live next to the blue house.
    next_to(house(norwegians,_,_,_,_), house(_,_,_,_,blue), Houses),
    member(house(_,_,_,water,_), Houses),
    member(house(_,_,zebra,_,_), Houses).



next_to(A, B, List) :- nextto(A, B, List).
next_to(A, B, List) :- nextto(B, A, List).