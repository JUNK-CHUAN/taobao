/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/6/19 9:16:27                            */
/*==============================================================*/

drop table if exists customer;

drop table if exists seller;

drop table if exists specialty;

drop table if exists cart;


drop table if exists orderTable;


/*==============================================================*/
/* Table: cart                                                  */
/*==============================================================*/
create table cart
(
   spID                 int not null,
   cID                  varchar(10) not null,
   count                int,
   primary key (spID, cID)
);

/*==============================================================*/
/* Table: customer                                              */
/*==============================================================*/
create table customer
(
   cID                  varchar(10) not null,
   password             varchar(45),
   name                 varchar(20),
   phone                varchar(12),
   address              varchar(45),
   primary key (cID)
);

/*==============================================================*/
/* Table: orderTable                                            */
/*==============================================================*/
create table orderTable
(
   oID                  int not null,
   count                int,
   submitTime           datetime,
   address              varchar(45),
   state                varchar(10),
   spID                 int,
   cID                  varchar(10),
   sum                  float,
   expressNo            varchar(45),
   primary key (oID)
);

/*==============================================================*/
/* Table: seller                                                */
/*==============================================================*/
create table seller
(
   sID                  varchar(10) not null,
   password             varchar(45),
   name                 varchar(20),
   phone                varchar(12),
   address              varchar(45),
   primary key (sID)
);

/*==============================================================*/
/* Table: specialty                                             */
/*==============================================================*/
create table specialty
(
   spID                 int not null,
   sID                  varchar(10),
   name                 varchar(20),
   picUrl               varchar(100),
   stock                int,
   detail               varchar(500),
   category             varchar(20),
   price                float,
   primary key (spID)
);

alter table ordertable modify oID int auto_increment;
alter table ordertable modify column submitTime datetime null default current_timestamp;
alter table specialty modify spID int auto_increment;



alter table cart add constraint FK_Reference_1 foreign key (cID)
      references customer (cID) on delete restrict on update restrict;

alter table cart add constraint FK_Reference_2 foreign key (spID)
      references specialty (spID) on delete restrict on update restrict;

alter table orderTable add constraint FK_Reference_4 foreign key (spID)
      references specialty (spID) on delete restrict on update restrict;

alter table orderTable add constraint FK_Reference_5 foreign key (cID)
      references customer (cID) on delete restrict on update restrict;

alter table specialty add constraint FK_Reference_3 foreign key (sID)
      references seller (sID) on delete restrict on update restrict;


