DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS description;
DROP TABLE IF EXISTS Comments;


CREATE TABLE restaurant (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT  NOT NULL,
  id_description INTEGER NOT NULL,
  open_time TIME,
  close_time TIME,
  FOREIGN KEY (id_description) REFERENCES description (id)
);

CREATE TABLE description (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  address TEXT NOT NULL,
  date_open TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  date_close DEFAULT NULL,
  average_bill INTEGER ,
  average_rating FLOAT
);

CREATE TABLE Comments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  Comment TEXT NOT NULL,
  comment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  user_name INTEGER ,
  id_description INTEGER NOT NULL,
  set_rating INTEGER,
  FOREIGN KEY (id_description) REFERENCES description (id)
);




