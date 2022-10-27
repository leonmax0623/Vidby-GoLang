--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:H+vV8XoOibKSRBUMJ6HxtA==$iQLpZHiALvOsbR7l/sNoDsznGMG8j0J7OiZcYGTn4fg=:jJutV2YnNWqyReWz3T+RICfcqSyv4UptMmLeiWTMsXs=';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

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
-- PostgreSQL database dump complete
--

--
-- Database "customer_feedback" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

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
-- Name: customer_feedback; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE customer_feedback WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE customer_feedback OWNER TO postgres;

\connect customer_feedback

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
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: advantages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advantages (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    image text NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    language text NOT NULL,
    index text NOT NULL
);


ALTER TABLE public.advantages OWNER TO postgres;

--
-- Name: advantages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.advantages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.advantages_id_seq OWNER TO postgres;

--
-- Name: advantages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.advantages_id_seq OWNED BY public.advantages.id;


--
-- Name: colorful_texts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colorful_texts (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    lang text NOT NULL,
    content text NOT NULL,
    color text NOT NULL,
    parent text NOT NULL,
    index bigint NOT NULL
);


ALTER TABLE public.colorful_texts OWNER TO postgres;

--
-- Name: colorful_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colorful_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colorful_texts_id_seq OWNER TO postgres;

--
-- Name: colorful_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colorful_texts_id_seq OWNED BY public.colorful_texts.id;


--
-- Name: faqs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faqs (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    question text NOT NULL,
    answer text NOT NULL,
    language text NOT NULL
);


ALTER TABLE public.faqs OWNER TO postgres;

--
-- Name: faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faqs_id_seq OWNER TO postgres;

--
-- Name: faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faqs_id_seq OWNED BY public.faqs.id;


--
-- Name: goals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goals (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    date text NOT NULL,
    achieved boolean NOT NULL,
    text text NOT NULL,
    selected boolean NOT NULL,
    lang text NOT NULL
);


ALTER TABLE public.goals OWNER TO postgres;

--
-- Name: goals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.goals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goals_id_seq OWNER TO postgres;

--
-- Name: goals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.goals_id_seq OWNED BY public.goals.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    language text NOT NULL,
    icon text NOT NULL,
    code text NOT NULL,
    website_language boolean DEFAULT false NOT NULL
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: page_text_contents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_text_contents (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    json_path text NOT NULL,
    parent text NOT NULL,
    content text NOT NULL,
    language text NOT NULL
);


ALTER TABLE public.page_text_contents OWNER TO postgres;

--
-- Name: page_text_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.page_text_contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_text_contents_id_seq OWNER TO postgres;

--
-- Name: page_text_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.page_text_contents_id_seq OWNED BY public.page_text_contents.id;


--
-- Name: price_advantages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_advantages (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    parent text NOT NULL,
    text text NOT NULL,
    index bigint NOT NULL,
    lang text DEFAULT 'en'::text NOT NULL
);


ALTER TABLE public.price_advantages OWNER TO postgres;

--
-- Name: price_advantages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_advantages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_advantages_id_seq OWNER TO postgres;

--
-- Name: price_advantages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_advantages_id_seq OWNED BY public.price_advantages.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    author_profile_picture text NOT NULL,
    author_name text NOT NULL,
    author_profession text NOT NULL,
    author_company text NOT NULL,
    author_company_url text NOT NULL,
    stars bigint NOT NULL,
    content text NOT NULL,
    full_content_url text,
    lang text DEFAULT 'en'::text NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: source_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.source_languages (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    code text NOT NULL,
    language text NOT NULL,
    price numeric NOT NULL
);


ALTER TABLE public.source_languages OWNER TO postgres;

--
-- Name: source_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.source_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.source_languages_id_seq OWNER TO postgres;

--
-- Name: source_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.source_languages_id_seq OWNED BY public.source_languages.id;


--
-- Name: update_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.update_histories (
    date text NOT NULL,
    parent text NOT NULL
);


ALTER TABLE public.update_histories OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    email text NOT NULL,
    password text NOT NULL,
    role text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video_examples; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.video_examples (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    original_id bigint NOT NULL,
    translated_ids integer[],
    page text DEFAULT 'main/customers'::text NOT NULL,
    company_logo text,
    index bigint
);


ALTER TABLE public.video_examples OWNER TO postgres;

--
-- Name: video_examples_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.video_examples_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_examples_id_seq OWNER TO postgres;

--
-- Name: video_examples_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.video_examples_id_seq OWNED BY public.video_examples.id;


--
-- Name: videos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.videos (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    language_code text,
    source text NOT NULL,
    preview text
);


ALTER TABLE public.videos OWNER TO postgres;

--
-- Name: videos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.videos_id_seq OWNER TO postgres;

--
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.videos_id_seq OWNED BY public.videos.id;


--
-- Name: website_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.website_languages (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    code text NOT NULL,
    language text NOT NULL,
    available boolean NOT NULL
);


ALTER TABLE public.website_languages OWNER TO postgres;

--
-- Name: website_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.website_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_languages_id_seq OWNER TO postgres;

--
-- Name: website_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.website_languages_id_seq OWNED BY public.website_languages.id;


--
-- Name: advantages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advantages ALTER COLUMN id SET DEFAULT nextval('public.advantages_id_seq'::regclass);


--
-- Name: colorful_texts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colorful_texts ALTER COLUMN id SET DEFAULT nextval('public.colorful_texts_id_seq'::regclass);


--
-- Name: faqs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs ALTER COLUMN id SET DEFAULT nextval('public.faqs_id_seq'::regclass);


