curStage = 0;
lastNumTextboxes = 1;
curQuestion = 0;
curTime = 0;
pause = 0;
drawBackground = false;
drawFlash = false;
drawPortrait = false;
portraitYOffs = 67;
portraitXOffs = 0;
staticSubimg = 0;
alarm[0] = 3;


questions[0, 0] = "Do you like being the center of attention?";
questions[0, 1] = "Yes, definitely!#No, I like to stay on the sidelines.#...can I have the best of both worlds?";
questions[0, 2] = [[1, 0, 1], [0, 2, 1], [2, 1, 0]];

questions[1, 0] = "What kind of job would satisfy you most?";
questions[1, 1] = "One that makes the world a better place!#One that requires the least effort...#One that gives me the most money, duh!#Any one will do.";
questions[1, 2] = [[1, 0, 2],[1, 1, 0],[0, 0, 1],[0, 1, 1]];

questions[2, 0] = "Do you think you're more intelligent than average?\nBe honest.";
questions[2, 1] = "Yes.#No.#I'm just average.";
questions[2, 2] = [[2, 2, 0], [0, 1, 2], [1, 2, 1]];

questions[3, 0] = "You got lost in a forest, and it's getting dark.\nWhat do you do?";
questions[3, 1] = "Panic!#Call for help.#Retrace my steps.#Keep going randomly.";
questions[3, 2] = [[0, 0, 2], [0, 1, 1], [1, 2, 0], [1, 0, 1]];

questions[4, 0] = "Do you find yourself asking a lot of questions when meeting\nnew people?";
questions[4, 1] = "Yes.#No.";
questions[4, 2] = [[0, 0, 1], [1, 1, 0]];

questions[5, 0] = "You go out on a dinner date.\nWho pays for the order?";
questions[5, 1] = "I pay.#They pay.#We pay for what we each ordered.#Neither of us. Dine and dash!";
questions[5, 2] = [[1,0,0],[0,2,0],[2,1,1],[0,0,2]];

questions[6, 0] = "You're in a restaurant. Someone just left a burger on their table.\nThey're not coming back for quite some time now...";
questions[6, 1] = "Take it and eat it.#Leave it be.#...is anyone watching?#I'm vegan.";
questions[6, 2] = [[0,1,1],[1,0,0],[1,1,0],[0,0,2]];

questions[7, 0] = "Out of the following, what do you find the most valuable?";
questions[7, 1] = "Knowledge and intelligence.#Career and success.#Relationships.#Just being yourself.";
questions[7, 2] = [[1,2,0], [0,1,1], [2,0,0], [2,0,1]];

questions[8, 0] = "Your best friend hasn't talked to you in a long while...";
questions[8, 1] = "They're probably busy...#Ask them if they're all right.#What?! Are they mad at me?";
questions[8, 2] = [[0,0,2], [0,2,0], [2,0,0]];

questions[9, 0] = "You win the jackpot prize in a casino!\nGoing to brag about it?";
questions[9, 1] = "Everyone's gonna hear that story!#I'll tell my closest friends.#Of course not.";
questions[9, 2] = [[0,0,2], [1,1,0], [2,1,0]];

questions[10, 0] = "Do you like pranks?";
questions[10, 1] = "Of course!#I don't like joking around.";
questions[10, 2] = [[0,0,1], [1,1,0]];

questions[11, 0] = "Do you always state your true opinion, even if you know you're\ngoing to be heavily criticized for it?";
questions[11, 1] = "Yes.#No.";
questions[11, 2] = [[1,1,0],[0,1,1]];

questions[12, 0] = "It's a zombie invasion. You have a sword.\nAn army of undead is blocking your path.";
questions[12, 1] = "Bravely fight alone.#Look around for people to help you.#Run away and hide.";
questions[12, 2] = [[2,0,0],[0,2,0],[0,0,2]];

