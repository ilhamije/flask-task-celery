BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS bucket (
	event_id INTEGER NOT NULL,
	email_subject TEXT,
	email_content TEXT,
	timestamp VARCHAR,
	PRIMARY KEY (event_id)
);
INSERT INTO `bucket` VALUES (1,'postman 1','ini adalah test untuk post','2018-06-02 03:57:15.150311');
COMMIT;