--
-- Name: goals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goals ALTER COLUMN id SET DEFAULT nextval('public.goals_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: page_text_contents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_text_contents ALTER COLUMN id SET DEFAULT nextval('public.page_text_contents_id_seq'::regclass);


--
-- Name: price_advantages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_advantages ALTER COLUMN id SET DEFAULT nextval('public.price_advantages_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: source_languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source_languages ALTER COLUMN id SET DEFAULT nextval('public.source_languages_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video_examples id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_examples ALTER COLUMN id SET DEFAULT nextval('public.video_examples_id_seq'::regclass);


--
-- Name: videos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videos ALTER COLUMN id SET DEFAULT nextval('public.videos_id_seq'::regclass);


--
-- Name: website_languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.website_languages ALTER COLUMN id SET DEFAULT nextval('public.website_languages_id_seq'::regclass);


--
-- Data for Name: advantages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advantages (id, created_at, updated_at, deleted_at, image, title, content, language, index) FROM stdin;
1	2022-06-01 23:58:33.544+00	2022-06-01 23:58:34.344+00	\N	/img/content/fiches-1.jpg	<span class="selected">INCREASE REACH,</span> VIEWS AND SUBSCRIBERS	Vidby's technologies enable video translation in over\n<span class="selected">50 different languages</span>. Thus, your videos will become available to the whole world, which means that more people will be able to see them. Your audience will constantly grow with subscribers from other countries.	en	0
2	2022-06-01 23:58:33.544+00	2022-06-01 23:58:34.344+00	\N	/img/content/fiches-2.jpg	INCREASED <span class="selected">INCOME</span>	If you publish commercial videos, then with the help of Vidby technologies you can attract new clients to your business from different countries. Plus, you'll get additional monetization on new video views.	en	1
3	2022-06-01 23:58:33.544+00	2022-06-01 23:58:34.344+00	\N	/img/content/fiches-3.jpg	<span class="selected">FAST</span> TRANSLATION RESULT	Vidby technology does it all in minutes. You do not need\nto wait days and months, as is the case now\nin the translation market.	en	2
4	2022-06-01 23:58:33.544+00	2022-06-01 23:58:34.344+00	\N	/img/content/fiches-4.jpg	<span class="selected">MINIMUM</span> INVESTMENT, <span class="selected">MAXIMUM</span>  RESULT AND QUALITY	Vidby technology does it all in minutes. You do not need\nto wait days and months, as is the case now\nin the translation market.	en	3
5	2022-06-01 23:58:33.544+00	2022-06-01 23:58:34.344+00	\N	/img/content/fiches-1.jpg	<span class="selected">REICHWEITE, </span>VIEWS UND ABONNENTEN STEIGERN\n	Die Technologien von Vidby ermöglichen die Übersetzung von Videos in über \n<span class="selected">50 different languages</span>. So werden Ihre Videos für die ganze Welt verfügbar, was bedeutet, dass mehr Menschen sie sehen können. Ihr Publikum wird ständig mit Abonnenten aus anderen Ländern wachsen.	de	0
6	2022-06-01 23:58:33.544+00	2022-06-01 23:58:34.344+00	\N	/img/content/fiches-2.jpg	ERHÖHTES <span class="selected">EINKOMMEN</span>	Wenn Sie kommerzielle Videos veröffentlichen, können Sie mit Hilfe von Vidby-Technologien neue Kunden aus verschiedenen Ländern für Ihr Unternehmen gewinnen. Außerdem erhalten Sie zusätzliche Monetarisierung für neue Videoaufrufe.	de	1
7	2022-06-01 23:58:33.544+00	2022-06-01 23:58:34.344+00	\N	/img/content/fiches-3.jpg	<span class="selected">SCHNELLES</span> ÜBERSETZUNGS ERGEBNIS	Vid by Technology erledigt alles in wenigen Minuten. Sie müssen nicht Tage und Monate warten, wie es jetzt auf dem Übersetzungsmarkt der Fall ist.	de	2
8	2022-06-01 23:58:33.544+00	2022-06-01 23:58:34.344+00	\N	/img/content/fiches-4.jpg	<span class="selected">MINIMALE</span> INVESTITION, <span class="selected">MAXIMALES</span> ERGEBNIS UND QUALITÄT	Sie brauchen keine komplizierten Verträge, Synchronsprecher, Tonredakteure, Übersetzer und teure Studioausrüstung mehr. Vidby Technologies wird all diese Probleme schnell, effizient und kostengünstig lösen.	 de	3
\.


--
-- Data for Name: colorful_texts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colorful_texts (id, created_at, updated_at, deleted_at, lang, content, color, parent, index) FROM stdin;
2	2022-05-26 11:56:04.721+00	2022-05-26 11:56:06.154+00	\N	en	And dubbing of videos	black	main/title	1
3	2022-05-26 11:56:25.699+00	2022-05-26 11:56:27.18+00	\N	en	Your video.	black	main/blob	0
4	2022-05-26 11:56:51.073+00	2022-05-26 11:56:52.74+00	\N	en	Whole world	blue	main/blob	1
1	2022-05-26 11:55:31.529+00	2022-05-26 11:55:33.407+00	\N	en	FAST TRANSLATION	blue	main/title	0
5	2022-05-26 12:06:13.085+00	2022-05-26 12:06:14.511+00	\N	en	Data	black	waves/1	0
6	2022-05-26 12:06:35.691+00	2022-05-26 12:06:37.145+00	\N	en	confidentiality	blue	waves/1	1
7	2022-05-26 12:07:03.34+00	2022-05-26 12:07:05.336+00	\N	en	50+	blue	waves/2	0
8	2022-05-26 12:07:25.938+00	2022-05-26 12:07:27.29+00	\N	en	languages translation	black	waves/2	1
9	2022-05-26 12:07:50.196+00	2022-05-26 12:07:51.591+00	\N	en	translation	black	waves/3	0
10	2022-05-26 12:08:09.429+00	2022-05-26 12:08:11.322+00	\N	en	speed	blue	waves/3	1
11	2022-05-26 12:08:31.981+00	2022-05-26 12:08:33.669+00	\N	en	100%	blue	waves/4	0
12	2022-05-26 12:08:51.026+00	2022-05-26 12:08:52.034+00	\N	en	Process automation	black	waves/4	1
13	2022-05-26 12:09:12.522+00	2022-05-26 12:09:15.505+00	\N	en	24/7	blue	waves/5	0
14	2022-05-26 12:09:37.459+00	2022-05-26 12:09:38.814+00	\N	en	Transfers anywhere in world	black	waves/5	1
15	2022-05-26 12:10:11.709+00	2022-05-26 12:10:14.427+00	\N	en	High-Quality	blue	waves/6	0
16	2022-05-26 12:10:45.279+00	2022-05-26 12:10:48.123+00	\N	en	translation	black	waves/6	1
17	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	Increase Reach	blue	advantages/1/title	0
18	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	Views and subscribers 	black	advantages/1/title	1
19	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	Vidby's technologies enable video translation in over	black	advantages/1/content	0
20	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	50 different languages	blue	advantages/1/content	1
21	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	. Thus, your videos will become available to the whole world, which means that more people will be able to see them. Your audience will constantly grow with subscribers from other countries.	black	advantages/1/content	2
22	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	Increased	black	advantages/2/title	0
23	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	Income	blue	advantages/2/title	1
24	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	If you publish commercial videos, then with the help of Vidby technologies you can attract new clients to your business from different countries. Plus, you'll get additional monetization on new video views.	black	advantages/2/content	0
25	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	Fast	blue	advantages/3/title	0
26	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	Translation result	black	advantages/3/title	1
27	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	Vidby technology does it all in minutes. You do not need to wait days and months, as is the case now in the translation market.	black	advantages/3/content	0
28	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	Minimum	blue	advantages/4/title	0
29	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	Investment	black	advantages/4/title	1
30	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	Maximum	blue	advantages/4/title	2
31	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	Result and quality	black	advantages/4/title	3
32	2022-05-26 12:24:32.708+00	2022-05-26 12:24:49.676+00	\N	en	You no longer need complicated contracts, dubbing actors, sound editors, translators and expensive studio equipment. Vidby technologies will solve all these problems quickly, efficiently and inexpensively.	black	advantages/4/content	0
33	2022-05-26 12:32:23.825+00	2022-05-26 12:32:25.494+00	\N	en	Advantages of working with	black	advantages/title	0
34	2022-05-26 12:32:51.239+00	2022-05-26 12:32:52.521+00	\N	en	vidby	red	advantages/title	1
35	\N	\N	\N	en	Synchronization of video and voice	black	pricing/fast/1	0
36	\N	\N	\N	en	Female and male voices	black	pricing/fast/2	0
37	\N	\N	\N	en	99% translation accuracy	black	pricing/expert/1	0
\.


--
-- Data for Name: faqs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faqs (id, created_at, updated_at, deleted_at, question, answer, language) FROM stdin;
1	2022-06-02 01:14:55.551+00	2022-06-02 01:14:56.077+00	\N	HOW LONG TO WAIT FOR ORDER FULFILLMENT?	We do not recommend translating such videos: humor, videos in which speech is against the background of loud music or extraneous noises, where several people speak at the same time, where emotions and intonation need to be conveyed, several languages ​​are used, terms or words from other languages ​​are used, jargon, obscene vocabulary.\n	en
2	2022-06-02 01:14:55.551+00	2022-06-02 01:14:56.077+00	\N	WHAT TRANSLATION ARE SUPPORTED?	We do not recommend translating such videos: humor, videos in which speech is against the background of loud music or extraneous noises, where several people speak at the same time, where emotions and intonation need to be conveyed, several languages ​​are used, terms or words from other languages ​​are used, jargon, obscene vocabulary.\n	en
3	2022-06-02 01:14:55.551+00	2022-06-02 01:14:56.077+00	\N	WHAT IS THE QUALITY OF THE TRANSLATION?	We do not recommend translating such videos: humor, videos in which speech is against the background of loud music or extraneous noises, where several people speak at the same time, where emotions and intonation need to be conveyed, several languages ​​are used, terms or words from other languages ​​are used, jargon, obscene vocabulary.\n	en
4	2022-06-02 01:14:55.551+00	2022-06-02 01:14:56.077+00	\N	WHAT ARE THE BEST VIDEOS FOR TRANSLATION?	We do not recommend translating such videos: humor, videos in which speech is against the background of loud music or extraneous noises, where several people speak at the same time, where emotions and intonation need to be conveyed, several languages ​​are used, terms or words from other languages ​​are used, jargon, obscene vocabulary.\n	en
5	2022-06-02 01:14:55.551+00	2022-06-02 01:14:56.077+00	\N	WHICH VIDEOS ARE NOT RECOMMENDED TO BE TRANSLATED?	We do not recommend translating such videos: humor, videos in which speech is against the background of loud music or extraneous noises, where several people speak at the same time, where emotions and intonation need to be conveyed, several languages ​​are used, terms or words from other languages ​​are used, jargon, obscene vocabulary.\n	en
6	2022-06-02 01:14:55.551+00	2022-06-02 01:14:56.077+00	\N	WHERE CAN I CONTACT IF I HAVE ADDITIONAL QUESTIONS?\n	We do not recommend translating such videos: humor, videos in which speech is against the background of loud music or extraneous noises, where several people speak at the same time, where emotions and intonation need to be conveyed, several languages ​​are used, terms or words from other languages ​​are used, jargon, obscene vocabulary.\n	en
7	2022-06-02 01:14:55.551+00	2022-06-02 01:14:56.077+00	\N	WIE LANGE MUSS ICH AUF DIE AUFTRAGSERFÜLLUNG WARTEN?	Wir empfehlen nicht, solche Videos zu übersetzen: Humor, Videos, in denen vor dem Hintergrund lauter Musik oder Fremdgeräusche gesprochen wird, in denen mehrere Personen gleichzeitig sprechen, in denen Emotionen und Intonation vermittelt werden müssen, mehrere Sprachen verwendet werden, Begriffe oder Wörter aus anderen Sprachen verwendet werden, Jargon, obszönes Vokabular.\n	de
8	2022-06-02 01:14:55.551+00	2022-06-02 01:14:56.077+00	\N	WELCHE ÜBERSETZUNGSSPRACHEN WERDEN UNTERSTÜTZT?	Wir empfehlen nicht, solche Videos zu übersetzen: Humor, Videos, in denen vor dem Hintergrund lauter Musik oder Fremdgeräusche gesprochen wird, in denen mehrere Personen gleichzeitig sprechen, in denen Emotionen und Intonation vermittelt werden müssen, mehrere Sprachen verwendet werden, Begriffe oder Wörter aus anderen Sprachen verwendet werden, Jargon, obszönes Vokabular.\n	de
9	2022-06-02 01:14:55.551+00	2022-06-02 01:14:56.077+00	\N	WAS IST DIE QUALITÄT DER ÜBERSETZUNG?	Wir empfehlen nicht, solche Videos zu übersetzen: Humor, Videos, in denen vor dem Hintergrund lauter Musik oder Fremdgeräusche gesprochen wird, in denen mehrere Personen gleichzeitig sprechen, in denen Emotionen und Intonation vermittelt werden müssen, mehrere Sprachen verwendet werden, Begriffe oder Wörter aus anderen Sprachen verwendet werden, Jargon, obszönes Vokabular.\n	de
10	2022-06-02 01:14:55.551+00	2022-06-02 01:14:56.077+00	\N	WAS SIND DIE BESTEN VIDEOS ZUM ÜBERSETZEN?	Wir empfehlen nicht, solche Videos zu übersetzen: Humor, Videos, in denen vor dem Hintergrund lauter Musik oder Fremdgeräusche gesprochen wird, in denen mehrere Personen gleichzeitig sprechen, in denen Emotionen und Intonation vermittelt werden müssen, mehrere Sprachen verwendet werden, Begriffe oder Wörter aus anderen Sprachen verwendet werden, Jargon, obszönes Vokabular.\n	de
11	2022-06-02 01:14:55.551+00	2022-06-02 01:14:56.077+00	\N	WELCHE VIDEOS SOLLTEN NICHT ÜBERSETZT WERDEN?	Wir empfehlen nicht, solche Videos zu übersetzen: Humor, Videos, in denen vor dem Hintergrund lauter Musik oder Fremdgeräusche gesprochen wird, in denen mehrere Personen gleichzeitig sprechen, in denen Emotionen und Intonation vermittelt werden müssen, mehrere Sprachen verwendet werden, Begriffe oder Wörter aus anderen Sprachen verwendet werden, Jargon, obszönes Vokabular.\n	de
12	2022-06-02 01:14:55.551+00	2022-06-02 01:14:56.077+00	\N	AN WEN KANN ICH MICH WENDEN, WENN ICH WEITERE FRAGEN HABE?	Wir empfehlen nicht, solche Videos zu übersetzen: Humor, Videos, in denen vor dem Hintergrund lauter Musik oder Fremdgeräusche gesprochen wird, in denen mehrere Personen gleichzeitig sprechen, in denen Emotionen und Intonation vermittelt werden müssen, mehrere Sprachen verwendet werden, Begriffe oder Wörter aus anderen Sprachen verwendet werden, Jargon, obszönes Vokabular.\n	de
\.


--
-- Data for Name: goals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goals (id, created_at, updated_at, deleted_at, date, achieved, text, selected, lang) FROM stdin;
1	2022-05-28 13:01:50.233+00	2022-05-28 13:01:51.343+00	\N	Sep 2021	t	Registration of vidby AG	f	en
2	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	Oct 2021	t	Market launch of the first commercial version	f	en
3	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	Nov 2021	t	Marketing hypothesis testing	f	en
4	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	Dec 2021	t	Improvement of the order processing form	f	en
5	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	Jan 2022	t	Improving the quality of translation	f	en
6	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	Feb 2022	t	Updated transcript editor	f	en
7	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	Mar 2022	t	Subscription for business customers	t	en
8	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	Apr 2022	f	Partnership with major influencer networks	f	en
9	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	May 2022	f	Entry into the online education market	f	en
10	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	2022	f	Development of speech technologies (new voices broken down by age of emotion)	f	en
11	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	2023	f	Entry into the US market	f	en
12	2022-05-28 13:01:50.233+00	2022-05-28 13:01:51.343+00	\N	Sep 2021	t	Eintragung der vidby AG	f	de
13	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	Oct 2021	t	Markteinführung der ersten kommerziellen Version	f	de
14	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	Nov 2021	t	Testen von Marketinghypothesen	f	de
15	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	Dec 2021	t	Verbesserung des Bestellabwicklungsformulars	f	de
16	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	Jan 2022	t	Verbesserung der Übersetzungsqualität	f	de
17	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	Feb 2022	t	Aktualisierter Transkript-Editor	f	de
18	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	Mar 2022	t	Abo für Geschäftskunden	f	de
19	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	Apr 2022	f	Partnerschaft mit großen Influencer-Netzwerken	t	de
20	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	May 2022	f	Einstieg in den Online-Bildungsmarkt	f	de
21	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	2022	f	Entwicklung von Sprachtechnologien (neue Stimmen aufgeschlüsselt nach Alter der Emotionen)	f	de
22	2022-05-28 13:01:53.296+00	2022-05-28 13:01:52.537+00	\N	2023	f	Eintritt in den US-Markt	f	de
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id, created_at, updated_at, deleted_at, language, icon, code, website_language) FROM stdin;
5103	2022-05-27 10:05:57.657274+00	2022-05-28 05:07:23.623126+00	\N	Bengali		bn-BN	f
3	2022-05-27 10:05:56.982219+00	2022-05-30 19:22:54.427347+00	\N	Afrikaans (South Africa)		af-ZA	f
4	2022-05-27 10:05:57.010952+00	2022-05-30 19:22:54.444881+00	\N	Amharic (Ethiopia)		am-ET	f
5	2022-05-27 10:05:57.015996+00	2022-05-30 19:22:54.457471+00	\N	Arabic (United Arab Emirates)		ar-AE	f
6	2022-05-27 10:05:57.020173+00	2022-05-30 19:22:54.469852+00	\N	Arabic (Bahrain)		ar-BH	f
7	2022-05-27 10:05:57.026279+00	2022-05-30 19:22:54.480846+00	\N	Arabic (Algeria)		ar-DZ	f
8	2022-05-27 10:05:57.0367+00	2022-05-30 19:22:54.490161+00	\N	Arabic (Egypt)		ar-EG	f
9	2022-05-27 10:05:57.047178+00	2022-05-30 19:22:54.497681+00	\N	Arabic (Israel)		ar-IL	f
10	2022-05-27 10:05:57.055855+00	2022-05-30 19:22:54.507061+00	\N	Arabic (Iraq)		ar-IQ	f
11	2022-05-27 10:05:57.062373+00	2022-05-30 19:22:54.514384+00	\N	Arabic (Jordan)		ar-JO	f
12	2022-05-27 10:05:57.069215+00	2022-05-30 19:22:54.521922+00	\N	Arabic (Kuwait)		ar-KW	f
13	2022-05-27 10:05:57.077922+00	2022-05-30 19:22:54.526853+00	\N	Arabic (Lebanon)		ar-LB	f
14	2022-05-27 10:05:57.085068+00	2022-05-30 19:22:54.531878+00	\N	Arabic (Libya)		ar-LY	f
15	2022-05-27 10:05:57.089945+00	2022-05-30 19:22:54.537592+00	\N	Arabic (Morocco)		ar-MA	f
16	2022-05-27 10:05:57.093621+00	2022-05-30 19:22:54.542241+00	\N	Arabic (Mauritania)		ar-MR	f
17	2022-05-27 10:05:57.098126+00	2022-05-30 19:22:54.547465+00	\N	Arabic (Oman)		ar-OM	f
18	2022-05-27 10:05:57.102079+00	2022-05-30 19:22:54.552755+00	\N	Arabic (Palestinian Territories)		ar-PS	f
19	2022-05-27 10:05:57.106854+00	2022-05-30 19:22:54.557745+00	\N	Arabic (Qatar)		ar-QA	f
20	2022-05-27 10:05:57.110982+00	2022-05-30 19:22:54.56376+00	\N	Arabic (Saudi Arabia)		ar-SA	f
21	2022-05-27 10:05:57.115789+00	2022-05-30 19:22:54.568641+00	\N	Arabic (Syria)		ar-SY	f
22	2022-05-27 10:05:57.119599+00	2022-05-30 19:22:54.573431+00	\N	Arabic (Tunisia)		ar-TN	f
23	2022-05-27 10:05:57.126668+00	2022-05-30 19:22:54.580803+00	\N	Arabic		ar-XA	f
24	2022-05-27 10:05:57.132709+00	2022-05-30 19:22:54.587093+00	\N	Arabic (Yemen)		ar-YE	f
25	2022-05-27 10:05:57.139212+00	2022-05-30 19:22:54.59132+00	\N	Azerbaijani (Latin, Azerbaijan)		az-AZ	f
26	2022-05-27 10:05:57.143039+00	2022-05-30 19:22:54.596846+00	\N	Bulgarian (Bulgaria)		bg-BG	f
27	2022-05-27 10:05:57.150838+00	2022-05-30 19:22:54.600978+00	\N	Bangla (Bangladesh)		bn-BD	f
28	2022-05-27 10:05:57.159002+00	2022-05-30 19:22:54.608446+00	\N	Bangla (India)		bn-IN	f
29	2022-05-27 10:05:57.164312+00	2022-05-30 19:22:54.616057+00	\N	Bosnian (Latin, Bosnia & Herzegovina)		bs-BA	f
30	2022-05-27 10:05:57.201123+00	2022-05-30 19:22:54.623596+00	\N	Catalan (Spain)		ca-ES	f
31	2022-05-27 10:05:57.242779+00	2022-05-30 19:22:54.628848+00	\N	Czech (Czechia)		cs-CZ	f
32	2022-05-27 10:05:57.254982+00	2022-05-30 19:22:54.633235+00	\N	Welsh (United Kingdom)		cy-GB	f
33	2022-05-27 10:05:57.262604+00	2022-05-30 19:22:54.639196+00	\N	Danish (Denmark)		da-DK	f
34	2022-05-27 10:05:57.26822+00	2022-05-30 19:22:54.644329+00	\N	German (Austria)		de-AT	f
35	2022-05-27 10:05:57.276265+00	2022-05-30 19:22:54.649036+00	\N	German (Switzerland)		de-CH	f
37	2022-05-27 10:05:57.286909+00	2022-05-30 19:22:54.658312+00	\N	Greek (Greece)		el-GR	f
38	2022-05-27 10:05:57.291676+00	2022-05-30 19:22:54.665817+00	\N	English (Australia)		en-AU	f
39	2022-05-27 10:05:57.296204+00	2022-05-30 19:22:54.673625+00	\N	English (Canada)		en-CA	f
36	2022-05-27 10:05:57.282501+00	2022-05-31 08:37:04.667483+00	\N	German (Germany)		de-DE	t
41	2022-05-27 10:05:57.306588+00	2022-05-30 19:22:54.689377+00	\N	English (Ghana)		en-GH	f
42	2022-05-27 10:05:57.316603+00	2022-05-30 19:22:54.696977+00	\N	English (Hong Kong SAR China)		en-HK	f
43	2022-05-27 10:05:57.320672+00	2022-05-30 19:22:54.704723+00	\N	English (Ireland)		en-IE	f
44	2022-05-27 10:05:57.325615+00	2022-05-30 19:22:54.712892+00	\N	English (India)		en-IN	f
45	2022-05-27 10:05:57.328683+00	2022-05-30 19:22:54.721646+00	\N	English (Kenya)		en-KE	f
46	2022-05-27 10:05:57.333179+00	2022-05-30 19:22:54.728337+00	\N	English (Nigeria)		en-NG	f
47	2022-05-27 10:05:57.336343+00	2022-05-30 19:22:54.736591+00	\N	English (New Zealand)		en-NZ	f
48	2022-05-27 10:05:57.341013+00	2022-05-30 19:22:54.742076+00	\N	English (Philippines)		en-PH	f
49	2022-05-27 10:05:57.345195+00	2022-05-30 19:22:54.749097+00	\N	English (Pakistan)		en-PK	f
50	2022-05-27 10:05:57.349333+00	2022-05-30 19:22:54.75704+00	\N	English (Singapore)		en-SG	f
51	2022-05-27 10:05:57.352947+00	2022-05-30 19:22:54.761238+00	\N	English (Tanzania)		en-TZ	f
52	2022-05-27 10:05:57.357447+00	2022-05-30 19:22:54.765997+00	\N	English (United States)		en-US	f
53	2022-05-27 10:05:57.360928+00	2022-05-30 19:22:54.774002+00	\N	English (South Africa)		en-ZA	f
54	2022-05-27 10:05:57.363742+00	2022-05-30 19:22:54.782131+00	\N	Spanish (Argentina)		es-AR	f
55	2022-05-27 10:05:57.366503+00	2022-05-30 19:22:54.790134+00	\N	Spanish (Bolivia)		es-BO	f
56	2022-05-27 10:05:57.368895+00	2022-05-30 19:22:54.797306+00	\N	Spanish (Chile)		es-CL	f
57	2022-05-27 10:05:57.371026+00	2022-05-30 19:22:54.802339+00	\N	Spanish (Colombia)		es-CO	f
58	2022-05-27 10:05:57.373595+00	2022-05-30 19:22:54.806979+00	\N	Spanish (Costa Rica)		es-CR	f
59	2022-05-27 10:05:57.376021+00	2022-05-30 19:22:54.812565+00	\N	Spanish (Cuba)		es-CU	f
61	2022-05-27 10:05:57.382094+00	2022-05-30 19:22:54.827954+00	\N	Spanish (Ecuador)		es-EC	f
62	2022-05-27 10:05:57.384952+00	2022-05-30 19:22:54.833079+00	\N	Spanish (Spain)		es-ES	f
75	2022-05-27 10:05:57.435165+00	2022-05-30 19:22:54.916803+00	\N	Spanish (Venezuela)		es-VE	f
76	2022-05-27 10:05:57.440625+00	2022-05-30 19:22:54.923986+00	\N	Estonian (Estonia)		et-EE	f
77	2022-05-27 10:05:57.443771+00	2022-05-30 19:22:54.927772+00	\N	Basque (Spain)		eu-ES	f
78	2022-05-27 10:05:57.445936+00	2022-05-30 19:22:54.932223+00	\N	Persian (Iran)		fa-IR	f
79	2022-05-27 10:05:57.448862+00	2022-05-30 19:22:54.937879+00	\N	Finnish (Finland)		fi-FI	f
81	2022-05-27 10:05:57.457357+00	2022-05-30 19:22:54.948039+00	\N	French (Belgium)		fr-BE	f
82	2022-05-27 10:05:57.459662+00	2022-05-30 19:22:54.954566+00	\N	French (Canada)		fr-CA	f
83	2022-05-27 10:05:57.461725+00	2022-05-30 19:22:54.95877+00	\N	French (Switzerland)		fr-CH	f
84	2022-05-27 10:05:57.466991+00	2022-05-30 19:22:54.964991+00	\N	French (France)		fr-FR	f
85	2022-05-27 10:05:57.469207+00	2022-05-30 19:22:54.971706+00	\N	Irish (Ireland)		ga-IE	f
86	2022-05-27 10:05:57.471389+00	2022-05-30 19:22:54.978165+00	\N	Galician (Spain)		gl-ES	f
87	2022-05-27 10:05:57.474556+00	2022-05-30 19:22:54.983493+00	\N	Gujarati (India)		gu-IN	f
89	2022-05-27 10:05:57.480147+00	2022-05-30 19:22:54.995004+00	\N	Hindi (India)		hi-IN	f
90	2022-05-27 10:05:57.482977+00	2022-05-30 19:22:54.999484+00	\N	Croatian (Croatia)		hr-HR	f
91	2022-05-27 10:05:57.484906+00	2022-05-30 19:22:55.00687+00	\N	Hungarian (Hungary)		hu-HU	f
92	2022-05-27 10:05:57.486718+00	2022-05-30 19:22:55.013951+00	\N	Armenian (Armenia)		hy-AM	f
95	2022-05-27 10:05:57.50037+00	2022-05-30 19:22:55.031495+00	\N	Italian (Switzerland)		it-CH	f
96	2022-05-27 10:05:57.502381+00	2022-05-30 19:22:55.038328+00	\N	Italian (Italy)		it-IT	f
97	2022-05-27 10:05:57.506875+00	2022-05-30 19:22:55.042287+00	\N	Japanese (Japan)		ja-JP	f
98	2022-05-27 10:05:57.509712+00	2022-05-30 19:22:55.046343+00	\N	Javanese (Indonesia)		jv-ID	f
100	2022-05-27 10:05:57.516645+00	2022-05-30 19:22:55.057996+00	\N	Kazakh (Kazakhstan)		kk-KZ	f
101	2022-05-27 10:05:57.518682+00	2022-05-30 19:22:55.062029+00	\N	Khmer (Cambodia)		km-KH	f
102	2022-05-27 10:05:57.520485+00	2022-05-30 19:22:55.066013+00	\N	Kannada (India)		kn-IN	f
40	2022-05-27 10:05:57.301659+00	2022-05-31 08:36:05.273871+00	\N	English (United Kingdom)		en-GB	t
72	2022-05-27 10:05:57.425286+00	2022-05-30 19:22:54.897537+00	\N	Spanish (El Salvador)		es-SV	f
73	2022-05-27 10:05:57.427675+00	2022-05-30 19:22:54.905029+00	\N	Spanish (United States)		es-US	f
65	2022-05-27 10:05:57.393907+00	2022-05-30 19:22:54.858174+00	\N	Spanish (Honduras)		es-HN	f
118	2022-05-27 10:05:57.559671+00	2022-05-30 19:22:55.157304+00	\N	Norwegian Bokmål (Norway)		no-NO	f
119	2022-05-27 10:05:57.565308+00	2022-05-30 19:22:55.165153+00	\N	Punjabi (Gurmukhi, India)		pa-IN	f
120	2022-05-27 10:05:57.568001+00	2022-05-30 19:22:55.169108+00	\N	Polish (Poland)		pl-PL	f
140	2022-05-27 10:05:57.630574+00	2022-05-30 19:22:55.286931+00	\N	Telugu (India)		te-IN	f
141	2022-05-27 10:05:57.632444+00	2022-05-30 19:22:55.291621+00	\N	Thai (Thailand)		th-TH	f
142	2022-05-27 10:05:57.635604+00	2022-05-30 19:22:55.295973+00	\N	Turkish (Turkey)		tr-TR	f
143	2022-05-27 10:05:57.63888+00	2022-05-30 19:22:55.300442+00	\N	Ukrainian (Ukraine)		uk-UA	f
144	2022-05-27 10:05:57.641491+00	2022-05-30 19:22:55.307959+00	\N	Urdu (India)		ur-IN	f
145	2022-05-27 10:05:57.643374+00	2022-05-30 19:22:55.314775+00	\N	Urdu (Pakistan)		ur-PK	f
66	2022-05-27 10:05:57.399814+00	2022-05-30 19:22:54.86349+00	\N	Spanish (Mexico)		es-MX	f
67	2022-05-27 10:05:57.406366+00	2022-05-30 19:22:54.871641+00	\N	Spanish (Nicaragua)		es-NI	f
68	2022-05-27 10:05:57.4112+00	2022-05-30 19:22:54.876202+00	\N	Spanish (Panama)		es-PA	f
71	2022-05-27 10:05:57.422711+00	2022-05-30 19:22:54.893263+00	\N	Spanish (Paraguay)		es-PY	f
146	2022-05-27 10:05:57.645162+00	2022-05-30 19:22:55.322769+00	\N	Uzbek (Latin, Uzbekistan)		uz-UZ	f
80	2022-05-27 10:05:57.452659+00	2022-05-30 19:22:54.942141+00	\N	Filipino (Philippines)		fil-PH	f
88	2022-05-27 10:05:57.477388+00	2022-05-30 19:22:54.990882+00	\N	Hebrew (Israel)		he-IL	f
94	2022-05-27 10:05:57.494772+00	2022-05-30 19:22:55.026146+00	\N	Icelandic (Iceland)		is-IS	f
147	2022-05-27 10:05:57.646884+00	2022-05-30 19:22:55.329606+00	\N	Vietnamese (Vietnam)		vi-VN	f
99	2022-05-27 10:05:57.511713+00	2022-05-30 19:22:55.050466+00	\N	Georgian (Georgia)		ka-GE	f
148	2022-05-27 10:05:57.648817+00	2022-05-30 19:22:55.337342+00	\N	Cantonese (Traditional, Hong Kong SAR China)		yue-HK	f
104	2022-05-27 10:05:57.524879+00	2022-05-30 19:22:55.075122+00	\N	Lao (Laos)		lo-LA	f
149	2022-05-27 10:05:57.650863+00	2022-05-30 19:22:55.34165+00	\N	Chinese (Simplified, China)		zh-CN	f
150	2022-05-27 10:05:57.652971+00	2022-05-30 19:22:55.349063+00	\N	Chinese (Traditional, Hong Kong SAR China)		zh-HK	f
105	2022-05-27 10:05:57.526866+00	2022-05-30 19:22:55.083651+00	\N	Lithuanian (Lithuania)		lt-LT	f
106	2022-05-27 10:05:57.528943+00	2022-05-30 19:22:55.087974+00	\N	Latvian (Latvia)		lv-LV	f
151	2022-05-27 10:05:57.65487+00	2022-05-30 19:22:55.352761+00	\N	Chinese (Traditional, Taiwan)		zh-TW	f
107	2022-05-27 10:05:57.531035+00	2022-05-30 19:22:55.095321+00	\N	Macedonian (North Macedonia)		mk-MK	f
152	2022-05-27 10:05:57.657274+00	2022-05-30 19:22:55.357412+00	\N	Zulu (South Africa)		zu-ZA	f
108	2022-05-27 10:05:57.533577+00	2022-05-30 19:22:55.100137+00	\N	Malayalam (India)		ml-IN	f
109	2022-05-27 10:05:57.535267+00	2022-05-30 19:22:55.104273+00	\N	Mongolian (Mongolia)		mn-MN	f
110	2022-05-27 10:05:57.5379+00	2022-05-30 19:22:55.108628+00	\N	Marathi (India)		mr-IN	f
111	2022-05-27 10:05:57.541847+00	2022-05-30 19:22:55.115416+00	\N	Malay (Malaysia)		ms-MY	f
112	2022-05-27 10:05:57.544276+00	2022-05-30 19:22:55.123381+00	\N	Maltese (Malta)		mt-MT	f
113	2022-05-27 10:05:57.548511+00	2022-05-30 19:22:55.131107+00	\N	Burmese (Myanmar (Burma))		my-MM	f
114	2022-05-27 10:05:57.551052+00	2022-05-30 19:22:55.135097+00	\N	Norwegian Bokmål (Norway)		nb-NO	f
115	2022-05-27 10:05:57.552829+00	2022-05-30 19:22:55.140039+00	\N	Nepali (Nepal)		ne-NP	f
116	2022-05-27 10:05:57.554757+00	2022-05-30 19:22:55.148099+00	\N	Dutch (Belgium)		nl-BE	f
117	2022-05-27 10:05:57.557052+00	2022-05-30 19:22:55.152471+00	\N	Dutch (Netherlands)		nl-NL	f
121	2022-05-27 10:05:57.570195+00	2022-05-30 19:22:55.174175+00	\N	Pashto (Afghanistan)		ps-AF	f
122	2022-05-27 10:05:57.572496+00	2022-05-30 19:22:55.181774+00	\N	Portuguese (Brazil)		pt-BR	f
123	2022-05-27 10:05:57.575051+00	2022-05-30 19:22:55.189805+00	\N	Portuguese (Portugal)		pt-PT	f
124	2022-05-27 10:05:57.577228+00	2022-05-30 19:22:55.194167+00	\N	Romanian (Romania)		ro-RO	f
125	2022-05-27 10:05:57.581558+00	2022-05-30 19:22:55.198571+00	\N	Russian (Russia)		ru-RU	f
126	2022-05-27 10:05:57.584698+00	2022-05-30 19:22:55.205976+00	\N	Sinhala (Sri Lanka)		si-LK	f
127	2022-05-27 10:05:57.586927+00	2022-05-30 19:22:55.210182+00	\N	Slovak (Slovakia)		sk-SK	f
128	2022-05-27 10:05:57.592464+00	2022-05-30 19:22:55.214439+00	\N	Slovenian (Slovenia)		sl-SI	f
129	2022-05-27 10:05:57.595782+00	2022-05-30 19:22:55.218402+00	\N	Somali (Somalia)		so-SO	f
130	2022-05-27 10:05:57.6015+00	2022-05-30 19:22:55.227858+00	\N	Albanian (Albania)		sq-AL	f
131	2022-05-27 10:05:57.604016+00	2022-05-30 19:22:55.2323+00	\N	Serbian (Cyrillic, Serbia)		sr-RS	f
132	2022-05-27 10:05:57.607366+00	2022-05-30 19:22:55.240341+00	\N	Sundanese (Latin, Indonesia)		su-ID	f
133	2022-05-27 10:05:57.610024+00	2022-05-30 19:22:55.24519+00	\N	Swedish (Sweden)		sv-SE	f
134	2022-05-27 10:05:57.612197+00	2022-05-30 19:22:55.249491+00	\N	Swahili (Kenya)		sw-KE	f
135	2022-05-27 10:05:57.6184+00	2022-05-30 19:22:55.253458+00	\N	Swahili (Tanzania)		sw-TZ	f
136	2022-05-27 10:05:57.622155+00	2022-05-30 19:22:55.258321+00	\N	Tamil (India)		ta-IN	f
137	2022-05-27 10:05:57.624772+00	2022-05-30 19:22:55.263935+00	\N	Tamil (Sri Lanka)		ta-LK	f
138	2022-05-27 10:05:57.626895+00	2022-05-30 19:22:55.271811+00	\N	Tamil (Malaysia)		ta-MY	f
139	2022-05-27 10:05:57.628707+00	2022-05-30 19:22:55.278221+00	\N	Tamil (Singapore)		ta-SG	f
60	2022-05-27 10:05:57.377991+00	2022-05-30 19:22:54.822972+00	\N	Spanish (Dominican Republic)		es-DO	f
64	2022-05-27 10:05:57.390878+00	2022-05-30 19:22:54.850377+00	\N	Spanish (Guatemala)		es-GT	f
69	2022-05-27 10:05:57.416621+00	2022-05-30 19:22:54.880618+00	\N	Spanish (Peru)		es-PE	f
70	2022-05-27 10:05:57.41965+00	2022-05-30 19:22:54.888871+00	\N	Spanish (Puerto Rico)		es-PR	f
74	2022-05-27 10:05:57.431161+00	2022-05-30 19:22:54.911448+00	\N	Spanish (Uruguay)		es-UY	f
93	2022-05-27 10:05:57.492447+00	2022-05-30 19:22:55.021669+00	\N	Indonesian (Indonesia)		id-ID	f
103	2022-05-27 10:05:57.522603+00	2022-05-30 19:22:55.070554+00	\N	Korean (South Korea)		ko-KR	f
63	2022-05-27 10:05:57.386928+00	2022-05-30 19:22:54.841163+00	\N	Spanish (Equatorial Guinea)		es-GQ	f
\.


--
-- Data for Name: page_text_contents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_text_contents (id, created_at, updated_at, deleted_at, json_path, parent, content, language) FROM stdin;
2	2022-05-28 10:12:51.297+00	2022-05-31 11:29:12.530868+00	\N	header/customers	main/header	Customers	en
5	2022-05-28 10:12:51.297+00	2022-05-31 11:29:12.537019+00	\N	header/prices	main/header	Prices	en
3	2022-05-28 10:12:51.297+00	2022-05-31 11:29:12.533232+00	\N	header/investors	main/header	Investors	en
13	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.910825+00	\N	advantages/2/content	main/products/advantages	With vidby, you can reach new customers from other countries in no time. Among other things, this opens up new business opportunities and additional revenue from your digital advertising campaigns. 123	en
12	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.914712+00	\N	advantages/2/title	main/products/advantages	Achieve higher income and new business ideas 123	en
15	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.917492+00	\N	advantages/3/content	main/products/advantages	We have spared no resources in developing a translation software that <strong>gives you both quality and speed.</strong> The result: one minute of original video is completely translated and dubbed for you in only about two minutes. 123\n  	en
51	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/title	main/customers/main	Our customers	en
4	2022-05-28 10:12:51.297+00	2022-05-31 11:29:12.535177+00	\N	header/about_us	main/header	About us	en
290	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/fast/title	landing	<span class="selected">SCHNELL</span>	de
10	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.907779+00	\N	advantages/1/title	main/products/advantages	Increase reach, views and subscribers 123	en
14	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.920577+00	\N	advantages/3/title	main/products/advantages	Quick translation result 123	en
17	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.923226+00	\N	advantages/4/content	main/products/advantages	Our technologies allow you to get high-quality video translations in over <strong>70 languages.</strong> This allows you to successfully bring your videos to the world with all the stories, messages and content. 123	en
16	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.9251+00	\N	advantages/4/title	main/products/advantages	Increase reach, views and subscribers 123	en
18	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.926856+00	\N	develop/title	main/products/develop	We develop and research new products 123	en
19	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.929394+00	\N	develop/content	main/products/develop	vidby develops and researches new, sophisticated voice interfaces for natural interaction. The goal: Different voice colours with a variety of emotional expressions are offered to match the protagonists of the videos. The voices can be clearly assigned to an age category and a biological sex. 123\n\nIn the future, vidby's speech interfaces will even be able to convey emotions such as joy, anger, amazement or sadness. vidby's sophisticated translation technology will ultimately even recognize emotions and intonations. It defines sentence boundaries for real-time translation.\n\nSpeech and music can also be subsequently removed from an audio file. Spelling and punctuation is automatic.	en
22	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.931521+00	\N	develop/widget/1/items/1	main/products/develop	Joy 123	en
23	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.933452+00	\N	develop/widget/1/items/2	main/products/develop	Sadness 123	en
24	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.935214+00	\N	develop/widget/1/items/3	main/products/develop	Anger 123	en
25	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.937956+00	\N	develop/widget/1/items/4	main/products/develop	Surprise 123	en
26	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.94024+00	\N	develop/widget/1/items/5	main/products/develop	Fear 123	en
27	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.942772+00	\N	develop/widget/1/items/6	main/products/develop	Disgust 123	en
21	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.946216+00	\N	develop/widget/1/title	main/products/develop	Emotions 123	en
29	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.94819+00	\N	develop/widget/2/items/1	main/products/develop	Children 123	en
30	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.950296+00	\N	develop/widget/2/items/2	main/products/develop	Adults 123	en
31	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.952435+00	\N	develop/widget/2/items/3	main/products/develop	Teenagers 123	en
32	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.954358+00	\N	develop/widget/2/items/4	main/products/develop	Seniors 123	en
28	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.956504+00	\N	develop/widget/2/title	main/products/develop	Emotions 123	en
20	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.959256+00	\N	develop/widget/title	main/products/develop	123	en
8	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.899924+00	\N	main/button	main/products/main	Start video translation 123	en
9	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.902486+00	\N	advantages/title	main/products/advantages	Our products bring you advantages	en
11	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.905067+00	\N	advantages/1/content	main/products/advantages	Our technologies allow you to get high-quality video translations in over <strong>70 languages.</strong> This allows you to successfully bring your videos to the world with all the stories, messages and content. 123	en
1	2022-05-28 10:12:51.297+00	2022-05-31 11:29:12.525675+00	\N	header/products	main/header	Products	en
163	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.129916+00	\N	footer/follow-us/linkedin	main/footer	<a href="#">Linkedin</a>	de
159	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.098594+00	\N	footer/contacts/address-1	main/footer	<a href="#">Suurstoffi 8</a>	de
291	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/expert/title	landing	<span class="selected">EXPERTE</span>	de
292	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/fast/time	landing	FÜR 1 MINUTE DES NEUEN VIDEOS	de
293	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/fast/price	landing	<span class="selected">$ 0,9</span>	de
294	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/fast/button	landing	BESTELLEN	de
295	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/expert/time	landing	FÜR 1 MINUTE DES NEUEN VIDEOS	de
52	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/content	main/customers/main	Ambitious companies as well as universities, governments, state organizations and the film industry rely on vidby. They build bridges with us between cultures and their languages. They benefit from improved collaboration in international teams, from a faster “time to market” and the creation of a global knowledge community – connected through the medium of video. We are happy to support you with all your questions and individual applications of the vidby technology in start-up, SME and multinational corporate environments.	en
53	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	examples/title	main/customers/examples	Video examples of our customers	en
54	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	examples/button	main/customers/examples	Become a customer	en
59	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.614805+00	\N	invest/token-holder-agreement	main/investors/invest	33 Token Holder Agreement	en
68	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	form/input-placeholder	main/investors/form	Email address	en
69	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.643759+00	\N	form/button	main/investors/form		en
74	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/title	main/about/main	Translate videos automatically: <span class="selected">boundless knowledge</span> for international <span class="selected">teams and organizations</span>	en
75	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/mission/title	main/about/main	Our mission	en
77	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/story/title	main/about/main	vidby’s story	en
296	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/expert/price/1/title	landing	$ 5,9	de
63	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.632325+00	\N	equity-structure/title	main/investors/equity-structure	123 Equity structure	en
65	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.636287+00	\N	trade-history/title	main/investors/trade-history	123 Trade history	en
70	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.64603+00	\N	share-register/title	main/investors/share-register	123 Share register	en
72	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.650004+00	\N	business-reports/title	main/investors/business-reports	123 Business reports	en
73	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.651805+00	\N	business-reports/content	main/investors/business-reports	123 vidby AG was founded in 2021 with CHF 1,500,000 capital and closed the year with about CHF 500,000 liquidity.\n\nAccording to our projections, we will reach break-even by 2024. We need investments for the further development of the technology platform and for the development of new markets and applications.\n\nvidby already has a weighty commitment from investors in the start-up phase. We would like to broaden this in the near future.	en
297	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/expert/price/1/subtitle	landing	für 1 sprache	de
298	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/expert/price/2/title	landing	$ 0,9	de
55	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.59431+00	\N	main/title	main/investors/main	123 vidby's <span class="selected">AI translator creates</span> new business in global markets - and strengthens collaboration and knowledge	en
56	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.604845+00	\N	main/content	main/investors/main	123 Intercultural collaboration, smooth knowledge exchange and fast, spontaneous creativity - this requires the medium of video with optimal and fast translation.\n\nWith vidby’s advanced technologies, videos of any length and complexity are translated quickly and affordably. From understanding comes joint and strong action. For your success. For one world. Economically and socially.\n\nThe applications are as endless as the creativity of your people. Conquer new markets faster than ever. Use local knowledge. Educate efficiently and embed knowledge in people’s minds and hearts faster than ever.	en
57	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.608904+00	\N	invest/title	main/investors/invest	33 Invest in vidby	en
60	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.61867+00	\N	invest/registration-agreement	main/investors/invest	123 Registration Agreement	en
71	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.648206+00	\N	share-register/content	main/investors/share-register	123 Shareholders can register their shares either with the accompanying form, using a wallet of their choice, or by holding their shares with the <a href="https://www.aktionariat.com/documentation/how-to-buy-aktionariat-shares">Shareholder Wallet App</a> for iOS or Android.\n\nAfter registration, newly acquired blockchain shares will automatically be added to the shareholder register in your name. For more information, please see our privacy policy.\n\nFields marked with an asterisk (*) are mandatory.	en
299	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/expert/price/2/subtitle	landing	n jeder neuen Sprache	de
58	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.61142+00	\N	invest/content	main/investors/invest	33 vidby has tokenized some of its shares and trades them on <a href="https://www.aktionariat.com/">aktionariat.com</a> under the ticker symbol VIDS.\n\nAn investment in vidby is highly attractive, as evidenced by our growth figures and the keen interest from Fortune 500 companies already in the first months after its launch. vidby shares are an ideal diversification tool in the attractive high-tech and automation environment. Artificial intelligence and data are the drivers of the digitalized economy.\n\nUse Aktionariat’s VIDS brokerbot to acquire shares of vidby. To buy or sell vidby shares, use the widget to the right. Set up your <a href="https://www.aktionariat.com/documentation/how-to-buy-aktionariat-shares">wallet</a> beforehand.\n\n	en
61	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.621534+00	\N	invest/hint/1	main/investors/invest	123 Our shares were issued on optimism (Ethereum Layer 2). To buy shares with crypto you have to bridge them to optimism. Learn how: <a href="https://gateway.optimism.io/deposit">https://gateway.optimism.io/deposit</a> 	en
62	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.625365+00	\N	invest/hint/2	main/investors/invest	123 Do you need help? Here is a guide: <a href="https://www.aktionariat.com/documentation/funding-your-wallet-for-optimism">https://www.aktionariat.com/documentation/funding-your-wallet-for-optimism</a>	en
66	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.639399+00	\N	trade-history/content	main/investors/trade-history	123 This widget shows the last share transactions. The complete trade history is also available for download (<a href="https://api.aktionariat.com/trades.csv?ticker=VIDS">CSV file</a>)	en
67	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.641491+00	\N	form/title	main/investors/form	123 If you would like to be informed about future <span class="selected">transactions</span> and other important events related to our <span class="selected">stock tokens</span>, you can sign up here.	en
300	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/expert/button	landing	BESTELLEN	de
301	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/title	landing	Calculate cost	en
302	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/video-length	landing	VIDEO LENGTH	en
303	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/source-lang	landing	SOURCE LANGUAGE	en
304	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/n-of-new-langs	landing	NUMBER OF NEW LANGUAGES	en
305	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/accuracy	landing	TRANSLATION ACCURACY	en
306	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/min	landing	min	en
307	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/accuracy-80	landing	80% (automatic verification)	en
363	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	get-email-modal/button	landing	Submit	en
364	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	get-email-modal/button	landing	Submit	de
78	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/story/content	main/about/main	vidby is based on advanced methods and algorithms for automatic translation of video soundtracks. An international team of scientists and business and marketing experts uses the technology for a unique SaaS application: <a href="http://vidby.com">vidby.com</a>.\n\nFounded in the fall of 2021, Switzerland-based vidby AG markets the technology to video and communications professionals.	en
76	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/mission/content	main/about/main	Making any video content accessible to anyone, anywhere in the world. For better understanding, diversity and connected people and markets. vidby - <span class="selected">preserving linguistic diversity and knowledge</span>.\n\nWith vidby, intercultural teams get a simple and fast technology for the automatic translation of videos. The moving image medium thus takes on a new role in intercultural collaboration for building knowledge and communicating content and messages.	en
79	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	commitment/title	main/about/commitment	Our commitment	en
80	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	commitment/content	main/about/commitment	We believe in a world of boundless knowledge and easy sharing across all language barriers. The medium of video provides a fast and sustainable spread of knowledge and strengthens social relationships that can make our planet a better place.	en
81	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	start-translation/title	main/about/start-translation	vidby - preserving\nlinguistic diversity and knowledge	en
82	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	start-translation/button	main/about/start-translation	Start video translation	en
83	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	basis/title	main/price	Basis	en
84	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	basis/description	main/price	The basic subscription is ideal for short movies with one speaking person.	en
85	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	extended/title	main/price	Extended	en
86	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	extended/description	main/price	The Extended subscription is ideal for demanding movies. It offers more video minutes, more speakers, and perfect voice and video sync as well as support.	en
87	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	professional/title	main/price	Professional	en
88	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	professional/description	main/price	The Professional subscription is ideal for the most demanding applications. It offers all the benefits of Extended and extensive post-processing and training options.	en
89	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	basis/price	main/price	<sup>$</sup>750	en
90	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	basis/plan	main/price	USD\n/mo	en
91	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	basis/second-price	main/price	<sup>$</sup>700*	en
92	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	basis/second-plan	main/price	USD\n/mo	en
93	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	extended/price	main/price	<sup>$</sup>1450	en
94	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	extended/plan	main/price	USD\n/mo	en
95	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	extended/second-price	main/price	<sup>$</sup>1350*	en
96	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	extended/second-plan	main/price	USD\n/mo	en
97	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	professional/price	main/price	<sup>$</sup>2950	en
98	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	professional/plan	main/price	USD\n/mo	en
99	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	professional/second-price	main/price	<sup>$</sup>2650*	en
100	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	professional/second-plan	main/price	USD\n/mo	en
101	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	hint1	main/price	Unused video minutes will be applied to the following month.	en
102	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	hint2	main/price	The notice period is 30 days. In this case, any existing credit balance is forfeited.	en
104	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	reviews/title	main/customers/reviews	What our customers say	en
105	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	reviews/full-text-here	main/customers/reviews	Full text here	en
108	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	title	main/price	Prices for business customers	en
109	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	basis/button	main/price	<a href="https://vidby.com/subscribe/1">Buy a subscription</a>	en
110	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	extended/button	main/price	<a href="https://vidby.com/subscribe/2">Buy a subscription</a>	en
111	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	professional/button	main/price	<a href="https://vidby.com/subscribe/3">Buy a subscription</a>	en
112	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	title	main/terms-of-use	Terms of Use	en
113	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	content	main/terms-of-use	<div class="p">Effective September 19, 2021\n   <br>\n</div>\n<div class="p">\n   These Terms of Use are the basic rights and obligations that you and us have between us when you use our Service, which actually constitute a binding agreement between you and <strong>vidby AG </strong>with its registered office\n   at: Suurstoffi 8, 6343 Rotkreuz Switzerland (hereinafter referred to as the "Terms"). Herewith <strong>vidby AG</strong> (hereinafter referred to as "<strong>Company</strong>", "<strong>we</strong>", "<strong>us</strong>" or\n   "\n   <strong>our</strong>") offers you the access to and use of this Website, mobile applications (apps)s, products, services, programs, software and other services and tools developed by Company that are offered or may be offered\n   in the future on this Website and / or mobile app (hereinafter jointly referred to as "<strong>Service</strong>", "<strong>Services</strong>" or "<strong>vidby</strong>").\n   <br>\n</div>\n<div class="p">The Terms shall mean these Terms of Use and the Privacy Policy, which are published on the Website and constitute an integral part of these Terms.\n   <br>\n</div>\n<div class="p">\n   By accessing, downloading, viewing or performing any other use of the Service, you unconditionally agree to be bound by terms and conditions of these Terms in pursuance of its observance. If you do not agree or accept all or any of these terms and conditions\n   of these Terms, please do not use this Service.\n   <br>\n</div>\n<div class="p">\n   Services we provide are as follows: vidby. In order to use our Services, you need compatible hardware, software (latest version is recommended and in some cases required) and Internet access (fee may be charged by your provider). The quality of Service\n   provided depends on these factors.\n   <br>\n</div>\n<div class="p">\n   This Service and its content and functions are owned, managed and rendered by Company and are provided solely for your personal, non-commercial use and in accordance with the terms and conditions set forth hereunder.\n   <br>\n</div>\n<div class="p"><strong>1. Definitions</strong>\n   <br>\n</div>\n<div class="p">Unless otherwise expressly specified in the Terms, the following terms shall have the following meaning:\n   <br>\n</div>\n<div class="sub-p">\n   <div class="p subp">\n      1.1. "<strong>Service</strong>", "<strong>vidby</strong> " – Website, mobile app, services, programs, services and tools developed by vidby AG offered by Company or may be offered in the future for access or use on this\n      Website and / or mobile app;\n      <br>\n   </div>\n   <div class="p subp">\n      1.2. "<strong>Website</strong>" – a set of software, information and media assets, combined together, designed as separate Web pages and available at the Internet domain name https://vidby.com, development and administration\n      of which is performed by Company;\n      <br>\n   </div>\n   <div class="p subp">\n      1.3. "<strong>Mobile application</strong>", "<strong>Application</strong>" – Mobile apps, programs, software that contain a reference to these Terms and which have been developed by Company being responsible for their administration,\n      including but not limited to vidby;&nbsp;\n      <br>\n   </div>\n   <div class="p subp">1.4. "<strong>Company</strong>" – <strong>vidby AG </strong>with its registered office at: Suurstoffi 8, 6343 Rotkreuz, Switzerland.\n      <br>\n   </div>\n   <div class="p subp">\n      1.5. "<strong>You</strong>" or "<strong>User</strong>" – an individual who has either reached the age of "majority" or "legal responsibility" where you live or have valid parent or legal guardian consent to be bound by\n      these Terms as herein provided.\n      <br>\n   </div>\n</div>\n<div class="p"><strong>2. General Provisions</strong>\n   <br>\n</div>\n<div class="sub-p">\n   <div class="p subp">2.1. This service is provided on the terms specified on the website <a href="https://vidby.com" class="copy__link">https://vidby.com</a> and is provided to you by the Company.\n      <br>\n   </div>\n   <div class="p subp">\n      2.2. vidby allows you to do automatic translation and dubbing of videos, as well as translation and dubbing of videos by connecting people as specialists, and can also provide other functions specified on the Service website.\n      <br>\n   </div>\n   <div class="p subp">2.3. These Terms apply to both authorized Users and Users who have not passed the authorization procedure.\n      <br>\n   </div>\n   <div class="p subp">\n      2.4. By visiting, browsing, downloading or using vidby in any other way, you confirm that you have read, understood and agreed to these Terms of Use, Privacy Policy and other documents placed on this Website and/or in the app and you accept all terms\n      and conditions of these documents, without any exceptions and / or limitations and you will take all legal rights and responsibilities for the above documents (regardless of whether you use vidby on your own behalf or on\n      behalf of a third party).\n      <br>\n   </div>\n   <div class="p subp">\n      2.5. These Terms shall include this vidby Terms of Use, Privacy Policy, and other documents placed on this Website and / or in the app that may be amended or changed from time to time. Amendments or changes shall enter into force from the date of publication\n      on the Website. You should visit on a regular basis this Website to be informed of such amendments and changes.\n      <br>\n   </div>\n   <div class="p subp">2.6. You shall abstain from any use of vidby, authorization in vidby, and you should leave vidby if:\n      <br>\n   </div>\n   <div class="sub-p">\n      <div class="p subp">(i) you have not reached the age of "majority" or "legal responsibility" according to the law where you live or have not valid parent or legal guardian consent to be bound by these Terms;\n         <br>\n      </div>\n      <div class="p subp">(ii) you have no right to use the Service under the laws of the country in which you live;\n         <br>\n      </div>\n      <div class="p subp">(iii) you do not agree with the Term or any other documents placed on this Website and / or in the app that may be amended or changed from time to time.\n         <br>\n      </div>\n   </div>\n</div>\n<div class="p"><strong>3. Terms of the use of the Service</strong>\n   <br>\n</div>\n<div class="sub-p">\n   <div class="p subp">\n      3.1. Prior to first use of vidby, you may be offered to create an account and specify login (User’s Service ID) and password, or undergo authorization procedure by synchronizing User’s account in social network, e-mail (hereinafter referred to as “authorization”).\n      During authorization, you agree to entitle Company to use your login, access to contacts and account settings.\n      <br>\n   </div>\n   <div class="p subp">\n      3.2. You are fully responsible for all actions taken under your account, including maintaining in confidence passwords and other personal data. You confirm that you will neither transfer your password to third parties, nor give access to your account\n      and will not take any other actions that may pose a threat to the security of your account.\n      <br>\n   </div>\n   <div class="p subp">\n      3.3. By using our Services you also agree that the Company shall not bear liability for damages or losses caused to you as a result of using your account by third parties, regardless of whether you have given permission to do so or not. Furthermore, you\n      shall be responsible for any damages and/or losses caused to Company or any third party in connection with the use of your account by another person.\n      <br>\n   </div>\n   <div class="p subp">\n      3.4. You shall be responsible for any information and/or content created, submitted, published, posted or transmitted in any other way by you to the Website and/or in the Application as well as for any actions taken by you in relation to the Service.\n      <br>\n   </div>\n   <div class="p subp">3.5. In the event of lodging claims by third parties regarding infringement of their intellectual property rights by you, the burden of proving its legitimacy shall be laid upon you.\n      <br>\n   </div>\n   <div class="p subp">\n      3.6. You acknowledge that the information and content on the Service may be placed by other users, third parties and may be inaccurate, false, offensive, misleading and may contravene the law; and the Company neither be liable for checking and approving\n      the information and content posted by users or any third parties, nor for any loss or damage associated with it.\n      <br>\n   </div>\n   <div class="p subp">\n      3.7. In order to ensure compliance with the conditions set forth herein we reserve the right to verify the information and content posted by you on vidby. We may, at our own discretion and at any time without any explanation to you, block, delete or in\n      any other way cease placing any information, content by any user or any third parties on vidby. Such measures taken by the Company shall not be construed as recognition by the company of its liability for breach of any\n      legal rights and interests of third parties or waiver of any of its rights.\n      <br>\n   </div>\n   <div class="p subp">\n      3.8. You acknowledge and agree that you have all legal rights to the content (intellectual property, and namely video and sound files), which you send to us for translation. You are aware of who the video and voice file are subject to copyright and property\n      rights and you have no right to violate these rights and use such content without the explicit and full consent of the legal owner of such intellectual property.\n      <br>3.9. vidby may use customer content in its advertising materials, on the website and in social networks. If the client does not want to give such permission or wants to revoke the right to such use of his content, he must\n      write an official letter to the company's e-mail <a href="#">support@vidby.com</a>. If there is no such prohibition, then the vidby AG company by default has the right to use the client's content and the client gives such\n      consent by agreeing with the terms and conditions of the service.\n      <br>\n   </div>\n</div>\n<div class="p"><strong>4. Responsibility for Your Use</strong>\n   <br>\n</div>\n<div class="sub-p">\n   <div class="p subp">\n      4.1. You confirm that you either reached the age of "majority" or "legal responsibility" where you live or have valid parent or legal guardian consent to be bound by these Terms. If you do not know whether you have reached the age of majority or "legal\n      responsibility" where you live, or do not understand these Terms, please ask your parent or legal guardian for help before use of the vidby. If you are the parent or legal guardian of a minor that uses the vidby, you accept\n      these Terms on the minor’s behalf and are responsible for all use of the vidby, or Services. You should use our Service only if you are fully able to understand and enter into and comply with these Terms. Our Services are\n      not intended for children under 16: if you are under 16, please wait until you turn 16 to use them.\n      <br>\n   </div>\n   <div class="p subp">\n      4.2. For use of our Service you should control and make timely payments for mobile, Internet and other communication services provided by suppliers of such services (hereinafter referred to as “\n      <strong>Communication services</strong>”), as well as to maintain technical operability and serviceability of your computer (mobile) devices and anti-virus software. All and any tariffs and prices for Communication services\n      are established by providers of such Communication services. We will not perform control over or make any payments for any Communication services.\n      <br>\n   </div>\n   <div class="p subp">4.3. In addition to the other terms and conditions set forth in these Terms, you shall also:\n      <br>\n   </div>\n   <div class="sub-p">\n      <div class="p subp">(i) provide true, accurate and complete information about yourself, your mobile phone number or/and email when authorizing and update it in a timely fashion;\n         <br>\n      </div>\n      <div class="p subp">(ii) use the Service in pursuance of the Terms and applicable laws of the country where you live. It is your responsibility for the right to use the Service in the country where you live;\n         <br>\n      </div>\n      <div class="p subp">\n         (iii) not to use the Service individually or through a third party for purposes which may be qualified as a violation of intellectual property rights, unfair competition and other violation of the law;\n         <br>\n      </div>\n      <div class="p subp">\n         (iv) not to be involved in illegal or criminal activities, including but not limited to, use of fake identity, deliberate placement on the Website or Application the information, content aimed at discrediting or humiliating honour and dignity of third\n         parties; mislead; violate the intellectual property rights of third parties; violate the rights of privacy of third parties; place pornography, calls for violence, aggression, war, and any other information being restricted\n         or prohibited;\n         <br>\n      </div>\n      <div class="p subp">(v) not to violate copyrights, trademarks for goods and services, patents, databases, and/or other intellectual property rights owned or used by Company or third parties;&nbsp;\n         <br>\n      </div>\n      <div class="p subp">(vi) not to use personal data, private information of third parties without their prior consent;&nbsp;\n         <br>\n      </div>\n      <div class="p subp">\n         (vii) not to place on the Website/Application advertisements, promotional materials,&nbsp; commercial and service offers or requests to transfer money, except cases where we have previously gave our written consent for such placement;\n         <br>\n      </div>\n      <div class="p subp">(viii) not to perform actions that may affect proper operation of <strong>vidby</strong> or are interpreted as unfair use;\n         <br>\n      </div>\n      <div class="p subp">(ix) not to spread viruses, Trojans and other malicious programs;\n         <br>\n      </div>\n      <div class="p subp">(x) not to threaten, intimidate or harass other users;\n         <br>\n      </div>\n      <div class="p subp">(xi) not to illegally collect and process personal data of other persons;\n         <br>\n      </div>\n      <div class="p subp">(xii) individually and at your own expense settle all claims of third parties related to your activities in connection to the use of vidby.\n         <br>\n      </div>\n   </div>\n</div>\n<div class="p"><strong>5. Availability and Termination of the Service</strong>\n   <br>\n</div>\n<div class="sub-p">\n   <div class="p subp">\n      5.1. We reserve the right at any time and for any reason to modify or discontinue, temporarily or permanently, the work of all or any part of the Service and/or any software, facilities and services provided within this Service with or without notice\n      and/or establish general principles and restrictions with regard to their use. The Service and its operation may be suspended temporarily or permanently due to circumstances beyond our control, such as natural disasters\n      and other circumstances of insuperable force.\n      <br>\n   </div>\n   <div class="p subp">\n      5.2. In the event of your breach of any provisions of these Terms we reserve the right at any time at our own discretion to terminate or block your account, stop spreading by you of any information or content by blocking or removing them and with no explanations\n      neither to you, nor to any third party. In some cases, for the purpose of identification or confirmation of your breach of these Terms, we reserve the right to access all information, content placed by you while using the\n      Service and by accepting these Terms you acknowledge and agree that we may conduct such review.\n      <br>\n   </div>\n</div>\n<div class="p"><strong>6. Third Party Services</strong>\n   <br>\n</div>\n<div class="sub-p">\n   <div class="p subp">\n      6.1. Website, Application may contain links to Websites, apps, any information and/or content of third parties. Placing such links shall not mean that we approve them. We are not responsible for Websites, apps, any information and/or content placed under\n      such links, as well as for any negative consequences in this regard, and you shall waive any claim to us related to such links. By using information or content of third parties, you agree to be familiarized with the terms\n      of use, privacy policy and other documents of third parties. You bear all risks and liability arising from your use of these links, including but not limited to, browsing, viewing, access, download and any use of the third-party\n      information, content, third-party web sites, applications links to which may be specified while using the Service.\n      <br>\n   </div>\n</div>\n<div class="p"><strong>7. Disclaimer of Warranties and Limitation of Liability</strong>\n   <br>\n</div>\n<div class="sub-p">\n   <div class="p subp">\n      7.1. <strong>vidby</strong> (including the information obtained through it) is provided by us under the terms of “AS IT IS” without any warranty of any kind, including but not limited to, warranties with regard to legality\n      of property rights, non-infringement upon intellectual property rights, absence of computer viruses. We do not guarantee compliance of <strong>vidby </strong>(including information obtained through it, its accuracy, reliability\n      and the content itself) to your expectations, uninterrupted and failure-free operation of the Service as well as the accuracy of information obtained through <strong>vidby</strong>. We do not guarantee the absence of technical\n      errors and/or failures, including proper operation of <strong>vidby </strong>-related software. We do not also guarantee storage or further data and/or content display placed by you. We will not assume any obligation regarding\n      storage, maintenance or provision of any information, content or other your data except those specified in the Privacy Policy.\n      <br>\n   </div>\n   <div class="p subp">\n      7.2. We shall neither be responsible nor reimburse for expenses, losses (direct or indirect) incurred by you due to use of <strong>vidby </strong>&nbsp;as well as due to use or inability to use the information and content\n      obtained through <strong>vidby</strong>.\n      <br>\n   </div>\n   <div class="p subp">7.3. In the instance where you are not satisfied with the terms and/or quality of <strong>vidby </strong>&nbsp;and/or the Services, you must stop using <strong>vidby </strong>&nbsp;and/or Services.\n      <br>\n   </div>\n   <div class="p subp">\n      7.4. You are solely responsible before third parties for your activities while using the Service, including but not limited to, writing messages, downloading images to <strong>vidby </strong>, if you violate the rights or\n      legitimate interests of third parties.&nbsp;\n      <br>\n   </div>\n   <div class="p subp">7.5. We are not responsible for any information provided by you including incomplete, inaccurate, false, misleading as well as illegally seized information.\n      <br>\n   </div>\n   <div class="p subp">\n      7.6. We are not liable for any expenses, losses (direct, indirect, incidental) and lost profits due to malfunction in work of <strong>vidby </strong>&nbsp;and/or Services and/or due to the use or inability to use\n      <strong>vidby </strong>&nbsp;and/or Services.\n      <br>\n   </div>\n   <div class="p subp">\n      7.7. You agree to hold the Company, its subsidiaries and affiliates and their founders, directors, officers, employees, partners and members harmless against any disputes and disagreements, complaints, claims (hereinafter referred to as “claims”) and\n      undertakes to reimburse such persons any loss, damage, expense (including fees and expenses for legal and/or lawyer services) that have arisen or may arise in respect of: (i) your use of\n      <strong>vidby </strong>&nbsp;or any other our Services or products; (ii) violation by you of any provision of these Terms or Privacy Policy or the terms of the documents they refer to; (iii) our use of your personal data\n      and/or content; (iv) violation by you of any law or rights of any third parties, including rights or interests of other service providers.\n      <br>\n   </div>\n</div>\n<div class="p"><strong>8. Liability</strong>\n   <br>\n</div>\n<div class="sub-p">\n   <div class="p subp">8.1. In the event of failure or improper use of their obligations under these Terms, both you and the Company shall bear liability under these Terms and applicable law.\n      <br>\n   </div>\n   <div class="p subp">\n      8.2. The Parties shall not be liable for partial or complete failure to fulfil their obligations under these Terms if it is caused by circumstances of insuperable force (“force majeure”), which the Parties could not foresee or prevent by all reasonable\n      actions. Terms of fulfilment of obligations in these cases shall continue for the duration of such circumstances.\n      <br>\n   </div>\n   <div class="p subp">\n      8.3. If you fail to fulfil your obligations under these Terms, we, at our own discretion, shall have the right to take measures aimed at prevention of such violation. We are entitled to block access, fully or partially, to vidby until you stop or eliminate\n      such violations or possible occurrence of violations.\n      <br>\n   </div>\n</div>\n<div class="p"><strong>9. Intellectual Property Rights</strong>\n   <br>\n</div>\n<div class="sub-p">\n   <div class="p subp">\n      9.1. <strong>vidby</strong>, all and any of its components (including analytical, technical, graphical and other documentation, marks for goods and services, logos, slogans, leaflets and other promotional materials of the\n      Company published in vidby) (hereinafter referred to as “Intellectual Property”) are owned by the Company and protected by the law in the field of protection of intellectual property rights. All rights are reserved.\n      <br>\n   </div>\n   <div class="p subp">\n      9.2. The Company reserves exclusive right for <strong>vidby</strong> ownership, use and disposition (all intellectual property rights) (including: style of <strong>vidby</strong>, users’ reviews and content translated), and\n      the User or any other person shall have no right to reproduce, copy, redistribute, analyse screen data, create links to <strong>vidby</strong>, make posts or use <strong>vidby</strong> in any other way&nbsp; for commercial\n      purposes (including any translations made by <strong>vidby</strong> and Users’ reviews) including use of brand or logo without written consent of <strong>vidby</strong>. Any unauthorized use or any of the above actions shall\n      be deemed material breach of Company’s intellectual property rights (including copyright).\n      <br>\n   </div>\n   <div class="p subp">\n      9.3. Unless otherwise provided in these Terms and/or Company’s written consent, you shall not to take actions violating Company’s intellectual property rights, including but not limited to, sale, import, export, licensing, leasing, introducing changes,\n      distribution, copying, reproduction, transmitting, public demonstration, public performance, publication, adaptation, editing or creating derivative works from materials, design elements or content of <strong>vidby</strong>.\n      Use of content, materials and other items being Company’s intellectual property for any purpose not expressly specified in these Terms is prohibited.\n      <br>\n   </div>\n   <div class="p subp">\n      9.4. By using our Service you guarantee us that you are the owner or hold all necessary rights, licenses, written consent and approvals of third parties to use and grant us the right to use all intellectual property rights with regard to all information,\n      content posted, uploaded or in any other way transferred within the Service or with its help under these Terms.\n      <br>\n   </div>\n   <div class="p subp">\n      9.5. By posting or uploading or in any other way transmitting any information, content within the Service or with its help (except for the User’s data defined by the Privacy Policy), you provides us with a nonexclusive, royalty-free, perpetual, assignable,\n      worldwide license to use in any way known with the right to edit, change, incorporate, combine, customize, record and reproduce, distribute, publish, use in advertising, for commercial purposes, rental, tenancy, export,\n      import, sale, dissemination or otherwise alienation of any information, content (including trademarks) and other items of intellectual property posted, published, provided, downloaded, stored, sent and received by you within\n      the Service or with its help.\n      <br>\n   </div>\n   <div class="p subp">\n      9.6. By accepting these Terms, you receive from us an individual, royalty-free, nonexclusive, limited, revocable, non-transferable license to use <strong>vidby</strong>, including but not limited to, installing the app on\n      personal mobile phone and/or other device and use of it for personal, non-commercial purposes. Notwithstanding the above said, you are prohibited to decipher, decompile, crack, develop, examine technical process of any\n      part of the Service or take such actions; interfere in technological protection of the Service; delegate access rights to the Service; publish, copy, transfer to the possession, use or disposal to third persons, including\n      but not limited to, lease out, sell, export, import, distribute or otherwise alienate any part of the Service or the whole Service.\n      <br>\n   </div>\n   <div class="p subp">\n      9.7. Any information, content posted by third parties within the Service or with its help shall be the property of third parties. The Company does not provide to you or any other persons with any rights and licenses for intellectual property rights of\n      such third parties.\n      <br>\n   </div>\n   <div class="p subp">9.8. You are not entitled to any other license or rights except as expressly specified in these Terms.\n      <br>\n   </div>\n</div>\n<div class="p"><strong>10. Applicable Law and Settlement of Disputes</strong>\n   <br>\n</div>\n<div class="sub-p">\n   <div class="p subp">10.1. To the extent permitted by law, these Terms shall be governed by, construed and enforced in accordance with the laws of Switzerland, with no reference to its conflicts of law provision.\n      <br>\n   </div>\n   <div class="p subp">\n      10.2. All claims, litigations, disputes that may arise between you and the Company in the process of the performance of these Terms shall be resolved by the Parties through negotiations. For the purposes of disputes settlement between you and the Company\n      an effective and binding mean of communication with the authorized representative of Company shall be correspondence through the following e-mail:\n      <a href="mailto:support@vidby.com" class="copy__link">support@vidby.com</a>.\n      <br>\n   </div>\n   <div class="p subp">\n      10.3. Should the parties fail to come to an agreement with respect to dispute settlement within 30 (thirty) calendar days from the start of negotiations, the dispute shall be submitted to the competent court pursuant to the laws of Swirzwrland. You agree\n      that you may file a claim to the Company only on individual basis and not as plaintiff, legal representative or pleader etc., each your requirements can not be combined with other requirements and shall be considered on\n      an individual basis.\n      <br>\n   </div>\n</div>\n<div class="p"><strong>11. Effect, Termination and Modification of the Terms</strong>\n   <br>\n</div>\n<div class="sub-p">\n   <div class="p subp">11.1. These Terms shall remain in effect until terminated by one of the Parties.\n      <br>\n   </div>\n   <div class="p subp">\n      11.2. You may terminate these Terms at any time by ceasing the use of Service. You shall be deemed to have ceased to use Service if you have not used the Service or visited Website or Application more than 90 (ninety) days in a row. The Company reserves\n      the right to send you information or promotional letters upon termination of these Terms; unless you expressly declare that you do not want to receive mailings from the Company.\n      <br>\n   </div>\n   <div class="p subp">11.3. The Company is entitled to terminate these Terms at any time by sending you a message.\n      <br>\n   </div>\n   <div class="p subp">\n      11.4. The Company shall have the right to incorporate changes or amendments to these Terms at any time without any special message by placing a revised version of the Terms on the Website. The revised version of the Terms shall enter into force from the\n      date of its placing on the Website, unless otherwise stipulated by the revised version of the Terms.\n      <br>\n   </div>\n   <div class="p subp">11.5. Any changes incorporated into these Terms shall remain in effect upon availability of the express consent of <strong>vidby</strong>.\n      <br>\n   </div>\n   <div class="p subp">\n      11.6. In the event the User does not accept revised version of the Terms, the User must stop using <strong>vidby</strong> as well as attend, view, download or use <strong>vidby</strong> in any other way.\n      <br>\n   </div>\n   <div class="p subp">\n      11.7. The absence of objections from the User expressed in the form of cessation of use of <strong>vidby</strong> shall be deemed as the consent with the revised version of the Terms. Notwithstanding the possibility of ceasing\n      the use of <strong>vidby</strong> upon termination of these Terms, the User shall still be liable for obligations taken by the User under these Terms or that have been applied to him/her before termination of these Terms.\n      <br>\n   </div>\n   <div class="p subp">11.8. The following provisions of the Terms shall be in force upon termination of these Terms: “Intellectual Property Rights”, “Disclaimer of Warranties and Limitation of Liability”, “Liability”.\n      <br>\n   </div>\n</div>\n<div class="p"><strong>12. Final provisions</strong>\n   <br>\n</div>\n<div class="sub-p">\n   <div class="p subp">12.1. Communication. The Parties have agreed that during the execution of these Terms the information shall be transmitted via email.\n      <br>\n   </div>\n   <div class="p subp">\n      12.2. Notifications. The User agrees that Company may send notifications to the User in the following manner: (i) by sending banner message (advertisement) relating to the Service and other services of <strong>vidby</strong>,\n      or (ii) by e-mail sent to the address provided by the User, or (iii) by any means, including mobile number, telephone or mail. The User agrees to provide his/her valid contact information.\n      <br>\n   </div>\n   <div class="p subp">\n      12.3. Severability. Should any provision of these Terms be considered invalid, illegal or impossible to be fulfilled in any respect and if it has no detrimental effect on the interests of the Parties, then: (a) such provisions shall not be deemed valid\n      by the Parties and shall not be constituent part of these Terms, and (b) all other provisions of these Terms shall remain in full force and effect. To the extent permitted by the applicable law, the Parties shall waive\n      the provisions of the law subject to which any provision of these Terms is invalid, illegal or impossible to be fulfilled.\n      <br>\n   </div>\n   <div class="p subp">\n      12.4. Should any part of the Service require payment&nbsp; in the future, the User shall be obliged to comply with the additional conditions set out separately in respect of that part of the Service, which shall prevail in the event of conflict with these\n      Terms.\n      <br>\n   </div>\n   <div class="p subp">\n      12.5. The Service shall not be be distributed or used in those countries where distribution or use of the Service may violate local laws or create grounds for applying any of legal norms of such countries. Company shall reserve the right to limit rendering\n      the Service in any country.\n      <br>\n   </div>\n   <div class="p subp">\n      12.6. These Terms has been drawn up in the <strong>English language</strong>. Should any translation of these Terms into another language be in conflict with its version in the English language, its version in the English\n      language shall have priority over any other version.\n      <br>\n   </div>\n   <div class="p subp">12.7. The User shall not delegate his/her rights, right to claim and obligations under these Terms without prior written consent of the Company.\n      <br>\n   </div>\n   <div class="p subp">\n      12.8. Company shall have the right at its own discretion to delegate, assign or otherwise alienate its rights and obligations under these Terms to other persons without prior written consent of the User.\n      <br>\n   </div>\n   <div class="p subp">12.9. These Terms shall not grant any rights to third parties, except as otherwise expressly provided in these Terms.\n      <br>\n   </div>\n</div>\n<div class="p"><strong>13. Contacts</strong>\n   <br>\n</div>\n<div class="p">\n   <strong>\n   vidby AG<br>\n   ‍\n   </strong>\n   Suurstoffi 8&nbsp;\n   <br>6343 Rotkreuz&nbsp;\n   <br>Switzerland\n   <br>\n</div>	en
114	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	title	main/privacy-policy	Privacy Policy	en
115	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	content	main/privacy-policy	<div class="p-2">Effective September 19, 2021\n   <br>\n</div>\n<div class="p-2 head"><strong>Key Information</strong>\n   <br>\n</div>\n<ul>\n   <li class="list-item"><strong>vidby AG</strong> is the data controller of your personal information.</li>\n   <li class="list-item">We collect the personal information set out in the "Information We Collect" section of this Privacy Policy below, including identity verification data and information about your use of our Service.&nbsp;</li>\n   <li class="list-item">\n      We use your personal information for the purposes set out in the "How We Use the Information" section of this Privacy Policy below, including providing our Service to you, ensuring the security and performance of our Service, sharing information with\n      other users and our partners, direct marketing and performing statistical analysis of the use of our Service.&nbsp;\n   </li>\n   <li class="list-item">\n      We process your personal data as set out in this Privacy Policy on the basis of your consent. In situations where we obtain your personal data from a source other than you, we process your data on the basis of legitimate interests, until the earlier of\n      (a) the point at which you provide your consent; or (b) the point at which you ask us to stop processing your data on the basis of our legitimate interests. We also rely on legitimate interest for very limited additional\n      purposes as set out in the "Scope and Consent" section.\n   </li>\n   <li class="list-item">\n      You have a number of rights that you can exercise in relation to our use of your personal information, as set out in the "Updating or Deleting Your Personally Identifiable Information" section of this Privacy Policy below.\n   </li>\n</ul>\n<div class="p-2 head"><strong>Purpose and who we are</strong>\n   <br>\n</div>\n<div class="p-2">\n   The purpose of this Privacy Policy is to describe how <strong>vidby AG</strong> ("<strong>vidby</strong>," "<strong>us</strong>," "<strong>we</strong>," or "<strong>our</strong>") collects, uses and shares information about you\n   through our online interfaces (e.g., mobile applications and websites) owned and controlled by us, including mobile applications<strong> vidby</strong> or bots Telegram @vidby or website\n   <a href="https://vidby.com" class="copy__link">https://vidby.com</a>&nbsp; (collectively referred to herein as the "<strong>Service</strong>" or "<strong>vidby</strong>"). Please read this notice carefully to understand what\n   we do. If you do not understand any aspects of our Privacy Policy, please feel free to contact us at support@vidby.com Your use of our Site is also governed by our Terms of Use link to which is on the site\n   <br>\n</div>\n<div class="p-2">\n   <strong>vidby AG</strong> is a Swiss company with a principal place of business at Suurstoffi 8, 6343 Rotkreuz, Switzerland. If you reside or are located in the European Economic Area ("EEA") <strong>vidby</strong> is the data\n   controller of all Personally Identifiable Information (as defined below) collected via the Service and of certain Personally Identifiable Information collected from third parties, as set out in this Privacy Policy.&nbsp;\n   <br>\n</div>\n<div class="p-2">\n   In general, we only collect information that allows us to provide you with our best Service. This includes, for example, simple tasks like allowing other users to see the name and picture you choose to show. It also helps us to keep our Service clear\n   of fraud and spam, and it allows us to get a unique understanding of what additional services may be useful to you, and all other purposes set out in this policy below.&nbsp;\n   <br>\n</div>\n<div class="p-2 head"><strong>Age requirement</strong>\n   <br>\n</div>\n<div class="p-2">\n   <strong>To use vidby you must be at least 16 years old</strong>. If you are under 16 years of age, then please do not use or access <strong>vidby</strong> or any other our Service at any time or in any manner. We will take appropriate\n   steps to delete any Personally Identifiable Information of persons less than 16 years of age that has been collected on our Service without verified parental consent upon learning of the existence of such Personally Identifiable\n   Information.&nbsp;\n   <br>\n</div>\n<div class="p-2 head"><strong>What Information this Privacy Policy Covers</strong>\n   <br>\n</div>\n<div class="p-2">\n   This Privacy Policy covers information we collect from you through our Service. In order to access certain features and benefits on our Service, you may need to submit, or we may collect, your "\n   <strong>Personally Identifiable Information</strong>" (i.e., information that can be used to identify you). Personally Identifiable Information can include information such as your name, mobile number and/or email address,\n   among other things. If you reside or are located in the EEA, it can also include your IP address or device identifier. You are responsible for ensuring the accuracy of the Personally Identifiable Information you submit to\n   <strong>vidb</strong>y. Inaccurate information may affect your ability to use the Service, the information you receive when using the Service, and our ability to contact you.\n   <br>\n</div>\n<div class="p-2 head"><strong>Scope and Consent</strong>\n   <br>\n</div>\n<div class="p-2">\n   Before you start using <strong>vidby</strong>, it’s important you understand that by using the Service, you allow us to collect, use, disclose, and retain your personal information and other information. We will only use your\n   information as described in this Policy.\n   <br>\n</div>\n<div class="p-2">By using the Service, you are also agreeing to our Terms of Use. Please make sure you read and agree with our Terms of Use if you want to use <strong>vidby</strong>.\n   <br>\n</div>\n<div class="p-2">\n   If you do not agree with any of <strong>vidby’s</strong> Privacy Policy, Cookies Policy or Terms of Use please <strong>do not use our Service and do not provide any Personally Identifiable Information to us</strong>. If you refuse\n   or withdraw your consent, or if you choose not to provide us with any required Personally Identifiable Information, we may not be able to provide you with the services that can be offered throughout <strong>vidby</strong>. Consent\n   can be withdrawn at any time. To remove your consent or deleting your account, please contact as at support@vidby.com. Please note that we may also rely on legitimate interests or fulfilment of a contract to continue processing\n   your data.&nbsp;\n   <br>\n</div>\n<div class="p-2">Please note that we rely on legitimate interests as the basis for processing your data in the limited circumstances set out below:\n   <br>\n</div>\n<div class="p-2">\n   In situations where we obtain your personal data from a source other than you, we process your data on the basis of legitimate interests, until the earlier of (a) the point at which you provide your consent; or (b) the point at which you ask us to stop\n   processing your data on the basis of our legitimate interests;\n   <br>\n</div>\n<div class="p-2">\n   We may retain your records for our own compliance and verification purposes (including where we are required to do so by law or by legitimate interest of our partners), even after you withdraw your consent to our processing of your data;\n   <br>\n</div>\n<div class="p-2">\n   We will use information relating to your use of our services for statistical analysis and research purposes, however we delete your name, mobile number and email address from such information before we do so.\n   <br>\n</div>\n<div class="p-2 head"><strong>Information we collect</strong>\n   <br>\n</div>\n<div class="p-2">\n   We must receive or collect some information to operate, provide, improve, understand, customize, support, and market our Service, including when you install, access, or use our Service. The types of information we receive and collect depend on how you\n   use our Service.&nbsp;\n   <br>\n</div>\n<div class="p-2">We collect the minimum information required to achieve the purposes set out in this Policy (see below), and you have the ability to limit such collection, as specified below under “Additional Options”:\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(i) Personally Identifiable Information provided directly by you:</em></strong> When you use our Service you voluntarily give us personal information (e.g., name, phone number, email, birth date, age, gender, country\n   of living and the desired language for use) and therefore you are not anonymous to us. In addition, providing us with the indicated information you con\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(ii) Personally Identifiable Information provided directly by third party sites: </em></strong>If you register for or sign in into your <strong>vidby</strong> account through your email or social networking sites,\n   you agree to give us with a continued access to all of your personal data listed on such a social network sites (e.g., your email address, birthday, country of residence).&nbsp;\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(iii) </em></strong>Aimed at improving the Service, except the above data on your activities, we will also collect the information on how you use <strong>vidby</strong>’s functions and tools; on your access to\n   <strong>vidby</strong>’s webpages, content, websites, apps, services, any messages sent by other users within and through <strong>vidby</strong>; applications downloaded by you within or through <strong>vidby</strong>.\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(iv) Device data:</em></strong>  <strong>vidby</strong> collects data on devices and networks used by the User to connect to <strong>vidby</strong> (e.g. IP-address, URLs, operating system and browser software used,\n   Internet Service Provider and the geographic location of his or her point of connectivity, device identifiers, language and regional settings).\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(v) </em></strong>We also use (or may use) cookies and web beacons when you visit our Service. For more information on our use of cookies and web beacons, please refer to our Cookie Policy.\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(vi) Partner sites: </em></strong>If you use services of our partners who provide <strong>vidby</strong>-related tools and services, then non-financial information on how you use these sites and/or services, as well\n   as\n   <strong>vidby</strong>, can also be collected. To improve the services of <strong>vidby</strong> and the sites and / or services of our partners, and to improve the quality of such services, we can share this information with\n   partners (in particular, data on the time spent on the relevant site or application and on the pages viewed). At the same time, any transfer or exchange of information with our partners will be carried out exclusively in accordance\n   with this Policy, as well as in compliance with applicable laws and regulations (including but not limited to GDPR).\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(vii) Other data:</em></strong> we are trying to do our best and provide you with a good services quality, in which regard we may upgrade our Service and establish new partnership relations in the future, which would\n   result in obtaining further additional data. If we start collecting new types of personal data or significantly alter the processing of your data, then relevant amendments will be incorporated into this Privacy Policy and we\n   will notify you of such amendments.\n   <br>\n</div>\n<div class="p-2 head"><strong>How We Use the Information</strong>\n   <br>\n</div>\n<div class="p-2">We aim at constant improvement of our Service and offering you new opportunities. In this regard we can use the information provided by for the following purposes:\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(i) Enabling vidby and services</em></strong>: We use the Personally Identifiable Information provided by you with the aim to (i) register you in the <strong>vidby</strong> application and create your\n   <strong>vidby</strong> user account; (ii) create your profile; (iii) provide support, provide you with information about your user account, and respond to your requests; (iv) provide an individual approach by providing content\n   (for example, information from other services) within the Service, including targeted advertisement of <strong>vidby</strong>&nbsp; sevices and partner services, which we believe may be of most interest to you; (iv) provide\n   you with access to the Service and provide the requested information, products and services.&nbsp;\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(ii) Technical support and security: </em></strong>We may use Personally Identifiable Information to provide technical support to you, where required, and to ensure the security of <strong>vidby</strong> and our services.\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(iii) Updates: </em></strong>We use Personally Identifiable Information collected when you sign-up to send you the messages in connection with the Service or news related to it. We may also archive this information\n   and/or use it for future communications with you, where we are legally entitled to do so.\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(iv) Communications with or from us: </em></strong>When you send us an email message or otherwise contact us, we may use the information provided by you to respond to your communication and/or as described in this\n   Privacy Policy. We may also archive this information and/or use it for future communications with you where we are legally entitled to do so. Where we send you emails, we may track the way that you interact with these emails\n   (such as when you open an email or click on a link inside an email). We use this information for the purposes of optimizing and better tailoring our communications to you.\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(v) Communications with our Business Partners, Advertising:</em></strong> We may share your Personally Identifiable Information with our business partners so that such partners may share information about their products\n   and services that may be of interest to you where they are legally entitled to do so.\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(vi) Disclosure to application providers and other third parties: </em></strong>We have the right to disclose your information, including your Personally Identifiable Information, to service providers and other\n   third parties under contract who help us providing you and to other users with our Service on our behalf, or other services provided by third parties through vidby Services (including but not limited to investigation of fraud\n   and spam activities, site analytics, provision of special partnerships opportunities with our Service - either without identification of users, or using a unique identifier, not tied to the identity of the user). This is necessary\n   to protect the data they receive.\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(vii) Disclosure to our Operations and Maintenance Contractors:</em></strong> We use various service providers, vendors and contractors (collectively, "<strong>Contractors</strong>") to assist us in providing our\n   products and services to you. Our Contractors may have limited access to your Personally Identifiable Information in the course of providing their products or services to us, so that we in turn can provide our products and\n   services to you. These Contractors may include vendors and suppliers that provide us with technology, services, and/or content related to the operation and maintenance of the Service. Access to your Personally Identifiable\n   Information by these contractors is limited to the information reasonably necessary for the Contractor to perform its limited function for us.\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(viii) Government Authorities, Legal Rights and Actions:</em></strong> We may share your Personally Identifiable Information with various government authorities in response to subpoenas, court orders, or other legal\n   process; to establish or exercise our legal rights or to protect our property; to defend against legal claims; or as otherwise required by law. In such cases we reserve the right to raise or waive any legal objection or right\n   available to us. We also may share your Personally Identifiable Information when we believe it is appropriate to investigate, prevent, or take action regarding illegal or suspected illegal activities; to protect and defend\n   the rights, property, or safety of <strong>vidby</strong>, the Service, our users, customers, or others; and in connection with our Terms of Use and other agreements.\n   <br>\n</div>\n<div class="p-2">\n   <strong><em>(ix) Disclosure to Acquirers: </em>vidby</strong> may disclose and/or transfer your Personally Identifiable Information to an acquirer, assignee or other successor entity in connection with a sale, merger, or reorganization\n   of all or substantially all of the equity, business or assets of <strong>vidby</strong> AG to which your Personally Identifiable Information relates.\n   <br>\n</div>\n<div class="p-2 head"><strong>Data Retention</strong>\n   <br>\n</div>\n<div class="p-2">\n   Unless otherwise specified, we retain information as long as it is necessary and relevant for us to achieve the purposes referred to above or to enable us to comply with our legal data protection retention obligations. Upon deactivation of your account\n   or revoking your consent on processing your data, we will minimize the personal data we keep about you only to such data which we are required to keep to comply with laws, or other legal reasons. We may keep activity data on\n   a non-identifiable basis to improve our services. Your posts on public accounts and communities may remain available if you do not delete them.\n   <br>\n</div>\n<div class="p-2">\n   Please note, we can store certain data of deactivated accounts in order to comply with legal requirements, prevent fraud, assist with investigations, resolve disputes, analyzes or troubleshoot programs, and with the aim to enforce\n   <strong>vidby</strong> Terms of Use or undertake other actions provided by law. Likewise, if your account has been closed or temporarily disabled, we can save some information to prevent your re-registration.\n   <br>\n</div>\n<div class="p-2 head"><strong>Confidentiality and Security of Data</strong>\n   <br>\n</div>\n<div class="p-2">\n   We consider the confidentiality and security of your information to be of the utmost importance. We will use industry standard physical, technical and administrative security measures to keep your Personally Identifiable Information confidential and secure\n   and will not share it with third parties, except as otherwise provided in this Privacy Policy, or unless such disclosure is necessary in special cases, such as a physical threat to you or others, as permitted by applicable\n   law. Because the Internet is not a 100% secure environment we cannot guarantee the security of Personally Identifiable Information, and there is some risk that an unauthorized third party may find a way to circumvent our security\n   systems or that transmission of your information over the Internet will be intercepted. It is your responsibility to protect the security of your login information. Please note that e-mails communications are typically not\n   encrypted and should not be considered secure.\n   <br>\n</div>\n<div class="p-2 head"><strong>Technical, organizational and other measures</strong>\n   <br>\n</div>\n<div class="p-2">\n   <strong>vidby</strong> endeavor to ensure that the data disclosed by you are as secure as possible. To that end we constantly strive to improve and introduce new number of technical and organizational measures which protect\n   your Personally Identifiable Information from unauthorized or unlawful processing and from unintentional loss, destruction or damage.&nbsp;\n   <br>\n</div>\n<div class="p-2">\n   <strong>vidby</strong> aims at minimizing the processing of Personally Identifiable Information. We only process information which is indispensable or information which you provide us with your consent beyond the scope of the\n   necessary processing.&nbsp;\n   <br>\n</div>\n<div class="p-2">\n   As mentioned above in this Privacy Policy, we disclose your personal data to third persons in certain cases in which we have an obligation to do so. In such cases we choose trustworthy partners of whom we can be sure they are going to apply personal data\n   protection standards that offer at least the same level of security as those adopted by <strong>vidby</strong>.\n   <br>\n</div>\n<div class="p-2">When personal data are transferred to state administration bodies, we use the most suitable and the most secure options offered by the given body.\n   <br>\n</div>\n<div class="p-2 head"><strong>Exercise of your rights</strong>\n   <br>\n</div>\n<div class="p-2 head"><strong>Right to information</strong>\n   <br>\n</div>\n<div class="p-2">\n   <strong>vidby</strong> respect the principle of transparency of personal data processing. In accordance with this principle we will provide information to you on the manner in which your personal data are processed.&nbsp;\n   <br>\n</div>\n<div class="p-2">If you wish to know in general which of your Personally Identifiable Information we process, you may submit your request via <a href="mailto:support@vidby.com" class="copy__link">support@vidby.com</a>\n   <br>\n</div>\n<div class="p-2">\n   If you wish to find out concrete Personally Identifiable Information which are processed directly for you, you can submit your request via <a href="mailto:support@vidby.com" class="copy__link">support@vidby.com</a> and\n   <strong>specify which concrete piece of information you require</strong>. The information to which you are entitled is described in Articles 13 and 14 of the GDPR. If you do not submit specific requirements, your request will\n   be viewed as a general request under the previous paragraph.&nbsp;\n   <br>\n</div>\n<div class="p-2">\n   We need to point out that if we are not able to verify your identity electronically or if there is reasonable doubt as to your identity, we may ask you to submit proof of identity at the office of <strong>vidby</strong> AG. Only\n   in this way we can rule out the possibility that your Personally Identifiable Information are disclosed to a person who only pretends to be you.\n   <br>\n</div>\n<div class="p-2">Your request will be handled in as short time as possible. But keep in mind that often this is a very complicated process which may take several weeks.\n   <br>\n</div>\n<div class="p-2 head"><strong>Right to Accessing, Reviewing, and Rectification Your Personally Identifiable Information</strong>\n   <br>\n</div>\n<div class="p-2">\n   As a registered user, you can view and modify Personally Identifiable Information, confirm its accuracy and relevance, subscribe to the <strong>vidby</strong> or partner newsletter, at any time, using access to your account in\n   the Application. Please remember to update your Personally Identifiable Information if it changes or becomes out of date.\n   <br>\n</div>\n<div class="p-2">If you reside or are located in the EEA, you have the right to request that we:\n   <br>\n</div>\n<ul>\n   <li class="list-item">provide access to any Personally Identifiable Information we hold about you;</li>\n   <li class="list-item">prevent the processing of your Personally Identifiable Information for direct-marketing purposes;</li>\n   <li class="list-item">update any Personally Identifiable Information which is out of date or incorrect;</li>\n   <li class="list-item">delete any Personally Identifiable Information which we are holding about you;</li>\n   <li class="list-item">restrict the way that we process your Personally Identifiable Information;</li>\n   <li class="list-item">provide your Personally Identifiable Information to a third party provider of services; or</li>\n   <li class="list-item">provide you with a copy of any Personally Identifiable Information which we hold about you.</li>\n</ul>\n<div class="p-2">\n   If you would like further information in relation to your rights or would like to exercise any of them, you may also contact us via <a href="mailto:support@vidby.com" class="copy__link">support@vidby.com</a>&nbsp;\n   <br>\n</div>\n<div class="p-2">\n   In certain cases we cannot rectify your Personally Identifiable Information. This includes cases when your incorrect or outdated personal data are contained in documents which we have to archive by law.&nbsp;\n   <br>\n</div>\n<div class="p-2 head"><strong>Withdrawal of consent to personal data processing and right to be forgotten</strong>\n   <br>\n</div>\n<div class="p-2">\n   If <strong>vidby</strong> process your Personally Identifiable Information on the basis of your consent with such processing, you can stop their further processing at any time. You only have to withdraw your consent to such processing.&nbsp;\n   <br>\n</div>\n<div class="p-2">\n   You can also exercise your right to be forgotten. In such case <strong>vidby</strong> will destroy all your Personally Identifiable Information that we process. Exception is cases when the processing is performed on the basis\n   of a statutory obligation or for a legitimate interest of <strong>vidby</strong>. Also in this case <strong>vidby</strong> may demand your identification before destroying the Personally Identifiable Information.&nbsp;\n   <br>\n</div>\n<div class="p-2 head"><strong>Additional Options</strong>\n   <br>\n</div>\n<div class="p-2">\n   From time to time, we can send you messages about the activities and operation of our Service (for example, changes in policies, technical issues, etc.). We may also send notifications about our or third parties offers, which in our opinion may be of\n   interest to you. If you do not want to receive such notifications, you can unsubscribe them in the system settings or by writing to us at\n   <a href="mailto:support@vidby.com" class="copy__link">support@vidby.com</a>&nbsp;\n   <br>\n</div>\n<div class="p-2 head"><strong>Cookies and Tracking Technologies</strong>\n   <br>\n</div>\n<div class="p-2">When you visit the App and/or our Website, we and our business partners may use cookies and other tracking technologies for a variety of purposes. To learn more visit our Cookies Policy.\n   <br>\n</div>\n<div class="p-2 head"><strong>Questions, Suggestions and Complaints</strong>\n   <br>\n</div>\n<div class="p-2">If you have any privacy-related questions, suggestions, unresolved problems, or complaints you may contact us via <a href="mailto:support@vidby.com" class="copy__link">support@vidby.com</a>&nbsp;\n   <br>\n</div>\n<div class="p-2">\n   If you reside or are located in the EEA, our Data Protection Officer and Privacy Team may assist with all queries regarding our processing of Personally Identifiable Information at\n   <a href="mailto:support@vidby.com" class="copy__link">support@vidby.com</a>&nbsp;\n   <br>\n</div>\n<div class="p-2">\n   If you reside or are located in the EEA, you may also make a complaint to our supervisory body for data protection matters (namely the Swiss Office for Personal Data Protection) or seek a remedy through local courts if you believe that your rights have\n   been breached.\n   <br>\n</div>\n<div class="p-2 head"><strong>California Privacy Rights</strong>\n   <br>\n</div>\n<div class="p-2">\n   Under California’s "Shine the Light" law, California residents who provide personal information in obtaining products or services for personal, family or household use are entitled to request and obtain from us once a calendar year information about the\n   customer information we shared, if any, with other businesses for their own direct marketing uses. If applicable, this information would include the categories of customer information and the names and addresses of those businesses\n   with which we shared customer information for the immediately prior calendar year (e.g. requests made in 2022 will receive information regarding 2021 sharing activities).\n   <br>\n</div>\n<div class="p-2">\n   To obtain this information, please send an email message to <a href="mailto:support@vidby.com" class="copy__link">support@vidby.com</a> with\n   <strong>"Request for California Privacy Information" on the subject line and in the body of your message</strong>. We will provide the requested information to you at your e-mail address in response. Please be aware that not\n   all information sharing is covered by the "Shine the Light" requirements and only information on covered sharing will be included in our response.\n   <br>\n</div>\n<div class="p-2 head"><strong>International Privacy Practices</strong>\n   <br>\n</div>\n<div class="p-2">\n   <strong>vidby</strong> Service is primarily operated and managed on servers located and operated within the Germany and USA. In order to provide our products and services to you, we may send and store your Personally Identifiable\n   Information (also commonly referred to as personal data) outside of the country where you reside or are located, including to Germany and USA. Accordingly, if you reside or are located outside of Germany and USA, your Personally\n   Identifiable Information may be transferred outside of the country where you reside or are located, including to countries that may not or do not provide the same level of protection for your Personally Identifiable Information.\n   We are committed to protecting the privacy and confidentiality of Personally Identifiable Information when it is transferred. If you reside or are located within the EEA and such transfers occur, we take appropriate steps to\n   provide the same level of protection for the processing carried out in any such countries as you would have within the EEA to the extent feasible under applicable law.&nbsp;\n   <br>\n</div>\n<div class="p-2 head"><strong>Updating personal data protection principles</strong>\n   <br>\n</div>\n<div class="p-2">\n   <strong>vidby</strong> keep the personal data protection principles up-to-date and in compliance with applicable legal regulations. For this reason they may be changed from time to time. We ask all our users to pay due attention\n   to these principles.\n   <br>\n</div>\n<div class="p-2 head"><strong>Representative in the EU</strong>\n   <br>\n</div>\n<div class="p-2">\n   To comply with all its obligations arising under the GDPR <strong>vidby</strong> appoints as of 25 of May 2018 the Representative, who represents <strong>vidby</strong> in the EU with regard of data processing (Representative).\n   The Representative’s task is to monitor compliance with the GDPR and in cooperation with the <strong>vidby</strong>’s employees the Representative is your contact in EU for your enquiries, comments, complaints and claims regarding\n   personal data protection.&nbsp;\n   <br>Representative contact data:\n   <br>\n   <strong>vidby</strong>  <strong>AG</strong>&nbsp;Suurstoffi 8, 6343 Rotkreuz, Switzerland\n   <br>Enquiries, comments, complaints and claims relating to the protection of personal data may also be submitted via <a href="mailto:support@vidby.com" class="copy__link">support@vidby.com</a>&nbsp;\n   <br>\n</div>\n<div class="p-2">n the event you read this policy in any language other than English, you agree that in the event of any discrepancies, the English version shall prevail.\n   <br>\n</div>	en
118	2022-05-28 10:12:51.297+00	2022-05-31 11:29:26.168899+00	\N	header/investors	main/header	Investoren	de
119	2022-05-28 10:12:51.297+00	2022-05-31 11:29:26.171764+00	\N	header/about_us	main/header	Über uns	de
120	2022-05-28 10:12:51.297+00	2022-05-31 11:29:26.173883+00	\N	header/prices	main/header	Preise	de
121	2022-05-28 10:12:51.297+00	2022-05-31 11:29:26.176128+00	\N	header/login	main/header	Anmelden	de
116	2022-05-28 10:12:51.297+00	2022-05-31 11:29:26.153252+00	\N	header/products	main/header	Produkte	de
117	2022-05-28 10:12:51.297+00	2022-05-31 11:29:26.162903+00	\N	header/customers	main/header	Kunden	de
106	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.627446+00	\N	hold-tokenize/title	main/investors/hold-tokenize	123 Hold tokenized shares and traditional shares securely in self-custody with our <span class="selected">Portfolio App</span>	en
122	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/title	main/products/main	<span class="selected">Künstliche Intelligenz</span> von vidby übersetzt und vertont Videos	de
123	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/content	main/products/main	Start-ups und KMUs nutzen unsere Software ebenso wie grosse, international tätige Organisationen, NGO sowie Influencer und Blogger.\n\nMit Vidby können sie kostengünstiger und effektiver in neue Märkte vordringen, internationale Teams führen und Wissen unabhängig von Standort oder Sprache verankern.\n\nVidby forscht und arbeitet auch in den Bereichen Live-Übersetzung sowie Konferenzübersetzung gleichzeitig in über 70 Sprachen – in allen Sprachpaarungen.	de
124	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/button	main/products/main	Videoübersetzung starten	de
125	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	advantages/title	main/products/advantages	Unsere Produkte bringen Ihnen Vorteile	de
126	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	advantages/1/title	main/products/advantages	Reichweite, Aufrufe und Abonnenten steigern	de
127	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	advantages/1/content	main/products/advantages	Unsere Technologien ermöglichen Ihnen qualitativ hochwertige Videoübersetzungen in über <strong>70 Sprachen</strong>. Damit können Sie Ihre Videos mit allen Geschichten, Botschaften und Inhalte erfolgreich in die Welt tragen.	de
128	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	advantages/2/title	main/products/advantages	Höheres Einkommen und neue Geschäftsideen realisieren	de
129	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	advantages/2/content	main/products/advantages	Mit vidby erreichen Sie im Handumdrehen neue Kunden <strong>aus anderen Ländern</strong>. Das eröffnet Ihnen unter anderem neue Geschäftsmöglichkeiten und Mehreinnahmen aus Ihren digitalen Werbekampagnen.	de
130	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	advantages/3/title	main/products/advantages	Schnelles Übersetzungsergebnis	de
131	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	advantages/3/content	main/products/advantages	Wir haben keine Ressourcen für die Entwicklung einer Übersetzungssoftware gescheut, die Ihnen sowohl <strong>Qualität als auch Geschwindigkeit bietet</strong>. Das Ergebnis: eine Minute Originalvideo wird in nur etwa zwei Minuten vollständig für Sie übersetzt und synchronisiert.	de
132	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	advantages/4/title	main/products/advantages	Minimale Investition, maximales Ergebnis und Qualität	de
133	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	advantages/4/content	main/products/advantages	Mit ein paar Klicks erhalten Sie Ihre Videoübersetzung und -synchronisierung zum günstigen Tarif. Sie brauchen keine komplizierten Verträge mehr, keine Synchronsprecher, Tonmeister, Übersetzer oder teures Studioequipment. Videoübersetzungen sind <strong>effizient und kostengünstig</strong>.	de
134	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/title	main/products/develop	Wir entwickeln und forschen an neuen Produkten	de
135	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/content	main/products/develop	vidby entwickelt und forscht an neuen, hochentwickelten Sprachinterfaces für eine natürliche Interaktion.\nDas Ziel: Passend zu den Protagonistinnen und Protagonisten der Videos bieten sich unterschiedliche Stimmfarben mit einer Vielzahl an Gefühlsausdrücken an. Die Stimmen lassen sich klar einer Alterskategorie und einem biologischen Geschlecht zuweisen.\n\nvidbys Sprachinterfaces vermögen in Zukunft sogar Gefühle zu vermitteln wie Freude, Zorn, Erstaunen oder Traurigkeit. Die hochentwickelte Übersetzungstechnologie von vidby erkennt dereinst sogar Emotionen und Intonationen. Sie definiert für die Echtzeitübersetzung die Satzgrenzen.\n\nSprache und Musik lassen sich dann auch nachträglich aus einer Audiodatei entfernen. Die Rechtschreibung und Zeichensetzung erfolgt automatisch.	de
136	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/widget/title	main/products/develop	Unsere laufenden Entwicklungen:	de
137	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/widget/1/title	main/products/develop	Emotionen	de
138	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/widget/1/items/1	main/products/develop	Freude	de
139	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/widget/1/items/2	main/products/develop	Trauer	de
140	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/widget/1/items/3	main/products/develop	Ärger	de
141	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/widget/1/items/4	main/products/develop	Überraschung	de
142	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/widget/1/items/5	main/products/develop	Furcht/Angst	de
143	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/widget/1/items/6	main/products/develop	Ekel	de
144	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/widget/2/title	main/products/develop	Emotionen	de
145	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/widget/2/items/1	main/products/develop	Kinder	de
146	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/widget/2/items/2	main/products/develop	Erwachsene	de
147	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/widget/2/items/3	main/products/develop	Teenager	de
148	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	develop/widget/2/items/4	main/products/develop	Senioren	de
168	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/title	main/customers/main	Unsere Kunden	de
208	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	professional/description	main/price	Das Professional-Abonnement ist ideal für höchst anspruchsvolle Anwendungen. Es bietet alle Leistungen von Extended und umfangreiche Nachbearbeitungswerkzeuge sowie Schulungen.	de
164	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.12805+00	\N	footer/follow-us/facebook	main/footer	<a href="#">Facebook</a>	de
154	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.144673+00	\N	footer/service/about-us	main/footer	Über uns	de
153	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.147978+00	\N	footer/service/investors	main/footer	Investoren	de
150	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.150196+00	\N	footer/service/products	main/footer	Produkte	de
152	2022-05-28 10:12:51.297+00	2022-05-31 11:30:15.436978+00	\N	footer/service/investors	main/footer	Investoren	de
167	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.122855+00	\N	footer/copyright/all-rights-reserved	main/footer	Alle Rechte vorbehalten Schweiz	de
160	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.108148+00	\N	footer/contacts/address-2	main/footer	<a href="#">6343 Rotkreuz</a>	de
161	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.115323+00	\N	footer/contacts/address-3	main/footer	<a href="#">Switzerland</a>	de
149	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.15192+00	\N	footer/service/title	main/footer	Service	de
169	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/content	main/customers/main	Ambitionierte Unternehmen sowie Universitäten, Regierungen, staatliche Organisationen als auch die Filmindustrie setzen auf vidby. Sie bauen mit uns Brücken zwischen den Kulturen und ihren Sprachen. Sie profitieren von einer verbesserten Zusammenarbeit in internationalen Teams, von einer schnelleren "Time to market" und dem Aufbau einer globalen Wissensgemeinschaft – verbunden durch das Medium Video. Gerne unterstützen wir Sie bei all Ihren Fragen und individuellen Anwendungen der vidby-Technologie im Start-up-, KMU- und multinationalen Konzernumfeld.	de
170	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	examples/title	main/customers/examples	Videobeispiele unserer Kunden	de
171	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	examples/button	main/customers/examples	Werden Sie unser Kunde	de
172	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	reviews/title	main/customers/reviews	Das sagen unsere Kunden	de
173	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	reviews/full-text-here	main/customers/reviews	Vollständiger Text hier.	de
174	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/title	main/investors/main	vidbys <span class="selected">KI-Übersetzer schafft</span> neues Business in globalen Märkten – und stärkt Zusammenarbeit und Wissen	de
175	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/content	main/investors/main	Interkulturelle Zusammenarbeit, reibungsloser Wissenstausch und schnelle, spontane Kreativität – dazu braucht es das Medium Video mit optimaler und schneller Übersetzung.\n\nMit vidbys fortgeschrittenen Technologien sind Videos jeder Länge und Komplexität schnell und günstig übersetzt.\nAus Verständnis erwächst gemeinsames und starkes Handeln. Für Ihren Erfolg. Für eine Welt. Wirtschaftlich und gesellschaftlich.\n\nDie Anwendungen sind unendlich wie die Kreativität Ihrer Mitarbeitenden. Erobern Sie neue Märkte schneller den je. Nutzen Sie lokales Wissen. Schulen Sie effizient und verankern Sie Wissen schneller denn je in den Köpfen und Herzen der Menschen.	de
176	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	invest/title	main/investors/invest	Investieren Sie in vidby	de
179	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	invest/hint/2	main/investors/invest	Brauchst du Hilfe? Hier gibts eine Anleitung: <a href="https://www.aktionariat.com/documentation/funding-your-wallet-for-optimism">https://www.aktionariat.com/documentation/funding-your-wallet-for-optimism</a>	de
178	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	invest/hint/1	main/investors/invest	Unsere Aktien wurden auf Optimism (Ethereum Layer 2) ausgegeben. Um Aktien mit Krypto zu kaufen, müssen Sie sie mit Optimism transferieren. Hier geht's zur Brücke: <a href="https://gateway.optimism.io/deposit">https://gateway.optimism.io/deposit</a> \n	de
177	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	invest/content	main/investors/invest	vidby hat einen Teil seiner Aktien tokenisiert und handelt sie auf <a href="https://www.aktionariat.com/">aktionariat.com</a> unter dem Tickersymbol VIDS.\n\nEin Investment in vidby ist höchst attraktiv, das bezeugen unsere Wachstumszahlen und das rege Interesse von Fortune-500-Unternehmen bereits in den ersten Monaten nach der Gründung. vidby-Aktien sind ein ideales Diversifizierungsinstrument im attraktiven High-tech- und Automatisierungsumfeld. Künstliche Intelligenz und Daten sind die Treiber der digitalisierten Wirtschaft.\n\nMit dem VIDS Brokerbot von Aktionariat erwerben Sie Aktien von vidby. Nutzen Sie zum Kauf oder Verkauf von vidby Aktien das nebenstehende Widget. Richten Sie zuvor Ihr <a href="https://www.aktionariat.com/documentation/how-to-buy-aktionariat-shares">Wallet</a> ein.\n\n	de
180	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	hold-tokenize/title	main/investors/hold-tokenize	Hold tokenized shares and traditional shares securely in self-custody with our <span class="selected">Portfolio App</span>	de
181	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	hold-tokenize/content	main/investors/hold-tokenize	Our mobile wallet is the safe deposit box for your shares. Connect your mobile wallet to a Brokerbot to buy stocks and access them anytime. Register your personal details in the wallet before buying to be automatically recorded in the company's share register.\n\nSee the market value of your shares at any time and transfer them directly to another wallet if needed. The wallet also acts as an authentication tool for a company's signatories, e.g., to approve transactions.	de
182	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	equity-structure/title	main/investors/equity-structure	Eigenkapitalstruktur	de
209	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	basis/price	main/price	<sup>$</sup>750	de
210	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	basis/plan	main/price	USD\n/mo	de
211	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	basis/second-price	main/price	<sup>$</sup>700*	de
212	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	basis/second-plan	main/price	USD\n/mo	de
213	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	extended/price	main/price	<sup>$</sup>1450	de
214	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	extended/plan	main/price	USD\n/mo	de
215	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	extended/second-price	main/price	<sup>$</sup>1350*	de
216	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	extended/second-plan	main/price	USD\n/mo	de
217	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	professional/price	main/price	<sup>$</sup>2950	de
218	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	professional/plan	main/price	USD\n/mo	de
219	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	professional/second-price	main/price	<sup>$</sup>2650*	de
220	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	professional/second-plan	main/price	USD\n/mo	de
221	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	hint1	main/price	Nicht verbrauchte Videominuten werden auf den Folgemonat übertragen.	de
222	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	hint2	main/price	Die Kündigungsfrist beträgt 30 Tage. In diesem Falle verfällt ein vorhandenes Guthaben.	de
6	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.88348+00	\N	main/title	main/products/main	<span class="selected">Artificial intelligence</span> from vidby translates and dubs videos 123	en
7	2022-05-28 10:12:51.297+00	2022-05-31 16:15:57.893527+00	\N	main/content	main/products/main	Start-ups and SMEs use our software just as much as large, internationally active organizations, NGOs and influencers and bloggers. 123\n\nWith vidby, you can enter new markets cheaper and effectively without language barriers, lead international teams, and embed knowledge regardless of location or language.\n\nVidby also researches and works in the areas of live translation as well as conference translation simultaneously in over 70 languages – in all language pairs.	en
310	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/result	landing	RESULT	en
311	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/prod-time	landing	PRODUCTION TIME	en
312	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/cost	landing	ORDER COST	en
313	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/discount	landing	DISCOUNT	en
314	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/total	landing	TOTAL	en
315	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/button	landing	Get results by email	en
316	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/title	landing	Kosten berechnen	de
317	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/video-length	landing	VIDEOLÄNGE	de
318	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/source-lang	landing	AUSGANGSSPRACHE	de
319	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/n-of-new-langs	landing	ANZAHL NEUER SPRACHEN	de
183	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	equity-structure/content	main/investors/equity-structure	Die vidby AG ist eine Schweizer Aktiengesellschaft mit Sitz in Rotkreuz ZG und der Handelsregisternummer CH-170.3.046.218-5.  Ihr Zweck besteht darin, Technologien für neue Sprachinterfaces und die automatisierte Übersetzung von Videos zu entwickeln und zu vermarkten.\n\nIhr Kapital ist in <span class="selected">1′700′000</span> Aktien mit einem Nennwert von je 1,00 CHF eingeteilt, wovon <span class="selected">143′422</span> Aktien von der Gesellschaft selbst gehalten werden. Auf der Grundlage einer Registrierungsvereinbarung werden <span class="selected">1′450′000</span> Aktien der vidby AG als ERC-20-Token mit dem Namen "Draggable vidby AG Shares" auf der Ethereum-Blockchain registriert. Der aktuelle Marktpreis pro Aktie beträgt <span class="selected">13.00 CHF</span>, was einer Marktkapitalisierung von <span class="selected">20′228′509 CHF</span> entspricht.	de
184	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	trade-history/title	main/investors/trade-history	Trade history	de
185	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	trade-history/content	main/investors/trade-history	Dieses Widget zeigt die letzten Share Transactions. Die komplette Trade History ist auch als Download erhältlich (<a href="https://api.aktionariat.com/trades.csv?ticker=VIDS">CSV-Datei</a>).	de
186	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	form/title	main/investors/form	Wenn Sie über künftige <span class="selected">Transaktionen</span> und andere wichtige Ereignisse in Bezug auf unsere <span class="selected">Aktien-Token informiert</span> werden möchten, können Sie sich hier anmelden.	de
187	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	share-register/title	main/investors/share-register	Aktienregister	de
188	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	share-register/content	main/investors/share-register	Aktionäre können ihre Aktien entweder mit dem nebenstehenden Formular registrieren, indem sie ein Wallet ihrer Wahl verwenden, oder indem sie ihre Aktien mit der <a href="https://www.aktionariat.com/documentation/how-to-buy-aktionariat-shares">Aktionariat Wallet App</a> für iOS oder Android halten.\n\nNach der Registrierung werden neu erworbene Blockchain-Aktien automatisch auf Ihren Namen in das Aktionärsregister aufgenommen. Weitere Informationen finden Sie in unseren Datenschutzrichtlinien.\n\nDie mit einem Sternchen (*) gekennzeichneten Felder sind Pflichtfelder.	de
189	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	business-reports/title	main/investors/business-reports	Geschäftsberichte	de
190	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	business-reports/content	main/investors/business-reports	Die vidby AG wurde 2021 mit 1’500’000 CHF Kapital gegründet und schloss das Jahr mit rund 500’000 CHF Liquidität ab.\n\nWir werden nach unseren Projektionen den Break-even bis 2024 Jahren erreichen. Für die Weiterentwicklung der Technologieplattform und für das Erschliessen neuer Märkte und Anwendungen benötigen wir Investitionen.\n\nvidby verfügt bereits in der Startphase über ein gewichtiges Engagement von Investoren.\nWir möchten dies in naher Zukunft breiter aufstellen.	de
191	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	invest/token-holder-agreement	main/investors/invest	Token Holder Agreement	de
192	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	invest/registration-agreement	main/investors/invest	Registration Agreement	de
193	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/title	main/about/main	Videos automatisch übersetzen: <span class="selected">grenzenloses Wissen</span> für internationale <span class="selected">Teams und Organisationen.</span>	de
194	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/mission/title	main/about/main	Unsere Mission	de
195	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/mission/content	main/about/main	Jeden Video-Content für jeden Menschen weltweit zugänglich machen. Für ein besseres Verständnis, Diversität und miteinander verbundene Menschen und Märkte. vidby – <span class="selected">sprachliche Vielfalt und Wissen erhalten</span>.\n\nMit vidby erhalten interkulturelle Teams eine einfache und schnelle Technologie zur automatischen Übersetzung von Videos. Das bewegte Bildmedium erhält damit in der interkulturellen Zusammenarbeit eine neue Rolle beim Aufbau von Wissen und zur Vermittlung von Inhalten und Botschaften.	de
196	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/story/title	main/about/main	vidby’s story	de
197	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	main/story/content	main/about/main	vidby basiert auf fortgeschrittenen Methoden und Algorithmen zur automatischen Übersetzung von Video-Tonspuren. Ein internationales Team aus Wissenschaftern, Business- und Marketingexperten nutzt die Technologie für eine einzigartige SaaS-Anwendung: <a href="http://vidby.com">vidby.com</a>.\n\nDie im Herbst 2021 gegründete vidby AG mit Sitz in der Schweiz vermarket die Technologie für Video-, Marketing- und Kommunikationsprofis.	de
198	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	commitment/title	main/about/commitment	Unser Bekenntnis	de
199	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	commitment/content	main/about/commitment	Wir glauben an eine Welt des grenzenlosen Wissens und des einfachen Austausches. Das Medium Video sorgt für eine schnelle und nachhaltige Verbreitung von Wissen und stärkt soziale Beziehungen	de
200	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	start-translation/title	main/about/start-translation	vidby - sprachliche\nVielfalt und Wissen erhalten	de
201	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	start-translation/button	main/about/start-translation	Videoübersetzung starten	de
202	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	title	main/price	Preise für Geschäftskunden	de
203	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	basis/title	main/price	Basis	de
204	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	basis/description	main/price	Das Basis-Abonnement ist ideal für kurze Filme mit einer sprechenden Person.	de
205	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	extended/title	main/price	Extended	de
206	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	extended/description	main/price	Das Extended-Abonnement ist ideal für anspruchsvolle Filme. Es bietet mehr Videominuten, mehr Sprecher und perfekte Sprach- und Videosynchronisation sowie Support.	de
207	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	professional/title	main/price	Professional	de
223	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	basis/button	main/price	<a href="https://vidby.com/subscribe/1">Kaufen Sie ein Abonnement</a>	de
224	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	extended/button	main/price	<a href="https://vidby.com/subscribe/2">Kaufen Sie ein Abonnement</a>	de
225	2022-05-28 10:12:51.297+00	2022-05-28 10:12:51.96+00	\N	professional/button	main/price	<a href="https://vidby.com/subscribe/3">Kaufen Sie ein Abonnement</a>	de
103	2022-05-28 10:12:51.297+00	2022-05-31 11:29:12.538972+00	\N	header/login	main/header	Login	en
282	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/fast/button	landing	ORDER	en
283	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/expert/time	landing	FOR 1 MINUTE OF THE NEW VIDEO	en
284	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/expert/price/1/title	landing	$ 5,9	en
285	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/expert/price/1/subtitle	landing	for 1 language	en
286	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/expert/price/2/title	landing	$ 0,9	en
287	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/expert/price/2/subtitle	landing	in each new language	en
288	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/expert/button	landing	ORDER	en
289	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/title	landing	PREISGESTALTUNG	de
249	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	benefits/1	landing	<span class="selected">70+</span> languages translation	en
250	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	benefits/2	landing	data <span class="selected">confidentiality</span>	en
251	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	benefits/3	landing	translation <span class="selected">speed</span>	en
107	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.629606+00	\N	hold-tokenize/content	main/investors/hold-tokenize	123 Our mobile wallet is the safe deposit box for your shares. Connect your mobile wallet to a Brokerbot to buy stocks and access them anytime. Register your personal details in the wallet before buying to be automatically recorded in the company's share register.\n\nSee the market value of your shares at any time and transfer them directly to another wallet if needed. The wallet also acts as an authentication tool for a company's signatories, e.g., to approve transactions.	en
64	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	equity-structure/content	main/investors/equity-structure	123 Vidby AG is a Swiss corporation with its registered office in Rotkreuz ZG and the commercial register number CH-170.3.046.218-5. Its purpose is to develop and market technologies for new language interfaces and the automated translation of videos.\n\nIts capital is divided into <span class="selected">1′700′000</span> shares with a par value of CHF 1.00 each, of which <span class="selected">143′422</span> shares are held by the company itself. Based on a registration agreement, <span class="selected">1′450′000</span> shares of vidby AG are registered as ERC-20 tokens named "Draggable vidby AG Shares" on the Ethereum blockchain. The current market price per share is <span class="selected">13.00 CHF</span>, which corresponds to a market capitalization of <span class="selected">20′228′509 CHF</span>.	en
226	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	header/advantages	landing	ADVANTAGES	en
227	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	header/how-it-works	landing	HOW IT WORKS	en
228	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	header/examples	landing	EXAMPLES	en
229	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	header/reviews	landing	REVIEWS	en
230	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	header/pricing	landing	PRICING	en
231	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	header/request-demo	landing	REQUEST DEMO	en
232	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	header/login	landing	LOGIN	en
233	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	header/advantages	landing	VORTEIL	de
234	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	header/how-it-works	landing	WIE ES FUNKTIONIERT	de
235	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	header/examples	landing	BEISPIEL	de
236	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	header/reviews	landing	GÄSTEBEWERTUNGEN	de
237	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	header/pricing	landing	PREISGESTALTUNG	de
238	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	header/request-demo	landing	DEMO ANFORDERN	de
239	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	header/login	landing	LOGIn	de
240	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	main/title	landing	<span class="selected">FAST TRANSLATION</span> AND DUBBING OF VIDEOS	en
241	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	main/content	landing	Just paste a link or upload a video that you want to translate	en
242	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	main/button	landing	Start now	en
243	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	main/widget/title	landing	YOUR VIDEO. <span class="selected">WHOLE WORLD.</span>	en
244	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	main/widget/video	landing	video	en
245	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	main/title	landing	<span class="selected">SCHNELLE ÜBERSETZUNG</span> UND SYNCHRONISATION VON VIDEOS	de
246	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	main/button	landing	Start now	de
247	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	main/widget/title	landing	DEIN VIDEO. <span class="selected">DIE GANZE WELT.</span>	de
248	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	main/widget/video	landing	video	de
252	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	benefits/4	landing	<span class="selected">24/7</span> transfers\nanywhere in world 	en
253	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	benefits/5	landing	<span class="selected">100%</span> process automation	en
254	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	benefits/6	landing	<span class="selected">high-quality</span>translation	en
255	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	benefits/1	landing	<span class="selected">70+</span> SPRACHEN ÜBERSETZUNG	de
256	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	benefits/2	landing	<span class="selected">VERTRAULICHKEIT</span> DER DATEN	de
257	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	benefits/3	landing	ÜBERSETZUNGSGE <span class="selected">SCH\nWINDIGKEIT</span>\n\n	de
258	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	benefits/4	landing	<span class="selected">24/7</span> TRANSFERS ÜBERALL\nAUF DER WELT	de
259	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	benefits/5	landing	<span class="selected">100%</span> PROZESS AUTOMATISIERUNG	de
260	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	benefits/6	landing	<span class="selected">QUALITATIV HOCHWERTIGE</span>\nÜBERSETZUNGEN	de
261	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	how-it-works/1	landing	UPLOAD A FILE\nOR ADD\nA VIDEO LINK	en
262	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	how-it-works/2	landing	SELECT THE\nLANGUAGES YOU WANT\nTO TRANSLATE THE\nVIDEO INTO	en
263	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	how-it-works/3	landing	PAY FOR THE\nORDER\nAND WAIT A BIT	en
264	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	how-it-works/4	landing	YOUR NEW\nVIDEOS\nARE READY!	en
265	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	how-it-works/button	landing	TRY IT!	en
266	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	how-it-works/1	landing	LADEN SIE EINE\nDATEI HOCH ODER\nFÜGEN SIE EINEN\nVIDEOLINK HINZU	de
267	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	how-it-works/2	landing	WÄHLEN SIE DIE\nSPRACHEN AUS,\nIN DIE SIE DAS\nVIDEO ÜBERSETZEN\nMÖCHTEN	de
268	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	how-it-works/3	landing	BEZAHLEN SIE DIE\nBESTELLUNG\nUND WARTE EIN\nBISSCHEN	de
269	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	how-it-works/4	landing	DEINE NEUEN\nVIDEOS\nSIND BEREIT!	de
270	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	how-it-works/button	landing	TRY IT!	de
271	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	examples/title	landing	<span class="selected">VIDEO</span> EXAMPLES	en
272	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	examples/original	landing	ORIGINAL	en
273	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	examples/translated	landing	<span class="selected">TRANSLATED VIDEO</span>	en
274	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	examples/title	landing	<span class="selected">VIDEO</span> BEISPIELE	de
275	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	examples/original	landing	ORIGINAL	de
276	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	examples/translated	landing	<span class="selected">ÜBERSETZTES VIDEO</span>	de
277	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/title	landing	PRICING	en
278	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/fast/title	landing	<span class="selected">FAST</span>	en
279	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/expert/title	landing	<span class="selected">EXPERT</span>	en
280	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/fast/time	landing	FOR 1 MINUTE OF THE NEW VIDEO	en
281	2022-05-28 10:12:51.297+00	2022-05-31 17:53:45.634331+00	\N	pricing/fast/price	landing	<span class="selected">$ 0,9</span>	en
320	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/accuracy	landing	ÜBERSETZUNGSGENAUIGKEIT	de
321	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/min	landing	min	de
322	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/accuracy-80	landing	80% (automatische Verifizierung)	de
325	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/result	landing	ERGEBNIS	de
326	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/prod-time	landing	PRODUKTIONSZEIT	de
327	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/cost	landing	BESTELLKOSTEN	de
328	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/discount	landing	RABATT	de
329	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/total	landing	INSGESAMT	de
330	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/button	landing	Ergebnisse per E-Mail erhalten	de
323	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/accuracy-99	landing	99% (Selbstüberprüfung)	de
309	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/accuracy-99-2	landing	99% (checking by a specialist) 	en
308	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/accuracy-99	landing	99% (self verification)	en
324	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	calc/accuracy-99-2	landing	99% (Prüfung durch einen Spezialisten)	de
331	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	discount/title	landing	<span class="selected">$10 DISCOUNT</span>\nON THE FIRST\nORDER	en
332	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	discount/form/title	landing	ENTER E-MAIL	en
333	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	discount/form/button	landing	Submit	en
334	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	discount/title	landing	<span class="selected">$10 RABATT</span>\nAUF DER ERSTEN\nBESTELLUNG	de
335	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	discount/form/title	landing	E-MAIL ADRESSE	de
336	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	discount/form/button	landing	abgeben	de
337	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	reviews/title	landing	WHAT OUR\n<span class="selected">CUSTOMERS SAY</span>	en
338	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	reviews/title	landing	DAS SAGEN\n<span class="selected">UNSERE KUNDEN</span>	de
339	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	faq/title	landing	FAQS	en
340	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	faq/title	landing	FAQS	de
341	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	banner/title	landing	START TRANSLATING YOUR VIDEO	en
342	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	banner/button	landing	CONTINUE	en
343	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	banner/title	landing	BEGINNE MIT DER ÜBERSETZUNG DEINES VIDEOS	de
344	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	banner/button	landing	WEITERHIN	de
47	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.04495+00	\N	footer/follow-us/facebook	main/footer	Facebook	en
36	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.064119+00	\N	footer/service/investors	main/footer	Investors	en
40	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.053303+00	\N	footer/legal-conditions/terms-of-use	main/footer	Terms of use	en
33	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.067839+00	\N	footer/service/title	main/footer	Service	en
42	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.021495+00	\N	footer/contacts/address-1	main/footer	Suurstoffi 8	en
34	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.065962+00	\N	footer/service/products	main/footer	Products	en
39	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.0512+00	\N	footer/legal-conditions/privacy-policy	main/footer	Privacy policy	en
38	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.055714+00	\N	footer/legal-conditions/title	main/footer	Legal Conditions	en
46	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.047232+00	\N	footer/follow-us/linkedin	main/footer	linkedin	en
37	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.059904+00	\N	footer/service/about-us	main/footer	About us	en
50	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.041187+00	\N	footer/copyright/all-rights-reserved	main/footer	© 2022. Vidby AG All rights reserved Switzerland	en
48	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.058013+00	\N	footer/payment-methods/title	main/footer	Payment Methods	en
43	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.025865+00	\N	footer/contacts/address-2	main/footer	6343 Rotkreuz	en
41	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.038547+00	\N	footer/contacts/title	main/footer	Contacts	en
44	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.032947+00	\N	footer/contacts/address-3	main/footer	Switzerland	en
35	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.062219+00	\N	footer/service/customers	main/footer	Customers	en
45	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.049294+00	\N	footer/follow-us/title	main/footer	Follow us	en
49	2022-05-28 10:12:51.297+00	2022-05-31 16:23:23.042997+00	\N	footer/copyright/company	main/footer	© 2022. Vidby AG 	en
165	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.14281+00	\N	footer/payment-methods/title	main/footer	ZAHLUNGSMETHODEN	de
158	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.11973+00	\N	footer/contacts/title	main/footer	KONTAKT	de
157	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.137915+00	\N	footer/legal-conditions/terms-of-use	main/footer	Nutzungsbedingungen	de
155	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.140655+00	\N	footer/legal-conditions/title	main/footer	RECHTLICHE BEDINGUNGEN	de
162	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.131848+00	\N	footer/follow-us/title	main/footer	FOLGEN SIE UNS	de
151	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.146325+00	\N	footer/service/customers	main/footer	Kunde	de
166	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.126209+00	\N	footer/copyright/company	main/footer	© 2022. Vid von AG	de
156	2022-05-28 10:12:51.297+00	2022-05-31 11:30:29.134637+00	\N	footer/legal-conditions/privacy-policy	main/footer	Datenschutzerklärung	de
345	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	get-email-modal/title	landing	Get the calculation\nto the email, and a <span class="selected">10$\ndiscount</span> on first order	en
346	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	get-email-modal/label	landing	your e-mail	en
347	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	get-email-modal/agreement	landing	I agree to the <span class="selected">processing of personal data</span>	en
348	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	get-email-modal/email-error	landing	error	en
349	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	get-email-modal/agreement-error	landing	Confirm your consent	en
350	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	get-email-modal/title	landing	Get the calculation\nto the email, and a <span class="selected">10$\ndiscount</span> on first order	de
351	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	get-email-modal/label	landing	your e-mail	de
352	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	get-email-modal/agreement	landing	I agree to the <span class="selected">processing of personal data</span>	de
353	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	get-email-modal/email-error	landing	error	de
354	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	get-email-modal/agreement-error	landing	Confirm your consent	de
355	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	thanks-modal/title	landing	<span class="selected">Thanks!</span>\n\nA reminder about the discount has been sent to your e-mail	en
356	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	thanks-modal/title	landing	<span class="selected">Thanks!</span>\n\nA reminder about the discount has been sent to your e-mail	de
357	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	thanks-modal/button	landing	Close	en
358	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	thanks-modal/button	landing	Close	de
359	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	supported-langs-modal/title	landing	List of supported languages	en
360	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	supported-langs-modal/placeholder	landing	Enter the name of the language	en
361	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	supported-langs-modal/title	landing	List of supported languages	de
362	2022-05-28 10:13:51.297+00	2022-05-31 17:53:45.634331+00	\N	supported-langs-modal/placeholder	landing	Enter the name of the language	de
\.


--
-- Data for Name: price_advantages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_advantages (id, created_at, updated_at, deleted_at, parent, text, index, lang) FROM stdin;
1	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	basis	Total length of original videos <span class="selected">max. 80 minutes</span>	0	en
2	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	basis	More than <span class="selected">70 languages</span>	1	en
3	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	basis	Maximum length of translated videos: <span class="selected">300 minutes</span> if translated into 10 languages	2	en
4	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	basis	Different voices: <span class="selected">1</span>	3	en
5	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	basis	From order to delivery: <span class="selected">48 hours</span>	4	en
6	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	basis	99% accuracy of translation	5	en
7	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	Total length of original videos <span class="selected">max. 200 minutes</span>	0	en
8	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	More than <span class="selected">70 languages</span>	1	en
9	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	Maximum length of translated videos: <span class="selected">750 minutes</span> if translated into 10 languages	2	en
10	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	Different voices: <span class="selected">3</span>	3	en
11	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	From order to delivery: <span class="selected">48 hours</span>	4	en
12	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	99% accuracy of translation	5	en
13	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	100% accuracy of voice and video synchronization	6	en
14	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	Personal support	7	en
15	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	Total length of original videos <span class="selected">max. 400 minutes</span>	0	en
21	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	100% accuracy of voice and video synchronization	6	en
20	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	99% accuracy of translation	5	en
19	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	From order to delivery: <span class="selected">24 hours</span>	4	en
18	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	Different voices: <span class="selected">10</span>	3	en
17	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	Maximum length of translated videos: <span class="selected">1500 minutes</span> if translated into 10 languages	2	en
16	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	More than <span class="selected">70 languages</span>	1	en
23	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	<span class="selected">Coaching</span> and the ability to edit transcripts on your own. Increase the number of minutes of new videos to <span class="selected">2500 minutes</span>	8	en
22	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	Personal support	7	en
24	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	basis	Gesamtlänge der Originalvideos <span class="selected">max. 80 Minuten</span>	0	de
25	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	basis	Mehr als <span class="selected">70 Sprachen</span>	1	de
27	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	basis	Sprecher Stimmen: <span class="selected">1</span>	3	de
28	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	basis	Von der Bestellung bis Lieferung: <span class="selected">48 Stunden</span>	4	de
29	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	basis	99% Genauigkeit der Übersetzung	5	de
30	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	Gesamtlänge der Originalvideos <span class="selected">max. 200 Minuten</span>	0	de
31	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	Mehr als <span class="selected">70 Sprachen</span>	1	de
33	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	Sprecher Stimmen: <span class="selected">3</span>	3	de
34	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	Von der Bestellung bis Lieferung: <span class="selected">24 Stunden</span>	4	de
35	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	99% Genauigkeit der Übersetzung	5	de
36	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	100% Genauigkeit bei der Sprach und Videosynchronisation	6	de
37	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	Persönlicher Support	7	de
38	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	Gesamtlänge der Originalvideos <span class="selected">max. 400 Minuten</span>	0	de
39	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	Mehr als <span class="selected">70 Sprachen</span>	1	de
41	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	Sprecher Stimmen: <span class="selected">10</span>	3	de
42	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	Von der Bestellung bis Lieferung: <span class="selected">Individuell vereinbar</span>	4	de
43	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	99% Genauigkeit der Übersetzung	5	de
44	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	100% Genauigkeit bei der Sprach und Videosynchronisation	6	de
45	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	Persönlicher Support	7	de
46	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	<span class="selected">Training</span> und die Fähigkeit, Transkripte selbst zu bearbeiten. Erhöhen Sie die Anzahl der Minuten neuer Videos auf <span class="selected">2500 Minuten</span>	8	de
40	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	professional	Maximal Länge der übersetzten Videos: <span class="selected">1500 Minuten</span> wenn in 10 Sprachen übersetzt	2	de
32	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	extended	Maximal Länge der übersetzten Videos: <span class="selected">750 Minuten</span> wenn in 10 Sprachen übersetzt	2	de
26	2022-05-28 15:42:48.013+00	2022-05-28 15:42:48.672+00	\N	basis	Maximal Länge der übersetzten Videos: <span class="selected">300 Minuten</span> wenn in 10 Sprachen übersetzt	2	de
47	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	fast	Synchronization of video and voice	0	en
48	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	fast	More than <span class="selected">50 languages</span> available for translation	1	en
49	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	fast	Female and male voices	2	en
50	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	fast	API for developers and corporate clients	3	en
51	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	fast	Convenient and payment methods	4	en
52	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	fast	Ability to edit the transcript and get excellent translation quality	5	en
53	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	Synchronization of video and voice	0	en
54	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	More than <span class="selected">50 languages</span> available for translation	1	en
55	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	Female and male voices	2	en
56	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	API for developers and corporate clients	3	en
57	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	Convenient and payment methods	4	en
58	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	Ability to edit the transcript and get excellent translation quality	5	en
59	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	From order to delivery: <span class="selected">24 hours</span>	6	en
60	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	99% translation accuracy	7	en
61	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	100% voice and video synchronization accuracy	8	en
62	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	fast	Synchronisation von Video und Sprache	0	de
63	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	fast	Mehr als <span class="selected">50 Sprachen</span> zur Übersetzung verfügbar	1	de
64	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	fast	Frauen- und Männerstimmen	2	de
65	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	fast	API für Entwickler und Firmenkunden	3	de
66	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	fast	Bequem und Zahlungsmethoden	4	de
67	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	fast	Möglichkeit, das Transkript zu bearbeiten und eine hervorragende Übersetzungsqualität zu erzielen\n	5	de
68	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	Synchronisation von Video und Sprache	0	de
69	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	Mehr als <span class="selected">50 Sprachen</span> zur Übersetzung verfügbar	1	de
70	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	Frauen- und Männerstimmen	2	de
71	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	API für Entwickler und Firmenkunden	3	de
72	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	Bequem und Zahlungsmethoden	4	de
73	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	Möglichkeit, das Transkript zu bearbeiten und eine hervorragende Übersetzungsqualität zu erzielen\n	5	de
74	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	Von der Bestellung bis zur Lieferung: <span class="selected">24 Stunden</span>	6	de
75	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	99% übersetzungsgenauigkeit	7	de
76	2022-06-02 00:25:22.575+00	2022-06-02 00:25:23.473+00	\N	expert	100% sprach- und Videosynchronisationsgenauigkeit	8	de
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, created_at, updated_at, deleted_at, author_profile_picture, author_name, author_profession, author_company, author_company_url, stars, content, full_content_url, lang) FROM stdin;
2	2022-05-28 12:08:14.156+00	2022-05-28 12:08:15.338+00	\N	https://uploads-ssl.webflow.com/620a21240872792f5daf740c/6266b6129857d597efd94284_review-6.png	Stepan Mykhailov	Co-Founder/Owner	Air Media-Tech	https://air.io/en	5	As Vidby platform can be useful for our work with a global of creators (from 44 countries) as well as for collaboration of our own team (240 employees in 5 countries), enabling translation into 67 languages and 60 dialects, we currently discuss deeper cooperation and strategic partnership with Vidby. We expect this enhanced collaboration to help both our companies to scale rapidly.	https://vidby.com/reviews/air-vidby-review/	en
1	2022-05-28 12:07:53.094+00	2022-05-28 12:07:54.232+00	\N	https://uploads-ssl.webflow.com/620a21240872792f5daf740c/6233154d2790c877289ab528_review-1.png	Elyne Hager	Branding und Content Marketing	Läderach AG	https://laderach.com/	5	vidby is excellent for training our global employees. We have never been able to produce our how-to videos as easy and understandable as with vidby.	\N	en
3	2022-05-28 12:09:24.847+00	2022-05-28 12:09:22.854+00	\N	https://uploads-ssl.webflow.com/620a21240872792f5daf740c/6233154da739600ffa33ccd0_review-2.png	Eray Müller	Senior Communications Manager 	Siemens Schweiz AG	https://www.siemens.com/	5	Practical, fast and good translation solution for internal use of employee videos.	\N	en
4	2022-05-28 12:10:16.538+00	2022-05-28 12:10:17.365+00	\N	https://uploads-ssl.webflow.com/620a21240872792f5daf740c/6233154d19983c1c9a2e95d3_review-3.png	Silvan Merki	Chief Communications Officer 	Implenia AG	https://implenia.com/	5	I have tested the automated translation with some videos - also in less frequently used language. The translation is very fast and already amazingly good in quality - the whole context absolutely well understandable.	\N	en
5	2022-05-28 12:07:53.094+00	2022-05-28 12:07:54.232+00	\N	https://uploads-ssl.webflow.com/620a21240872792f5daf740c/6233154d2790c877289ab528_review-1.png	Elyne Hager	Branding und Content Marketing	Läderach AG	https://laderach.com/	5	vidby ist hervorragend für die Schulung unserer weltweit tätigen Mitarbeiterinnen und Mitarbeiter. So einfach und verständlich wie mit vidby konnten wir unsere How-to-Videos noch nie produzieren.	\N	de
6	2022-05-28 12:08:14.156+00	2022-05-28 12:08:15.338+00	\N	https://uploads-ssl.webflow.com/620a21240872792f5daf740c/6266b6129857d597efd94284_review-6.png	Stepan Mykhailov	Co-Founder/Owner	Air Media-Tech	https://air.io/en	5	Da die Vidby-Plattform sowohl für unsere Arbeit mit einer Vielzahl von Entwicklern (aus 44 Ländern) als auch für die Zusammenarbeit unseres eigenen Teams (240 Mitarbeiter in 5 Ländern) nützlich sein kann, da sie die Übersetzung in 67 Sprachen und 60 Dialekte ermöglicht, diskutieren wir derzeit über eine engere Zusammenarbeit und strategische Partnerschaft mit Vidby. Wir erwarten, dass diese verstärkte Zusammenarbeit unseren beiden Unternehmen helfen wird, schnell zu wachsen. 	https://vidby.com/reviews/air-vidby-review/	de
7	2022-05-28 12:09:24.847+00	2022-05-28 12:09:22.854+00	\N	https://uploads-ssl.webflow.com/620a21240872792f5daf740c/6233154da739600ffa33ccd0_review-2.png	Eray Müller	Senior Communications Manager 	Siemens Schweiz AG	https://www.siemens.com/	5	Praktische, schnelle und gute Übersetzungs-Lösung für die interne Nutzung von Mitarbeitervideos.	\N	de
9	2022-05-28 12:10:16.538+00	2022-05-28 12:10:17.365+00	\N	https://uploads-ssl.webflow.com/620a21240872792f5daf740c/6233154d19983c5d382e95cf_review-5.png	Mike Fuhrmann	Chief Communications Officer 	Generali AG	https://www.generali.ch/	5	Effective tool, which can be used well for simple, internal educational videos.	\N	en
10	2022-05-28 12:10:16.538+00	2022-05-28 12:10:17.365+00	\N	https://uploads-ssl.webflow.com/620a21240872792f5daf740c/6233154d19983c5d382e95cf_review-5.png	Mike Fuhrmann	Chief Communications Officer 	Generali AG	https://www.generali.ch/	5	Effektives Tool, welches sich gut für einfache, interne Lehrvideos nutzen lässt.	\N	de
8	2022-05-28 12:09:24.847+00	2022-05-28 12:09:22.854+00	\N	https://uploads-ssl.webflow.com/620a21240872792f5daf740c/6233154d19983c1c9a2e95d3_review-3.png	Silvan Merki	Chief Communications Officer 	Implenia AG	https://implenia.com/	5	Ich habe die automatisierte Übersetzung mit einigen Videos getestet – auch in seltener verwendeten Sprachen. Die Übersetzung ist sehr schnell und in der Qualität bereits erstaunlich gut – der gesamte Kontext absolut gut verständlich	\N	de
\.


