--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 10.4 (Ubuntu 10.4-2.pgdg16.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: jhonny
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO jhonny;

--
-- Name: bucket; Type: TABLE; Schema: public; Owner: jhonny
--

CREATE TABLE public.bucket (
    id integer NOT NULL,
    event_id integer NOT NULL,
    email_subject character varying NOT NULL,
    email_content character varying NOT NULL,
    "timestamp" character varying NOT NULL,
    created_date timestamp without time zone
);


ALTER TABLE public.bucket OWNER TO jhonny;

--
-- Name: bucket_id_seq; Type: SEQUENCE; Schema: public; Owner: jhonny
--

CREATE SEQUENCE public.bucket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bucket_id_seq OWNER TO jhonny;

--
-- Name: bucket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jhonny
--

ALTER SEQUENCE public.bucket_id_seq OWNED BY public.bucket.id;


--
-- Name: email_address; Type: TABLE; Schema: public; Owner: jhonny
--

CREATE TABLE public.email_address (
    id integer NOT NULL,
    email character varying(120) NOT NULL,
    bucket_event_id integer
);


ALTER TABLE public.email_address OWNER TO jhonny;

--
-- Name: email_address_id_seq; Type: SEQUENCE; Schema: public; Owner: jhonny
--

CREATE SEQUENCE public.email_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_address_id_seq OWNER TO jhonny;

--
-- Name: email_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jhonny
--

ALTER SEQUENCE public.email_address_id_seq OWNED BY public.email_address.id;


--
-- Name: bucket id; Type: DEFAULT; Schema: public; Owner: jhonny
--

ALTER TABLE ONLY public.bucket ALTER COLUMN id SET DEFAULT nextval('public.bucket_id_seq'::regclass);


--
-- Name: email_address id; Type: DEFAULT; Schema: public; Owner: jhonny
--

ALTER TABLE ONLY public.email_address ALTER COLUMN id SET DEFAULT nextval('public.email_address_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: jhonny
--

COPY public.alembic_version (version_num) FROM stdin;
8c5fe5d5ce59
\.


--
-- Data for Name: bucket; Type: TABLE DATA; Schema: public; Owner: jhonny
--

COPY public.bucket (id, event_id, email_subject, email_content, "timestamp", created_date) FROM stdin;
6	40	postman sadayana 40	Ini hanyalah contoh sahaja.	01 Oct 2018 08:10	2018-06-27 18:00:48.103335
7	41	postman sadayana 41	Ini hanyalah contoh sahaja.	11 Oct 2018 08:10	2018-06-27 18:02:42.666347
8	42	postman sadayana 42	Ini hanyalah contoh sahaja.	12 Oct 2018 08:10	2018-06-27 18:06:08.20866
9	43	postman sadayana 43	Ini hanyalah contoh sahaja.	13 Oct 2018 08:10	2018-06-27 18:23:24.462873
10	44	postman sadayana 44	Ini hanyalah contoh sahaja.	14 Oct 2018 08:10	2018-06-27 18:25:13.994608
11	45	postman sadayana 45	Ini hanyalah contoh sahaja.	15 Oct 2018 08:10	2018-06-27 18:26:25.279377
12	46	postman sadayana 46	Ini hanyalah contoh sahaja.	16 Oct 2018 08:10	2018-06-27 18:28:51.601642
13	47	postman sadayana 47	Ini hanyalah contoh sahaja.	17 Oct 2018 08:10	2018-06-27 18:35:11.611156
14	48	postman sadayana 48	Ini hanyalah contoh sahaja.	18 Oct 2018 08:10	2018-06-27 18:57:08.630594
15	49	postman sadayana 49	Ini hanyalah contoh sahaja.	19 Oct 2018 08:10	2018-06-27 19:04:02.421841
16	50	postman sadayana 50	Ini hanyalah contoh sahaja.	28 Jun 2018 03:12	2018-06-27 19:10:16.304127
17	31	postman sadayana 31	Ini hanyalah contoh sahaja.	28 Jun 2018 03:15	2018-06-27 19:14:10.002674
18	32	postman sadayana 32	Ini hanyalah contoh sahaja.	28 Jun 2018 03:28	2018-06-27 19:27:52.197961
19	61	postman sadayana 61	Ini hanyalah contoh sahaja.	28 Jun 2018 04:07	2018-06-27 20:04:38.869323
21	71	postman sadayana 71	Ini hanyalah contoh sahaja.	28 Jun 2018 04:07	2018-06-27 20:06:05.873356
22	72	postman sadayana 72	Ini hanyalah contoh sahaja.	28 Jun 2018 04:25	2018-06-27 20:23:22.283474
28	73	postman sadayana 73	Ini hanyalah contoh sahaja.	28 Jun 2018 04:45	2018-06-27 20:44:15.965991
30	74	postman sadayana 74	Ini hanyalah contoh sahaja.	28 Jun 2018 04:47	2018-06-27 20:46:03.668036
31	75	postman sadayana 75	Ini hanyalah contoh sahaja.	28 Jun 2018 08:57	2018-06-28 00:56:44.750523
33	76	postman sadayana 76	Ini hanyalah contoh sahaja.	28 Jun 2018 08:59	2018-06-28 00:59:03.17402
35	77	postman sadayana 77	Ini hanyalah contoh sahaja.	28 Jun 2018 09:02	2018-06-28 01:01:57.178661
36	78	postman sadayana 78	Ini hanyalah contoh sahaja.	28 Jun 2018 09:04	2018-06-28 01:03:17.937164
37	79	postman sadayana 79	Ini hanyalah contoh sahaja.	28 Jun 2018 09:06	2018-06-28 01:05:05.347679
38	80	postman sadayana 80	Ini hanyalah contoh sahaja.	28 Jun 2018 09:11	2018-06-28 01:10:33.861848
40	81	postman sadayana 81	Ini hanyalah contoh sahaja.	28 Jun 2018 09:11	2018-06-28 01:11:51.38503
41	82	postman sadayana 82	Ini hanyalah contoh sahaja.	28 Jun 2018 09:14	2018-06-28 01:13:09.338212
42	83	postman sadayana 83	Ini hanyalah contoh sahaja.	28 Jun 2018 09:16	2018-06-28 01:15:44.787815
43	84	postman sadayana 84	Ini hanyalah contoh sahaja.	28 Jun 2018 09:24	2018-06-28 01:23:14.936017
44	85	postman sadayana 85	Ini hanyalah contoh sahaja.	28 Jun 2018 09:29	2018-06-28 01:28:46.303125
45	86	postman sadayana 86	Ini hanyalah contoh sahaja.	28 Jun 2018 09:33	2018-06-28 01:32:24.970863
46	87	postman sadayana 87	Ini hanyalah contoh sahaja.	28 Jun 2018 09:38	2018-06-28 01:37:33.901121
47	88	postman sadayana 88	Ini hanyalah contoh sahaja.	28 Jun 2018 09:41	2018-06-28 01:40:14.367606
48	89	postman sadayana 89	Ini hanyalah contoh sahaja.	28 Jun 2018 09:48	2018-06-28 01:47:03.849177
49	90	postman sadayana 90	Ini hanyalah contoh sahaja.	28 Jun 2018 09:53	2018-06-28 01:52:48.406491
50	91	postman sadayana 91	Ini hanyalah contoh sahaja.	28 Jun 2018 09:55	2018-06-28 01:54:34.73471
51	92	postman sadayana 92	Ini hanyalah contoh sahaja.	28 Jun 2018 09:57	2018-06-28 01:56:13.737887
52	93	postman sadayana 93	Ini hanyalah contoh sahaja.	28 Jun 2018 10:03	2018-06-28 02:02:36.907084
53	94	postman sadayana 94	Ini hanyalah contoh sahaja.	28 Jun 2018 10:05	2018-06-28 02:04:42.323844
54	95	postman sadayana 95	Ini hanyalah contoh sahaja.	28 Jun 2018 10:11	2018-06-28 02:10:13.618968
55	96	postman sadayana 96	Ini hanyalah contoh sahaja.	28 Jun 2018 10:15	2018-06-28 02:14:34.14993
56	97	postman sadayana 97	Ini hanyalah contoh sahaja.	28 Jun 2018 10:17	2018-06-28 02:16:10.550673
57	98	postman sadayana 98	Ini hanyalah contoh sahaja.	28 Jun 2018 10:21	2018-06-28 02:20:17.588381
58	99	postman sadayana 99	Ini hanyalah contoh sahaja.	28 Jun 2018 10:22	2018-06-28 02:21:43.563086
\.


--
-- Data for Name: email_address; Type: TABLE DATA; Schema: public; Owner: jhonny
--

COPY public.email_address (id, email, bucket_event_id) FROM stdin;
\.


--
-- Name: bucket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jhonny
--

SELECT pg_catalog.setval('public.bucket_id_seq', 58, true);


--
-- Name: email_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jhonny
--

SELECT pg_catalog.setval('public.email_address_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: jhonny
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: bucket bucket_event_id_key; Type: CONSTRAINT; Schema: public; Owner: jhonny
--

ALTER TABLE ONLY public.bucket
    ADD CONSTRAINT bucket_event_id_key UNIQUE (event_id);


--
-- Name: bucket bucket_pkey; Type: CONSTRAINT; Schema: public; Owner: jhonny
--

ALTER TABLE ONLY public.bucket
    ADD CONSTRAINT bucket_pkey PRIMARY KEY (id);


--
-- Name: email_address email_address_pkey; Type: CONSTRAINT; Schema: public; Owner: jhonny
--

ALTER TABLE ONLY public.email_address
    ADD CONSTRAINT email_address_pkey PRIMARY KEY (id);


--
-- Name: email_address email_address_bucket_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jhonny
--

ALTER TABLE ONLY public.email_address
    ADD CONSTRAINT email_address_bucket_event_id_fkey FOREIGN KEY (bucket_event_id) REFERENCES public.bucket(event_id);


--
-- PostgreSQL database dump complete
--

