select * from final;
use netflix;
-- SQL Project - Netflix Data Analysis

-- 1 Display all records from the dataset.
select * from final;

-- 2 Count the total number of titles available.
select count(title) as total_titles
from final;

-- 3 Display only the title and type columns.
select title,type from final;

-- 4 Show all Movies in the dataset.
select * from final where type = "movie";

-- 5 Show all TV Shows in the dataset.
select * from final
where type = "TV show";

-- 6 Show all titles released in 2020.
select title from final where release_year = 2020;

-- 7 Display content produced in India.
select * from final 
where country = 'India';

-- 8 Show titles with rating TV-MA.
select title, rating from final
where rating = "TV-MA";

-- 9 Display titles added to Netflix in 2021.
SELECT title, date_added
FROM final
WHERE YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) = 2021;

-- 10 Show movies released after 2018.
select type ,release_year from final
where type= "movie"and release_year > 2018;

-- 11 Count the number of Movies and TV Shows.
select type,count(*) as total_count 
from final 
group by type;

-- 12 Find the most common rating.
select rating,count(*) as total_count
from final
group by rating 
order by total_count desc
limit 1;


-- 13 Find the total number of titles per country.
select country,count(title) as total_count
from final
group by country;

-- 14 Find the number of titles released each year.
select release_year,count(title) as total_count
from final
group by release_year
order by release_year;

-- 15 Find the top 5 countries producing content.
select country,count(*)as total_count
 from final
group by country
order by total_count desc
limit 5;

-- 16 Show titles ordered by release year (latest first).
select title,release_year
from final 
order by release_year desc;

-- 17 Show the top 10 newest titles.
select title,release_year from final
order by release_year desc
limit 10;


-- 18 Show directors with the highest number of titles.
             select director,count(*) as no_of_titles from final group by 
          director order by no_of_titles desc;

-- 19 Find the longest movie.
select title,duration
from final
where type = "movie"
order by cast(replace(duration,'min','')as unsigned)desc
limit 1 ;

-- 20 Find movies with duration greater than 120 minutes.
select title,duration
from final 
where type = 'movie' and cast(replace(duration,'min','')as unsigned)>120;

-- 21 Find titles that do not have a director listed.
select title
from final
where director is null;

-- 22 Find the top 10 genres on Netflix.
select listed_in as genre,count(*) as total_titles 
from final 
group by listed_in
order by total_titles desc
limit 10; 



-- 23 Find how many titles each director created.
select director,count(title) as total_count
from final
group by director;

-- 24 Find the year with the most content releases.
select release_year,count(*) as total_count
from final
group by release_year
order by total_count desc
limit 1;

-- 25 Find the country producing the most TV Shows.
select country ,count(*) as total_count
from final
where type = 'TV show'
group by country
order by total_count desc
limit 1;

-- 26 Find average release year of movies.
select avg(release_year) as avg_year
from final
where type = 'movie';

-- 27 Find top 5 directors with most content.
select director,count(*) total_title
from final
group by director
order by total_title desc
limit 5;

-- 28 Find the number of titles added each year.
select release_year,count(title)as total_count
from final
group by release_year
order by release_year desc;

--  Students must write SQL queries and explain insights.
-- 1 Which type of content is most common on Netflix?
select type,count(*) as total_count
from final
group by type
order by total_count desc
limit 1;

/*Movies are the most common type of content on Netflix.
This means Netflix focuses more on movies than TV shows.*/

-- 2 Which country produces the most Netflix content?
select country,count(*) as total_count
from final
group by country
order by total_count desc
limit 1;

/*The United States produces the most content on Netflix, 
making it the largest contributor to the platform’s content library.*/

-- 3 Which year had the highest number of releases?
select release_year,count(*) as total_count 
from final
group by release_year
order by total_count desc
limit 1;

/*The year 2003 had the highest number of movie and TV show releases on Netflix.
This means more content was released in 2003 
than in any other year in the dataset.*/
 
-- 4 Which director created the most content?
select director,count(title) as total_content
from final
group by director
order by total_content desc
limit 1; 

/*Toshiya Shinohara created the most content on Netflix.
This means they have directed more movies and
 TV shows than any other director in the dataset.*/
 
-- 5 Which genre appears most frequently?
select listed_in as genre ,count(*) as total_count
from final
group by listed_in
order by total_count desc
limit 1;

/*Action & Adventure, Anime Features, and International
 Movies is the most frequent genre on Netflix, which means
 viewers highly prefer exciting action content,
 animated films, and movies from different countries.*/
 
-- 6 Find movies released in the last 5 years.

select title,release_year from final
where type="movie" and release_year>=year(curdate())-5;

-- 7 Find titles where duration is more than 2 hours.
select title,duration
from final 
where cast(replace(duration,'min','')as unsigned) > 2;

-- 8 Find directors who created both Movies and TV Shows.
select director from final
where type = 'movie' and type = 'TV show';

-- 9Find countries with more than 50 titles.
select country,count(*) as total_count from final
group by country having count(*)>50;

-- 10 Find titles added in the same year they were released.
select title,release_year,date_added from final
where year(str_to_date(date_added,'%M%d,%Y'))=release_year;

-- 11 Find oldest movie in the dataset.
select title,release_year from final
order by release_year limit 1;

-- 12 Find top 5 years with highest releases.
select release_year,count(*) as total_release from final
group by release_year order by total_release desc limit 5;

-- insights from the analysis
-- 1.	Content Added Over the Years

-- The number of titles added to Netflix has increased every year.
-- There is a sharp rise after 2015 in content additions.
-- This shows Netflix has been expanding its library rapidly in recent years.

-- 2.	Genre Distribution

-- Drama is the most common genre in the dataset.
-- It appears more frequently than other genres like Comedy or Action.
-- This indicates that Drama is highly preferred and widely produced.

-- 3.	Content Distribution

-- The dataset mostly contains Movies, and very few TV Shows.
-- Movies make up almost all the content (about 99%).
-- This shows that the dataset mainly focuses on movies.

-- 4.	Most Common Rating

-- The most common rating is TV-MA.
-- This means most content is for mature audiences.
-- Other common ratings are PG-13 and TV-14.

-- 5.	Year of Addition vs Release Year

-- Many titles were added to Netflix several years after their release.
-- Only a few titles were added in the same year they were released.
-- This indicates that Netflix also streams older content along with new releases.