--
-- Data for Name: source_languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.source_languages (id, created_at, updated_at, deleted_at, code, language, price) FROM stdin;
915	2022-05-27 18:18:04.273814+00	2022-05-30 19:22:55.372868+00	\N	en-US	English (United States)	5
916	2022-05-27 18:18:04.276202+00	2022-05-30 19:22:55.380668+00	\N	en-GB	English (United Kingdom)	5
917	2022-05-27 18:18:04.280107+00	2022-05-30 19:22:55.387572+00	\N	ru-RU	Russian (Russia)	2
918	2022-05-27 18:18:04.284221+00	2022-05-30 19:22:55.396407+00	\N	uk-UA	Ukrainian (Ukraine)	2
919	2022-05-27 18:18:04.286573+00	2022-05-30 19:22:55.401399+00	\N	de-CH	German (Switzerland)	10
920	2022-05-27 18:18:04.288907+00	2022-05-30 19:22:55.411907+00	\N	de-DE	German (Germany)	7
921	2022-05-27 18:18:04.291183+00	2022-05-30 19:22:55.417313+00	\N	pl-PL	Polish (Poland)	5
922	2022-05-27 18:18:04.293586+00	2022-05-30 19:22:55.422451+00	\N	tr-TR	Turkish (Turkey)	5
923	2022-05-27 18:18:04.295645+00	2022-05-30 19:22:55.429166+00	\N	it-IT	Italian (Italy)	5
924	2022-05-27 18:18:04.297743+00	2022-05-30 19:22:55.437908+00	\N	it-CH	Italian (Switzerland)	5
925	2022-05-27 18:18:04.300333+00	2022-05-30 19:22:55.445221+00	\N	fr-FR	French (France)	5
926	2022-05-27 18:18:04.302604+00	2022-05-30 19:22:55.449867+00	\N	sw-TZ	Swahili (Tanzania)	5
927	2022-05-27 18:18:04.305022+00	2022-05-30 19:22:55.457141+00	\N	sw-KE	Swahili (Kenya)	5
928	2022-05-27 18:18:04.307383+00	2022-05-30 19:22:55.460824+00	\N	sv-SE	Swedish (Sweden)	5
\.


