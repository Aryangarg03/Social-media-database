CREATE TABLE UserTable (
user_id NUMBER,
email VARCHAR(255) NOT NULL,
pwd VARCHAR(255),
fname VARCHAR(255) NOT NULL,
mname VARCHAR(255) NOT NULL,
lname VARCHAR(255) NOT NULL,
DOB VARCHAR(255));
/*PRIMARY KEY (user_id),
UNIQUE KEY email (email) */

ALTER TABLE UserTable
ADD CONSTRAINT UserTable_user_id_PK PRIMARY KEY(user_id)

CREATE TABLE Posts(
pid NUMBER NOT NULL,
user_id NUMBER,
caption  VARCHAR(255),
P_date VARCHAR(255) NOT NULL,
PRIMARY KEY (pid),
FOREIGN KEY (user_id) REFERENCES UserTable (user_id)
);


CREATE TABLE Friends(
user_id NUMBER NOT NULL, 
following_id NUMBER NOT NULL, 
f_date VARCHAR(255) NOT NULL,
PRIMARY KEY (user_id, following_id),
FOREIGN KEY (user_id) REFERENCES UserTable (user_id),
FOREIGN KEY (following_id) REFERENCES UserTable (user_id)
);




CREATE TABLE Comments(
comment_id NUMBER NOT NULL,
pid NUMBER NOT NULL,
user_id NUMBER NOT NULL,
C_content VARCHAR (255) NOT NULL,
C_date VARCHAR (255) NOT NULL,
PRIMARY KEY (comment_id),
FOREIGN KEY (pid) REFERENCES Posts (pid),
FOREIGN KEY (user_id) REFERENCES UserTable (user_id)
);

CREATE TABLE Messages(
message_id NUMBER NOT NULL,
user_id_from NUMBER NOT NULL,
user_id_to NUMBER NOT NULL,
M_content VARCHAR(255) NOT NULL,
M_date VARCHAR(255) NOT NULL,
PRIMARY KEY (message_id),
FOREIGN KEY (user_id_from) REFERENCES UserTable(user_id),
FOREIGN KEY (user_id_to) REFERENCES UserTable(user_id)
);

CREATE TABLE Likes(
user_id NUMBER NOT NULL,
pid NUMBER NOT NULL,
L_date DATE NOT NULL,
PRIMARY KEY (user_id, pid),
FOREIGN KEY (pid) REFERENCES Posts(pid),
FOREIGN KEY (user_id) REFERENCES UserTable(user_id)
);

LTER TABLE UserTable
ADD About_us varchar(255);

ALTER TABLE UserTable
DROP COLUMN About_us;


ALTER TABLE UserTable
MODIFY DOB DATE;

DESC UserTable;

Create Table UserDefault(
usid NUMBER
);

Drop table UserDefault;

Insert into UserTable
VALUES (1,'mehul.sonavan@gmail.com','12345','Mehul','vijay','sonavane','29-May-2001');
Insert into UserTable
VALUES (2,'pranaysuryarao.com','123','Pranay','vijay','sonavane','9-Jan-2001');
Insert into UserTable
VALUES (3,'aryan@gmail.com','1234','Aryan','vijay','sonavane','2-Feb-2001');
Insert into UserTable
VALUES (4,'rahul@gmail.com','345','Rahul','vijay','sonavane','2-March-2001');

Select * from UserTable;
TRUNCATE TABLE Usertable;
Select * from UserTable;

Insert into UserTable
VALUES (1,'mehul.sonavan@gmail.com','12345','Mehul','vijay','sonavane','29-May-2001');
Insert into UserTable
VALUES (2,'pranaysuryarao.com','123','Pranay','vijay','sonavane','9-Jan-2001');
Insert into UserTable
VALUES (3,'aryan@gmail.com','1234','Aryan','vijay','sonavane','2-Feb-2001');
Insert into UserTable
VALUES (5,'mehul@gmail.com','345','Mehul','vijay','sonavane','2-March-2001');


Select * from Usertable
where User_id = 1;

SELECT Count(User_id), FName
FROM UserTable
GROUP BY FName;

	SELECT * FROM UserTable
ORDER BY FName;

UPDATE UserTable SET User_id = 6
where FName='Rahul';

Delete from UserTable 
where email='mehul@gmail.com';

Select * from UserTable;

ALTER TABLE UserTable
ADD CHECK (User_id>=0);

ALTER TABLE UserTable
ADD CONSTRAINT Uniqemail UNIQUE (email);
