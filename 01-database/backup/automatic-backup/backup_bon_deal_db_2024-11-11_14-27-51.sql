--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-1.pgdg24.04+2)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-1.pgdg24.04+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: admin_bon_deal
--

CREATE TABLE public.orders (
    order_number bigint NOT NULL,
    order_total_cost_ht numeric(10,2) NOT NULL,
    order_total_quantity integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deliver_ato date,
    user_uuid uuid
);


ALTER TABLE public.orders OWNER TO admin_bon_deal;

--
-- Name: orders_order_number_seq; Type: SEQUENCE; Schema: public; Owner: admin_bon_deal
--

CREATE SEQUENCE public.orders_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_number_seq OWNER TO admin_bon_deal;

--
-- Name: orders_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_bon_deal
--

ALTER SEQUENCE public.orders_order_number_seq OWNED BY public.orders.order_number;


--
-- Name: orders_products; Type: TABLE; Schema: public; Owner: admin_bon_deal
--

CREATE TABLE public.orders_products (
    order_number bigint NOT NULL,
    product_uuid uuid NOT NULL
);


ALTER TABLE public.orders_products OWNER TO admin_bon_deal;

--
-- Name: orders_products_order_number_seq; Type: SEQUENCE; Schema: public; Owner: admin_bon_deal
--

CREATE SEQUENCE public.orders_products_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_products_order_number_seq OWNER TO admin_bon_deal;

--
-- Name: orders_products_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_bon_deal
--

ALTER SEQUENCE public.orders_products_order_number_seq OWNED BY public.orders_products.order_number;


--
-- Name: products; Type: TABLE; Schema: public; Owner: admin_bon_deal
--

