use  [Spotify_db];
select * from cleaned_spotify_data;
select count(*) from cleaned_spotify_data;
select count(distinct Artist) from cleaned_spotify_data;
select MIN(duration_min) from spotify
select *from cleaned_spotify_data
where Likes=0
select distinct most_playedon from cleaned_spotify_data
select distinct channel from cleaned_spotify_data
--ques 1: Retrieve the names of all tracks that have more than 1 billion streams
select *from cleaned_spotify_data
where stream >1000000000
--ques 2 List all the aldum with their resepective artist
select 
      Artist,album_type
	  from cleaned_spotify_data
select 
	  distinct artist
	  from cleaned_spotify_data
	  group by 1
select distinct licensed from cleaned_spotify_data
select sum(comments) as total_comments
from cleaned_spotify_data
where Licensed='true'
--q.4 find all tracks that belong to album type single
select *from cleaned_spotify_data
where Album_type='single'
--ques 5 count the total number of tracks by each astist
SELECT artist,
       COUNT(*) AS total_no_songs
FROM cleaned_spotify_data
GROUP BY artist
ORDER BY total_no_songs DESC;
--Medium level
--calculate avg danceability of tracks in each album
select 
Album_type,
avg(danceability) as avg_danceability
from cleaned_spotify_data
-- qus 5find top 5 tracks with highest enegery values
SELECT
  Danceability,
  MAX(energy) AS MaxEnergy
FROM cleaned_spotify_data
GROUP BY Danceability
ORDER BY MaxEnergy DESC;
--6. List all the tracks with their views and likes as official_vdo=TRUe
SELECT
  artist,
  SUM(views) AS total_views,
  SUM(likes) AS total_likes
FROM cleaned_spotify_data
WHERE official_video = 'true'
GROUP BY artist
ORDER BY total_views DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
-- ques 7.for each album,calculate the total views of all associated tracks
SELECT 
  artist,
  SUM(views) AS total_views 
FROM cleaned_spotify_data
GROUP BY artist
ORDER BY artist;
-- ques 8. retrieve the track names that have been streamd on spotify more than youtube
select
artist,
most_playedon
from cleaned_spotify_data
--ques 13 use a with clause to calculate the difference between the hightest
-- and lowest energy values for tracks in each album
select 
album,
max(energy) as highest_energy,
max(energy) as lowest_emergency
from cleaned_spotify_data
group by album
-- using with clause 
WITH cte AS (
    SELECT 
        artist,
        MAX(energy) AS highest_energy,
        MIN(energy) AS lowest_energy
    FROM cleaned_spotify_data
    GROUP BY artist
)
SELECT
    artist, 
    highest_energy - lowest_energy AS energy_diff
FROM cte;
--- query optimization

select *from cleaned_spotify_data
where artist='Gorillaz'
order by energy Desc Limit 25


