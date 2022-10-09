CREATE TABLE "user" (
  "user_id" varchar(10) PRIMARY KEY,
  "first_name" varchar(25) NOT NULL,
  "last_name" varchar(25) NOT NULL,
  "phone" varchar(10) UNIQUE NOT NULL,
  "is_admin" varchar(1) NOT NULL DEFAULT 'N', -- 'Y': Yes, 'N': No
  "password" varchar(10) NOT NULL
);

CREATE TABLE "member" (
  "member_id" integer PRIMARY KEY,
  "status" varchar(1) NOT NULL DEFAULT 'A', -- 'A': Active, 'I': Inactive
  "warnings" integer NOT NULL DEFAULT 0
);

CREATE TABLE "book" (
  "book_id" varchar(10) PRIMARY KEY,
  "title" varchar(100) NOT NULL,
  "category" varchar(15) NOT NULL DEFAULT 'MISC',
  "print_year" varchar(4) NOT NULL,
  "author" varchar(40) NOT NULL,
  "status" varchar(1) NOT NULL DEFAULT 'E', -- 'E': Enabled, 'D': Disabled
  "count" integer NOT NULL,
  "pub_id" varchar(10) NOT NULL
);

CREATE TABLE "publisher" (
  "pub_id" varchar(10) PRIMARY KEY,
  "pub_name" varchar(30) NOT NULL
);

CREATE TABLE "issue_history" (
  "issue_id" varchar(10) PRIMARY KEY,
  "member_id" varchar(10) NOT NULL,
  "book_id" varchar(10) NOT NULL,
  "issue_date" date NOT NULL,
  "return_date" date NOT NULL,
  "status" varchar(1) NOT NULL, -- 'A': Active, 'R': Returned, 'V': Violated Deadline,
  "fine" integer NOT NULL DEFAULT 0
);

CREATE TABLE "book_request" (
  "request_id" varchar(10) PRIMARY KEY,
  "member_id" varchar(10) NOT NULL,
  "book_title" varchar(10) NOT NULL,
  "book_desc" varchar(255),
  "status" varchar(1) NOT NULL -- 'A': Accepted, 'R': Rejected, 'P': Pending
);

CREATE TABLE "issue_request" (
  "request_id" varchar(10) PRIMARY KEY,
  "member_id" varchar(10) NOT NULL,
  "book_id" varchar(10) NOT NULL,
  "request_date" date NOT NULL
);

ALTER TABLE "member" ADD FOREIGN KEY ("member_id") REFERENCES "user" ("user_id");

ALTER TABLE "book" ADD FOREIGN KEY ("pub_id") REFERENCES "publisher" ("pub_id");

ALTER TABLE "issue_history" ADD FOREIGN KEY ("member_id") REFERENCES "member" ("member_id");

ALTER TABLE "issue_history" ADD FOREIGN KEY ("book_id") REFERENCES "book" ("book_id");

ALTER TABLE "book_request" ADD FOREIGN KEY ("member_id") REFERENCES "member" ("member_id");

ALTER TABLE "issue_request" ADD FOREIGN KEY ("member_id") REFERENCES "member" ("member_id");

ALTER TABLE "issue_request" ADD FOREIGN KEY ("book_id") REFERENCES "book" ("book_id");