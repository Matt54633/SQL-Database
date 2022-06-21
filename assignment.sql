--CREATE SCRIPTS

--Create Dish Table
CREATE TABLE Dish_TBL (
	Dish_ID VARCHAR(2),
	Dish_Name VARCHAR(25) NOT NULL,
	Dish_Description VARCHAR(70) NOT NULL,
	Dish_Price NUMERIC(4, 2) CONSTRAINT Price_Check CHECK(Dish_Price < 30),
	PRIMARY KEY (Dish_ID)
);

--Create Food Item Tabel
CREATE TABLE Food_Item_TBL (
	Food_Item_ID VARCHAR(2),
	Food_Item_Name VARCHAR(20) NOT NULL,
	Food_Item_Price NUMERIC(4, 2) NOT NULL,
	Dietary_Label VARCHAR(30) NOT NULL,
	Date_Added DATE NOT NULL,
	PRIMARY KEY (Food_Item_ID)
);

--Create Ingredient Table
CREATE TABLE Ingredient_TBL (
	Ingredient_ID VARCHAR(2),
	Ingredient_Name VARCHAR(20) NOT NULL,
	PRIMARY KEY (Ingredient_ID)
);

--Create Allergen Table
CREATE TABLE Allergen_TBL (
	Allergen_ID VARCHAR(3),
	Allergen_Name VARCHAR(20) NOT NULL,
	Allergen_Description VARCHAR(355) NOT NULL,
	PRIMARY KEY (Allergen_ID)
);

--Create Dish and Food Item link table
CREATE TABLE Dish_Food_Item_Link_TBL (
	Dish_ID VARCHAR(2),
	Food_Item_ID VARCHAR(2),
	FOREIGN KEY (Dish_ID) REFERENCES Dish_TBL,
	FOREIGN KEY (Food_Item_ID) REFERENCES Food_Item_TBL,
	PRIMARY KEY (Dish_ID, Food_Item_ID)
);

--Create Food Item and Ingredient link table
CREATE TABLE Food_Item_Ingredient_Link_TBL (
	Food_Item_ID VARCHAR(2),
	Ingredient_ID VARCHAR(2),
	FOREIGN KEY (Food_Item_ID) REFERENCES Food_Item_TBL,
	FOREIGN KEY (Ingredient_ID) REFERENCES Ingredient_TBL,
	PRIMARY KEY (Food_Item_ID, Ingredient_ID)
);

--Create Allergen and Ingredient link table
CREATE TABLE Allergen_Ingredient_Link_TBL (
	Ingredient_ID VARCHAR(2),
	Allergen_ID VARCHAR(3),
	FOREIGN KEY (Ingredient_ID) REFERENCES Ingredient_TBL,
	FOREIGN KEY (Allergen_ID) REFERENCES Allergen_TBL,
    PRIMARY KEY (Allergen_ID, Ingredient_ID)
);

COMMIT;

--INSERT SCRIPTS

--Insert 5 dishes into the dish table
INSERT INTO Dish_TBL VALUES ('D1', 'Lasagne', 'A nice and creamy lasagne with chips', '6.00');
INSERT INTO Dish_TBL VALUES ('D2', 'Chicken Korma', 'A wonderfully spiceless curry with rice', '5.35');
INSERT INTO Dish_TBL VALUES ('D3', 'Tuna and Rice', 'A tasty mix of tuna, rice and peas', '6.18');
INSERT INTO Dish_TBL VALUES ('D4', 'Chicken and Mash', 'A household favourite, chicken and mash!', '6.15');
INSERT INTO Dish_TBL VALUES ('D5', 'Tuna Pasta', 'Can''t believe the taste on this bad boy', '5.43');

--Insert 8 food items into the food items table
INSERT INTO Food_Item_TBL VALUES ('F1', 'Pasta', '1.00', 'Vegetarian', (DATE '2020-03-17'));
INSERT INTO Food_Item_TBL VALUES ('F2', 'Lasagne', '3.00', 'Anything', (DATE '2020-08-12'));
INSERT INTO Food_Item_TBL VALUES ('F3', 'Mashed Potato', '2.50', 'Anything', (DATE '2018-03-07'));
INSERT INTO Food_Item_TBL VALUES ('F4', 'Fried Chicken', '3.65', 'Kosher', (DATE '2017-01-17'));
INSERT INTO Food_Item_TBL VALUES ('F5', 'Chips', '2.00', 'Vegan', (DATE '2020-01-31'));
INSERT INTO Food_Item_TBL VALUES ('F6', 'Egg Fried Rice', '1.70', 'Anything', (DATE '2015-07-05'));
INSERT INTO Food_Item_TBL VALUES ('F7', 'Tuna', '3.43', 'Pescetarian', (DATE '2020-10-30'));
INSERT INTO Food_Item_TBL VALUES ('F8', 'Mushy Peas', '1.05', 'Vegetarian', (DATE '2019-12-25'));

