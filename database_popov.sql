BEGIN

CREATE TABLE shop (
   id serial PRIMARY KEY,
   city varchar(255),
   street varchar(255),
   house_number varchar(255),
   coordinate_x integer,
   coordinate_y integer,
   date_open date,
   date_close date
)

CREATE TABLE department (
    id serial PRIMARY KEY,
    name varchar(255)
)

CREATE TABLE division (
    id serial PRIMARY KEY,
    name varchar(255),
    description varchar(255),
    date_start date,
    department_id integer REFERENCES department
)

CREATE TABLE employee (
    id serial PRIMARY KEY,
    name varchar(255),
    surname varchar(255),
    second_name varchar(255),
    shop_id integer REFERENCES shop,
    division_id integer REFERENCES division,
    birth_date data,
    date_start date,
    date_finish date
)

CREATE TABLE schedule (
    start_time varchar(255),
    finish_time varchar(255),
    working_day varchar(255),
    employee_id integer REFERENCES employee
)

CREATE TABLE supplier (
    id serial PRIMARY KEY,
    name varchar(255),
    adress varchar(255),
    email varchar(255),
    number varchar(255),
)

CREATE TABLE product (
id serial PRIMARY KEY,
name varchar(255) NOT NULL UNIQUE
)

CREATE TABLE property (
id serial PRIMARY KEY,
product_id integer REFERENCES product,
category varchar(255),
description varchar(255)
)

CREATE TABLE supply (
    id serial PRIMARY KEY,
    employee_id integer REFERENCES employee,
    shop_id integer REFERENCES shop,
    supplier_id integer REFERENCES supplier,
    product_id integer REFERENCES product,
    price integer,
    amount integer
)

CREATE TABLE shop_product (
    id serial PRIMARY KEY,
    shop_id integer REFERENCES shop,
    product_id integer REFERENCES product,
    price integer,
    amount integer
)

CREATE TABLE client (
    id serial PRIMARY KEY,
    name varchar(255),
    surname varchar(255),
    second_name varchar(255),
    email varchar(255),
    number varchar(255),
)

CREATE TABLE buy (
    id serial PRIMARY KEY,
    client_id integer REFERENCES client,
    shop_product_id ineger REFERENCES shop_product,
    date_buy date
)

CREATE TABLE discount (
    id serial PRIMARY KEY,
    client_id integer REFERENCES client,
    product_id integer REFERENCES product,
    date_start date,
    date_finish date
    discount_price integer
)


CREATE TABLE price_history (
    id serial PRIMARY KEY,
    shop_product_id ineger REFERENCES shop_product,
    old_price integer,
    new_price integer,
    date_change date
)

CREATE TABLE warehouse (
    id serial PRIMARY KEY,
    product_id ineger REFERENCES product,
    amount integer
)

