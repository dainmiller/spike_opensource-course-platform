# Data Model

`Concerns ONLY used for relations aren't included (but represented in tree)`

`+ = Concern` | `- = Data model` | `* = implemented`

- Clients::Github*
	+ +Clientable*
		+ +Cacheable*
		+ +Fetchable*
		+ +Parseable*
- Clients::Repo*
- Vault*
	+ +Bucketable
- Course*
	+ +Recordable*
	+ +Bucketable
	+ +Attendable
	+ +Completable
	+ +Rateable _(or thru bucket)_
	+ +Reviewable _(or thru bucket)_
- Track
	+ +Completable
- Lesson
	+ +Completable
	+ +Badgeable
	+ +Commentable
- Bucket
	+ +Recordable
	+ +Searchable
- Recording*
	+ +Notifiable
- Notification
	- Mentionee
	- Mentioner
- People
	- User
	- Instructor
	- Attendee
	- Guest
- Status
- Badge
- Achievement
- Catalog
	- Program _(Microbachelors/etc programs)_
	- Topic _(engineering/arts/math/computer science/etc)_
	- Specialization
	- Group
- Rating
- Difficulty
- Review
- Degree
- Comment
- School _(actual universities)_