--
-- Data for Name: update_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.update_histories (date, parent) FROM stdin;
2022-05-28T10:07:12+05:00	available-languages
2022-05-28T10:07:12+05:00	sources-languages
2022-05-28T10:07:23+05:00	available-languages
2022-05-28T10:07:23+05:00	sources-languages
2022-05-31T00:22:55+05:00	available-languages
2022-05-31T00:22:55+05:00	sources-languages
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, created_at, updated_at, deleted_at, email, password, role, name) FROM stdin;
1	2022-05-26 01:36:21.017+00	2022-05-27 06:16:20.61687+00	\N	the1ime@yandex.ru	$2a$14$q/Jd9jVuEP1dAnMU535q6OP2KetHQdDZYqAH5H19Zzh83b0p1uX7O	admin	Yaroslav 123
2	2022-05-25 20:37:05.092726+00	2022-05-27 06:28:50.736098+00	\N	m2@zotov.dev	$2a$14$4nBG6XWzYplYNPxLOXMfae31C1w1tOUDtFcKgCg4eRbp9ZRgdjPW2	translator	Yaroslav
6	0001-01-01 00:00:00+00	2022-05-26 18:57:05.295675+00	\N	admin@gmail.com	Jd9jVuEP1dAnMU535q6OP2KetHQdDZYqAH5H19Zzh83b0p1uX7O	admin	Yaroslav
7	0001-01-01 00:00:00+00	2022-05-27 04:32:26.919882+00	\N	translator@gmail.com	$2a$14$4nBG6XWzYplYNPxLOXMfae31C1w1tOUDtFcKgCg4eRbp9ZRgdjPW2	translator	Yaroslav
8	2022-05-27 15:54:54.84343+00	2022-05-27 15:59:08.162186+00	\N	m@zotov.dev	$2a$14$JtixY15bJ2aQXWPx1Zxh0OCCowqk/uFGyl29rmZ9RxsqNAqWUhi82	manager	123
9	2022-05-27 16:45:50.422081+00	2022-05-27 16:45:50.422081+00	\N	test@gmail.com	$2a$14$7nz.hUzMfzAO5haltIFgo.Um51d/sjgu0DD1AZZrc9BSPBIszgO2a	translator	TEst
13	2022-05-27 16:47:58.989306+00	2022-05-27 16:47:58.989306+00	2022-05-27 17:34:31.672042+00	test4@gmail.com	$2a$14$Ax/XZVzqvtYYRadjBdFi2OXQRByG1GjtfDYHmkXelpFV3.5cpLQGy	translator	123
11	2022-05-27 16:46:52.159164+00	2022-05-27 16:46:52.159164+00	2022-05-27 17:34:40.463946+00	test2@gmail.com	$2a$14$oWyMeWlpv1qsUcItgP0VS.cCs8dWvksk/or8ffawF8p037Jpr6nKu	translator	123
12	2022-05-27 16:47:19.843017+00	2022-05-27 16:47:19.843017+00	2022-05-27 17:34:40.464651+00	test3@gmail.com	$2a$14$nV9TSBhEnPdswYqLv1nS4.yWBv4NkH/u9osSuzN6CyWKO5RIbxiAG	translator	123
\.


