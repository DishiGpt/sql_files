

create table employ(
    id int AUTO_INCREMENT,
    last_name varchar(20) NOT NULL,
    first_name varchar(20) NOT NULL,
    middle_name varchar(20) NOT NULL,
    age int NOT NULL,
    current_status varchar(20) NOT NULL default 'has none',
    primary key(id));

    