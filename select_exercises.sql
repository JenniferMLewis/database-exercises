USE mysql;
Use albums_db;
SELECT * FROM albums;

SELECT DISTINCT artist FROM albums;
/* 31 Rows in Albums, 23 Unique artists, id is the primary key, 1967 is the oldest release date and 2011 is the newest release date. */

SELECT name FROM albums WHERE artist = 'Pink Floyd';
/* Album's by Pink Floyd are 'The Dark Side of the Moon' and 'The Wall',*/

SELECT release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
 -- Sgt. Pepper was released 1967, 

SELECT genre FROM albums WHERE name = 'Nevermind';
-- Nevermind's genre is "Grunge, Alternative Rock,

SELECT name FROM albums WHERE release_date BETWEEN 1990 AND 1999;
/* 'The Bodyguard'
'Jagged Little Pill'
'Come On Over'
'Falling into You'
'Let\'s Talk About Love'
'Dangerous'
'The Immaculate Collection'
'Titanic: Music from the Motion Picture'
'Metallica'
'Nevermind'
'Supernatural'
were released in the 1990s, */

SELECT name FROM albums WHERE sales < 20000000;
/*'Thriller'
'Back in Black'
'The Dark Side of the Moon'
'Bat Out of Hell'
'The Bodyguard'
'Their Greatest Hits (1971–1975)'
'Saturday Night Fever'
'Rumours'
'Grease: The Original Soundtrack from the Motion Picture'
'Led Zeppelin IV'
'Bad'
'Jagged Little Pill'
'Come On Over'
'Falling into You'
'Sgt. Pepper\'s Lonely Hearts Club Band'
'Hotel California'
'Dirty Dancing'
'21'
'Let\'s Talk About Love'
'1'
'Dangerous'
'The Immaculate Collection'
'Abbey Road'
'Born in the U.S.A.'
'Brothers in Arms'
'Titanic: Music from the Motion Picture'
'Metallica'
'Nevermind'
'The Wall'
'Supernatural'
'Appetite for Destruction'
 had less than 20,000,000 certified sales, */
 
SELECT name FROM albums WHERE genre = "Rock";
/*'Sgt. Pepper\'s Lonely Hearts Club Band'
'1'
'Abbey Road'
'Born in the U.S.A.'
'Supernatural'
 Are all the 'Rock' Albums, They don't include Hard Rock or Progressive Rock because we're telling it we want only the word "Rock" and code is VERY literal. */