--
-- Data for Name: video_examples; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.video_examples (id, created_at, updated_at, deleted_at, original_id, translated_ids, page, company_logo, index) FROM stdin;
2	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	1	{2,3,4,5,6,7,8,9}	main/customers	/img/content/customers/logo-1.svg	0
21	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	87	{88,89,90,91}	main/customers	/img/content/customers/logo-10.svg	7
12	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	39	{40,41,42,43,44,45}	main/customers	/img/content/customers/logo-4.svg	13
13	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	46	{47,48}	main/customers	/img/content/customers/logo-20.svg	14
19	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	77	{78,79,80,81,82,83}	main/customers	/img/content/customers/logo-9.svg	17
14	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	49	{50,51,52}	main/customers	/img/content/customers/logo-6.svg	3
4	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	22	{23,24,25,26,27,28,29,30,31,32}	main/customers	/img/content/customers/logo-5.svg	2
3	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	10	{11,12,13,14,15,16,17,18,19,20,21}	main/customers	/img/content/customers/logo-3.svg	1
25	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	113	{114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129}	main/customers	/img/content/customers/logo-13.svg	20
20	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	84	{85,86}	main/customers	/img/content/customers/logo-4.svg	6
11	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	33	{34,35,36,37,38}	main/customers	/img/content/customers/logo-2.svg	12
23	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	96	{97,98,99,100,101,102,103}	main/customers	/img/content/customers/logo-22.svg	18
16	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	56	{57,58,59,60,61,62,63,64,65,66}	main/customers	/img/content/customers/logo-11.svg	5
18	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	73	{74,75,76}	main/customers	/img/content/customers/logo-21.svg	16
17	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	67	{68,69,70,71,72}	main/customers	/img/content/customers/logo-7.svg	15
30	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	164	{165,166,167,168,169,170,171,172,173}	main/customers	/img/content/customers/logo-14.svg	22
31	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	174	{175,176,177,178,179,180,181,182,183,184}	main/customers	/img/content/customers/logo-5.svg	23
24	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	104	{105,106,107,108,109,110,111,112}	main/customers	/img/content/customers/logo-11.svg	19
15	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	53	{54,55}	main/customers	/img/content/customers/logo-25.png	4
26	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	130	{131,132}	main/customers	/img/content/customers/logo-23.png	9
22	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	92	{93,94,95}	main/customers	/img/content/customers/logo-12.svg	8
27	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	133	{134,135,136,137,138,139,140,141,142,143,144,145}	main/customers	/img/content/customers/logo-20.svg	10
28	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	146	{147,148,149,150,151,152}	main/customers	/img/content/customers/logo-24.svg	11
29	2022-05-26 14:43:50.91+00	2022-05-26 14:43:51.966+00	\N	153	{154,155,156,157,158,159,160,161,162,163}	main/customers	/img/content/customers/logo-7.svg	21
\.