INSERT INTO shop(name, city, street, house_number, coordinate_x, coordinate_x, date_open, date_close) 
VALUES
('Hackett, Jast and Trantow', 'Onieton', 'Ima Avenue','155', 35, 25, 'Mon Apr 06 2020 17:03:22 GMT+0300 (GMT+03:00)', 'Fri May 29 2020 15:37:27 GMT+0300 (GMT+03:00)'),
('Hills and Sons', 'West Rollinborough', 'Colten Unions','35', 40, 66, 'Tue Mar 17 2020 20:40:47 GMT+0300 (GMT+03:00)', 'Fri May 29 2020 01:35:56 GMT+0300 (GMT+03:00)'),   
('Boehm Inc', 'Raynorport', 'Cornelius Gateway','109', 1, 53, 'Mon Apr 27 2020 21:42:05 GMT+0300 (GMT+03:00)', 'Fri May 29 2020 15:01:19 GMT+0300 (GMT+03:00)'),
('Rodriguez - Rice', 'Pollichmouth', 'Gladys Coves','114', 35, 16, 'Mon Mar 02 2020 08:00:42 GMT+0300 (GMT+03:00)', 'Fri May 29 2020 02:46:37 GMT+0300 (GMT+03:00)'),       
('Collins, Wolff and Boyer', 'Port Brigittemouth', 'Amira Ford','80', 96, 42, 'Fri Feb 21 2020 13:39:39 GMT+0300 (GMT+03:00)', 'Fri May 29 2020 18:09:12 GMT+0300 (GMT+03:00)'),
('Doyle LLC', 'Collierberg', 'Klocko Harbors','39', 84, 13, 'Thu Mar 19 2020 22:50:09 GMT+0300 (GMT+03:00)', 'Fri May 29 2020 01:59:14 GMT+0300 (GMT+03:00)'),
('Cummings - Gibson', 'North Donavonstad', 'Susanna Meadow','44', 54, 41, 'Fri May 01 2020 16:24:10 GMT+0300 (GMT+03:00)', 'Thu May 28 2020 22:10:39 GMT+0300 (GMT+03:00)'),
('Macejkovic - Armstrong', 'Vandervortstad', 'Xander Village','81', 43, 95, 'Tue Mar 17 2020 07:36:32 GMT+0300 (GMT+03:00)', 'Fri May 29 2020 15:15:08 GMT+0300 (GMT+03:00)'),
('Runolfsson - Purdy', 'East Drakeside', 'Ledner Cove','28', 56, 63, 'Mon Apr 27 2020 01:45:07 GMT+0300 (GMT+03:00)', 'Fri May 29 2020 14:05:50 GMT+0300 (GMT+03:00)'),     
('Kub, Heidenreich and Schulist', 'Lake Hailee', 'Kenyon Pike','59', 47, 60, 'Tue Apr 28 2020 00:09:31 GMT+0300 (GMT+03:00)', 'Fri May 29 2020 04:18:03 GMT+0300 (GMT+03:00)'),
('Altenwerth Group', 'North Jeniferburgh', 'Gia Fort','158', 78, 61, 'Thu Mar 19 2020 01:18:23 GMT+0300 (GMT+03:00)', 'Fri May 29 2020 16:07:54 GMT+0300 (GMT+03:00)'),     
('Keebler - Dietrich', 'Lake Freemanport', 'Summer Fall','31', 63, 96, 'Thu Mar 26 2020 09:09:58 GMT+0300 (GMT+03:00)', 'Fri May 29 2020 10:17:45 GMT+0300 (GMT+03:00)'),   
('Johnson, Auer and Schinner', 'North Abdiel', 'Kuhic Walk','108', 62, 4, 'Thu Apr 16 2020 02:02:43 GMT+0300 (GMT+03:00)', 'Fri May 29 2020 20:15:02 GMT+0300 (GMT+03:00)'),
('Goodwin, Yundt and Kihn', 'South Cheyenne', 'Jaiden Lake','191', 100, 34, 'Thu Mar 19 2020 03:33:25 GMT+0300 (GMT+03:00)', 'Fri  29 2020 00:34:24 GMT+0300 (GMT+03:00)'),
('Aufderhar, Hirthe and Sipes', 'Flatleyborough', 'Brycen Trail','180', 34, 70, 'Mon Apr 20 2020 19:13:14 GMT+0300 (GMT+03:00)', 'Fri Nov 29 2020 12:43:32 GMT+0300 (GMT+03:00)');

INSERT INTO department(name) 
VALUES
('Marketing'),('Finance'),('Management'),('Logistics'),('Security')

INSERT INTO divison(name, discription, date_start, department_id) 
VALUES
('Industrial', 'Minus rem dolore.', '2019-10-16T07:07:38.423Z',3),
('Home', 'Aut praesentium neque.', '2020-01-15T19:12:41.754Z',4),
('Baby', 'Excepturi dolores veniam possimus et asperiores fugiat.', '2019-12-28T00:50:48.162Z',5),
('Baby', 'Ut et saepe autem quod commodi.', '2019-10-16T08:09:01.848Z',5),
('Health', 'Velit aliquam quisquam dolor incidunt.', '2019-12-18T09:05:40.105Z',3),
('Sports', 'Est voluptatem vero hic cum voluptas.', '2020-02-07T10:38:07.788Z',2),
('Automotive', 'Quibusdam beatae recusandae voluptatem.', '2020-04-05T04:57:47.030Z',1),
('Books', 'Ut voluptas earum nihil.', '2020-02-16T01:15:01.810Z',5),
('Home', 'Recusandae id harum omnis vitae et temporibus totam.', '2020-03-30T23:22:09.738Z',1),
('Kids', 'A temporibus voluptatem amet sit id quia quo.', '2020-01-05T17:41:40.504Z',2);


