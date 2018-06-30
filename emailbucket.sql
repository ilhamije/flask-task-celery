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
    event_id integer
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
93912cbcbddf
\.


--
-- Data for Name: bucket; Type: TABLE DATA; Schema: public; Owner: jhonny
--

COPY public.bucket (id, event_id, email_subject, email_content, "timestamp", created_date) FROM stdin;
1	1	postman sadayana 001	Ini hanyalah contoh sahaja.	30 Jun 2018 10:32	2018-06-30 03:03:02.702604
3	2	postman sadayana 002	Ini hanyalah contoh sahaja.	30 Jun 2018 11:05	2018-06-30 03:04:29.411269
6	3	postman sadayana 003	Ini hanyalah contoh sahaja.	30 Jun 2018 11:06	2018-06-30 03:05:53.341902
7	4	postman sadayana 004	Ini hanyalah contoh sahaja.	30 Jun 2018 11:09	2018-06-30 03:08:23.291171
8	5	postman sadayana 005	Ini hanyalah contoh sahaja.	30 Jun 2018 11:12	2018-06-30 03:11:24.389916
9	6	postman sadayana 006	Ini hanyalah contoh sahaja.	30 Jun 2018 11:14	2018-06-30 03:13:18.947487
10	7	postman sadayana 007	Ini hanyalah contoh sahaja.	30 Jun 2018 11:15	2018-06-30 03:14:43.221267
11	8	postman sadayana 008	Ini hanyalah contoh sahaja.	30 Jun 2018 11:16	2018-06-30 03:15:41.084281
13	9	postman sadayana 009	Ini hanyalah contoh sahaja.	30 Jun 2018 11:17	2018-06-30 03:16:26.550275
14	10	postman sadayana 010	Ini hanyalah contoh sahaja.	30 Jun 2018 11:18	2018-06-30 03:17:07.936346
15	11	postman sadayana 011	Ini hanyalah contoh sahaja.	30 Jun 2018 11:19	2018-06-30 03:17:39.874091
17	12	postman sadayana 012	Ini hanyalah contoh sahaja.	30 Jun 2018 11:20	2018-06-30 03:19:07.943284
18	13	postman sadayana 013	Ini hanyalah contoh sahaja.	30 Jun 2018 14:06	2018-06-30 06:05:44.281352
19	14	postman sadayana 014	Ini hanyalah contoh sahaja.	30 Jun 2018 14:10	2018-06-30 06:10:05.595074
20	15	postman sadayana 015	Ini hanyalah contoh sahaja.	30 Jun 2018 14:11	2018-06-30 06:11:01.09781
21	17	postman sadayana 017	Ini hanyalah contoh sahaja.	30 Jun 2018 14:15	2018-06-30 06:15:09.30067
22	18	postman sadayana 018	Ini hanyalah contoh sahaja.	30 Jun 2018 14:21	2018-06-30 06:20:13.454456
23	19	postman sadayana 019	Ini hanyalah contoh sahaja.	30 Jun 2018 14:21	2018-06-30 06:20:43.22771
25	13	postman sadayana 013	Ini hanyalah contoh sahaja.	30 Jun 2018 14:24	2018-06-30 06:25:01.362724
26	13	postman sadayana 013 - 2	Ini hanyalah contoh sahaja.	30 Jun 2018 14:26	2018-06-30 06:25:42.642316
27	16	postman sadayana 016	Ini hanyalah contoh sahaja.	30 Jun 2018 14:55	2018-06-30 06:54:17.531395
28	19	postman sadayana 019	Ini hanyalah contoh sahaja.	30 Jun 2018 15:21	2018-06-30 07:20:08.143528
29	18	postman sadayana 018 - 01	Ini hanyalah contoh sahaja.	30 Jun 2018 15:21	2018-06-30 07:20:56.304746
30	13	postman sadayana 013 - 02	Ini hanyalah contoh sahaja.	30 Jun 2018 15:24	2018-06-30 07:24:00.01189
31	19	postman sadayana 019	Ini hanyalah contoh sahaja.	30 Jun 2018 15:32	2018-06-30 07:31:58.032243
32	19	postman sadayana 019	Ini hanyalah contoh sahaja.	30 Jun 2018 15:33	2018-06-30 07:32:33.688692
33	20	postman sadayana 020	Ini hanyalah contoh sahaja.	30 Jun 2018 15:35	2018-06-30 07:34:24.739153
34	17	postman sadayana 017	Ini hanyalah contoh sahaja.	30 Jun 2018 15:36	2018-06-30 07:35:51.311871
35	17	postman sadayana 017	Ini hanyalah contoh sahaja.	30 Jun 2018 15:38	2018-06-30 07:37:19.836679
36	17	postman sadayana 017 - 03	Ini hanyalah contoh sahaja.	30 Jun 2018 15:38	2018-06-30 07:38:43.615094
37	17	postman sadayana 017 - 03	Ini hanyalah contoh sahaja.	30 Jun 2018 15:38	2018-06-30 07:39:19.734195
\.


--
-- Data for Name: email_address; Type: TABLE DATA; Schema: public; Owner: jhonny
--

COPY public.email_address (id, email, event_id) FROM stdin;
1	niktes0x01@gmail.com	13
2	ilhamije@gmail.com	13
3	ilhamije@gmail.com	17
4	niktes0x01@gmail.com	17
5	niktes0x01@gmail.com	18
6	ilhamije@gmail.com	18
\.


--
-- Name: bucket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jhonny
--

SELECT pg_catalog.setval('public.bucket_id_seq', 37, true);


--
-- Name: email_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jhonny
--

SELECT pg_catalog.setval('public.email_address_id_seq', 6, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: jhonny
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


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
-- PostgreSQL database dump complete
--