--
-- Data for Name: videos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.videos (id, created_at, updated_at, deleted_at, language_code, source, preview) FROM stdin;
1	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/692385926?h=88ae5ef648&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401318133-5141d5a709753a39fc21aa003a67bff4b953f934ecb1f2f2df1fb8e35b9f347f-d_640
2	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ar-AE	https://player.vimeo.com/video/672082875?h=860433384e&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1361851252-cac1b6ccbc8ab90cf43e65fe77675274ea6b6bdf17362b2b1a05285cbb8bf4e1-d_640
3	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	zh-CN	https://player.vimeo.com/video/672008723?h=6711705682&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1361851252-cac1b6ccbc8ab90cf43e65fe77675274ea6b6bdf17362b2b1a05285cbb8bf4e1-d_640
4	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/672000454?h=21c7df667e&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1361850392-0026d68d178a904fe9b10d892e0b3f0996806edcf408ec7206a25656fc5fb249-d_640
5	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/672003306?h=1e5266a9fb&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1361850392-0026d68d178a904fe9b10d892e0b3f0996806edcf408ec7206a25656fc5fb249-d_640
6	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/672004707?h=671936dcee&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1361782991-93b01a9190f1fd9fcfa3fcae225a93bdc4cf5702489e7dd33337210c05e56710-d_640
7	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ko-KR	https://player.vimeo.com/video/672005981?h=ebde26993d&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1361855679-b88954f96d55917090245ff3279bef4fc450408d41a2da67bc9ae758d2344f53-d_640
8	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/672007370?h=15c3d6679a&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1399858198-ea79ea487b8ee09d8f8954c5b6477cb86155e8158bba0aea5848b662dd189334-d_640
9	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/672001852?h=5233487e15&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1399858198-ea79ea487b8ee09d8f8954c5b6477cb86155e8158bba0aea5848b662dd189334-d_640
10	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/691933047?h=73a7ed4141&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1400598648-2345066d30706ac3ba63625327cb1ab4154c15d87905a8ba5f52773c9710cec5-d_640
11	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ar-AE	https://player.vimeo.com/video/674388309?h=95a5cfb12d&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367025289-3b3f6abb4cc1a5a2d34ca86ea293869ee87a1a27d1ad380b432c4ca6f2a535bc-d_640
12	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	zh-CN	https://player.vimeo.com/video/674397328?h=e5b0edfe86&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367025289-3b3f6abb4cc1a5a2d34ca86ea293869ee87a1a27d1ad380b432c4ca6f2a535bc-d_640
13	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/674389334?h=264c87d080&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367025289-3b3f6abb4cc1a5a2d34ca86ea293869ee87a1a27d1ad380b432c4ca6f2a535bc-d_640
14	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/674391375?h=ee362a451d&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367025289-3b3f6abb4cc1a5a2d34ca86ea293869ee87a1a27d1ad380b432c4ca6f2a535bc-d_640
15	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	hi-IN	https://player.vimeo.com/video/674392370?h=e810305635&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367025289-3b3f6abb4cc1a5a2d34ca86ea293869ee87a1a27d1ad380b432c4ca6f2a535bc-d_640
16	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/674393379?h=5020ff2184&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367025289-3b3f6abb4cc1a5a2d34ca86ea293869ee87a1a27d1ad380b432c4ca6f2a535bc-d_640
17	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ja-JP	https://player.vimeo.com/video/674394401?h=ae04c42916&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367025289-3b3f6abb4cc1a5a2d34ca86ea293869ee87a1a27d1ad380b432c4ca6f2a535bc-d_640
18	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	pt-PT	https://player.vimeo.com/video/674395329?h=0ca9af127a&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367025289-3b3f6abb4cc1a5a2d34ca86ea293869ee87a1a27d1ad380b432c4ca6f2a535bc-d_640
19	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/674387275?h=e2f363a46e&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367025289-3b3f6abb4cc1a5a2d34ca86ea293869ee87a1a27d1ad380b432c4ca6f2a535bc-d_640
20	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/674390329?h=2c9342f829&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367025289-3b3f6abb4cc1a5a2d34ca86ea293869ee87a1a27d1ad380b432c4ca6f2a535bc-d_640
21	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	tr-TR	https://player.vimeo.com/video/674396389?h=bbba4f0b83&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367025289-3b3f6abb4cc1a5a2d34ca86ea293869ee87a1a27d1ad380b432c4ca6f2a535bc-d_640
22	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/691816038?h=5f007f5c4e&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1400361613-d1be0c0963eaf150291e6671e1baf39c7f50fe8b51df53d3c3b64bb99654bc29-d_640
23	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ar-AE	https://player.vimeo.com/video/674345973?h=2f676171cd&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1366931846-d58d26a8042d08adb41ef83eab734acc56fd289c16191b233c8b5a94e784ae08-d_640
24	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	zh-CN	https://player.vimeo.com/video/674359300?h=5fb449da77&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1366931846-d58d26a8042d08adb41ef83eab734acc56fd289c16191b233c8b5a94e784ae08-d_640
25	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/674357748?h=bafbf87535&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1366931846-d58d26a8042d08adb41ef83eab734acc56fd289c16191b233c8b5a94e784ae08-d_640
26	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/674360964?h=0e6de41f3e&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1366931846-d58d26a8042d08adb41ef83eab734acc56fd289c16191b233c8b5a94e784ae08-d_640
27	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/674345225?h=7bbb0c87d4&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1366931846-d58d26a8042d08adb41ef83eab734acc56fd289c16191b233c8b5a94e784ae08-d_640
28	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ja-JP	https://player.vimeo.com/video/674347469?h=d0e845dcd7&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1366931846-d58d26a8042d08adb41ef83eab734acc56fd289c16191b233c8b5a94e784ae08-d_640
29	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	pt-PT	https://player.vimeo.com/video/674346658?h=deb78ac321&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1366931846-d58d26a8042d08adb41ef83eab734acc56fd289c16191b233c8b5a94e784ae08-d_640
30	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/674360139?h=ca61ce0182&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1366931846-d58d26a8042d08adb41ef83eab734acc56fd289c16191b233c8b5a94e784ae08-d_640
31	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/674358525?h=2e25689fc6&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1366931846-d58d26a8042d08adb41ef83eab734acc56fd289c16191b233c8b5a94e784ae08-d_640
32	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	tr-TR	https://player.vimeo.com/video/674361897?h=1a6582b070&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1366931846-d58d26a8042d08adb41ef83eab734acc56fd289c16191b233c8b5a94e784ae08-d_640
33	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/669724257?h=c6d0a71ba8&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1356699735-022cd2dde55653d0be8013eed9a2ab5ada43829cce0f7b4d4bf4b679411d6f35-d_640
34	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ar-AE	https://player.vimeo.com/video/673719067?h=926526bd8b&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1365263272-7387bfc0b22229f62f7ab3963d101e368bf380f074c19c3b9e44cab3630dfdbf-d_640
35	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/669752045?h=d5b15dffe8&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1365263272-7387bfc0b22229f62f7ab3963d101e368bf380f074c19c3b9e44cab3630dfdbf-d_640
36	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/669767998?h=a1a6baf231&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1365263272-7387bfc0b22229f62f7ab3963d101e368bf380f074c19c3b9e44cab3630dfdbf-d_640
37	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/669726756?h=84463949a5&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1365263272-7387bfc0b22229f62f7ab3963d101e368bf380f074c19c3b9e44cab3630dfdbf-d_640
38	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/669727912?h=f5493b11e7&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1365263272-7387bfc0b22229f62f7ab3963d101e368bf380f074c19c3b9e44cab3630dfdbf-d_640
39	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-CH	https://player.vimeo.com/video/692420075?h=2aa8a8b206&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401376031-041fcdaa9c496b015e9354332eab035e705c9861e6d8071afa3cfd1a02230d66-d_640
40	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/674849507?h=dafb7e026f&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367937474-23cc5ba32b12e8ed7e1af67c6fe1c31374738793ce216c37465b860aa2ef7581-d_640
41	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/674851973?h=97acf9acca&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367937474-23cc5ba32b12e8ed7e1af67c6fe1c31374738793ce216c37465b860aa2ef7581-d_640
42	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/674848222?h=4f1d6386f9&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367937474-23cc5ba32b12e8ed7e1af67c6fe1c31374738793ce216c37465b860aa2ef7581-d_640
43	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/674853370?h=e8ce387f0f&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367937474-23cc5ba32b12e8ed7e1af67c6fe1c31374738793ce216c37465b860aa2ef7581-d_640
44	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/674854690?h=fb0b49535d&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367937474-23cc5ba32b12e8ed7e1af67c6fe1c31374738793ce216c37465b860aa2ef7581-d_640
45	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/674850664?h=032b5ef8a1&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367937474-23cc5ba32b12e8ed7e1af67c6fe1c31374738793ce216c37465b860aa2ef7581-d_640
46	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/692428312?h=499e33945a&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401395737-95185de6d3b89fe65cb98d7cbf889ade50bfd14578462af5cf67979140f10b2f-d_640
47	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/692428383?h=a3e137b57b&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401396297-d0302ec769a5491d9694d7f9849888bcb7d5f8538c3b52e457562660c2d3ac3e-d_640
48	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	uk-UA	https://player.vimeo.com/video/692430398?h=9d14616689&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401396297-d0302ec769a5491d9694d7f9849888bcb7d5f8538c3b52e457562660c2d3ac3e-d_640
49	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/668157661?h=323ae1b89d&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1352836491-8199f8f710130e30b6d0e76233204b296f361341dae9a5cf84cdb8e84cc09a89-d_640
50	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/668156673?h=eeb5ee5e2d&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1352837402-d68a6c36327f3fa564f37ef376e6426db2a800abd555de55cf779da4c58eaaea-d_640
51	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/668154470?h=72ba019887&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1352837402-d68a6c36327f3fa564f37ef376e6426db2a800abd555de55cf779da4c58eaaea-d_640
52	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/668155595?h=6386f829a5&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1352837402-d68a6c36327f3fa564f37ef376e6426db2a800abd555de55cf779da4c58eaaea-d_640
53	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/665171025?h=322a1a3451&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1346316532-26e845c49cf0669d203b8fd4291b2b45aa788e1e2ff214247ec3c22da1130e18-d_640
54	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/693330996?h=3fda85a8da&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403128648-6644ff8a4f162aaf5b989032c884defe61e7356f6c2a7b9a213e33cfd60c89cc-d_640
55	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	tr-TR	https://player.vimeo.com/video/693331534?h=750f766d40&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403128648-6644ff8a4f162aaf5b989032c884defe61e7356f6c2a7b9a213e33cfd60c89cc-d_640
56	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/693460987?h=b6a414546d&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403362212-3183689f29301af3071ad475ed6eb0b127e95f84256d4f29fdda42e2e4efc4a6-d_640
57	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ar-AE	https://player.vimeo.com/video/693396934?h=6ca4a6f8c2&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403278254-c2f4d4c3e17b48716e5660f129bdb7b38ba5c8dbf55c02100a6e21d35524254f-d_640
58	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/693400284?h=0369d095eb&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403278254-c2f4d4c3e17b48716e5660f129bdb7b38ba5c8dbf55c02100a6e21d35524254f-d_640
59	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/693398048?h=375746991b&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403278254-c2f4d4c3e17b48716e5660f129bdb7b38ba5c8dbf55c02100a6e21d35524254f-d_640
60	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	hi-IN	https://player.vimeo.com/video/693401423?h=517363a2b7&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403278254-c2f4d4c3e17b48716e5660f129bdb7b38ba5c8dbf55c02100a6e21d35524254f-d_640
61	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/693402475?h=0bb06d9530&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403278254-c2f4d4c3e17b48716e5660f129bdb7b38ba5c8dbf55c02100a6e21d35524254f-d_640
62	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ko-KR	https://player.vimeo.com/video/693403707?h=1ebab6d526&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403278254-c2f4d4c3e17b48716e5660f129bdb7b38ba5c8dbf55c02100a6e21d35524254f-d_640
63	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	pt-PT	https://player.vimeo.com/video/693404888?h=ee1a6ede6e&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403278254-c2f4d4c3e17b48716e5660f129bdb7b38ba5c8dbf55c02100a6e21d35524254f-d_640
64	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/693406040?h=46a529749b&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403278254-c2f4d4c3e17b48716e5660f129bdb7b38ba5c8dbf55c02100a6e21d35524254f-d_640
65	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/693399194?h=4c6f074ff2&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403278254-c2f4d4c3e17b48716e5660f129bdb7b38ba5c8dbf55c02100a6e21d35524254f-d_640
66	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	tr-TR	https://player.vimeo.com/video/693407184?h=6521d1dfe4&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403278254-c2f4d4c3e17b48716e5660f129bdb7b38ba5c8dbf55c02100a6e21d35524254f-d_640
67	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/692445909?h=1da3a8506b&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401429460-b825d1b5e99098add81da7cb562262cd0a2d9e383f08983a41b65076b2e458ff-d_640
68	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/692441847?h=022052db40&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401428951-813ae4ccb503197eb4d6e6f4f24fe586af21140dcf0f3461712cf8e86fce281f-d_640
69	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/692444155?h=a34f5a52b7&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401429623-e434be03f79fbfa41772c0dfc0232aa141161a63a13f39c91928fb747aa7867e-d_640
70	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/692443331?h=c40dc81723&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401429623-e434be03f79fbfa41772c0dfc0232aa141161a63a13f39c91928fb747aa7867e-d_640
71	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/692444938?h=ccf7b63050&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401429623-e434be03f79fbfa41772c0dfc0232aa141161a63a13f39c91928fb747aa7867e-d_640
72	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/692442603?h=29ca73797b&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401429623-e434be03f79fbfa41772c0dfc0232aa141161a63a13f39c91928fb747aa7867e-d_640
73	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/692452692?h=471d19dbde&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401440644-76da36d1fe39287f94291280b407d21efa6200c4eac3540c873819fd734b309c-d_640
74	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/668541508?h=61e18ef491&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1353780034-ace45667bccf562556819b7183787db11bc24e83e9e4e815e873d6c7434cdad3-d_640
75	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/668542133?h=cbeea65e53&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1353780034-ace45667bccf562556819b7183787db11bc24e83e9e4e815e873d6c7434cdad3-d_640
76	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/668542741?h=edfdc61b91&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1353780034-ace45667bccf562556819b7183787db11bc24e83e9e4e815e873d6c7434cdad3-d_640
77	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/692467133?h=ec8c6460db&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401471165-012c2a372726400f7f4373815e58197d753354655f2d4b77879e71063a6d747c-d_640
78	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ar-AE	https://player.vimeo.com/video/692467576?h=5997e512ac&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401472126-727f625d3591a75423b8d4f07b1f17d9a415612e131d81d2230810db93f31481-d_640
79	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	zh-CN	https://player.vimeo.com/video/692467835?h=d109f03a58&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401472126-727f625d3591a75423b8d4f07b1f17d9a415612e131d81d2230810db93f31481-d_640
80	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/692467927?h=644e5e73c8&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401472126-727f625d3591a75423b8d4f07b1f17d9a415612e131d81d2230810db93f31481-d_640
81	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/692468028?h=8216e2f2b7&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401472126-727f625d3591a75423b8d4f07b1f17d9a415612e131d81d2230810db93f31481-d_640
82	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/692467640?h=82607298db&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401472126-727f625d3591a75423b8d4f07b1f17d9a415612e131d81d2230810db93f31481-d_640
83	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	sv-SE	https://player.vimeo.com/video/692467733?h=74dbda7099&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401472126-727f625d3591a75423b8d4f07b1f17d9a415612e131d81d2230810db93f31481-d_640
84	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/692413423?h=8395a9450f&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1401363631-f7abc8210493e4fb3d0a3ed8d8bd7c8099e0272bb04927fbc36bf8c83d932fbe-d_640
85	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	pt-PT	https://player.vimeo.com/video/674870303?h=7982686348&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367974527-1e4425b022a77b986952654d2ca189b04510a7b1725bd0c1157c24f537de2ef8-d_640
86	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/674875952?h=85802013c1&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367974527-1e4425b022a77b986952654d2ca189b04510a7b1725bd0c1157c24f537de2ef8-d_640
87	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/693334356?h=ef3625dd67&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403132818-c199454c6d9ed28bc4f79679a4a3998c752b0883ab337c57ac9557e9dcd3f90d-d_640
88	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/669891824?h=ee009d4989&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403133712-edd101bf53db19b9214aabb6198f115dbfe799d432d7479448219d61a27951de-d_640
89	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/669892887?h=e934b869ba&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403133712-edd101bf53db19b9214aabb6198f115dbfe799d432d7479448219d61a27951de-d_640
90	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/669893987?h=1dafc86016&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403133712-edd101bf53db19b9214aabb6198f115dbfe799d432d7479448219d61a27951de-d_640
91	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/669895010?h=4a50167f82&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403133712-edd101bf53db19b9214aabb6198f115dbfe799d432d7479448219d61a27951de-d_640
92	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/693380297?h=67fa7f7914&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403220334-59619c46029b2461c021a3e94ba79980a11f09364e624669800fb0eda322ee8f-d_640
93	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/668579022?h=09137d3dad&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1353842562-1f737a108997ef523c9dd0adb5771fbccfda0e5fcbeb5f02230cc88b52dc25a9-d_640
94	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	sv-SE	https://player.vimeo.com/video/668570819?h=07fb2037ff&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1353842562-1f737a108997ef523c9dd0adb5771fbccfda0e5fcbeb5f02230cc88b52dc25a9-d_640
95	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	uk-UA	https://player.vimeo.com/video/668570133?h=16223bd477&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1353842562-1f737a108997ef523c9dd0adb5771fbccfda0e5fcbeb5f02230cc88b52dc25a9-d_640
96	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/691851464?h=1aca543b16&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1400700472-fbea484e264187772022b1b1152992b1333fb1420e4c2e780230b8fcad946901-d_640
97	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ar-AE	https://player.vimeo.com/video/693367606?h=f00e42e122&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403199947-dacaca33f62790e3ea95ddd2763d868c6a2c6e724fa853962b9ddd4e4d1771a5-d_640
98	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/693365561?h=1699f19e29&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403199947-dacaca33f62790e3ea95ddd2763d868c6a2c6e724fa853962b9ddd4e4d1771a5-d_640
99	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/693383320?h=bc04c6407f&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403199947-dacaca33f62790e3ea95ddd2763d868c6a2c6e724fa853962b9ddd4e4d1771a5-d_640
100	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	hi-IN	https://player.vimeo.com/video/693384877?h=1900c28172&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403199947-dacaca33f62790e3ea95ddd2763d868c6a2c6e724fa853962b9ddd4e4d1771a5-d_640
101	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/693387005?h=fac05207b0&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403199947-dacaca33f62790e3ea95ddd2763d868c6a2c6e724fa853962b9ddd4e4d1771a5-d_640
102	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/679069506?h=790f2ba780&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403199947-dacaca33f62790e3ea95ddd2763d868c6a2c6e724fa853962b9ddd4e4d1771a5-d_640
103	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/693381315?h=ff3d80cc34&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403199947-dacaca33f62790e3ea95ddd2763d868c6a2c6e724fa853962b9ddd4e4d1771a5-d_640
104	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/691860347?h=a1d5667f02&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402676657-93970f2f3075e9efc08f5cb2f2af8925104603f5c0d4284482e81ca4a721cf07-d_640
105	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ar-AE	https://player.vimeo.com/video/693350973?h=73dc72a1ae&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403190940-b1110a294f2d79b6f94f20a74694294cf685c47283bcd5f4f201316fec996d7d-d_640
106	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	zh-CN	https://player.vimeo.com/video/693343016?h=f84fd29cf3&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403190940-b1110a294f2d79b6f94f20a74694294cf685c47283bcd5f4f201316fec996d7d-d_640
107	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/693348435?h=c3226e4c56&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403190940-b1110a294f2d79b6f94f20a74694294cf685c47283bcd5f4f201316fec996d7d-d_640
108	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/693352296?h=77c32e876d&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403190940-b1110a294f2d79b6f94f20a74694294cf685c47283bcd5f4f201316fec996d7d-d_640
109	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	hi-IN	https://player.vimeo.com/video/693347176?h=0a53823daa&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403190940-b1110a294f2d79b6f94f20a74694294cf685c47283bcd5f4f201316fec996d7d-d_640
110	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/693345829?h=f9d4ab7b6e&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403190940-b1110a294f2d79b6f94f20a74694294cf685c47283bcd5f4f201316fec996d7d-d_640
111	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	pl-PL	https://player.vimeo.com/video/693344443?h=7f8243fc92&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403190940-b1110a294f2d79b6f94f20a74694294cf685c47283bcd5f4f201316fec996d7d-d_640
112	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/693341634?h=b46fd291b0&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403190940-b1110a294f2d79b6f94f20a74694294cf685c47283bcd5f4f201316fec996d7d-d_640
114	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	pl-PL	https://player.vimeo.com/video/691454099?h=566134068e&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1399784229-0f9f5d56c325badc1c02e60f4e2389a13bf296258d7036e2a2cf008aef2888fd-d_640
115	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ar-AE	https://player.vimeo.com/video/693311298?h=f37e384f60&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
116	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	bn-BN	https://player.vimeo.com/video/693309806?h=f918308a78&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
117	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	zh-CN	https://player.vimeo.com/video/693292471?h=edcde5956b&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
118	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/693290555?h=d5fbe8ba63&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
119	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/693288743?h=ab44d3485b&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
120	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/693282527?h=be5393765a&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
121	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	hi-IN	https://player.vimeo.com/video/693305402?h=595572d067&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
122	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/693286896?h=a74e708025&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
123	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ja-JP	https://player.vimeo.com/video/693302996?h=9bd61cbfae&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
124	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ko-KR	https://player.vimeo.com/video/693300328?h=d3acf46f5a&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
125	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	mr-IN	https://player.vimeo.com/video/693297914?h=d094c44ba3&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
126	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	pt-PT	https://player.vimeo.com/video/693296223?h=24139f55fe&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
127	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/693284831?h=16095c0cc1&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
128	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/693307762?h=9fea67f634&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
129	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	tr-TR	https://player.vimeo.com/video/693294610?h=7800f4902c&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1403098725-38991ad5719e94472b1ff6d15543673bf413d6b9de4073ad3ffa1a7597869306-d_640
130	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/691340024?h=0424011c45&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1399569952-200fd8d8613e8dff9d1895fd498100a473afe343925a6105632161a4b68599c6-d_640
131	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	zh-CN	https://player.vimeo.com/video/693189153?h=d8725eaced&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402884436-938eab262e74a5c0056e85a14b4fc290dc93b42c980e1e264860b1bc88ca47ec-d_640
132	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/693190305?h=6adf584349&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402884436-938eab262e74a5c0056e85a14b4fc290dc93b42c980e1e264860b1bc88ca47ec-d_640
113	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/693349596?h=a6544d1a63&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1399784229-0f9f5d56c325badc1c02e60f4e2389a13bf296258d7036e2a2cf008aef2888fd-d_640
133	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/693116522?h=23e1dd91a8&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402772357-6f58b58fa98e0b1de2d522aa1b27c2b405ce6324d328bcb18665700d52c01406-d_640
134	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ar-AE	https://player.vimeo.com/video/693158038?h=25a93fa8d2&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402850263-bd694a7ae82f59bf62465feb0ff7230343496f73a7d722876047f179ed04474f-d_640
135	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	zh-CN	https://player.vimeo.com/video/693151110?h=d13f8fdea1&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402850263-bd694a7ae82f59bf62465feb0ff7230343496f73a7d722876047f179ed04474f-d_640
136	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/693157286?h=804ceb29c8&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402850263-bd694a7ae82f59bf62465feb0ff7230343496f73a7d722876047f179ed04474f-d_640
137	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/693155657?h=6f1fdf4c07&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402850263-bd694a7ae82f59bf62465feb0ff7230343496f73a7d722876047f179ed04474f-d_640
138	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	hi-IN	https://player.vimeo.com/video/693154919?h=9d991ad915&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402850263-bd694a7ae82f59bf62465feb0ff7230343496f73a7d722876047f179ed04474f-d_640
139	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/693154131?h=b6b3c4c728&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402850263-bd694a7ae82f59bf62465feb0ff7230343496f73a7d722876047f179ed04474f-d_640
140	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ja-JP	https://player.vimeo.com/video/693153389?h=b5c65a840c&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402850263-bd694a7ae82f59bf62465feb0ff7230343496f73a7d722876047f179ed04474f-d_640
141	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ko-KR	https://player.vimeo.com/video/693152664?h=9581c719cb&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402850263-bd694a7ae82f59bf62465feb0ff7230343496f73a7d722876047f179ed04474f-d_640
142	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/693150390?h=7a5c2ae882&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402850263-bd694a7ae82f59bf62465feb0ff7230343496f73a7d722876047f179ed04474f-d_640
143	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/693156532?h=af74ee0e72&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402850263-bd694a7ae82f59bf62465feb0ff7230343496f73a7d722876047f179ed04474f-d_640
144	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	sv-SE	https://player.vimeo.com/video/693151898?h=03c2449561&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402850263-bd694a7ae82f59bf62465feb0ff7230343496f73a7d722876047f179ed04474f-d_640
145	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	uk-UA	https://player.vimeo.com/video/693149727?h=b74b8d1739&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402850263-bd694a7ae82f59bf62465feb0ff7230343496f73a7d722876047f179ed04474f-d_640
146	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/693089230?h=172acd04b9&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402750495-658e6216a477ac29938d15459d0b9b3a15b843603dce86ecab13f9ae9077d32f-d_640
147	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/693078786?h=a1c895c2db&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402757534-17101fb68b61923fb625f582dd848b1f223a7630d9d4a39916b9cc8da7a2df7f-d_640
148	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/693073784?h=57a1cc268d&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402757534-17101fb68b61923fb625f582dd848b1f223a7630d9d4a39916b9cc8da7a2df7f-d_640
149	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	pt-PT	https://player.vimeo.com/video/693081362?h=a4d6140677&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402757534-17101fb68b61923fb625f582dd848b1f223a7630d9d4a39916b9cc8da7a2df7f-d_640
150	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/693083779?h=bc1f6a559d&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402757534-17101fb68b61923fb625f582dd848b1f223a7630d9d4a39916b9cc8da7a2df7f-d_640
151	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/693076356?h=1d3af468c0&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402757534-17101fb68b61923fb625f582dd848b1f223a7630d9d4a39916b9cc8da7a2df7f-d_640
152	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	uk-UA	https://player.vimeo.com/video/693086403?h=333894935a&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402757534-17101fb68b61923fb625f582dd848b1f223a7630d9d4a39916b9cc8da7a2df7f-d_640
153	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	sv-SE	https://player.vimeo.com/video/693177499?h=14d003ccdc&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402869394-b13003fb5798ad0e98dd6c99d33872cca90e402c2aaf5965189521807821473b-d_640
154	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ar-AE	https://player.vimeo.com/video/693177499?h=14d003ccdc&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1368205437-a6cc2cbeb5fc5c2d478810ef4801a73744ae2b0968e38a4c7a0b3c8e07affa05-d_640
155	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/674986835?h=bff4d33afb&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1368205437-a6cc2cbeb5fc5c2d478810ef4801a73744ae2b0968e38a4c7a0b3c8e07affa05-d_640
156	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/674984367?h=fcfabdae7c&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1368205437-a6cc2cbeb5fc5c2d478810ef4801a73744ae2b0968e38a4c7a0b3c8e07affa05-d_640
157	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	hi-IN	https://player.vimeo.com/video/674992120?h=490eabed6f&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1368205437-a6cc2cbeb5fc5c2d478810ef4801a73744ae2b0968e38a4c7a0b3c8e07affa05-d_640
158	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/674994657?h=e24a5ad391&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1368205437-a6cc2cbeb5fc5c2d478810ef4801a73744ae2b0968e38a4c7a0b3c8e07affa05-d_640
159	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	pl-PL	https://player.vimeo.com/video/674997305?h=8b4c04a15a&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1368205437-a6cc2cbeb5fc5c2d478810ef4801a73744ae2b0968e38a4c7a0b3c8e07affa05-d_640
160	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	pt-PT	https://player.vimeo.com/video/674999857?h=66a5484509&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1368205437-a6cc2cbeb5fc5c2d478810ef4801a73744ae2b0968e38a4c7a0b3c8e07affa05-d_640
161	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/675004662?h=aba65e55d3&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1368205437-a6cc2cbeb5fc5c2d478810ef4801a73744ae2b0968e38a4c7a0b3c8e07affa05-d_640
162	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/674989465?h=e284da4d1b&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1368205437-a6cc2cbeb5fc5c2d478810ef4801a73744ae2b0968e38a4c7a0b3c8e07affa05-d_640
163	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	tr-TR	https://player.vimeo.com/video/675002311?h=2a2847d8fa&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1368205437-a6cc2cbeb5fc5c2d478810ef4801a73744ae2b0968e38a4c7a0b3c8e07affa05-d_640
164	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/652524104?h=6061adc8d6&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1316734869-9e02800e6be4d7b364195538e446402262dccc42c9e2e6b662ebbc2d0186fc2d-d_640
165	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ar-AE	https://player.vimeo.com/video/697283011?h=d9c78f28c2&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1410292524-d740d63209281acc039f51f83c2f2fe9ba8b43fed7cfb0028e9bcef03e69b089-d_640
166	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	zh-CN	https://player.vimeo.com/video/697284620?h=88abc055c8&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1410293081-980ac0aceb8cad2e4bc14c0d2f417058eaccf06470882441fae36be48c2d8df6-d_640
167	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/697429256?h=33257e70ae&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1410293081-980ac0aceb8cad2e4bc14c0d2f417058eaccf06470882441fae36be48c2d8df6-d_640
168	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/697287762?h=ea00d5e31e&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1410293081-980ac0aceb8cad2e4bc14c0d2f417058eaccf06470882441fae36be48c2d8df6-d_640
169	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/697294695?h=c800f45255&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1410293081-980ac0aceb8cad2e4bc14c0d2f417058eaccf06470882441fae36be48c2d8df6-d_640
170	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ja-JP	https://player.vimeo.com/video/697301777?h=f6357d1027&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1410293081-980ac0aceb8cad2e4bc14c0d2f417058eaccf06470882441fae36be48c2d8df6-d_640
171	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/697303452?h=b5c4f15523&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1410293081-980ac0aceb8cad2e4bc14c0d2f417058eaccf06470882441fae36be48c2d8df6-d_640
172	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/697286160?h=d810bf3d6b&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1410293081-980ac0aceb8cad2e4bc14c0d2f417058eaccf06470882441fae36be48c2d8df6-d_640
173	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	uk-UA	https://player.vimeo.com/video/697305053?h=1f41070e32&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1410293081-980ac0aceb8cad2e4bc14c0d2f417058eaccf06470882441fae36be48c2d8df6-d_640
174	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	de-DE	https://player.vimeo.com/video/693095216?h=f5417e29c9&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1402742356-b91d11b3463b636e37b418aad07821a4ab7133656ed1eb0faffa8c767fa3a157-d_640
175	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ar-AE	https://player.vimeo.com/video/674572192?h=0f9eb6a006&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367416665-087d6e5b450cda66fbae47e4be3bb24342c2a3335753d5972ba88c02866c4ebf-d_640
176	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	zh-CN	https://player.vimeo.com/video/674569306?h=6b19805682&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367402005-d1bb2552374f205e45695e4e9f30f0d8bce2264a13ca170a8c52d46f30aab49c-d_640
177	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	en-GB	https://player.vimeo.com/video/674588716?h=6dcafb28d1&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367402005-d1bb2552374f205e45695e4e9f30f0d8bce2264a13ca170a8c52d46f30aab49c-d_640
178	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	fr-FR	https://player.vimeo.com/video/674583436?h=2a405defc6&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367402005-d1bb2552374f205e45695e4e9f30f0d8bce2264a13ca170a8c52d46f30aab49c-d_640
179	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	hi-IN	https://player.vimeo.com/video/674580652?h=0e4ab2bd0b&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367402005-d1bb2552374f205e45695e4e9f30f0d8bce2264a13ca170a8c52d46f30aab49c-d_640
180	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	it-IT	https://player.vimeo.com/video/674578062?h=dee5a141af&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367402005-d1bb2552374f205e45695e4e9f30f0d8bce2264a13ca170a8c52d46f30aab49c-d_640
181	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	pl-PL	https://player.vimeo.com/video/693098719?h=0e375d72ea&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367402005-d1bb2552374f205e45695e4e9f30f0d8bce2264a13ca170a8c52d46f30aab49c-d_640
182	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	ru-RU	https://player.vimeo.com/video/674566524?h=4f6a95f437&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367402005-d1bb2552374f205e45695e4e9f30f0d8bce2264a13ca170a8c52d46f30aab49c-d_640
183	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	es-ES	https://player.vimeo.com/video/674585985?h=e65e6b5f0e&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367402005-d1bb2552374f205e45695e4e9f30f0d8bce2264a13ca170a8c52d46f30aab49c-d_640
184	2022-05-30 00:56:23.811+00	2022-05-30 00:56:25.282+00	\N	tr-TR	https://player.vimeo.com/video/674575400?h=9f1e4154e6&autoplay=1&autopause=0	https://i.vimeocdn.com/video/1367402005-d1bb2552374f205e45695e4e9f30f0d8bce2264a13ca170a8c52d46f30aab49c-d_640
\.


