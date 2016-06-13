--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2016-06-14 00:15:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 189 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 189
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 37353)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customer (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    imgurl character varying(255),
    login character varying(255) NOT NULL,
    password character varying(255),
    role character varying(255),
    status character varying(255),
    portfolio_id integer
);


ALTER TABLE customer OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 37361)
-- Name: de_infos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE de_infos (
    de_id integer NOT NULL,
    info character varying(3000),
    language character varying(255) NOT NULL
);


ALTER TABLE de_infos OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 37369)
-- Name: de_names; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE de_names (
    de_id integer NOT NULL,
    name character varying(255),
    language character varying(255) NOT NULL
);


ALTER TABLE de_names OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 37294)
-- Name: describedentity; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE describedentity (
    id integer NOT NULL,
    isactive boolean NOT NULL
);


ALTER TABLE describedentity OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 37299)
-- Name: feedback; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE feedback (
    id integer NOT NULL,
    rating integer NOT NULL,
    text character varying(255),
    author_id integer
);


ALTER TABLE feedback OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 37482)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 37304)
-- Name: place; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE place (
    imgurl character varying(255),
    lat character varying(255),
    lng character varying(255),
    id integer NOT NULL
);


ALTER TABLE place OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 37312)
-- Name: portfolio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE portfolio (
    id integer NOT NULL,
    text character varying(255)
);


ALTER TABLE portfolio OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 37317)
-- Name: portfolio_feedback; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE portfolio_feedback (
    portfolio_id integer NOT NULL,
    feedbacks_id integer NOT NULL
);


ALTER TABLE portfolio_feedback OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 37320)
-- Name: portfolio_imageurls; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE portfolio_imageurls (
    portfolio_id integer NOT NULL,
    imageurls character varying(255)
);


ALTER TABLE portfolio_imageurls OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 37323)
-- Name: request; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE request (
    id integer NOT NULL,
    comment character varying(255),
    enddate bytea,
    startdate bytea,
    author_id integer
);


ALTER TABLE request OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 37122)
-- Name: request_place; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE request_place (
    request_id integer NOT NULL,
    places_id integer NOT NULL
);


ALTER TABLE request_place OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 37331)
-- Name: route; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE route (
    complexity character varying(255),
    duration integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE route OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 37336)
-- Name: route_place; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE route_place (
    route_id integer NOT NULL,
    places_id integer NOT NULL
);


ALTER TABLE route_place OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 37339)
-- Name: tour; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tour (
    capacity integer NOT NULL,
    enddate bytea,
    price double precision NOT NULL,
    startdate bytea,
    id integer NOT NULL,
    guide_id integer,
    route_id integer
);


ALTER TABLE tour OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 37350)
-- Name: tour_customer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tour_customer (
    tour_id integer NOT NULL,
    participants_id integer NOT NULL
);


ALTER TABLE tour_customer OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 37347)
-- Name: tour_feedback; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tour_feedback (
    tour_id integer NOT NULL,
    feedbacks_id integer NOT NULL
);


ALTER TABLE tour_feedback OWNER TO postgres;

--
-- TOC entry 2118 (class 0 OID 37353)
-- Dependencies: 185
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer (id, email, imgurl, login, password, role, status, portfolio_id) FROM stdin;
1	admin@gmail.com	\N	admin	$2a$10$WzGnJAcPS1USPaUBHcftE.mvLqJDvTL2oDaQUm1ifHQgJJx3M6dtS	ROLE_ADMIN	ACTIVE	\N
17	seryoga.dah@gmail.com	\N	serg1236	$2a$10$WkpgO/7FBGHPp927steIyOsCM/Z7OiCCnLMjdT8rucRnjtyNT5EtO	ROLE_REGISTERED_USER	ACTIVE	\N
18	howard@gmail.com	\N	howard	$2a$10$Getlvxj8ufT9ubunhj0MIeG7aZ6i36q5rR9BHAHTeGhFpP283Hce6	ROLE_REGISTERED_USER	ACTIVE	\N
23	new_user@gmail.com	\N	new_user	$2a$10$bq9Tm5ZcxOHqHbQ52E62TuyQmqGDOx0FdSv7q1o308rrODZa2Y3dm	ROLE_REGISTERED_USER	ACTIVE	\N
24	new_user1@gmail.com	\N	new_user1	$2a$10$PSI5iNYwW8WEDLJprgrDn..WyV3bFNJlIiUzq7kAFc8RlROiCTyvu	ROLE_REGISTERED_USER	ACTIVE	\N
34	Sergiy_Dakhniy@epam.com	\N	Сергій	$2a$10$x2cZlSR7SmjEtwVXOFnxcOOyV99SQ4.zz9V3ce1dxp4RWFXbVg3uC	ROLE_REGISTERED_USER	ACTIVE	\N
\.


