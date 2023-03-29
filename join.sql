--1. Selezionare i dati di tutti giocatori che hanno scritto almeno una recensione, mostrandoli una sola volta (996)
SELECT DISTINCT name, lastname, nickname, city
FROM players
INNER JOIN reviews 
ON reviews.player_id = players.id;

--2. Sezionare tutti i videogame dei tornei tenuti nel 2016, mostrandoli una sola volta (226)
SELECT DISTINCT videogame_id
FROM tournament_videogame
INNER JOIN tournaments
ON tournament_videogame.tournament_id = tournaments.id
WHERE tournaments.year = 2016;

--3. Mostrare le categorie di ogni videogioco (1718)
SELECT videogame_id, category_id
FROM category_videogame
INNER JOIN videogames
ON category_videogame.videogame_id = videogames.id


--4. Selezionare i dati di tutte le software house che hanno rilasciato almeno un gioco dopo il 2020, mostrandoli una sola volta (6)
SELECT DISTINCT software_houses.name
FROM software_houses
INNER JOIN videogames
ON software_houses.id = videogames.software_house_id
WHERE release_date LIKE '202%'