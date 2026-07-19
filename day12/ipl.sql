

CREATE TABLE IF NOT EXISTS player_stats (
    record_id INTEGER PRIMARY KEY,
    player_name TEXT NOT NULL,
    team TEXT NOT NULL,
    match_id INTEGER NOT NULL,
    runs INTEGER DEFAULT 0,
    wickets INTEGER DEFAULT 0,
    match_date TEXT NOT NULL
);
INSERT INTO player_stats (
    record_id,
    player_name,
    team,
    match_id,
    runs,
    wickets,
    match_date
)
VALUES
(1, 'Virat Kohli', 'RCB', 101, 82, 0, '2026-04-01'),
(2, 'Rohit Sharma', 'MI', 101, 65, 0, '2026-04-01'),
(3, 'Jasprit Bumrah', 'MI', 101, 12, 3, '2026-04-01'),
(4, 'Virat Kohli', 'RCB', 102, 45, 0, '2026-04-03'),
(5, 'Rohit Sharma', 'MI', 102, 88, 0, '2026-04-03'),
(6, 'Jasprit Bumrah', 'MI', 102, 8, 4, '2026-04-03'),
(7, 'Shubman Gill', 'GT', 103, 95, 0, '2026-04-05'),
(8, 'Hardik Pandya', 'MI', 103, 54, 1, '2026-04-05'),
(9, 'Virat Kohli', 'RCB', 104, 110, 0, '2026-04-07'),
(10, 'Shubman Gill', 'GT', 104, 42, 0, '2026-04-07'),
(11, 'Hardik Pandya', 'MI', 105, 72, 2, '2026-04-09'),
(12, 'Jasprit Bumrah', 'MI', 105, 5, 5, '2026-04-09');

SELECT * from player_stats;

SELECT
    player_name,
    team,
    runs,
    ROW_NUMBER() over (
    order by runs  desc ) as rank_by_runs
    from player_stats;

SELECT
          player_name ,team ,runs,
          rank() over (
          partition by  team 
          order by runs desc)
          as team_rank
          FROM player_stats;

SELECT player_name ,match_date,runs ,
       lag(runs) over (
       PARTITION by player_name
       order by match_date )
       as previous_match_runs 
       from player_stats;

SELECT player_name ,match_date,runs ,
    sum(runs) over (
    PARTITION by player_name 
    order by match_date 
    ) as cumulative_runs
    from player_stats;


select player_name,team, runs,
    dense_rank() over (
    PARTITION by team
    order by runs desc)as team_rank  
    from player_stats;


WITH ranked_players AS (
    SELECT
        player_name,
        team,
        runs,
        DENSE_RANK() OVER (
            PARTITION BY team
            ORDER BY runs DESC
        ) AS team_rank
    FROM player_stats
)
SELECT
    player_name,
    team,
    runs,
    team_rank
FROM ranked_players
WHERE team_rank <= 2
ORDER BY team, team_rank;


SELECT player_name,team, runs, LEAD(runs) OVER (
    PARTITION BY player_name
    ORDER BY match_date
) as next_match_runs from player_stats;