--
-- TOC entry 2119 (class 0 OID 37361)
-- Dependencies: 186
-- Data for Name: de_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY de_infos (de_id, info, language) FROM stdin;
2	Гове́рла (рум. Hovârla, угор. Hoverla, давня назва угор. Hóvár) — найвища вершина Українських Карпат і найвища точка України, висота 2061 м. Назва походить із румунської howirla, що означає «важкопрохідне підняття», або з угорської Hóvár, що означає «снігова вершина». Розміщена в гірському масиві Чорногора, на межі Надвірнянського району Івано-Франківської області та Рахівського району Закарпатської області за 17 кілометрів від кордону з Румунією.	EN
3	Пе́трос — гора в Українських Карпатах, у Рахівському районі Закарпатської області. Одна з найвищих вершин гірського масиву Чорногора. Популярний об'єкт пішохідного туризму.	EN
4	Розташована в центральній частині хребта Чорногора, між вершинами Туркул (на північному заході) і Бребенескул (на південному сході) та Гутин Томнатик (на півдні), на межі Івано-Франківської та Закарпатської областей.\n\nВисота 2001 м. Південні схили Ребри — пологі ділянки (вкриті переважно травостоєм з щучника дернистого і біловуса) та крутосхили, вкриті криволіссям. Північні та північно-східні схили спадають крутими скелястими урвищами. На захід від вершини, у розлогому льодовиковому карі розташовані невеликі високогірні озера.	EN
5	Несамови́те — одне з найвище розташованих озер Українських Карпат (1750 м над рівнем моря). Розташоване в межах Надвірнянського району Івано-Франківської області.\n\nЛежить у межах Карпатського національного парку, в льодовиковому карі (впадині) на східних схилах гори Туркул (масив Чорногора).	EN
6	Піп Іва́н Чорногірський (Чорна Гора або просто Піп Іван) — одна з найвищих вершин Українських Карпат. Розташована на південно-східному кінці головного хребта масиву Чорногора, на межі Івано-Франківської та Закарпатської областей.\n\nЗа переказами, свою назву дістала від скелі на вершині, яка нагадувала священика в рясі. Нині від скелі залишилася безформна купа каміння.	EN
7	Бребене́скул — найбільш високогірне озеро України (1801 м над рівнем моря); гідрологічна пам'ятка природи місцевого значення (зареєстрована як Озеро Бербеняскул).\n\nЛежить у межах Рахівського району Закарпатської області, на території Чорногірського заповідного масиву (частина Карпатського біосферного заповідника).	EN
8	Підйом на 2 двотисячники	EN
9	Перехід через Бребенескул з ймовірним привалом	EN
10	Підйом на Говерлу, привал на Несамовитому, пперехід до Бребенескула	EN
11	Підйом на найвищу точку України. Перехід по мальовничому хребту до двох живописних озер: Несамовите та Бребенескул. Ночівля в долині озера Несамовите.	EN
12	Підйом на найвищу точку України. Перехід по мальовничому хребту до двох живописних озер: Несамовите та Бребенескул. Ночівля в долині озера Несамовите.	EN
13	Підйом на Петрос у перший день. Ночівля на хребті між Петросом та Говерлою. У другий день підйом на Говерлу.	EN
14	Подорувальникам відкриваються мальовничі схили карпатський ребер, згодом і вся Чорногора з вершини одноіменного двотисячника. Подорож завершує знаменита обсерваторія "Білий слон" на вершині Попа Івана.	EN
15	lkwjsdlgjalfsjljk	EN
16	kjsldjlvlcjxlkv	EN
22	падлопдлоадвпоо адлвопдлавождіпоіваодлпо	EN
27	Один з двотисячників Карпат!	EN
28	Чудовий маршрут для досвідчених мандрівників	EN
29	Чудова можливість відчути дух Карпат!	EN
30	Бребене́скул — одна з найвищих вершин хребта Чорногора (Українські Карпати). Розташована посередині хребта, на межі Івано-Франківської та Закарпатської областей, між вершинами Менчул (1998 м) на південному сході та Ребра (2001 м) на північному заході.	EN
31	Чудовий 3-денний маршрут!	EN
32	Літня подорож з 3ома 2тисячниками!	EN
\.