CREATE TABLE public.products (
    product_uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    product_name character varying(100) NOT NULL,
    product_description character varying(500),
    product_price numeric(10,2) NOT NULL,
    product_quantity integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.products OWNER TO admin_bon_deal;

--
-- Name: users; Type: TABLE; Schema: public; Owner: admin_bon_deal
--

CREATE TABLE public.users (
    user_uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_pseudo character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    user_password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.users OWNER TO admin_bon_deal;

--
-- Name: orders order_number; Type: DEFAULT; Schema: public; Owner: admin_bon_deal
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_number SET DEFAULT nextval('public.orders_order_number_seq'::regclass);


--
-- Name: orders_products order_number; Type: DEFAULT; Schema: public; Owner: admin_bon_deal
--

ALTER TABLE ONLY public.orders_products ALTER COLUMN order_number SET DEFAULT nextval('public.orders_products_order_number_seq'::regclass);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: admin_bon_deal
--

COPY public.orders (order_number, order_total_cost_ht, order_total_quantity, created_at, deliver_ato, user_uuid) FROM stdin;
1	482.97	32	2024-08-09 19:03:39	2024-04-04	95076037-88c0-430b-8ac0-e260fb466a44
2	103.80	61	2024-01-22 05:40:44	\N	95076037-88c0-430b-8ac0-e260fb466a44
3	920.90	84	2024-09-30 08:14:35	2024-04-02	95076037-88c0-430b-8ac0-e260fb466a44
4	922.50	68	2023-12-25 14:23:26	\N	155af5ce-bcd4-47c8-a6a2-937319a2a105
5	441.71	3	2024-07-09 02:25:55	2024-03-04	155af5ce-bcd4-47c8-a6a2-937319a2a105
6	107.94	28	2024-03-18 00:28:53	2024-03-18	6a6f992f-854a-4fe0-8477-a512c7c0f347
7	869.73	33	2024-10-31 02:34:24	\N	153e63ee-73dd-4166-b3e9-6a2149383f04
8	700.06	31	2024-10-16 20:00:14	\N	24573bce-07eb-4d83-8ebc-8912ac41917f
9	85.89	7	2024-09-08 02:34:21	2024-05-09	b0d2eae8-e1d7-48c1-ab97-66e4d10cad9a
10	953.95	62	2024-10-26 18:39:25	\N	b0d2eae8-e1d7-48c1-ab97-66e4d10cad9a
\.


--
-- Data for Name: orders_products; Type: TABLE DATA; Schema: public; Owner: admin_bon_deal
--

COPY public.orders_products (order_number, product_uuid) FROM stdin;
1	24d16bac-74e4-4871-8c2f-9a9d57478d58
2	1b2ed993-a071-4af3-980a-9bda87702555
2	e9dba206-ba95-4843-b215-c0d768a17199
3	e9dba206-ba95-4843-b215-c0d768a17199
3	d2861b55-34dd-434b-809e-92813747a130
4	e9dba206-ba95-4843-b215-c0d768a17199
5	e9dba206-ba95-4843-b215-c0d768a17199
6	e9dba206-ba95-4843-b215-c0d768a17199
7	e9dba206-ba95-4843-b215-c0d768a17199
8	e9dba206-ba95-4843-b215-c0d768a17199
8	d2861b55-34dd-434b-809e-92813747a130
9	e9dba206-ba95-4843-b215-c0d768a17199
10	e9dba206-ba95-4843-b215-c0d768a17199
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: admin_bon_deal
--

COPY public.products (product_uuid, product_name, product_description, product_price, product_quantity, created_at, updated_at) FROM stdin;
5c000660-e146-4aa5-abdd-d2a7a2748245	Cheese - La Sauvagine	Cross-platform asynchronous project	45.91	82	2024-07-04 06:08:04	2024-01-28 19:03:12
24d16bac-74e4-4871-8c2f-9a9d57478d58	Uniform Linen Charge	Organic asynchronous archive	15.70	1	2024-05-23 17:52:40	2024-08-06 09:08:51
acc9e72d-1806-46f2-a10f-9a34e8dfc3d1	Mix Pina Colada	\N	82.06	65	2024-04-17 19:14:50	2024-11-05 17:30:37
1b2ed993-a071-4af3-980a-9bda87702555	Fiddlehead - Frozen	Versatile local superstructure	23.20	43	2024-01-02 14:45:20	2024-08-18 15:44:48
89ac78d7-32b0-4e37-a29b-33cf871d10da	Juice - Clam, 46 Oz	\N	121.42	38	2024-10-11 13:20:45	2024-04-16 10:21:37
e9dba206-ba95-4843-b215-c0d768a17199	Kellogs All Bran Bars	\N	51.93	85	2024-06-23 20:39:43	2024-08-13 13:20:05
0d673534-8b9b-4071-a11c-a0c8a7ff085a	Apple - Custard	Re-engineered web-enabled architecture	90.56	79	2024-01-03 02:50:31	2024-05-02 11:43:24
51329776-b9d5-47bf-878f-87c8dc98c797	Bread Foccacia Whole	\N	134.78	3	2024-02-21 13:45:22	2024-06-30 20:34:31
d2861b55-34dd-434b-809e-92813747a130	Tomatoes - Grape	Versatile intangible alliance	123.92	52	2023-11-24 07:24:07	2024-04-13 14:36:51
f8e48f4f-8402-4adb-9789-9f7b8dc12267	Appetizer - Sausage Rolls	\N	92.75	83	2024-02-06 17:17:42	2024-06-10 09:37:03
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin_bon_deal
--

COPY public.users (user_uuid, user_pseudo, username, user_password, created_at) FROM stdin;
95076037-88c0-430b-8ac0-e260fb466a44	cwarlow0	Chastity Warlow	$2a$04$MjM//OVUVa9mH0LaOi5NPeWZLVKC7lVXgI9/vlq7RwdBIlMRej6lO	2024-01-01 23:36:42
8b16c0fc-ca5c-434d-ab55-75d9831a0a93	hcake1	Harv Cake	$2a$04$/YTH65Y515Eyc3YQVkzveu2T10is/JI5.L3yYKxzyPz3IocqMkc5m	2024-06-25 02:37:00
b0d2eae8-e1d7-48c1-ab97-66e4d10cad9a	cfeige2	Carmelita Feige	$2a$04$l5NDovpgwl.pWkaNF0PTCeeOoruPU5eiyJItXAIHpaO5dwqoqu4pG	2024-01-13 05:54:42
155af5ce-bcd4-47c8-a6a2-937319a2a105	ktite3	Kristyn Tite	$2a$04$a1Ob6exQN5z2qcee9aCFCuf8PrK4p.6TP1IpNCijFsbocNgP/LVIi	2023-11-08 01:59:10
8546bce1-751d-4210-8a11-2fba2c8df607	iebhardt4	Ikey Ebhardt	$2a$04$PZpS95652N86kfgkJLq.duNXVD6/I4umco0UrEqaC/Cn5FM/mqWtG	2024-02-24 19:36:01
153e63ee-73dd-4166-b3e9-6a2149383f04	lgeillier5	Lizbeth Geillier	$2a$04$8PRDr8NvFFNlV.ADUF87aeqzhqWQLIOpaH7sL92iTP2jvbOxYD2Ti	2024-03-31 17:27:46
a7c16b87-44f2-4b13-9848-529d962be590	dfothergill6	Dido Fothergill	$2a$04$NjNXXotZHtnpq7maeRwWBuqWI/EjR/NkVOKrxq7c.2dEC5CcGnw02	2024-04-19 18:47:44
6a6f992f-854a-4fe0-8477-a512c7c0f347	kreasun7	Kingsley Reasun	$2a$04$vt.6LQACA9rMymavg187quHqxx0Y9GeZXC.6/0sfeKkgelCf/DcV6	2023-11-22 20:10:18
24573bce-07eb-4d83-8ebc-8912ac41917f	cpegrum8	Caressa Pegrum	$2a$04$Y23mo7MMPecQCOs6VGCkRuTAL9nRb2mxBq6lrF/rluOnEfKXP7XG.	2024-08-08 10:10:02
6a972d89-d385-480d-9798-f084c6711406	ayegorov9	Adore Yegorov	$2a$04$ogBm560rtINDfzgWmNUgG.c8SOrFei/VKzTlwBlq8g4ks0DiJGpvG	2024-06-03 05:30:25
\.


--
-- Name: orders_order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_bon_deal
--

SELECT pg_catalog.setval('public.orders_order_number_seq', 10, true);


--
-- Name: orders_products_order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_bon_deal
--

SELECT pg_catalog.setval('public.orders_products_order_number_seq', 1, false);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_bon_deal
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_number);


--
-- Name: orders_products orders_products_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_bon_deal
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_pkey PRIMARY KEY (order_number, product_uuid);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_bon_deal
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_uuid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_bon_deal
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_uuid);


--
-- Name: users users_user_pseudo_key; Type: CONSTRAINT; Schema: public; Owner: admin_bon_deal
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_pseudo_key UNIQUE (user_pseudo);


--
-- Name: orders_products orders_products_order_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin_bon_deal
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_order_number_fkey FOREIGN KEY (order_number) REFERENCES public.orders(order_number);


--
-- Name: orders_products orders_products_product_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin_bon_deal
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_product_uuid_fkey FOREIGN KEY (product_uuid) REFERENCES public.products(product_uuid);


--
-- Name: orders orders_user_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin_bon_deal
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_uuid_fkey FOREIGN KEY (user_uuid) REFERENCES public.users(user_uuid);


--
-- PostgreSQL database dump complete
--