INSERT INTO employee(name, surname, second_name, shop_id, division_id, birth_date, date_start, date_finish) 
VALUES
('Wilford', 'Weimann', 'Hildegard',15, 2, '2009-06-01T16:54:48.770Z', '2019-01-19T09:09:57.941Z', '2020-11-15T04:20:34.217Z'),
('Rahsaan', 'Cormier', 'Justice',11, 8, '1995-11-19T04:50:32.269Z', '2020-04-08T16:51:00.841Z', '2021-03-27T18:31:14.170Z'),
('Clark', 'Carter', 'Doyle',13, 10, '1998-01-10T01:25:29.044Z', '2020-05-04T02:56:41.626Z', '2021-04-12T03:03:10.254Z'),
('Letha', 'Lockman', 'William',15, 1, '1991-01-16T10:51:42.929Z', '2019-03-09T07:19:57.595Z', '2020-12-30T21:50:50.189Z'),
('Scarlett', 'Bergnaum', 'Caesar',13, 3, '2011-07-06T09:05:08.290Z', '2018-08-09T18:17:16.965Z', '2020-12-17T11:55:38.205Z'),
('Jeff', 'Kuvalis', 'Martin',15, 9, '2005-09-15T21:10:17.851Z', '2019-04-11T22:59:06.417Z', '2021-05-05T13:14:25.906Z'),
('Elias', 'Robel', 'Clarissa',10, 4, '1991-09-01T17:52:35.611Z', '2018-07-20T19:30:16.394Z', '2020-09-17T06:37:40.150Z'),
('Mossie', 'Ferry', 'Austen',9, 7, '2000-09-07T00:17:19.298Z', '2019-02-11T21:09:36.016Z', '2021-04-27T15:51:34.034Z'),
('Elnora', 'Homenick', 'Concepcion',2, 6, '2008-07-25T06:11:04.408Z', '2020-05-05T15:31:09.266Z', '2020-09-04T04:27:35.623Z'),
('Spencer', 'Bogan', 'Lela',10, 5, '1991-04-17T17:03:10.594Z', '2018-09-23T09:29:47.648Z', '2021-04-03T07:09:32.105Z'),
('Curt', 'Wolf', 'Ford',5, 5, '1990-06-28T16:27:56.778Z', '2019-12-08T13:33:55.321Z', '2021-03-14T23:42:13.048Z'),
('Corrine', 'Predovic', 'Betsy',8, 9, '2001-11-17T01:15:09.562Z', '2020-02-02T21:11:13.884Z', '2020-07-10T08:09:27.582Z'),
('Vernie', 'Bashirian', 'Janae',10, 3, '2000-02-01T16:39:49.460Z', '2018-07-31T01:03:25.078Z', '2020-08-27T02:43:48.302Z'),
('Tyson', 'Beer', 'Floy',11, 7, '1999-12-05T05:51:34.915Z', '2019-07-16T00:25:34.645Z', '2020-08-29T00:55:20.939Z'),
('Elvis', 'Rippin', 'Leatha',12, 9, '2000-02-12T15:23:24.332Z', '2019-03-11T11:02:33.308Z', '2020-06-21T19:27:15.983Z');

