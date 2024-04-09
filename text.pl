% values type for each cheese
cheese_values(brie, [4, 5, 6, 8, 2, 10, 1]).
cheese_values(cheddar, [1, 2, 2, 1, 6, 16, 1]).
cheese_values(goat, [2, 3, 5, 8, 5, 25, 2]).
cheese_values(gouda, [3, 2, 4, 4, 4, 3, 1]).
cheese_values(mozzarella, [1, 5, 3, 7, 3, 3, 2]).
cheese_values(pepperjack, [2, 2, 3, 8, 4, 18, 1]).
cheese_values(provolone, [3, 6, 6, 4, 4, 16, 1]).
cheese_values(swiss, [4, 6, 6, 5, 2, 12, 2]).
cheese_values(queso, [1, 5, 2, 7, 2, 24, 1]).
cheese_values(blue, [2, 4, 4, 1, 4, 22, 2]).
cheese_values(feta, [3, 3, 4, 3, 4, 14, 1]).
cheese_values(colby, [4, 1, 6, 8, 4, 9, 2]).

% questions
% each question is chosen from a list of variants, all having the same number of answers

% question 1 variants and randomization
question_1_variant('Pick a card game: \n Uno (1), Go Fish (2), Solitaire (3), or Poker (4)').
question_1_variant('Choose your favorite season: \n Spring (1), Summer (2), Autumn (3), Winter (4)').
question_1_variant('Whats your preferred pet? \n Cat (1), Dog (2), Bird (3), Fish (4)').
question_1_variant('Select a vacation destination: \n Beach (1), Mountains (2), City (3), Countryside (4)').
cheese_question_1(QuestionVariant) :-
    findall(Q, question_1_variant(Q), QuestionVariants),
    length(QuestionVariants, Length),
    random(0, Length, Index),
    nth0(Index, QuestionVariants, QuestionVariant).


% question 2 variants and randomization
question_2_variant('Pick a candy: \n Kit Kat (1), Reeses (2), Lollipop (3), Twix (4), Skittles (5), or Gummy Bears (6)').
question_2_variant('Choose a type of chocolate: \n Milk Chocolate (1), Dark Chocolate (2), White Chocolate (3), Chocolate with Nuts (4), Chocolate with Caramel (5), or Chocolate Truffle (6)').
question_2_variant('Select your favorite fruit: \n Apple (1), Banana (2), Cherry (3), Dragon Fruit (4), Elderberry (5), or Fig (6)').
question_2_variant('Favorite type of cake: \n Cheesecake (1), Chocolate Cake (2), Red Velvet (3), Sponge Cake (4), Fruit Cake (5), or Ice Cream Cake (6)').
cheese_question_2(QuestionVariant) :-
    findall(Q, question_2_variant(Q), QuestionVariants),
    length(QuestionVariants, Length),
    random(0, Length, Index),
    nth0(Index, QuestionVariants, QuestionVariant).

% question 3 variants and randomization
question_3_variant('How would your friends describe you? \n Kind (1), Loyal (2), Funny (3), Creative (4), Outgoing (5), or Annoying (6)').
question_3_variant('What is your preferred way to spend a weekend? \n Reading (1), Hiking (2), Watching Movies (3), Crafting (4), Socializing (5), or Sleeping (6)').
question_3_variant('Pick a music genre: \n Rock (1), Pop (2), Jazz (3), Classical (4), Hip-Hop (5), or Electronic (6)').
question_3_variant('Whats your favorite drink? \n Coffee (1), Tea (2), Soda (3), Water (4), Juice (5), or Smoothie (6)').
cheese_question_3(QuestionVariant) :-
    findall(Q, question_3_variant(Q), QuestionVariants),
    length(QuestionVariants, Length),
    random(0, Length, Index),
    nth0(Index, QuestionVariants, QuestionVariant).

