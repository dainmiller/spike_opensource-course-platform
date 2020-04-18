# Data Model

`Concerns ONLY used for relations aren't included (but represented in tree)`

`+ = Concern` | `- = Data model` | `* = implemented`

- Clients::Github *
	+ +Clientable *
		+ +Cacheable *
		+ +Fetchable *
		+ +Parseable *
- Clients::Repo *
- Vault *
	+ +Bucketable *
- Course *
	+ +Recordable *
	+ +Bucketable *
	+ +Rateable * 
		- TODO: Add `rating` integer to Course table
	+ +Effort *
		- TODO: Add `effort/difficulty` integer to Course table
	+ +Attendable
	+ +Completable
- Bucket
	+ +Recordable *
	+ +Searchable *
	+ +Commentable *
- Comment *
- Review < Comment *
- Status
	- Completeable
- Track
	+ +Completable
- Lesson
	+ +Completable
	+ +Badgeable
	+ +Commentable
- Recording *
	+ +Notifiable
- Notification
	* `#.eavesdrop`
	- Mentionee
	- Mentioner
- People
	- User
	- Instructor
	- Attendee
	- Guest
- Badge
- Achievement
- Catalog
	- Program _(Microbachelors/etc programs)_
	- Topic _(engineering/arts/math/computer science/etc)_
	- Specialization
	- Group
- Degree
- Comment
- School _(actual universities)_