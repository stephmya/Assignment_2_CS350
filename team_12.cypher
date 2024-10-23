/* 
CS350 Assignment 2
Group 12: Au Sein, Honey Love, Stephanie Myalik
*/

/* 1. Show the name of each tournament included in the database. */
Author: Honey Love
MATCH (t:Tournament)
RETURN t.name AS tournament_name

/* 2. Show the name of each player (Person) who has ever represented the USA. */
Author: Honey Love
MATCH (p:Person)-[:REPRESENTS]->(t:Team {name: "USA"})
RETURN DISTINCT p.name;

/* 3. Show the date of birth (dob) of Lauren Holiday. */
Author: Honey Love

MATCH (p:Person {name: "Lauren Holiday"})
RETURN p.dob AS date_of_birth;

/* 4. Show the data of each person whose name contains the substring 'Hara'
 Hint: you may do match followed by WHERE n.name CONTAINS …. */
MATCH (person:Person)
WHERE person.name CONTAINS 'Hara'
RETURN person;


/* 5. Show the number of squads that 'Kelley O Hara' was in. */
MATCH (person:Person {name: "Kelley O Hara"})-[:IN_SQUAD]->(squad:Squad)
RETURN COUNT(DISTINCT squad) AS number_of_squads;

/* 6. Show the name of each player (Person) for team 'USA' who has scored a goal in the tournaments. */
MATCH (player:Person)-[:REPRESENTS]->(team:Team {name: "USA"})
MATCH (player)-[:SCORED_GOAL]->(match:Match)
RETURN DISTINCT player.name;

/* 
 Author: Stephanie Myalik
 7. Who was the coach of the USA squad in 2019 (that is, the squad whose id is "USA in 2019")? 
*/
MATCH (team:Team {name: "USA"})-[:NAMED]->(squad:Squad {id: "USA in 2019"})
MATCH (coach:Person)-[:COACH_FOR]->(squad)
RETURN team.name, squad.id, coach.name;


/* 
 Author: Stephanie Myalik
 8. Show all the matches in which "Rose Lavelle" scored a goal. 
*/
MATCH (player:Person {name: "Rose Lavelle"})-[:SCORED_GOAL]->(match:Match)
RETURN match.date;


/* 
 Author: Stephanie Myalik
 9. Show the name of each person who represented team "USA" (as player) and also coached for
 some squad in the tournaments (not at the same time, of course). 
*/

// Team USA as players
MATCH (person:Person)-[:REPRESENTS]->(team:Team {name: "USA"})
RETURN DISTINCT person.name AS name, 
       "Player" AS role
UNION
// Team USA Coaches
MATCH (team:Team {name: "USA"})-[:NAMED]->(squad:Squad)
MATCH (coach:Person)-[:COACH_FOR]->(squad)
RETURN DISTINCT coach.name AS name, 
       "Coach" AS role;