--
-- TOC entry 2120 (class 0 OID 37369)
-- Dependencies: 187
-- Data for Name: de_names; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY de_names (de_id, name, language) FROM stdin;
2	Говерла	EN
3	Петрос	EN
4	Ребра	EN
5	Озеро Несамовите	EN
6	Піп Іван Чорногірський	EN
7	Озеро Бребенескул	EN
8	Петрос і Говерла	EN
9	Від Ребри до Попа	EN
10	Говерла і озера	EN
11	2 дні на Чорногорі	EN
12	2 дні на Чорногорі (осінь)	EN
13	Від Петроса до Говерли	EN
14	Чорногірські двотисячники	EN
15	lkjklsjdklasjl	EN
16	lkjlkj	EN
22	бре	EN
27	Бребенескул	EN
29	Літом у Карпати	EN
28	3 по 2 тисячі і 2 озера	EN
30	Бребенескул	EN
31	Від Петроса до Бребенескула	EN
32	Літом до Карпат	EN
\.


--
-- TOC entry 2106 (class 0 OID 37294)
-- Dependencies: 173
-- Data for Name: describedentity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY describedentity (id, isactive) FROM stdin;
2	t
3	t
4	t
5	t
6	t
7	t
8	t
9	t
10	t
11	t
12	t
13	t
14	t
15	t
16	t
22	t
27	t
28	t
29	t
30	t
31	t
32	t
\.