questions[13, 0] = "You threw a party, but that person you didn't want to invite...\nThey found out. And they're heartbroken!";
questions[13, 1] = "Just ignore them.#Apologize and be sincere.#Apologize, but make an excuse.";
questions[13, 2] = [[0,1,0],[1,1,0],[0,0,1]];

questions[14, 0] = "You're playing a team video game.\nWhat kind of role would suit you best?";
questions[14, 1] = "One that does tons of damage!#A support class, like a healer.#A beefy frontline tank.#A balanced mix of everything.";
questions[14, 2] = [[2,0,0],[0,0,2],[0,2,0],[1,1,0]];

questions[15, 0] = "You went to the restroom... but on your way there, you find\na secret passage!";
questions[15, 1] = "Go through it immediately!#Get prepared, then go through it.#Stay away from it.";
questions[15, 2] = [[0,0,2],[0,2,0],[1,0,1]];

questions[16, 0] = "You made a really silly mistake during a speech.\nSomeone from the audience laughs.";
questions[16, 1] = "Get embarassed.#Ask what's so funny!#Don't care. Keep talking.";
questions[16, 2] = [[1,0,1],[0,0,2],[2,1,0]];

questions[17, 0] = "When playing charades, which part would you find the most\nenjoyable?";
questions[17, 1] = "Guessing.#Acting out.#Both are fine!#Both suck!";
questions[17, 2] = [[1,0,2],[0,1,1],[0,2,0],[2,0,0]];

questions[18, 0] = "You're moving to a new place. Where do you choose to live?";
questions[18, 1] = "In a big city.#In a farm.#In a campervan.";
questions[18, 2] = [[2,0,0],[0,2,0],[0,0,2]];

questions[19, 0] = "You obtain a treasure chest at the end of a long, arduous\nadventure. What do you expect to find inside?";
questions[19, 1] = "A fancy trophy!#A lot of money.#Rare and powerful item.#Nothing. I want to be surprised!";
questions[19, 2] = [[0,1,1],[1,1,0],[0,2,0],[0,0,2]];

questions[20, 0] = "What is your sleep schedule like?";
questions[20, 1] = "Early to bed, early to rise!#I stay up late most of the time.#What is a sleep schedule?";
questions[20, 2] = [[0,2,0],[2,0,0],[0,0,2]];

questions[21, 0] = "You suddenly become the leader of the entire world.\nHow do you choose to run the planet?";
questions[21, 1] = "Be a kind and thoughtful ruler.#Become a tyrant.#Avoid standing out completely.#\"Free cookies every Friday!\"";
questions[21, 2] = [[1,0,1],[2,1,0],[0,2,1],[1,0,2]];

questions[22, 0] = "Have you ever tried to build a pillow fort?";
questions[22, 1] = "Yes, as a child.#Yes, as an adult!#Never.";
questions[22, 2] = [[2,0,1],[1,0,2],[0,2,0]];

questions[23, 0] = "Wow! You discovered a real life arbitrary code execution exploit!\nFull control over reality... how do you aim to use it?";
questions[23, 1] = "Get rich!#Teleport around the world.#Read other people's thoughts.#Decide to never use it.";
questions[23, 2] = [[0,2,0],[0,0,2],[2,1,0],[0,1,1]];

questions[24, 0] = "Do you ever think taking revenge is justified?";
questions[24, 1] = "Yes.#No.";
questions[24, 2] = [[2,1,0],[0,1,2]];

questions[25, 0] = "You see a bug crawling on the floor of your room...";
questions[25, 1] = "SMASH IT!#Let it be. It's cute!#Grab it and take it outside.#Trap it in a box and make it your pet.";
questions[25, 2] = [[1,1,0],[2,0,1],[1,0,2],[0,0,2]];

var qids = [];
for (var i=0; i<array_length(questions); i++) array_push(qids, i);
shuffledQids = array_shuffle(qids);

results = [0,0,0];
finalResult = 0;

sw = sprite_get_width(TextboxBorders);
sh = sprite_get_height(TextboxBorders);

exitState = 0;
crashed = false;