--Cardinality - A dish can have many food items such as D1 and each food item can be in many dishes such as F6
INSERT INTO Dish_Food_Item_Link_TBL VALUES ('D1','F1');
INSERT INTO Dish_Food_Item_Link_TBL VALUES ('D1','F2');
INSERT INTO Dish_Food_Item_Link_TBL VALUES ('D1','F5');
INSERT INTO Dish_Food_Item_Link_TBL VALUES ('D2','F4');
INSERT INTO Dish_Food_Item_Link_TBL VALUES ('D2','F6');
INSERT INTO Dish_Food_Item_Link_TBL VALUES ('D3','F7');
INSERT INTO Dish_Food_Item_Link_TBL VALUES ('D3','F6');
INSERT INTO Dish_Food_Item_Link_TBL VALUES ('D3','F8');
INSERT INTO Dish_Food_Item_Link_TBL VALUES ('D4','F3');
INSERT INTO Dish_Food_Item_Link_TBL VALUES ('D4','F4');
INSERT INTO Dish_Food_Item_Link_TBL VALUES ('D5','F1');
INSERT INTO Dish_Food_Item_Link_TBL VALUES ('D5','F7');

--Inset 8 items into the ingredient table
INSERT INTO Ingredient_TBL VALUES ('I1', 'Butter');
INSERT INTO Ingredient_TBL VALUES ('I2', 'Curry Sauce');
INSERT INTO Ingredient_TBL VALUES ('I3', 'Eggs');
INSERT INTO Ingredient_TBL VALUES ('I4', 'Mince Meat');
INSERT INTO Ingredient_TBL VALUES ('I5', 'Oil');
INSERT INTO Ingredient_TBL VALUES ('I6', 'Milk');
INSERT INTO Ingredient_TBL VALUES ('I7', 'Wheat');
INSERT INTO Ingredient_TBL VALUES ('I8', 'Chicken Breast');

--Cardinality - Each food item can have many ingredients such as F1 and likewise each ingredient can be in many food items such as I1.
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F1','I7');
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F1','I3');
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F2','I4');
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F2','I5');
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F2','I1');
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F3','I1');
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F3','I6');
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F4','I8');
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F4','I5');
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F5','I5');
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F6','I3');
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F6','I1');
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F7','I5');
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F8','I1');
INSERT INTO Food_Item_Ingredient_Link_TBL VALUES ('F8','I4');