INSERT INTO schedule 
VALUES
('07:30','17:00','Friday', 12),
('09:00','19:00','Wednesday', 8),
('08:30','16:00','Tuesday', 3),
('07:30','17:00','Saturday', 9),
('07:30','17:00','Friday', 1),
('07:30','16:00','Sunday', 12),
('08:30','16:00','Tuesday', 4),
('13:30','22:00','Friday', 15),
('07:30','17:00','Monday', 5),
('13:30','22:00','Wednesday', 10),
('07:30','17:00','Thursday', 2),
('09:00','19:00','Thursday', 5),
('07:30','17:00','Thursday', 7),
('07:30','17:00','Monday', 4),
('09:00','19:00','Saturday', 1);

INSERT INTO supplier (name, adress, email, number)
VALUES
('Kunde - Rogahn','Suite 080','Marco_OHara@gmail.com','080-910-0220'),
('Schmitt LLC','Apt. 106','Elvie_Witting84@yahoo.com','476-521-8360'),
('Shanahan Inc','Suite 418','Nadia.Towne@gmail.com','596-171-7168'),
('Ondricka - Crist','Suite 361','Emmalee_Heidenreich@gmail.com','832-767-9478'),
('Hickle - Kris','Apt. 403','Meta.Dare@gmail.com','118-084-5615'),
('Hagenes - Thiel','Suite 129','Bethany6@gmail.com','082-572-3258'),
('Treutel Group','Suite 830','Effie_Keebler@hotmail.com','073-576-5454'),
('Denesik, Schuppe and Dickens','Suite 697','Kennedy.Roberts6@gmail.com','716-694-5416'),
('Bednar, Lockman and Erdman','Suite 726','Roxanne_Jenkins12@yahoo.com','250-795-2581'),
('Auer Group','Apt. 529','Zakary_Heathcote91@yahoo.com','101-607-5485');

INSERT INTO product (name)
VALUES
('Fish'),
('Ball'),
('Car'),
('Mouse'),
('Shoes'),
('Car'),
('Pants'),
('Keyboard'),
('Chicken'),
('Chips'),
('Sausages'),
('Pants'),
('Cheese'),
('Pizza'),
('Shirt'),
('Keyboard'),
('Bike'),
('Hat'),
('Gloves'),
('Hat')

INSERT INTO property (product_id, category, discription) 
VALUES
(6,'Concrete','Intelligent'),
(20,'Soft','Licensed'),
(6,'Wooden','Gorgeous'),
(12,'Wooden','Refined'),
(9,'Granite','Licensed'),
(9,'Wooden','Rustic'),
(17,'Wooden','Small'),
(5,'Wooden','Unbranded'),
(20,'Soft','Ergonomic'),
(11,'Wooden','Small'),
(4,'Concrete','Sleek'),
(12,'Cotton','Licensed'),
(13,'Granite','Licensed'),
(17,'Frozen','Licensed'),
(3,'Fresh','Unbranded'),
(2,'Fresh','Handcrafted'),
(13,'Frozen','Intelligent'),
(4,'Rubber','Handcrafted'),
(20,'Wooden','Tasty'),
(8,'Wooden','Rustic');

INSERT INTO supply (employee_id, shop_id, supplier_id, product_id, price, amount) 
VALUES
(1, 14, 4, 15, 224, 96),
(9, 14, 9, 13, 454, 52),
(11, 3, 2, 9, 105, 32),
(4, 11, 1, 5, 333, 84),
(13, 10, 7, 5, 252, 11),
(2, 3, 8, 15, 380, 68),
(11, 8, 8, 12, 236, 96),
(7, 9, 4, 20, 197, 37),
(10, 2, 2, 14, 391, 40),
(8, 4, 6, 2, 370, 69),
(9, 11, 10, 4, 115, 37),
(12, 13, 10, 11, 235, 92),
(14, 5, 10, 13, 275, 26),
(8, 13, 8, 5, 138, 87),
(8, 15, 9, 10, 352, 81),
(6, 8, 10, 14, 242, 28),
(14, 2, 5, 18, 197, 47),
(7, 7, 4, 5, 411, 86),
(3, 1, 6, 19, 254, 16),
(6, 3, 5, 7, 208, 70);