% question 4 variants and randomization
question_4_variant('Pick the song of the summer: \n Señorita by Shawn Mendes and Camila Cabello (1), Truth Hurts by Lizzo (2), \n Old Town Road by Lil Nas X (3), bad guy by Billie Eilish (4), \n You Need To Calm Down by Taylor Swift (5), I Dont Care by Ed Sheeran and Justin Bieber (6), \n Talk by Khalid (7), Never Really Over by Katy Perry (8)').
question_4_variant('Choose a classic rock song: \n Stairway to Heaven by Led Zeppelin (1), Bohemian Rhapsody by Queen (2), \n Hotel California by The Eagles (3), Sweet Child o\' Mine by Guns N\' Roses (4), \n Imagine by John Lennon (5), Born to Run by Bruce Springsteen (6), \n Comfortably Numb by Pink Floyd (7), Smells Like Teen Spirit by Nirvana (8)').
question_4_variant('Select a hit from the 2000s: \n Yeah! by Usher (1), Hollaback Girl by Gwen Stefani (2), \n Mr. Brightside by The Killers (3), Viva La Vida by Coldplay (4), \n Umbrella by Rihanna (5), Rolling in the Deep by Adele (6), \n SexyBack by Justin Timberlake (7), Crazy by Gnarls Barkley (8)').
question_4_variant('Pick a movie soundtrack song: \n My Heart Will Go On from Titanic (1), Lose Yourself from 8 Mile (2), \n I Will Always Love You from The Bodyguard (3), Eye of the Tiger from Rocky III (4), \n Hakuna Matata from The Lion King (5), Skyfall by Adele from Skyfall (6), \n Dont You (Forget About Me) from The Breakfast Club (7), Ghostbusters from Ghostbusters (8)').
cheese_question_4(QuestionVariant) :-
    findall(Q, question_4_variant(Q), QuestionVariants),
    length(QuestionVariants, Length),
    random(0, Length, Index),
    nth0(Index, QuestionVariants, QuestionVariant).

% question 5 variants and randomization
question_5_variant('Pick a social media platform: \n Instagram (1), Snapchat (2), Twitter (3), Facebook (4), TikTok (5), or Pinterest (6)').
question_5_variant('Choose a type of blog to follow: \n Travel (1), Food (2), Fashion (3), Technology (4), Fitness (5), or DIY (6)').
question_5_variant('Select your go-to news source: \n BBC (1), CNN (2), Fox News (3), The New York Times (4), The Guardian (5), or Al Jazeera (6)').
question_5_variant('Favorite type of online content: \n Memes (1), Podcasts (2), Blogs (3), News Articles (4), Vlogs (5), or eBooks (6)').
cheese_question_5(QuestionVariant) :-
    findall(Q, question_5_variant(Q), QuestionVariants),
    length(QuestionVariants, Length),
    random(0, Length, Index),
    nth0(Index, QuestionVariants, QuestionVariant).

% question 6 variants and randomization
question_6_variant('Choose the first letter of your name: \n A (1), B (2), C (3), D (4), E (5), F (6), \n G (7), H (8), I (9), J (10), K (11), L (12), \n M (13), N (14), O (15), P (16), Q (17), R (18), \n S (19), T (20), U (21), V (22), W (23), X (24), Y (25), Z (26)').
question_6_variant('Select the first letter of your favorite city: \n A (1), B (2), C (3), D (4), E (5), F (6), \n G (7), H (8), I (9), J (10), K (11), L (12), \n M (13), N (14), O (15), P (16), Q (17), R (18), \n S (19), T (20), U (21), V (22), W (23), X (24), Y (25), Z (26)').
question_6_variant('Pick the first letter of your favorite food: \n A (1), B (2), C (3), D (4), E (5), F (6), \n G (7), H (8), I (9), J (10), K (11), L (12), \n M (13), N (14), O (15), P (16), Q (17), R (18), \n S (19), T (20), U (21), V (22), W (23), X (24), Y (25), Z (26)').
question_6_variant('Choose the first letter of your birth month: \n A (1), B (2), C (3), D (4), E (5), F (6), \n G (7), H (8), I (9), J (10), K (11), L (12), \n M (13), N (14), O (15), P (16), Q (17), R (18), \n S (19), T (20), U (21), V (22), W (23), X (24), Y (25), Z (26)').
cheese_question_6(QuestionVariant) :-
    findall(Q, question_6_variant(Q), QuestionVariants),
    length(QuestionVariants, Length),
    random(0, Length, Index),
    nth0(Index, QuestionVariants, QuestionVariant).

