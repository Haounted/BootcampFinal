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
	constraint UserFK1 foreign key(UserId) references Users(UserId)

)

create table Friends(
	FriendId char(5),
	UserId char(5),
	constraint FriendPK primary key(FriendId),
	constraint UserFK2 foreign key(UserId) references Users(UserId)
)

create table PageLikes(
	PageId char(5),
	UserId char(5),
	constraint PageLikesPK primary key(PageId,UserId),
	constraint PageFK1 foreign key(PageId) references Pages(PageId),
	constraint UserFK3 foreign key(UserId) references Users(UserId)
)

create table PostLikes(
	PostId char(5),
	UserId char(5),
	constraint PostLikesPK primary key(PostId,UserId),
	constraint PostFK1 foreign key(PostId) references Posts(PostId),
	constraint UserFK4 foreign key(UserId) references Users(UserId)
)

create table Photos(
	PhotoId char(5),
	PostId char(5),
	ImageContent varchar(255),
	constraint PhotoPK primary key(PhotoId),
	constraint PostFK3 foreign key(PostId) references Posts(PostId)
)

create table Shares(
	PostId char(5),
	UserId char(5),
	constraint PostFK4 foreign key(PostId) references Posts(PostId),
	constraint UserFK5 foreign key(UserId) references Users(UserId)
)

create table Comments(
	CommentId char(5),
	PostId char(5),
	UserId char(5),
	CommentDate date,
	CommentContent varchar(255),
	constraint CommentPK primary key(CommentId),
	constraint PostFK5 foreign key(PostId) references Posts(PostId),
	constraint UserFK6 foreign key(UserId) references Users(UserId)
)

create table CommentLikes(
	CommentId char(5),
	UserId char(5),
	constraint CommentLikesPK primary key(CommentId, UserId),
	constraint CommentFK foreign key(CommentId) references Comments(CommentId),
	constraint UserFK7 foreign key(UserId) references Users(UserId)
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

