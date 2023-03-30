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

--5. Selezionare i premi ricevuti da ogni software house per i videogiochi che ha prodotto (55)
SELECT awards.name, software_houses.name, award_videogame.year
FROM awards
INNER JOIN award_videogame
ON awards.id = award_videogame.award_id
INNER JOIN videogames
ON videogames.id = award_videogame.videogame_id
INNER JOIN software_houses
ON videogames.software_house_id = software_houses.id
ORDER BY year;

--6. Selezionare categorie e classificazioni PEGI dei videogiochi che hanno ricevuto recensioni da 4 e 5 stelle, mostrandole una sola volta (3363)
SELECT DISTINCT videogames.id AS videogame_id, categories.name AS category, pegi_labels.name as PEGI
FROM videogames
INNER JOIN reviews
on reviews.videogame_id = videogames.id
INNER JOIN category_videogame
ON category_videogame.videogame_id = videogames.id
INNER JOIN categories
ON categories.id = category_videogame.category_id
INNER JOIN pegi_label_videogame
ON pegi_label_videogame.videogame_id = videogames.id
INNER JOIN pegi_labels
ON pegi_labels.id = pegi_label_videogame.pegi_label_id
WHERE rating >= 4
ORDER BY videogames.id

--7. Selezionare quali giochi erano presenti nei tornei nei quali hanno partecipato i giocatori il cui nome inizia per 'S' (474)
SELECT DISTINCT videogames.id AS videogame_id
FROM videogames
INNER JOIN tournament_videogame 
ON videogames.id = tournament_videogame.videogame_id
INNER JOIN tournaments
ON tournaments.id = tournament_videogame.tournament_id
INNER JOIN player_tournament 
ON tournament_videogame.tournament_id = player_tournament.tournament_id
INNER JOIN players 
ON player_tournament.player_id = players.id
WHERE players.name LIKE 'S%';

--8. Selezionare le città in cui è stato giocato il gioco dell'anno del 2018 (36)
SELECT DISTINCT tournaments.city
FROM tournaments
INNER JOIN tournament_videogame
ON tournaments.id = tournament_videogame.tournament_id
INNER JOIN videogames
ON videogames.id = tournament_videogame.videogame_id
INNER JOIN award_videogame
ON videogames.id = award_videogame.videogame_id
INNER JOIN awards
ON awards.id = award_videogame.award_id
WHERE award_videogame.year = 2018 AND awards.name = 'Gioco dell''anno'

--9- Selezionare i giocatori che hanno giocato al gioco più atteso del 2018 in un torneo del 2019 (3306)
SELECT DISTINCT players.nickname as player, tournaments.name as tournament
FROM players
INNER JOIN player_tournament
ON player_tournament.player_id = players.id
INNER JOIN tournaments
ON tournaments.id = player_tournament.tournament_id
INNER JOIN tournament_videogame
ON tournament_videogame.tournament_id = tournaments.id
INNER JOIN videogames
ON videogames.id = tournament_videogame.videogame_id
INNER JOIN award_videogame
ON award_videogame.videogame_id = videogames.id
INNER JOIN awards
ON awards.id = award_videogame.award_id
WHERE awards.name = 'Gioco più atteso' AND award_videogame.year = 2018 AND tournaments.year = 2019