select *
from Track
where Composer like '%ine%';


select *
from Album
where Title like '%eppe%';

select  BillingAddress, BillingCountry, total
from Invoice
where total > 20 and total < 25
order by Total desc, BillingCountry asc
limit 2;

select BillingCountry, grand_total
from (select BillingCountry, sum(total) as grand_total
      from Invoice
      group by BillingCountry
      order by grand_total desc, BillingCountry desc
    )
where grand_total > 50;


select BillingCountry, round(sum(total), 2) as grand_total
from Invoice
where total > 10
group by BillingCountry
having grand_total > 50
order by grand_total desc, BillingCountry desc;


-- class Album;
-- class Artist {
-- priavte:
--     vector<Album*> m_albums;
-- };

Artist 1 ----> 0..N Album

Artist
    id integer is uniqiue, primary key
  id, name
  1, lez zepl
  103, pink floyd

Album
           FK                  PK
id, title, artistid --> Artist.id
3, "the wall", 103


Person:  (id, idnum, name, address)
Car: (id , ownerid, license, model, year, ..)  ownerid->Person.id
Tipul: (id, cardid, date, what)   carid -> Car.id

Genere: (id, Name)
Track (id, Genereid, Name)


(TrackName, Genere.Name)

select Name from Genre where Genreid=3;

select Name, GenreID
from Track
where GenreId = 3;


select Track.Name, Genre.Name
from Track, Genre
where Track.GenreId = Genre.GenreId
    AND Genre.Name = 'Metal';

select T.Name, G.Name
from Track as T, Genre as G
where T.GenreId = G.GenreId
    AND G.Name = 'Metal';

select T.Name, G.Name
from Track T, Genre  G
where T.GenreId = G.GenreId
    AND G.Name = 'Metal';


select T.Name, G.Name, T.Milliseconds
from Track T               -- PK        FK
    INNER JOIN Genre G on G.GenreId = T.GenreId
where
        G.Name = 'Metal'
    AND T.Milliseconds > 600000;



-- One Track has one Genre
-- One Genre has many tracks  Genre 1.. Track N
select G.Name, round((avg(T.Milliseconds) / 1000)/60) as duration
from Track T               -- PK        FK
    INNER JOIN Genre G on G.GenreId = T.GenreId
where
    G.Name = 'Latin';

-- Artist
--    Album
--       Track

select T.Name, A.Title, U.Name
from Track T
    INNER JOIN Album A on T.AlbumId = A.AlbumId
    INNER JOIN Artist U on U.ArtistId = A.ArtistId
WHERE
    U.Name like '%z%'
AND T.Milliseconds > 500000;

select T.Name, A.Title, U.Name
from Track T, Album A, Artist U;


select E.Name, M.Name
from Employee E
    inner join Employee M on E.managerid = M.id;

-- Customer: (id, fname, em, balance) moti, itzik, adi
-- Supplier: (id, name) daniel, adi

select name as x from Customer --  result: Records list(record)    set A
UNION
select fname as x from Supplier
where Religon = 1; -- set B

select *
from Artist
order by name
limit 4;


select unique(name)
from artist;

select *
from Artist
-- where 0 < (select count(*) from Album where Album.ArtistId = Artist.ArtistId);
where NOT EXISTS(select * from Album where Album.ArtistId = Artist.ArtistId);

-- Person: (id, name, birthdate, diedat, salary)

select count(dieat) from person;  -- alive

select name, BirthDate
from person
where diesat is not null;

