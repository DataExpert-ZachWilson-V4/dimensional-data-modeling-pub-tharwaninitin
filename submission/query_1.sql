CREATE OR REPLACE TABLE tharwaninitin.actors (
    actor VARCHAR, -- Name of the actor
    actor_id VARCHAR, -- Unique identifier for each actor
    films ARRAY( -- Array of films the actor has participated in
        ROW(
            film VARCHAR, -- Name of the film
            votes INTEGER, -- Number of votes the film has received
            rating DOUBLE, -- Rating of the film
            film_id VARCHAR -- Unique identifier for each film
        )
    ),
    quality_class VARCHAR, -- Classification of the actor's performance quality based on average rating in the most recent year: 'star' (>8), 'good' (>7 and ≤8), 'average' (>6 and ≤7), 'bad' (≤6)
    is_active BOOLEAN, -- Indicates whether the actor is currently active
    current_year INTEGER -- Year in which the data is current
)
WITH
(
    FORMAT = 'PARQUET', -- Data format for storage
    partitioning = ARRAY['current_year'] -- Partitioning key for optimization
)