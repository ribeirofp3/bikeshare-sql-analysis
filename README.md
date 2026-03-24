# Bikeshare-sql-analysis

## Focus: Operational Efficiency & Usage Patterns

This project demonstrates my ability to extract business insights from relational databases using SQL. I analyzed a bike-sharing system (simulating an Italian operation) to help managers understand station popularity, identify trip anomalies, and categorize user behavior.

Tech Stack
Database: PostgreSQL / MySQL
Key Concepts: Joins, Subqueries, Aggregations, CASE Statements.


### High-Traffic Cities

Goal: Identify which cities have the highest volume of trips to optimize bike distribution.
Solution :

SELECT cidade, count(id_estacao_partida) Est_começadas
FROM Estacoes e 
JOIN Viagens v on e.id_estacao = v.id_estacao_partida
GROUP BY cidade;


### Identifying Trip Outliers

Goal: Find trips with a duration strictly greater than the overall average to identify potential bike misuse or long-distance patterns.
Solution :

SELECT id_viagem, duracao_minutos
FROM Viagens
WHERE duracao_minutos > (SELECT AVG(duracao_minutos) Media_Viagens
FROM Viagens);


### Trip Categorization (Focus: Milan)

Goal: Segment trips in Milan into 'Short', 'Medium', or 'Long' categories to help marketing understand how the service is being used in the city.

If the trip lasted less than 20 minutes, write 'Curta'.
If it lasted between 20 and 60 minutes, write 'Media'.
If it lasted more than 60 minutes, write 'Longa'.
Show only trips from the city of 'Milano'.

Solution :
SELECT 
    e.nome_estacao, 
    CASE 
        WHEN v.duracao_minutos < 20 THEN 'Short'
        WHEN v.duracao_minutos BETWEEN 20 AND 60 THEN 'Medium'
        WHEN v.duracao_minutos > 60 THEN 'Long'
        ELSE 'N/A'
    END AS duration_category
FROM Estacoes e
JOIN Viagens v ON e.id_estacao = v.id_estacao_partida
WHERE e.cidade = 'Milano';