INSERT INTO shop_product (shop_id, product_id, price, amount) 
VALUES
(8, 8, 794, 11),
(8, 12, 727, 21),
(4, 4, 685, 79),
(12, 15, 490, 40),
(7, 20, 798, 54),
(15, 9, 341, 91),
(14, 6, 326, 62),
(2, 15, 408, 94),
(10, 8, 204, 43),
(7, 9, 696, 69),
(13, 11, 791, 88),
(12, 14, 752, 47),
(8, 20, 700, 10),
(3, 19, 548, 42),
(10, 7, 779, 70),
(3, 19, 679, 54),
(6, 15, 230, 19),
(6, 19, 534, 48),
(11, 18, 597, 68),
(6, 2, 707, 60);

INSERT INTO client (name, surname, second_name, email, number) 
VALUES
('Evan', 'Renner', 'Joelle', 'Kevin0@hotmail.com', '036-310-5136'),
('Cristobal', 'Shields', 'Travon', 'Sherwood_Jacobi@hotmail.com', '642-895-8745'),
('Mohamed', 'Parker', 'Jayne', 'Emilio_Kertzmann32@gmail.com', '887-232-6224'),
('Lois', 'Morar', 'Chance', 'Karen_Lesch@hotmail.com', '096-754-4732'),
('Tad', 'Stracke', 'Marcus', 'Noemy_Eichmann75@gmail.com', '446-414-8961'),
('Serenity', 'Block', 'Tremayne', 'Efrain94@gmail.com', '608-683-1474'),
('Zack', 'Rutherford', 'Lura', 'Marcelino14@gmail.com', '290-053-4235'),
('Maybell', 'Schaefer', 'Andre', 'Graciela51@yahoo.com', '071-298-7851'),
('Domenico', 'Anderson', 'Jaclyn', 'Vita32@gmail.com', '112-210-8209'),
('Dwight', 'Morissette', 'Evangeline', 'Jayce_Howell7@hotmail.com', '540-871-5094'),
('Brielle', 'Will', 'Justus', 'Ronaldo_Homenick0@hotmail.com', '101-514-7964'),
('Sid', 'Howe', 'Koby', 'Arjun_Towne88@hotmail.com', '676-789-7940'),
('Arne', 'Batz', 'Shanie', 'Deborah_Nader56@yahoo.com', '193-240-2474'),
('Columbus', 'Halvorson', 'Enrique', 'Christelle76@hotmail.com', '647-394-3190'),
('Princess', 'Gislason', 'Kevon', 'Lacy_Batz84@gmail.com', '211-683-2536'),
('Torey', 'MacGyver', 'Elian', 'Elmira.Bailey93@yahoo.com', '296-891-0787'),
('Guido', 'Hessel', 'Kirk', 'Tad37@yahoo.com', '380-897-2710'),
('Carlotta', 'Rau', 'Sadye', 'Kennedi57@gmail.com', '084-428-0769'),
('Haley', 'Grimes', 'Alda', 'Nelle_Wolff@hotmail.com', '314-883-3050'),
('Kasandra', 'Bins', 'Nicolas', 'Casimir_Rempel71@gmail.com', '597-966-9175');

INSERT INTO buy (client_id, shop_product_id, date_buy) 
VALUES
(5, 2, '2020-05-29T00:49:03.507Z'),
(14, 2, '2020-05-28T23:42:30.699Z'),
(8, 20, '2020-05-29T19:00:29.906Z'),
(14, 3, '2020-05-28T23:05:16.981Z'),
(7, 2, '2020-05-29T19:28:19.900Z'),
(9, 2, '2020-05-29T05:09:57.265Z'),
(15, 7, '2020-05-29T02:34:16.729Z'),
(19, 2, '2020-05-29T13:51:42.177Z'),
(20, 2, '2020-05-29T07:09:55.334Z'),
(14, 8, '2020-05-28T21:45:33.786Z'),
(16, 10, '2020-05-29T20:01:52.193Z'),
(4, 19, '2020-05-29T03:17:25.473Z'),
(5, 11, '2020-05-28T22:33:51.025Z'),
(18, 19, '2020-05-28T22:39:46.906Z'),
(9, 8, '2020-05-29T05:53:49.201Z'),
(1, 16, '2020-05-29T13:03:07.023Z'),
(17, 18, '2020-05-29T03:53:04.824Z'),
(16, 13, '2020-05-29T18:49:39.020Z'),
(1, 14, '2020-05-29T00:15:49.425Z'),
(2, 10, '2020-05-29T05:55:59.706Z');

