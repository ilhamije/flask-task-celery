--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bucket; Type: TABLE; Schema: public; Owner: jhonny
--

CREATE TABLE public.bucket (
    email_subject character varying,
    email_content character varying,
    "timestamp" character varying,
    id integer NOT NULL,
    event_id character varying
);


ALTER TABLE public.bucket OWNER TO jhonny;

--
-- Name: bucket_id_seq1; Type: SEQUENCE; Schema: public; Owner: jhonny
--

CREATE SEQUENCE public.bucket_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bucket_id_seq1 OWNER TO jhonny;

--
-- Name: bucket_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: jhonny
--

ALTER SEQUENCE public.bucket_id_seq1 OWNED BY public.bucket.id;


--
-- Name: bucket id; Type: DEFAULT; Schema: public; Owner: jhonny
--

ALTER TABLE ONLY public.bucket ALTER COLUMN id SET DEFAULT nextval('public.bucket_id_seq1'::regclass);


--
-- Data for Name: bucket; Type: TABLE DATA; Schema: public; Owner: jhonny
--

COPY public.bucket (email_subject, email_content, "timestamp", id, event_id) FROM stdin;
postman 1	Ini hanyalah contoh sahaja.	03 March 2018 07:00	1	5
postman 2	Ini hanyalah contoh sahaja.	17 March 2018 07:17	2	17
postman 3	Ini hanyalah contoh sahaja.	21 March 2018 07:21	3	13
\.


--
-- Name: bucket_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: jhonny
--

SELECT pg_catalog.setval('public.bucket_id_seq1', 3, true);


--
-- PostgreSQL database dump complete
--