--Insert 14 allergens into the allergen table
INSERT INTO Allergen_TBL VALUES ('A01', 'Celery', 'This includes celery stalks, ');
INSERT INTO Allergen_TBL VALUES ('A02', 'Gluten','Wheat (such as spelt and Khorasan wheat/Kamut)');
INSERT INTO Allergen_TBL VALUES ('A03', 'Crustaceans','Crabs, lobster, prawns .');
INSERT INTO Allergen_TBL VALUES ('A04', 'Eggs','Eggs are often found in cakes, some meat products, mayonnaise, mousses, pasta, quiche, sauces and pastries or foods brushed or glazed with egg.');
INSERT INTO Allergen_TBL VALUES ('A05', 'Fish', 'You will find this in some fish sauces, pizzas, relishes, salad dressings, stock cubes and Worcestershire sauce.');
INSERT INTO Allergen_TBL VALUES ('A06', 'Lupin', 'Yes, lupin is a flower, but it’s also found in flour! Lupin flour and seeds
can be used in some types of bread, pastries and even in pasta.');
INSERT INTO Allergen_TBL VALUES ('A07', 'Milk', 'Milk is a common ingredient in butter, cheese, cream, milk powders and yoghurt. It can
also be found in foods brushed or glazed with milk, and in powdered soups and sauces.');
INSERT INTO Allergen_TBL VALUES ('A08', 'Molluscs', 'These include mussels, land snails, squid and whelks, but can also be commonly found in oyster sauce or as an ingredient in fish stews');
INSERT INTO Allergen_TBL VALUES ('A09', 'Mustard', 'Liquid mustard, mustard powder and mustard seeds fall into this category.
This ingredient can also be found in breads, curries, marinades, meat products, salad dressings, sauces and soups.');
INSERT INTO Allergen_TBL VALUES ('A10', 'Nuts', 'Not to be mistaken with peanuts.You can find nuts in breads, biscuits, crackers, desserts, nut powders.');
INSERT INTO Allergen_TBL VALUES ('A11', 'Peanuts', 'Peanuts are actually a legume and grow underground, which is why it’s
sometimes called a groundnut. Peanuts are often used as an ingredient in biscuits.');
INSERT INTO Allergen_TBL VALUES ('A12', 'Sesame Seeds', 'These seeds can often be found in bread (sprinkled on hamburger
buns for example), breadsticks, houmous, sesame oil and tahini. They are sometimes toasted and used in salads.');
INSERT INTO Allergen_TBL VALUES ('A13', 'Soya', 'Often found in bean curd, edamame beans, miso paste, textured soya protein,
soya flour or tofu, soya is a staple ingredient in oriental food. It can also be found
in desserts, ice cream, meat products, sauces and vegetarian products.');
INSERT INTO Allergen_TBL VALUES ('A14', 'Sulphur Dioxide', 'This is an ingredient often used in dried fruit such as raisins, dried apricots
and prunes. You might also find it in meat products, soft drinks, vegetables as well as in wine and beer. ');


--Cardinality here is many to many but with optionality. Not every ingredient has an allergen. I5 and I8 don't have any allergens in them but A07 appears in many ingredients
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I1','A07');
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I1','A14');
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I2','A09');
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I2','A04');
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I2','A10');
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I3','A04');
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I3','A06');
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I4','A13');
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I4','A12');
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I4','A11');
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I6','A08');
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I7','A01');
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I7','A02');
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I7','A03');
INSERT INTO Allergen_Ingredient_Link_TBL VALUES ('I7','A05');

COMMIT;

--SELECT SCRIPTS
SET PAGESIZE 100
--Query 1
--List of all food items, including their details (e.g. unit price, name, dietary consideration, the date they were added to the menu etc.).
SELECT * FROM Food_Item_TBL;

--Query 2
--List of all dishes with their details (i.e. name of the dish, and description), and their food items with their details. Please exclude any artificial IDs for this query
SELECT Dish_Name, Dish_Description, Dish_Price, Food_Item_Name, Food_Item_Price, Dietary_Label, Date_Added 
FROM Dish_TBL, Food_Item_TBL,Dish_Food_Item_Link_TBL
WHERE Dish_TBL.Dish_ID = Dish_Food_Item_Link_TBL.Dish_ID AND Food_Item_TBL.Food_Item_ID = Dish_Food_Item_Link_TBL.Food_Item_ID
ORDER BY Dish_Name DESC;

--Query 3
--List of all ingredients, and any allergens (with description) that can be found in them ordered by the name of the ingredients.
SELECT Ingredient_Name, Allergen_Name, Allergen_Description 
FROM Ingredient_TBL, Allergen_TBL, Allergen_Ingredient_Link_TBL
WHERE Ingredient_TBL.Ingredient_ID = Allergen_Ingredient_Link_TBL.Ingredient_ID AND Allergen_TBL.Allergen_ID = Allergen_Ingredient_Link_TBL.Allergen_ID
ORDER BY Ingredient_Name ASC;

--Query 4
--List the food items and the number of ingredients in them (count only), ordered by number of ingredients.
SELECT Food_Item_Name, Count(Ingredient_ID) AS Number_Of_Ingredients
FROM Food_Item_TBL, Food_Item_Ingredient_Link_TBL
WHERE Food_Item_TBL.Food_Item_ID = Food_Item_Ingredient_Link_TBL.Food_Item_ID 
GROUP BY Food_Item_Name
ORDER BY Number_Of_Ingredients DESC;

--Query 5
--The ingredient with the most allergens.
SELECT * FROM (SELECT Ingredient_Name, COUNT(Allergen_ID) AS Number_Of_Allergens
FROM Ingredient_TBL, Allergen_Ingredient_Link_TBL
WHERE Ingredient_TBL.Ingredient_ID = Allergen_Ingredient_Link_TBL.Ingredient_ID
GROUP BY Ingredient_Name
ORDER BY COUNT(Allergen_ID) DESC) WHERE ROWNUM = 1;

--DROP SCRIPT
DROP TABLE Dish_Food_Item_Link_TBL;
DROP TABLE Food_Item_Ingredient_Link_TBL;
DROP TABLE Allergen_Ingredient_Link_TBL;
DROP TABLE Dish_TBL;
DROP TABLE Food_Item_TBL;
DROP TABLE Ingredient_TBL;
DROP TABLE Allergen_TBL;

COMMIT;