INSERT INTO discount (client_id, product_id, date_start, date_finish, discount_price) 
VALUES
(2, 5, '2020-05-29T01:27:57.557Z', '2020-09-09T08:15:42.569Z', 816),
(14, 7, '2020-05-28T22:19:43.704Z', '2020-08-12T09:31:46.055Z', 799),
(2, 17, '2020-05-28T23:49:16.192Z', '2020-11-12T00:43:38.298Z', 1162),
(15, 2, '2020-05-29T10:11:58.315Z', '2020-10-02T05:25:01.328Z', 1129),
(10, 5, '2020-05-29T10:56:45.023Z', '2021-04-23T16:59:18.247Z', 1117),
(19, 10, '2020-05-29T09:45:32.370Z', '2021-03-02T03:21:13.644Z', 1469),
(2, 7, '2020-05-29T15:40:30.021Z', '2020-08-24T03:16:48.435Z', 742),
(19, 19, '2020-05-29T12:34:40.579Z', '2020-08-23T04:13:53.756Z', 700),
(16, 12, '2020-05-29T02:28:15.074Z', '2020-08-20T03:52:31.029Z', 641),
(1, 12, '2020-05-29T07:42:55.530Z', '2021-03-27T10:18:43.217Z', 1009),
(3, 14, '2020-05-29T00:36:40.442Z', '2021-04-27T07:02:19.451Z', 1129),
(18, 11, '2020-05-29T06:09:29.702Z', '2020-09-20T20:46:55.076Z', 581),
(14, 15, '2020-05-29T06:37:48.857Z', '2021-02-01T13:31:08.405Z', 1152),
(11, 20, '2020-05-29T04:24:43.341Z', '2020-09-04T08:16:49.418Z', 920),
(15, 19, '2020-05-29T18:51:51.262Z', '2020-09-28T22:56:38.311Z', 955),
(19, 16, '2020-05-29T09:15:06.976Z', '2021-01-04T12:14:09.918Z', 798),
(2, 5, '2020-05-29T04:39:13.672Z', '2020-09-16T10:09:31.223Z', 924),
(7, 15, '2020-05-28T21:56:26.025Z', '2020-11-07T02:47:38.093Z', 576),
(12, 10, '2020-05-29T10:13:48.600Z', '2020-09-19T06:10:01.417Z', 989),
(9, 10, '2020-05-29T18:35:36.859Z', '2020-06-02T08:51:13.164Z', 596);

INSERT INTO price_history (shop_product_id, old_price, new_price, date_change) 
VALUES
(1, 791, 735, '2019-09-22T08:54:20.564Z'),
(19, 351, 316, '2019-07-03T12:27:57.596Z'),
(3, 707, 402, '2019-11-22T08:52:24.143Z'),
(17, 641, 523, '2019-07-25T19:41:21.018Z'),
(7, 523, 420, '2019-10-29T11:36:36.317Z'),
(18, 248, 262, '2019-09-22T07:10:59.864Z'),
(17, 543, 273, '2019-06-10T22:37:45.635Z'),
(17, 447, 448, '2019-08-05T05:50:41.912Z'),
(5, 247, 669, '2019-10-26T18:39:40.201Z'),
(11, 470, 507, '2020-05-27T11:54:28.948Z');

INSERT INTO warehouse (product_id, amount) 
VALUES
(7, 85),
(12, 124),
(3, 83),
(9, 143),
(11, 155),
(9, 130),
(16, 70),
(1, 164),
(6, 196),
(6, 141),
(11, 192),
(10, 172),
(15, 176),
(4, 55),
(10, 59);

COMMIT