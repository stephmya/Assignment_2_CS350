/* 1. Show the name of each tournament included in the database. */
MATCH (t:Tournament)
RETURN t.name AS TournamentName

/* 2. Show the name of each player (Person) who has ever represented the USA. */
MATCH (p:Person)-[:REPRESENTS]->(t:Team {name: "USA"})
RETURN p.name AS PlayerName

/* 3. Show the date of birth (dob) of Lauren Holiday. */
MATCH (p:Person {name: "Lauren Holiday"})
RETURN p.dob AS DateOfBirth

/* Author: Au Sein */
/* 4. Show the data of each person whose name contains the substring 'Hara'
 Hint: you may do match followed by WHERE n.name CONTAINS …. */
MATCH (p:Person)
WHERE p.name CONTAINS 'Hara'
RETURN p

/* Author: Au Sein */
/* 5. Show the number of squads that 'Kelley O Hara' was in. */
MATCH (p:Person {name: "Kelley O Hara"})-[:IN_SQUAD]->(s:Squad)
RETURN COUNT(s) AS NumberOfSquads

/* Author: Au Sein */
/* 6. Show the name of each player (Person) for team 'USA' who has scored a goal in the tournaments. */
MATCH (p:Person)-[:REPRESENTS]->(t:Team {name: "USA"})
MATCH (p)-[:SCORED_GOAL]->(tournament:Tournament)
RETURN p.name AS PlayerName

/* 7. Who was the coach of the USA squad in 2019 (that is, the squad whose id is "USA in 2019")? */
MATCH (p:Person)-[:COACH_FOR]->(s:Squad {id: "USA in 2019"})
RETURN p.name AS CoachName

/* 8. Show all the matches in which "Rose Lavelle" scored a goal. */
MATCH (p:Person {name: "Rose Lavelle"})-[:SCORED_GOAL]->(m:Match)
RETURN m AS Matches

/* 9. Show the name of each person who represented team "USA" (as player) and also coached for
 some squad in the tournaments (not at the same time, of course). */
MATCH (p:Person)-[:REPRESENTS]->(t:Team {name: "USA"})
MATCH (p)-[:COACH_FOR]->(s:Squad)
RETURN p.name AS PersonName