% question 7 variants and randomization
question_7_variant('Do you wear glasses? \n Yes (1) or No (2)').
question_7_variant('Are you a morning person? \n Yes (1) or No (2)').
question_7_variant('Have you traveled to another country? \n Yes (1) or No (2)').
question_7_variant('Do you have a pet? \n Yes (1) or No (2)').
cheese_question_7(QuestionVariant) :-
    findall(Q, question_7_variant(Q), QuestionVariants),
    length(QuestionVariants, Length),
    random(0, Length, Index),
    nth0(Index, QuestionVariants, QuestionVariant).

% cheese personality type
cheese_personality(brie, 'You are a Brie! You are soft and creamy, and you have a mild and buttery flavor. \n You are sophisticated and elegant, and you are always a hit at parties.','assets/images/xpm/brie.xpm').
cheese_personality(cheddar, 'You are a Cheddar! You are sharp and tangy, and you have a rich and nutty flavor. \n You are a classic and reliable choice, and you are always a crowd-pleaser.','assets/images/xpm/cheddar.xpm').
cheese_personality(goat, 'You are a Goat Cheese! You are creamy and tangy, and you have a distinct and earthy flavor. \n You are unique and adventurous, and you are always willing to try new things.','assets/images/xpm/goat.xpm').
cheese_personality(gouda, 'You are a Gouda! You are smooth and nutty, and you have a sweet and caramelized flavor. \n You are warm and comforting, and you are always a comforting presence.','assets/images/xpm/gouda.xpm').
cheese_personality(mozzarella, 'You are a Mozzarella! You are soft and milky, and you have a fresh and delicate flavor. \n You are light and refreshing, and you are always a delightful addition to any dish.','assets/images/xpm/mozzarella.xpm').
cheese_personality(pepperjack, 'You are a Pepper Jack! You are spicy and zesty, and you have a bold and fiery flavor. \n You are lively and energetic, and you are always ready to spice things up.','assets/images/xpm/pepperjack.xpm').
cheese_personality(provolone, 'You are a Provolone! You are smooth and smoky, and you have a sharp and tangy flavor. \n You are versatile and adaptable, and you are always a reliable choice.','assets/images/xpm/provolone.xpm').
cheese_personality(swiss, 'You are a Swiss! You are nutty and sweet, and you have a mild and buttery flavor. \n You are classic and timeless, and you are always a comforting presence.','assets/images/xpm/swiss.xpm').
cheese_personality(queso, 'You are a Queso! You are creamy and spicy, and you have a bold and zesty flavor. \n You are lively and energetic, and you are always ready to spice things up.','assets/images/xpm/queso.xpm').
cheese_personality(blue, 'You are a Blue Cheese! You are bold and tangy, and you have a sharp and pungent flavor. \n You are strong and assertive, and you are always a memorable presence.','assets/images/xpm/blue.xpm').
cheese_personality(feta, 'You are a Feta! You are crumbly and tangy, and you have a salty and briny flavor. \n You are unique and adventurous, and you are always willing to try new things.','assets/images/xpm/feta.xpm').
cheese_personality(colby, 'You are a Colby! You are mild and mellow, and you have a smooth and creamy flavor. \n You are easygoing and laid-back, and you are always a comforting presence.','assets/images/xpm/colby.xpm').