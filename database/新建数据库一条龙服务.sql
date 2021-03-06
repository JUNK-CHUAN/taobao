/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/6/29 11:11:45                           */
/*==============================================================*/

drop database demo;
create database demo;

use demo;

drop table if exists cart;

drop table if exists comment;

drop table if exists customer;

drop table if exists orderTable;

drop table if exists seller;

drop table if exists specialty;

drop table if exists specialtyPic;

/*==============================================================*/
/* Table: cart                                                  */
/*==============================================================*/
create table cart
(
   spID                 int not null,
   cID                  varchar(10) not null,
   count                int,
   submitTime           datetime,
   primary key (spID, cID)
);

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   oID                  int not null,
   text                 varchar(200),
   star                 int,
   submitTime           datetime,
   primary key (oID)
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
   stock                int,
   detail               varchar(500),
   category             varchar(20),
   price                float,
   isDeleted            bool DEFAULT false,
   picUrl               varchar(100),
   insertTime           datetime,
   primary key (spID)
);

/*==============================================================*/
/* Table: specialtyPic                                          */
/*==============================================================*/
create table specialtyPic
(
   picUrl               varchar(100) not null,
   spID                 int,
   updateTime           datetime,
   primary key (picUrl)
);

alter table ordertable modify oID int auto_increment;
alter table ordertable modify column submitTime datetime null default current_timestamp;
alter table specialty modify spID int auto_increment;
alter table specialty modify column insertTime datetime null default current_timestamp;
alter table cart modify column submitTime datetime null default current_timestamp;
alter table comment modify column submitTime datetime null default current_timestamp;

alter table cart add constraint FK_Reference_1 foreign key (cID)
      references customer (cID) on delete restrict on update restrict;

alter table cart add constraint FK_Reference_2 foreign key (spID)
      references specialty (spID) on delete restrict on update restrict;

alter table comment add constraint FK_Reference_7 foreign key (oID)
      references orderTable (oID) on delete restrict on update restrict;

alter table orderTable add constraint FK_Reference_4 foreign key (spID)
      references specialty (spID) on delete restrict on update restrict;

alter table orderTable add constraint FK_Reference_5 foreign key (cID)
      references customer (cID) on delete restrict on update restrict;

alter table specialty add constraint FK_Reference_3 foreign key (sID)
      references seller (sID) on delete restrict on update restrict;

alter table specialtyPic add constraint FK_Reference_6 foreign key (spID)
      references specialty (spID) on delete restrict on update restrict;









-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('1', '123', '东北小卖部', '13460986283', '哈尔滨南岗区西大直街92号');
INSERT INTO `seller` VALUES ('10', '123', '桂林米粉店', '13460986280', '广西南宁市大学东路100号');
INSERT INTO `seller` VALUES ('2', '123', '翠花的特产店', '13460986282', '长春市前进大街2699号');
INSERT INTO `seller` VALUES ('3', '123', '重大饭堂旗舰店', '13460986283', '重庆市沙坪坝区沙正街174号');
INSERT INTO `seller` VALUES ('4', '123', '南京的家', '13460986284', '江苏省南京市汉口路22号');
INSERT INTO `seller` VALUES ('5', '123', '天津的家', '13460986285', '天津市南开区卫津路92号');
INSERT INTO `seller` VALUES ('6', '123', '河南的家', '513460986286', '河南省开封市明伦街85号');
INSERT INTO `seller` VALUES ('7', '123', '广州点都得', '13460986287', '广州市天河区中山大道西55号');
INSERT INTO `seller` VALUES ('8', '123', '魔都美味', '13460986288', '上海市普陀区中山北路3663号');
INSERT INTO `seller` VALUES ('9', '123', '兵马俑美食广场', '13460986289', '西安市友谊西路127号');


insert into customer values("1", "123","默认人","10001100082","重庆市沙坪坝区重庆大学虎溪校区梅园5栋511");





insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "东北冻梨", "img/testsp/东北/东北冻梨.jpg", 109, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 10.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "东北参片", "img/testsp/东北/东北参片.jpg", 618, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 13.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北大榛子仁（生）", "img/testsp/东北/东北大榛子仁（生）.jpg", 959, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 27.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "东北姑娘果", "img/testsp/东北/东北姑娘果.jpg", 561, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 39.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "东北开口大榛子", "img/testsp/东北/东北开口大榛子.jpg", 877, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 36.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "东北手打糕", "img/testsp/东北/东北手打糕.jpg", 535, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 5.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北民俗服饰", "img/testsp/东北/东北民俗服饰.jpg", 900, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 19.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北烤冷面", "img/testsp/东北/东北烤冷面.jpg", 843, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 49.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北猪血肠", "img/testsp/东北/东北猪血肠.jpg", 497, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 41.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北猴头菇", "img/testsp/东北/东北猴头菇.jpg", 657, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 7.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北玉米", "img/testsp/东北/东北玉米.jpg", 774, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 27.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北白果", "img/testsp/东北/东北白果.jpg", 726, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 28.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北粉条", "img/testsp/东北/东北粉条.jpg", 82, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 27.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "东北粘豆包", "img/testsp/东北/东北粘豆包.jpg", 59, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 24.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北红高粱", "img/testsp/东北/东北红高粱.jpg", 549, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 23.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北纯野生核桃仁", "img/testsp/东北/东北纯野生核桃仁.jpg", 208, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 18.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北荞麦", "img/testsp/东北/东北荞麦.jpg", 316, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 49.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北荞麦米", "img/testsp/东北/东北荞麦米.jpg", 670, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 43.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "东北菇娘果", "img/testsp/东北/东北菇娘果.jpg", 474, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 27.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北薄皮大榛子", "img/testsp/东北/东北薄皮大榛子.jpg", 521, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 39.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "东北酸菜", "img/testsp/东北/东北酸菜.jpg", 226, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 7.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北野生小榛子", "img/testsp/东北/东北野生小榛子.jpg", 159, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 7.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "东北锅包肉", "img/testsp/东北/东北锅包肉.jpg", 281, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 16.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "东北雪里红", "img/testsp/东北/东北雪里红.jpg", 304, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 34.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北黄豆", "img/testsp/东北/东北黄豆.jpg", 150, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 15.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "东北黑冻梨", "img/testsp/东北/东北黑冻梨.jpg", 696, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 15.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "东北黑木耳", "img/testsp/东北/东北黑木耳.jpg", 241, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 46.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "五谷杂粮粉", "img/testsp/东北/五谷杂粮粉.jpg", 142, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 22.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "传统打糕", "img/testsp/东北/传统打糕.jpg", 516, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 31.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "冻梨", "img/testsp/东北/冻梨.jpg", 968, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 34.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "凤凰山荞麦米", "img/testsp/东北/凤凰山荞麦米.jpg", 195, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 10.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "北大荒五常大米", "img/testsp/东北/北大荒五常大米.jpg", 666, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 34.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "北森蓝莓干", "img/testsp/东北/北森蓝莓干.jpg", 887, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 35.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "千年老参", "img/testsp/东北/千年老参.jpg", 446, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 14.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "原味榛子", "img/testsp/东北/原味榛子.jpg", 150, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 46.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "原生黑木耳", "img/testsp/东北/原生黑木耳.jpg", 55, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 44.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "参片", "img/testsp/东北/参片.jpg", 524, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 36.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "哈尔滨红肠", "img/testsp/东北/哈尔滨红肠.jpg", 148, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 9.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "大白果", "img/testsp/东北/大白果.jpg", 526, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 25.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "大马哈鱼", "img/testsp/东北/大马哈鱼.jpg", 985, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 47.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "寒地大米", "img/testsp/东北/寒地大米.jpg", 430, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 21.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "小粒蓝莓", "img/testsp/东北/小粒蓝莓.jpg", 958, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 38.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "山核桃仁", "img/testsp/东北/山核桃仁.jpg", 143, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 40.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "崔奶奶红肠", "img/testsp/东北/崔奶奶红肠.jpg", 964, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 32.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "干蕨菜", "img/testsp/东北/干蕨菜.jpg", 117, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 35.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "康大锅包肉", "img/testsp/东北/康大锅包肉.png", 153, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 8.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "延边手打糕", "img/testsp/东北/延边手打糕.jpg", 182, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 19.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "延边粳米", "img/testsp/东北/延边粳米.jpg", 275, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 35.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "开口大榛子", "img/testsp/东北/开口大榛子.jpg", 212, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 38.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "开口榛子", "img/testsp/东北/开口榛子.jpg", 587, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 35.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "手工参片", "img/testsp/东北/手工参片.jpg", 621, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 9.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "手工核桃", "img/testsp/东北/手工核桃.jpg", 565, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 45.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "手工红豆包", "img/testsp/东北/手工红豆包.jpg", 550, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 29.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "拔丝锅包肉", "img/testsp/东北/拔丝锅包肉.jpg", 396, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 33.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "核桃仁", "img/testsp/东北/核桃仁.jpg", 182, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 24.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "森家蓝莓干", "img/testsp/东北/森家蓝莓干.jpg", 817, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 12.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "椒盐榛子", "img/testsp/东北/椒盐榛子.jpg", 636, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 46.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "椴木大花菇", "img/testsp/东北/椴木大花菇.jpg", 611, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 43.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "椴木小碗耳", "img/testsp/东北/椴木小碗耳.jpg", 211, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 16.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "椴木小香菇", "img/testsp/东北/椴木小香菇.png", 999, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 46.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "正大锅包肉", "img/testsp/东北/正大锅包肉.jpg", 362, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 20.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "正宗冻梨", "img/testsp/东北/正宗冻梨.jpg", 599, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 20.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "灯笼果", "img/testsp/东北/灯笼果.jpg", 227, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 31.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "生参", "img/testsp/东北/生参.jpg", 881, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 28.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "生白果", "img/testsp/东北/生白果.jpg", 882, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 14.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "白果", "img/testsp/东北/白果.jpg", 258, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 12.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "百年老参", "img/testsp/东北/百年老参.jpg", 654, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 36.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "秋林红肠", "img/testsp/东北/秋林红肠.jpg", 263, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 20.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "粘豆包", "img/testsp/东北/粘豆包.jpg", 998, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 21.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "精选大花菇", "img/testsp/东北/精选大花菇.jpg", 712, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 6.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "精选花菇", "img/testsp/东北/精选花菇.jpg", 254, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 15.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "红肠", "img/testsp/东北/红肠.jpg", 127, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 28.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "红高粱", "img/testsp/东北/红高粱.jpg", 202, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 49.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "纯野生榛子仁", "img/testsp/东北/纯野生榛子仁.jpg", 917, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 26.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "老东北血肠", "img/testsp/东北/老东北血肠.jpg", 186, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 28.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "老树野生核桃", "img/testsp/东北/老树野生核桃.jpg", 608, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 48.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "老黑土大米", "img/testsp/东北/老黑土大米.jpg", 656, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 5.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "腌制雪里红", "img/testsp/东北/腌制雪里红.jpg", 898, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 41.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "荞麦血肠", "img/testsp/东北/荞麦血肠.gif", 968, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 36.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "药用白果", "img/testsp/东北/药用白果.jpg", 839, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 18.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "蓝莓果干", "img/testsp/东北/蓝莓果干.gif", 357, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 23.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "薄皮核桃", "img/testsp/东北/薄皮核桃.jpg", 524, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 9.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "薄皮榛子", "img/testsp/东北/薄皮榛子.jpg", 231, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 9.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "蟹田大米", "img/testsp/东北/蟹田大米.jpg", 455, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 42.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "蟹稻家大米", "img/testsp/东北/蟹稻家大米.jpg", 635, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 17.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "酸甜蓝莓干", "img/testsp/东北/酸甜蓝莓干.jpg", 191, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 43.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "野生小木耳", "img/testsp/东北/野生小木耳.jpg", 601, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 47.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "野生干木耳", "img/testsp/东北/野生干木耳.png", 940, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 27.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "野生猴头菇", "img/testsp/东北/野生猴头菇.jpg", 819, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 10.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "野生猴菇", "img/testsp/东北/野生猴菇.jpg", 521, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 25.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "野生红菇", "img/testsp/东北/野生红菇.jpg", 901, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 48.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "野生蓝莓干", "img/testsp/东北/野生蓝莓干.jpg", 811, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 19.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "锅包肉半成品", "img/testsp/东北/锅包肉半成品.jpg", 373, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 28.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "锅包肉原料", "img/testsp/东北/锅包肉原料.jpg", 448, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 15.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "长白山参片", "img/testsp/东北/长白山参片.jpg", 909, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 39.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "长白山小木耳", "img/testsp/东北/长白山小木耳.jpg", 427, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 46.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "长白山核桃仁", "img/testsp/东北/长白山核桃仁.jpg", 863, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 14.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "长白山猴头菇", "img/testsp/东北/长白山猴头菇.jpg", 789, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 8.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "长白山老参", "img/testsp/东北/长白山老参.jpg", 701, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 12.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "长白山蓝莓", "img/testsp/东北/长白山蓝莓.jpg", 174, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 25.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "非转基因黄豆", "img/testsp/东北/非转基因黄豆.jpg", 263, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 42.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "风干小木耳", "img/testsp/东北/风干小木耳.jpg", 426, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 21.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "风干黑木耳", "img/testsp/东北/风干黑木耳.jpg", 625, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 11.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "黄秋葵种子", "img/testsp/东北/黄秋葵种子.jpg", 916, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 18.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "黑木耳", "img/testsp/东北/黑木耳.jpg", 763, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 9.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "黑龙家的黄豆", "img/testsp/东北/黑龙家的黄豆.jpg", 466, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 9.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "黑龙江大榛仁", "img/testsp/东北/黑龙江大榛仁.jpg", 691, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 12.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("1", "黑龙江核桃仁", "img/testsp/东北/黑龙江核桃仁.jpg", 772, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 15.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("2", "黑龙江黄豆", "img/testsp/东北/黑龙江黄豆.jpg", 648, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "东北", 8.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("5", "宁夏盐池滩羊", "img/testsp/中原/宁夏盐池滩羊.jpg", 763, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 47.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("5", "山西醋", "img/testsp/中原/山西醋.jpg", 658, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 47.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("6", "岐山臊子面", "img/testsp/中原/岐山臊子面.jpg", 801, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 40.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("6", "手抓羊肉", "img/testsp/中原/手抓羊肉.jpg", 432, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 19.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("6", "无铅变蛋", "img/testsp/中原/无铅变蛋.jpg", 956, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 28.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("6", "杜康", "img/testsp/中原/杜康.jpg", 579, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 40.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("5", "杜康原浆", "img/testsp/中原/杜康原浆.jpg", 436, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 18.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("5", "杜康酒", "img/testsp/中原/杜康酒.jpg", 216, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 9.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("6", "毛尖茶", "img/testsp/中原/毛尖茶.jpg", 599, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 35.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("6", "河南道口烧鸡", "img/testsp/中原/河南道口烧鸡.jpg", 975, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 44.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("6", "油泼辣子", "img/testsp/中原/油泼辣子.jpg", 774, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 28.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("6", "洋槐花", "img/testsp/中原/洋槐花.jpg", 249, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 9.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("6", "盐池滩羊排", "img/testsp/中原/盐池滩羊排.jpg", 441, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 18.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("5", "红瓜子", "img/testsp/中原/红瓜子.jpg", 531, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 36.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("5", "肉夹馍饼胚", "img/testsp/中原/肉夹馍饼胚.jpg", 287, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 26.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("5", "胡辣汤", "img/testsp/中原/胡辣汤.jpg", 379, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 21.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("6", "臊子面", "img/testsp/中原/臊子面.jpg", 176, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 40.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("6", "良心黑枸杞", "img/testsp/中原/良心黑枸杞.jpg", 82, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 34.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("6", "道口烧鸡", "img/testsp/中原/道口烧鸡.jpg", 390, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 27.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("6", "野生大果黑枸杞", "img/testsp/中原/野生大果黑枸杞.jpg", 225, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 35.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("5", "陕西干菜苔", "img/testsp/中原/陕西干菜苔.png", 768, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 26.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("6", "陕西肉夹馍", "img/testsp/中原/陕西肉夹馍.jpg", 587, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 19.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("5", "陕西臊子面", "img/testsp/中原/陕西臊子面.jpg", 729, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "中原", 29.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "东酿", "img/testsp/华东/东酿.jpg", 942, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 36.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "云锦围巾", "img/testsp/华东/云锦围巾.jpg", 420, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 16.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "云锦织物", "img/testsp/华东/云锦织物.jpg", 553, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 47.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "云锦美女", "img/testsp/华东/云锦美女.jpg", 701, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 45.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "云锦领带", "img/testsp/华东/云锦领带.jpg", 496, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 11.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "六安瓜片", "img/testsp/华东/六安瓜片.jpg", 974, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 43.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "南京云锦", "img/testsp/华东/南京云锦.jpg", 324, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 44.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "南京盐水鸭", "img/testsp/华东/南京盐水鸭.jpg", 789, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 18.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "南腿王火腿", "img/testsp/华东/南腿王火腿.jpg", 115, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 32.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "卤水盐水鸭", "img/testsp/华东/卤水盐水鸭.jpg", 376, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 40.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "即食盐水鸭", "img/testsp/华东/即食盐水鸭.jpg", 505, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 33.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "原生纯藕粉", "img/testsp/华东/原生纯藕粉.jpg", 917, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 37.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "古井贡酒", "img/testsp/华东/古井贡酒.jpg", 767, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 8.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "古法藕粉", "img/testsp/华东/古法藕粉.jpg", 652, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 26.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "大闸蟹", "img/testsp/华东/大闸蟹.jpg", 107, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 29.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "天然西湖藕粉", "img/testsp/华东/天然西湖藕粉.jpg", 542, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 27.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "太湖银鱼", "img/testsp/华东/太湖银鱼.jpg", 949, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 37.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "头采西湖龙井", "img/testsp/华东/头采西湖龙井.jpg", 570, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 37.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "安徽六安瓜片", "img/testsp/华东/安徽六安瓜片.jpg", 921, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 11.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "宜兴紫砂壶", "img/testsp/华东/宜兴紫砂壶.jpg", 719, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 27.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "徐家盐水鸭", "img/testsp/华东/徐家盐水鸭.png", 461, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 29.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "徐州酱菜", "img/testsp/华东/徐州酱菜.jpg", 513, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 20.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "手工烘焙六安瓜片", "img/testsp/华东/手工烘焙六安瓜片.jpg", 237, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 40.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "手工藕粉", "img/testsp/华东/手工藕粉.jpg", 65, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 16.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "扬州炒饭", "img/testsp/华东/扬州炒饭.jpg", 691, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 13.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "招牌盐水鸭", "img/testsp/华东/招牌盐水鸭.jpg", 290, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 23.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "散装龙井", "img/testsp/华东/散装龙井.jpg", 991, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 42.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "无刺银鱼", "img/testsp/华东/无刺银鱼.jpg", 699, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 38.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "无锡油面筋", "img/testsp/华东/无锡油面筋.jpg", 925, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 6.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "无锡特产礼盒", "img/testsp/华东/无锡特产礼盒.jpg", 380, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 13.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "无锡阳山水蜜桃", "img/testsp/华东/无锡阳山水蜜桃.jpg", 866, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 32.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "杭州丝绸", "img/testsp/华东/杭州丝绸.jpg", 684, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 15.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "杭州味糕点", "img/testsp/华东/杭州味糕点.jpg", 557, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 46.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "桂花盐水鸭", "img/testsp/华东/桂花盐水鸭.jpg", 728, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 43.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "梅家西湖龙井", "img/testsp/华东/梅家西湖龙井.jpg", 723, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 31.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "梨膏糖", "img/testsp/华东/梨膏糖.jpg", 149, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 34.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "正宗盐水鸭", "img/testsp/华东/正宗盐水鸭.jpg", 651, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 19.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "火腿切片", "img/testsp/华东/火腿切片.jpg", 376, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 29.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "绍兴花雕酒", "img/testsp/华东/绍兴花雕酒.jpg", 602, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 23.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "绍兴黄酒", "img/testsp/华东/绍兴黄酒.jpg", 603, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 48.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "美味盐水鸭", "img/testsp/华东/美味盐水鸭.jpg", 647, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 11.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "芜湖铁画", "img/testsp/华东/芜湖铁画.jpg", 224, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 31.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "芜湖铁画骏马", "img/testsp/华东/芜湖铁画骏马.jpg", 980, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 37.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "苏州太湖银鱼", "img/testsp/华东/苏州太湖银鱼.jpg", 942, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 10.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "苏州特产礼包", "img/testsp/华东/苏州特产礼包.jpg", 775, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 37.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "苏州礼盒", "img/testsp/华东/苏州礼盒.jpg", 489, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 39.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "西湖爽滑藕粉", "img/testsp/华东/西湖爽滑藕粉.jpg", 701, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 32.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "西湖藕粉", "img/testsp/华东/西湖藕粉.png", 276, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 42.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "西湖龙井", "img/testsp/华东/西湖龙井.jpg", 454, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 33.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "野生银鱼", "img/testsp/华东/野生银鱼.jpg", 632, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 12.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "金华火腿", "img/testsp/华东/金华火腿.jpg", 132, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 9.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "阳山水蜜桃", "img/testsp/华东/阳山水蜜桃.jpg", 127, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 28.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "阳澄湖大闸蟹", "img/testsp/华东/阳澄湖大闸蟹.jpg", 137, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 23.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "青瓷古井贡酒", "img/testsp/华东/青瓷古井贡酒.jpg", 473, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 39.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "非遗-芜湖铁画", "img/testsp/华东/非遗-芜湖铁画.jpg", 79, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 15.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "黄山毛尖", "img/testsp/华东/黄山毛尖.jpg", 809, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 37.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("8", "黄山毛峰", "img/testsp/华东/黄山毛峰.jpg", 144, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 33.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "黄山毛峰茶", "img/testsp/华东/黄山毛峰茶.jpg", 265, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 8.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "黑猫小孩酥", "img/testsp/华东/黑猫小孩酥.jpg", 747, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 48.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("4", "龙井", "img/testsp/华东/龙井.jpg", 516, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华东", 42.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "三亚菠萝蜜", "img/testsp/华南/三亚菠萝蜜.jpg", 219, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 31.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "乌龙茶", "img/testsp/华南/乌龙茶.jpg", 298, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 33.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "佛跳墙", "img/testsp/华南/佛跳墙.jpg", 321, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 22.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "利口福马拉糕", "img/testsp/华南/利口福马拉糕.jpg", 819, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 34.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "原形马拉糕", "img/testsp/华南/原形马拉糕.jpg", 399, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 6.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "叉烧包", "img/testsp/华南/叉烧包.jpg", 295, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 32.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "叉烧肉", "img/testsp/华南/叉烧肉.jpg", 767, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 24.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "口味王槟榔", "img/testsp/华南/口味王槟榔.jpg", 703, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 23.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "广东特产礼包", "img/testsp/华南/广东特产礼包.jpg", 233, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 23.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "广味香肠", "img/testsp/华南/广味香肠.jpg", 371, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 29.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "广州早茶", "img/testsp/华南/广州早茶.jpg", 346, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 46.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "广西毛尖", "img/testsp/华南/广西毛尖.jpg", 732, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 20.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "广西灯笼果", "img/testsp/华南/广西灯笼果.jpg", 612, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 37.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "手制叉烧包", "img/testsp/华南/手制叉烧包.jpg", 484, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 49.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "易太叉烧", "img/testsp/华南/易太叉烧.gif", 932, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 26.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "柳州螺蛳粉", "img/testsp/华南/柳州螺蛳粉.jpg", 684, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 33.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "桂富善菠萝蜜", "img/testsp/华南/桂富善菠萝蜜.jpg", 350, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 7.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "桂林卤肉米粉", "img/testsp/华南/桂林卤肉米粉.jpg", 517, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 44.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "桂林米粉", "img/testsp/华南/桂林米粉.jpg", 95, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 35.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "桂林米粉（湿）", "img/testsp/华南/桂林米粉（湿）.jpg", 662, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 5.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "桂林黑糖", "img/testsp/华南/桂林黑糖.jpg", 120, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 33.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "椰子鸡", "img/testsp/华南/椰子鸡.jpg", 963, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 40.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "椰雕", "img/testsp/华南/椰雕.jpg", 533, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 12.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "海南云龙莲雾", "img/testsp/华南/海南云龙莲雾.jpg", 71, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 49.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "海南新鲜榴莲蜜", "img/testsp/华南/海南新鲜榴莲蜜.jpg", 525, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 40.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "海南椰丝", "img/testsp/华南/海南椰丝.jpg", 780, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 28.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "海南椰子鸡", "img/testsp/华南/海南椰子鸡.png", 667, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 32.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "海南牛奶椰子", "img/testsp/华南/海南牛奶椰子.jpg", 807, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 47.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "海南莲雾", "img/testsp/华南/海南莲雾.jpg", 312, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 33.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "港式叉烧", "img/testsp/华南/港式叉烧.jpg", 102, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 7.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "港式叉烧包", "img/testsp/华南/港式叉烧包.jpg", 82, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 21.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "湿包菠萝蜜", "img/testsp/华南/湿包菠萝蜜.jpg", 742, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 33.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "福建鲍鱼", "img/testsp/华南/福建鲍鱼.png", 76, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 18.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "福建黄花鱼丸", "img/testsp/华南/福建黄花鱼丸.jpg", 100, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 41.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "粤式叉烧", "img/testsp/华南/粤式叉烧.jpg", 967, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 46.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "粤式点心", "img/testsp/华南/粤式点心.jpg", 320, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 44.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "粤式蜜汁叉烧肉", "img/testsp/华南/粤式蜜汁叉烧肉.jpg", 476, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 6.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "纯三七", "img/testsp/华南/纯三七.jpg", 114, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 29.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "老椰子", "img/testsp/华南/老椰子.jpg", 865, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 12.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "脱水菠萝蜜", "img/testsp/华南/脱水菠萝蜜.jpg", 104, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 15.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "芋丝糕", "img/testsp/华南/芋丝糕.jpg", 175, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 36.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "菠萝蜜", "img/testsp/华南/菠萝蜜.jpg", 677, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 42.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "蜜汁叉烧包", "img/testsp/华南/蜜汁叉烧包.jpg", 310, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 23.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "蜜汁叉烧肉", "img/testsp/华南/蜜汁叉烧肉.jpg", 679, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 5.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "螺满地螺蛳粉", "img/testsp/华南/螺满地螺蛳粉.jpg", 230, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 7.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "螺蛳粉", "img/testsp/华南/螺蛳粉.jpg", 538, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 9.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "金味马拉糕", "img/testsp/华南/金味马拉糕.jpg", 766, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 5.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "金城芋头糕", "img/testsp/华南/金城芋头糕.jpg", 639, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 36.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("10", "香水柠檬", "img/testsp/华南/香水柠檬.jpg", 95, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 12.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "鲍鱼佛跳墙", "img/testsp/华南/鲍鱼佛跳墙.jpg", 606, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 20.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("7", "鲜香酸辣粉", "img/testsp/华南/鲜香酸辣粉.jpg", 294, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "华南", 40.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "乌江榨菜", "img/testsp/西南/乌江榨菜.jpg", 324, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 16.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "云南花椒", "img/testsp/西南/云南花椒.jpg", 563, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 46.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "五花腊肉", "img/testsp/西南/五花腊肉.jpg", 954, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 31.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "农家土猪", "img/testsp/西南/农家土猪.jpg", 910, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 30.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "冷吃兔头", "img/testsp/西南/冷吃兔头.jpg", 585, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 22.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "古蜀叶儿粑", "img/testsp/西南/古蜀叶儿粑.jpg", 594, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 39.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "古镇麻花", "img/testsp/西南/古镇麻花.gif", 200, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 35.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "叶儿粑", "img/testsp/西南/叶儿粑.jpg", 472, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 20.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "四川宜宾燃面", "img/testsp/西南/四川宜宾燃面.jpg", 474, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 11.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "四川酸辣粉", "img/testsp/西南/四川酸辣粉.png", 936, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 32.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "土家腊肉", "img/testsp/西南/土家腊肉.jpg", 723, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 30.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "太白酒", "img/testsp/西南/太白酒.jpg", 702, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 10.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "宜宾叶儿粑", "img/testsp/西南/宜宾叶儿粑.jpg", 447, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 21.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "宜宾燃面", "img/testsp/西南/宜宾燃面.jpg", 136, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 40.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "小包涪陵榨菜", "img/testsp/西南/小包涪陵榨菜.jpg", 67, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 7.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "怪味胡豆", "img/testsp/西南/怪味胡豆.jpg", 888, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 14.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "成都手撕兔", "img/testsp/西南/成都手撕兔.jpg", 372, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 15.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "歌乐山辣子鸡", "img/testsp/西南/歌乐山辣子鸡.png", 540, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 14.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "水豆豉", "img/testsp/西南/水豆豉.jpg", 607, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 46.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "涪陵乌江榨菜", "img/testsp/西南/涪陵乌江榨菜.jpg", 141, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 49.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "涪陵榨菜", "img/testsp/西南/涪陵榨菜.jpg", 518, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 10.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "灯影牛肉", "img/testsp/西南/灯影牛肉.jpg", 517, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 27.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "灯影牛肉丝", "img/testsp/西南/灯影牛肉丝.jpg", 827, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 31.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "牛肉豆豉", "img/testsp/西南/牛肉豆豉.jpg", 835, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 8.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "特级豆瓣酱", "img/testsp/西南/特级豆瓣酱.jpg", 361, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 43.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "磁器口陈麻花", "img/testsp/西南/磁器口陈麻花.jpg", 138, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 37.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "磁器口麻花", "img/testsp/西南/磁器口麻花.jpg", 528, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 29.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "老腊肉", "img/testsp/西南/老腊肉.jpg", 327, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 42.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "西南咸鸭蛋", "img/testsp/西南/西南咸鸭蛋.jpg", 730, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 5.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "西南花生酥", "img/testsp/西南/西南花生酥.jpg", 789, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 29.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "西南香辛料", "img/testsp/西南/西南香辛料.jpg", 388, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 19.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "记忆燃面", "img/testsp/西南/记忆燃面.jpg", 886, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 18.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "诗仙太白", "img/testsp/西南/诗仙太白.jpg", 273, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 6.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "贵州豆腐乳", "img/testsp/西南/贵州豆腐乳.jpg", 125, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 8.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "辣子鸡", "img/testsp/西南/辣子鸡.jpg", 414, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 42.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "辣椒段", "img/testsp/西南/辣椒段.jpg", 406, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 12.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "遵义辣子鸡", "img/testsp/西南/遵义辣子鸡.jpg", 223, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 48.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "郫县豆瓣酱", "img/testsp/西南/郫县豆瓣酱.jpg", 781, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 31.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "重庆干溜小面", "img/testsp/西南/重庆干溜小面.jpg", 837, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 12.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "重庆怪味胡豆", "img/testsp/西南/重庆怪味胡豆.jpg", 524, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 27.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "重庆火锅底料", "img/testsp/西南/重庆火锅底料.jpg", 702, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 19.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("3", "重庆辣子鸡", "img/testsp/西南/重庆辣子鸡.png", 934, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 26.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "重庆酸辣粉", "img/testsp/西南/重庆酸辣粉.jpg", 351, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 19.00);
insert into specialty(sID, name, picUrl, stock, detail, category, price) values("9", "陈酿太白酒", "img/testsp/西南/陈酿太白酒.jpg", 974, "小面是作为南方人的重庆市民唯一普遍接受的面食。重庆人对重庆小面的热爱不亚于火锅，亲密度更是有过之而无不及。重庆人喜爱小面与其说上瘾，不如说是一种依赖。每天清早起来，街边的面摊格外红火，尽管一些店面装修的不太好，甚至就是路边摊。但是，美女们在这个时候也从不顾及自己的淑女形象，吃着那个香哦。", "西南", 35.00);
