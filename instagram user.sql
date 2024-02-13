**/1) find the 5 oldest users of the instagram**/
select username,created_at from users order by created_at limit 5;
**/ 2) find the users who have never posted a single photo on instagram**/
select * from photos,users;
select from users  as u
left join photos as p
on p.user_id=u.id
where p.image_url is not null  order by u.username;
**/ 3) identify he winner of the contest and provide ther details to the team
select likes.photo_id,users.username,count(likes.user_id) as likess
from likes inner join photos on likes.photo_id=photos.id
inner join users on photos.user_id=users.id
group by likes.photo_id,users.username order by likess desc;
**/ 4)identify and suggest the top 5 most commonly used hashtags on the platform
select t.tag_name,count(p.photo_id) as ht
from photo_tags p
inner join tags t 
on t.id=p.tag_id group by
t.tag_name order by ht desc;
**/5) wat day of the week do most users register on? provide insights on when to schedule and ad campaign
select DATE_FORMAT((created_at),'%W') as dayy,count(username) from users group by 1
order by 2 desc;
**/6 provide how many times does average user posts in instagram.also provide the total number of photos in instagram/total number of users
SELECT 
    AVG(PostsCount) AS AvgPostsPerUser,
    TotalPhotos.TotalPhotos AS TotalPhotos,
    TotalUsers.TotalUsers AS TotalUsers,
    TotalPhotos.TotalPhotos / TotalUsers.TotalUsers AS PhotosPerUserRatio
FROM (
    SELECT id, COUNT(*) AS PostsCount
    FROM comments
    GROUP BY id
) AS PostCounts
CROSS JOIN (
    SELECT COUNT(*) AS TotalPhotos
    FROM Photos
	group by id
) AS TotalPhotos
CROSS JOIN (
    SELECT COUNT(*) AS TotalUsers
    FROM Users
) AS TotalUsers;