--
-- TOC entry 2107 (class 0 OID 37299)
-- Dependencies: 174
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY feedback (id, rating, text, author_id) FROM stdin;
19	4	Ходив так в жовтні. Якість проведеного часу дуже залежить від погоди:(	17
20	4	Ходив так в жовтні. Якість проведеного часу дуже залежить від погоди:(	17
21	5	Чекаю з нетерпінням!	18
25	5	Чудовий тур!!!	24
33	5	Мені подобається!!	1
\.


--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 188
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 35, true);


--
-- TOC entry 2108 (class 0 OID 37304)
-- Dependencies: 175
-- Data for Name: place; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY place (imgurl, lat, lng, id) FROM stdin;
http://res.cloudinary.com/imagine/image/upload/v1464806578/x07x0fxtlkpjwk2agvna.jpg	48.16021728587421	24.50018260627985	2
http://res.cloudinary.com/imagine/image/upload/v1464806808/yxkwu0uyad9obzifvuha.jpg	48.173183531565265	24.41960871219635	3
http://res.cloudinary.com/imagine/image/upload/v1464806993/bldrfh3jlxxifn96drat.jpg	48.115683488677305	24.556377232074738	4
http://res.cloudinary.com/imagine/image/upload/v1464807077/mhbl7g9mvnkvdeor07lq.jpg	48.12233021120403	24.539382755756378	5
http://res.cloudinary.com/imagine/image/upload/v1464807224/y7mizd8fp7xae7d9ujab.jpg	48.04685947903043	24.62751243263483	6
http://res.cloudinary.com/imagine/image/upload/v1464807711/rtxxlkgumcouyy88flea.jpg	48.102201180339605	24.561280477792025	7
http://res.cloudinary.com/imagine/image/upload/v1465420215/dwb84wvjsn5usqb8ntpx.jpg	48.102387463741465	24.575946629047394	30
\.


--
-- TOC entry 2109 (class 0 OID 37312)
-- Dependencies: 176
-- Data for Name: portfolio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY portfolio (id, text) FROM stdin;
\.


--
-- TOC entry 2110 (class 0 OID 37317)
-- Dependencies: 177
-- Data for Name: portfolio_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY portfolio_feedback (portfolio_id, feedbacks_id) FROM stdin;
\.


--
-- TOC entry 2111 (class 0 OID 37320)
-- Dependencies: 178
-- Data for Name: portfolio_imageurls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY portfolio_imageurls (portfolio_id, imageurls) FROM stdin;
\.


--
-- TOC entry 2112 (class 0 OID 37323)
-- Dependencies: 179
-- Data for Name: request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY request (id, comment, enddate, startdate, author_id) FROM stdin;
35	Чи є у вас походи на Пікуй? Я б приєднався!	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007e0061e78	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007e0061478	34
\.


--
-- TOC entry 2105 (class 0 OID 37122)
-- Dependencies: 172
-- Data for Name: request_place; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY request_place (request_id, places_id) FROM stdin;
\.


--
-- TOC entry 2113 (class 0 OID 37331)
-- Dependencies: 180
-- Data for Name: route; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY route (complexity, duration, id) FROM stdin;
AVERAGE	0	8
AVERAGE	0	9
LOW	0	10
AVERAGE	0	31
\.


--
-- TOC entry 2114 (class 0 OID 37336)
-- Dependencies: 181
-- Data for Name: route_place; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY route_place (route_id, places_id) FROM stdin;
8	3
8	2
9	4
9	7
9	6
10	2
10	5
10	7
31	3
31	2
31	7
31	30
\.


--
-- TOC entry 2115 (class 0 OID 37339)
-- Dependencies: 182
-- Data for Name: tour; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tour (capacity, enddate, price, startdate, id, guide_id, route_id) FROM stdin;
8	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007e0061778	250	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007e0061478	11	\N	10
8	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007e0090378	250	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007e0090178	12	\N	10
5	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007e0060b78	300	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007e0060878	13	\N	8
5	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007e0061278	300	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007e0060f78	14	\N	9
4	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007e0061278	230	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007e0060f78	32	\N	31
\.


--
-- TOC entry 2117 (class 0 OID 37350)
-- Dependencies: 184
-- Data for Name: tour_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tour_customer (tour_id, participants_id) FROM stdin;
12	18
13	17
13	24
13	1
11	17
11	18
11	23
\.


--
-- TOC entry 2116 (class 0 OID 37347)
-- Dependencies: 183
-- Data for Name: tour_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tour_feedback (tour_id, feedbacks_id) FROM stdin;
11	19
11	21
11	25
11	33
\.


--
-- TOC entry 1968 (class 2606 OID 37360)
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 1974 (class 2606 OID 37368)
-- Name: de_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY de_infos
    ADD CONSTRAINT de_infos_pkey PRIMARY KEY (de_id, language);


--
-- TOC entry 1976 (class 2606 OID 37376)
-- Name: de_names_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY de_names
    ADD CONSTRAINT de_names_pkey PRIMARY KEY (de_id, language);


--
-- TOC entry 1948 (class 2606 OID 37298)
-- Name: describedentity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY describedentity
    ADD CONSTRAINT describedentity_pkey PRIMARY KEY (id);


--
-- TOC entry 1950 (class 2606 OID 37303)
-- Name: feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- TOC entry 1952 (class 2606 OID 37311)
-- Name: place_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY place
    ADD CONSTRAINT place_pkey PRIMARY KEY (id);


--
-- TOC entry 1956 (class 2606 OID 37316)
-- Name: portfolio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY portfolio
    ADD CONSTRAINT portfolio_pkey PRIMARY KEY (id);


--
-- TOC entry 1960 (class 2606 OID 37330)
-- Name: request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY request
    ADD CONSTRAINT request_pkey PRIMARY KEY (id);


--
-- TOC entry 1962 (class 2606 OID 37335)
-- Name: route_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY route
    ADD CONSTRAINT route_pkey PRIMARY KEY (id);


--
-- TOC entry 1964 (class 2606 OID 37346)
-- Name: tour_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT tour_pkey PRIMARY KEY (id);


--
-- TOC entry 1954 (class 2606 OID 37378)
-- Name: uk_32se21ckbdldkiu41kqytp93c; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY place
    ADD CONSTRAINT uk_32se21ckbdldkiu41kqytp93c UNIQUE (lng, lat);


--
-- TOC entry 1970 (class 2606 OID 37384)
-- Name: uk_dwk6cx0afu8bs9o4t536v1j5v; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT uk_dwk6cx0afu8bs9o4t536v1j5v UNIQUE (email);


--
-- TOC entry 1966 (class 2606 OID 37382)
-- Name: uk_fuekqhsfk85x9kuf2qfh98r4j; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tour_feedback
    ADD CONSTRAINT uk_fuekqhsfk85x9kuf2qfh98r4j UNIQUE (feedbacks_id);


--
-- TOC entry 1958 (class 2606 OID 37380)
-- Name: uk_i2j0r48cft1xyv4lrnq69cevr; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY portfolio_feedback
    ADD CONSTRAINT uk_i2j0r48cft1xyv4lrnq69cevr UNIQUE (feedbacks_id);


--
-- TOC entry 1972 (class 2606 OID 37386)
-- Name: uk_l4t3rudi0h7ibnjpnbvcnkcbf; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT uk_l4t3rudi0h7ibnjpnbvcnkcbf UNIQUE (login);


--
-- TOC entry 1982 (class 2606 OID 37412)
-- Name: fk_1q6cqlei4op7sv5wc7n7r1q96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY request
    ADD CONSTRAINT fk_1q6cqlei4op7sv5wc7n7r1q96 FOREIGN KEY (author_id) REFERENCES customer(id);


--
-- TOC entry 1983 (class 2606 OID 37417)
-- Name: fk_3my8x5i9sjcfhy541usuf9pbi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY route
    ADD CONSTRAINT fk_3my8x5i9sjcfhy541usuf9pbi FOREIGN KEY (id) REFERENCES describedentity(id);


--
-- TOC entry 1980 (class 2606 OID 37402)
-- Name: fk_42ku85cx2uq9ppxe72xtxhssa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY portfolio_feedback
    ADD CONSTRAINT fk_42ku85cx2uq9ppxe72xtxhssa FOREIGN KEY (portfolio_id) REFERENCES portfolio(id);


--
-- TOC entry 1978 (class 2606 OID 37392)
-- Name: fk_6et9ynmct1d17ibj61inhib70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY place
    ADD CONSTRAINT fk_6et9ynmct1d17ibj61inhib70 FOREIGN KEY (id) REFERENCES describedentity(id);


--
-- TOC entry 1991 (class 2606 OID 37457)
-- Name: fk_7mluhavwbjqlfkuj9uo24qidk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tour_customer
    ADD CONSTRAINT fk_7mluhavwbjqlfkuj9uo24qidk FOREIGN KEY (participants_id) REFERENCES customer(id);


--
-- TOC entry 1985 (class 2606 OID 37427)
-- Name: fk_8m558v0dbd355jsw9ecc72tsn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY route_place
    ADD CONSTRAINT fk_8m558v0dbd355jsw9ecc72tsn FOREIGN KEY (route_id) REFERENCES route(id);


--
-- TOC entry 1987 (class 2606 OID 37437)
-- Name: fk_b1ix4y5n6rc0gy3w1vh76kdpd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT fk_b1ix4y5n6rc0gy3w1vh76kdpd FOREIGN KEY (route_id) REFERENCES route(id);


--
-- TOC entry 1990 (class 2606 OID 37452)
-- Name: fk_b1kp5hd53t93kxw1awvah6dit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tour_feedback
    ADD CONSTRAINT fk_b1kp5hd53t93kxw1awvah6dit FOREIGN KEY (tour_id) REFERENCES tour(id);


--
-- TOC entry 1992 (class 2606 OID 37462)
-- Name: fk_c7cs6itvj2wv88jr6h2ghsnys; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tour_customer
    ADD CONSTRAINT fk_c7cs6itvj2wv88jr6h2ghsnys FOREIGN KEY (tour_id) REFERENCES tour(id);


--
-- TOC entry 1993 (class 2606 OID 37467)
-- Name: fk_cahemp800hgdpsju2p6h732du; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT fk_cahemp800hgdpsju2p6h732du FOREIGN KEY (portfolio_id) REFERENCES portfolio(id);


--
-- TOC entry 1989 (class 2606 OID 37447)
-- Name: fk_fuekqhsfk85x9kuf2qfh98r4j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tour_feedback
    ADD CONSTRAINT fk_fuekqhsfk85x9kuf2qfh98r4j FOREIGN KEY (feedbacks_id) REFERENCES feedback(id);


--
-- TOC entry 1979 (class 2606 OID 37397)
-- Name: fk_i2j0r48cft1xyv4lrnq69cevr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY portfolio_feedback
    ADD CONSTRAINT fk_i2j0r48cft1xyv4lrnq69cevr FOREIGN KEY (feedbacks_id) REFERENCES feedback(id);


--
-- TOC entry 1988 (class 2606 OID 37442)
-- Name: fk_jps4a11svhhuh3r19eqju5x4q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT fk_jps4a11svhhuh3r19eqju5x4q FOREIGN KEY (id) REFERENCES describedentity(id);


--
-- TOC entry 1994 (class 2606 OID 37472)
-- Name: fk_kmruey9bldureseqw5dp789li; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY de_infos
    ADD CONSTRAINT fk_kmruey9bldureseqw5dp789li FOREIGN KEY (de_id) REFERENCES describedentity(id);


--
-- TOC entry 1984 (class 2606 OID 37422)
-- Name: fk_lqhubb52x078410rs2sa4jy4y; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY route_place
    ADD CONSTRAINT fk_lqhubb52x078410rs2sa4jy4y FOREIGN KEY (places_id) REFERENCES place(id);


--
-- TOC entry 1986 (class 2606 OID 37432)
-- Name: fk_nuyt6pubqykmtm61s1frnea1i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT fk_nuyt6pubqykmtm61s1frnea1i FOREIGN KEY (guide_id) REFERENCES customer(id);


--
-- TOC entry 1995 (class 2606 OID 37477)
-- Name: fk_pbetdp7808cwvtahvt72thonh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY de_names
    ADD CONSTRAINT fk_pbetdp7808cwvtahvt72thonh FOREIGN KEY (de_id) REFERENCES describedentity(id);


--
-- TOC entry 1981 (class 2606 OID 37407)
-- Name: fk_ri6mdm1jh2c330vxv9kjup2ny; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY portfolio_imageurls
    ADD CONSTRAINT fk_ri6mdm1jh2c330vxv9kjup2ny FOREIGN KEY (portfolio_id) REFERENCES portfolio(id);


--
-- TOC entry 1977 (class 2606 OID 37387)
-- Name: fk_rroh2tfwf8h5w0bwsqg51rdhe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY feedback
    ADD CONSTRAINT fk_rroh2tfwf8h5w0bwsqg51rdhe FOREIGN KEY (author_id) REFERENCES customer(id);


--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-06-14 00:15:14

--
-- PostgreSQL database dump complete
--

