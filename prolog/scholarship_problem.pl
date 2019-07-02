/** <> The Scholarship problem 
 
There are 4 students: Amy, Carrie, Erma, and Tracy. 
Each has one scholarship and one major subject.  
The available scholarships are: $25,000, $30,000, $35,000 and $40,000. 
The available majors are: Astronomy, Comp Sci, English, and Philosophy. 

Using the following clues, determine which student has which scholarship and studies which subject.

1. The student who studies Astronomy gets a smaller scholarship than Amy.
2. Amy studies either English or Philosophy.
3. The student who studies Comp Sci has a $5,000 bigger scholarship than Carrie.
4. Erma has a $10,000 bigger scholarship than Carrie.
5. Tracy has a bigger scholarship than the student who studies English.

The (unique) solution.

Students: 
	Carrie(English, 25)
	Tracy(Comp Sci, 30)
	Erma(Astronomy, 35)
	Amy(Philosophy, 40)
    
*/


is_a_subsequence_of([], _).
is_a_subsequence_of([Y|Ys], [Y|Xs]) :-
    is_a_subsequence_of(Ys, Xs).
is_a_subsequence_of([Y|Ys], [_|Xs]) :-
    is_a_subsequence_of([Y|Ys], Xs).
    

scholarship_problem(Students) :-
    Students = [student(_, _, 25), student(_, _, 30), student(_, _, 35), student(_, _, 40)],
    clue1(Students),
    clue2(Students),
    clue3(Students),
    clue4(Students),
    clue5(Students),
    all_majors_appear(Students),
    writeln('Students '=Students).

% 1. The student who studies Astronomy gets a smaller scholarship than Amy.
clue1(Students) :-
	is_a_subsequence_of([student(_, 'Astronomy', _), student('Amy', _, _)], Students).    

% 2. Amy studies either Philosophy or English.
clue2(Students) :- 
	member(student('Amy', Major, _), Students),
    member(Major, ['Philosophy', 'English']).    

% 3. The student who studies Comp Sci has a $5,000 larger scholarship than Carrie.
clue3(Students) :- 
    % nextto is define in the list library. It requires the members to be in the order listed.
	nextto(student('Carrie', _, _), student(_, 'Comp Sci', _), Students).    

% 4. Erma has a $10,000 larger scholarship than Carrie.
clue4(Students) :- 
	nextto(student('Carrie', _, _), S, Students),
    nextto(S, student('Erma', _, _), Students).    

% 5. Tracy has a larger scholarship than the student who studies English.
clue5(Students) :- 
	is_a_subsequence_of([student(_, 'English', _), student('Tracy', _, _)], Students).

% Each major appears in the list. 
all_majors_appear(Students) :-
    member(student(_,'Astronomy', _), Students),    
    member(student(_,'Comp Sci', _), Students),
    member(student(_,'English', _), Students),
    member(student(_,'Philosophy', _), Students).

/**  <examples>
?-  scholarship_problem(Students).
*/            