--
-- Data for Name: website_languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.website_languages (id, created_at, updated_at, deleted_at, code, language, available) FROM stdin;
4	2022-05-29 12:37:03.317+00	2022-05-29 12:37:04.098+00	\N	de	Deutsch	t
1	2022-05-29 12:36:54.081+00	2022-05-31 08:54:47.857776+00	\N	en	English	t
5	2022-05-31 09:12:35.536517+00	2022-05-31 09:12:57.018766+00	2022-05-31 10:53:42.971379+00	jp	Japan	f
\.


--
-- Name: advantages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.advantages_id_seq', 8, true);


--
-- Name: colorful_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colorful_texts_id_seq', 37, true);


--
-- Name: faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faqs_id_seq', 12, true);


--
-- Name: goals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.goals_id_seq', 22, true);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_seq', 5253, true);


--
-- Name: page_text_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.page_text_contents_id_seq', 364, true);


--
-- Name: price_advantages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_advantages_id_seq', 76, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 10, true);


--
-- Name: source_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.source_languages_id_seq', 998, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- Name: video_examples_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.video_examples_id_seq', 31, true);


--
-- Name: videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.videos_id_seq', 184, true);


--
-- Name: website_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.website_languages_id_seq', 5, true);


--
-- Name: advantages advantages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advantages
    ADD CONSTRAINT advantages_pkey PRIMARY KEY (id);


