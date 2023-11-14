--Задание 2
--Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.
--Внимание: результаты запросов не должны быть пустыми, учтите это при заполнении таблиц.

--Название и продолжительность самого длительного трека.
select track_name, track_length
from tracks
where track_length = (select max(track_length) from tracks)

--Название треков, продолжительность которых не менее 3,5 минут.
select track_name, track_length
from tracks
where track_length >= 3.5*60

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select collection_name
from collections
where collection_year between '2018' and '2020'

--Исполнители, чьё имя состоит из одного слова.
select singer_name
from singers
where array_length(regexp_split_to_array(singer_name, '\s+'), 1) = 1;

--Название треков, которые содержат слово «мой» или «my».
SELECT track_name FROM tracks
WHERE track_name ILIKE '%мой%' or track_name ILIKE '%my%';

--Задание 3
--Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.
--Внимание: результаты запросов не должны быть пустыми, при необходимости добавьте данные в таблицы.

--Количество исполнителей в каждом жанре.
SELECT genres.genre_name, COUNT(singer) FROM singers_genres
LEFT JOIN genres ON singers_genres.genre = genres.genre_id
GROUP BY genres.genre_name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT albums.album_name, count(track_id)  FROM tracks
LEFT JOIN albums ON tracks.album=albums.album_id
where albums.album_year between '2019' and '2020'
GROUP BY albums.album_name;

--Средняя продолжительность треков по каждому альбому.
select album_name, AVG(tracks.track_length)   from albums a
LEFT join tracks ON a.album_id = tracks.album
group by album_name

--Все исполнители, которые не выпустили альбомы в 2020 году.
select singer_name
from singers as all_singers
where (
select count(a.album_id) from albums a 
left join singers_albums sa on a.album_id = sa.album 
left join singers s on sa.singer = s.singer_id 
where album_year = '2020' and s.singer_id=all_singers.singer_id 
GROUP by s.singer_id
) is null 

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select collection_name from collections c
LEFT join collections_tracks ct ON c.collection_id = ct.collection 
LEFT join tracks tr ON ct.track = tr.track_id
LEFT join albums a ON tr.album = a.album_id
LEFT join singers_albums sa ON a.album_id = sa.album 
LEFT join singers si ON sa.singer = si.singer_id
where singer_name = 'The Cardigans'
group by collection_name
;

--Задание 4(необязательное)
--Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.
--Внимание: результаты запросов не должны быть пустыми, при необходимости добавьте данные в таблицы.

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
select album_name,  singer_name from albums a 
LEFT join singers_albums sa ON a.album_id  = sa.album 
LEFT join singers si ON sa.singer = si.singer_id 
where (
select COUNT(genre) FROM singers_genres
where singer = si.singer_id 
GROUP BY singer
) >1

 --Наименования треков, которые не входят в сборники.
select track_name from tracks
full outer join collections_tracks on tracks.track_id = collections_tracks.track 
where track is null

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
select singers.singer_name  from tracks
join singers_albums on tracks.album = singers_albums.album 
join singers on singers_albums.singer = singers.singer_id 
where tracks.track_length = (select min(track_length) from tracks)

--Названия альбомов, содержащих наименьшее количество треков.
--не работает
select album_name, 
		(select count(track_id) from tracks tr 
		where tr.album = tracks.album
		GROUP BY album) as tr_count
from albums
join tracks on albums.album_id =tracks.album
GROUP BY album_name,  tracks.album




