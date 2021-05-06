create database tugas1
use tugas1

create table Users(
	UserId char(5),
	FirstName varchar(255),
	LastName varchar(255),
	School varchar(255),
	Alamat varchar(255),
	Email varchar(255),
	Phone varchar(15),
	Lokasi varchar(255),
	DOB date,
	Gender varchar(15)
		check(Gender like 'male' or Gender like 'female')
	constraint UserPK primary key(UserId)
)

create table Pages(
	PageId char(5),
	PageName varchar(255),
	PageContent varchar(255),
	constraint PagePK primary key(PageId)
)

create table Posts(
	PostId char(5),
	UserId char(5),
	PostContent varchar(255),
	PostDate date
	constraint PostPK primary key(PostId),
	constraint PostFK foreign key(UserId) references Users(UserId)
)

create table Friends(
	FriendId char(5),
	UserId char(5),
	constraint FriendPK primary key(FriendId),
	constraint FriendFK foreign key(UserId) references Users(UserId)
)

create table PageLikes(
	PageId char(5),
	UserId char(5),
	constraint PageLikesPK primary key(PageId),
	constraint PageLikesFK foreign key(PageId) references Pages(PageId),
	constraint PageLikesFK1 foreign key(UserId) references Users(UserId)
)

create table PostLikes(
	PostId char(5),
	UserId char(5),
	constraint PostLikesPK primary key(PostId),
	constraint PostLikesFK foreign key(PostId) references Posts(PostId),
	constraint PostLikesFK1 foreign key(UserId) references Users(UserId)
)

create table Photos(
	PhotoId char(5),
	PostId char(5),
	ImageContent varchar(255),
	constraint PhotoPK primary key(PhotoId),
	constraint PhotoFK foreign key(PostId) references Posts(PostId)
)

create table Shares(
	PostId char(5),
	UserId char(5),
	constraint SharesPK primary key(PostId),
	constraint SharesFK foreign key(PostId) references Posts(PostId),
	constraint SharesFK1 foreign key(UserId) references Users(UserId)
)

create table Comments(
	CommentId char(5),
	PostId char(5),
	UserId char(5),
	CommentDate date,
	CommentContent varchar(255),
	constraint CommentPK primary key(CommentId),
	constraint CommentFK foreign key(PostId) references Posts(PostId),
	constraint CommentFK1 foreign key(UserId) references Users(UserId)
)

create table CommentLikes(
	CommentId char(5),
	UserId char(5),
	constraint CommentLikesPK primary key(CommentId),
	constraint CommentLikesFK foreign key(CommentId) references Comments(CommentId),
	constraint CommentLikesFK1 foreign key(UserId) references Users(UserId)
)

select * from Users
insert into Users
values
('AB001','Felicia','Sania','Binus','Taman Kopo Indah','sanifelicia@gmail.com','09921231','semarang','2001-12-10','female')

select * from Pages
insert into Pages
values
('AB001','example','hahaha')

select * from Posts
insert into Posts
values
('AA001','AB001','example','2020-12-30')

select * from Friends
insert into Friends 
values
('AF001','AB001')

select * from PostLikes
insert into PostLikes
values
('AA001','AB001')

begin tran
rollback
commit

drop table Users
drop table Pages
drop table Friends
drop table PageLikes
drop table Posts
drop table PostLikes
drop table Photos
drop table Shares
drop table Comments
drop table CommentLikes