--
-- Name: colorful_texts colorful_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colorful_texts
    ADD CONSTRAINT colorful_texts_pkey PRIMARY KEY (id);


--
-- Name: faqs faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs
    ADD CONSTRAINT faqs_pkey PRIMARY KEY (id);


--
-- Name: goals goals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_pkey PRIMARY KEY (id);


--
-- Name: users idx_users_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT idx_users_email UNIQUE (email);


--
-- Name: languages languages_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_code_key UNIQUE (code);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: page_text_contents page_text_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_text_contents
    ADD CONSTRAINT page_text_contents_pkey PRIMARY KEY (id);


--
-- Name: price_advantages price_advantages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_advantages
    ADD CONSTRAINT price_advantages_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: source_languages source_languages_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source_languages
    ADD CONSTRAINT source_languages_code_key UNIQUE (code);


--
-- Name: source_languages source_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source_languages
    ADD CONSTRAINT source_languages_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video_examples video_examples_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_examples
    ADD CONSTRAINT video_examples_pkey PRIMARY KEY (id);


--
-- Name: videos videos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


--
-- Name: website_languages website_languages_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.website_languages
    ADD CONSTRAINT website_languages_code_key UNIQUE (code);


--
-- Name: website_languages website_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.website_languages
    ADD CONSTRAINT website_languages_pkey PRIMARY KEY (id);


--
-- Name: idx_advantages_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_advantages_deleted_at ON public.advantages USING btree (deleted_at);


--
-- Name: idx_colorful_texts_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_colorful_texts_deleted_at ON public.colorful_texts USING btree (deleted_at);


--
-- Name: idx_faqs_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_faqs_deleted_at ON public.faqs USING btree (deleted_at);


--
-- Name: idx_goals_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_goals_deleted_at ON public.goals USING btree (deleted_at);


--
-- Name: idx_languages_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_languages_deleted_at ON public.languages USING btree (deleted_at);


--
-- Name: idx_page_text_contents_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_page_text_contents_deleted_at ON public.page_text_contents USING btree (deleted_at);


--
-- Name: idx_price_advantages_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_price_advantages_deleted_at ON public.price_advantages USING btree (deleted_at);


--
-- Name: idx_reviews_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_reviews_deleted_at ON public.reviews USING btree (deleted_at);


--
-- Name: idx_source_languages_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_source_languages_deleted_at ON public.source_languages USING btree (deleted_at);


--
-- Name: idx_users_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_deleted_at ON public.users USING btree (deleted_at);


--
-- Name: idx_video_examples_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_video_examples_deleted_at ON public.video_examples USING btree (deleted_at);


--
-- Name: idx_videos_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_videos_deleted_at ON public.videos USING btree (deleted_at);


--
-- Name: idx_website_languages_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_website_languages_deleted_at ON public.website_languages USING btree (deleted_at);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

