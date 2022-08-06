--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE public.urls OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urls_id_seq OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
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
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, token, "userId", "createdAt") FROM stdin;
1	3e1124c9-4cf2-4c04-a3d6-6a86bb5d78f9	1	2022-08-05 16:04:50.485825
2	1899ab5b-072d-4e04-977f-e424d87a346a	1	2022-08-05 16:06:21.760567
3	6fdd7c2f-b61b-40ad-a4bc-23801ce7ecab	1	2022-08-05 16:12:55.640849
4	f74489e6-6258-4416-8fde-59904fb4f8f3	1	2022-08-05 17:28:18.918959
5	c1bbbd3b-e18a-47f9-9a96-e1a5ca10b837	4	2022-08-05 21:02:08.895339
6	ae3d659f-17b8-47c2-9ed0-26879ba410ee	4	2022-08-06 04:10:43.224319
7	242423f5-a155-4961-991c-d87a62e48817	5	2022-08-06 06:05:32.53234
\.


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urls (id, url, "shortUrl", "visitCount", "userId", "createdAt") FROM stdin;
4	https://www.youtube.com/playlist?list=LL	nkbL8CPlpA	4	1	2022-08-05 21:31:21.423995
5	https://www.youtube.com/watch?v=SzdVPU3KuiY&list=LL&index=1&ab_channel=johnniewalker23	E9MGUwvPf6	2	1	2022-08-05 21:34:22.075635
3	https://www.youtube.com/watch?v=N4Q4j1oSdUU&ab_channel=MCGORILA	n-TcVFDFKG	5	4	2022-08-05 21:03:19.879187
7	https://www.youtube.com/watch?v=MJ4kgCWQMy0	vZlkfE7zIs	0	4	2022-08-06 05:27:23.525413
8	https://bootcampra.notion.site/Projeto-Shortly-API-4ffa110c0ebd4e83ad7302cfafd33133	Pczr7idAYo	0	5	2022-08-06 06:06:07.186418
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, "createdAt") FROM stdin;
1	Gabriel Rak	gabriel@gmail.com	$2b$10$fhQkwKVQIhBLd8dJ2iZ3vuYeIIpK/hP.UZpBT0TwH1vaNFd7cw6mS	2022-08-05 15:10:39.324208
2	Gabe Gabe	gabe@gabemail.com	$2b$10$rP.MN1UKuC1cw.fnn07m7OPuyu176n7lcIOTjVItJ.GxtFVdCpxZq	2022-08-05 15:16:38.208094
3	Luan do Corinthians	luancamisa7@corinthians.com	$2b$10$6AHGBlFmgtklTqRFAAtNVemAffIU3ZJPKeb6IclSaD0h3JGEnHFTu	2022-08-05 15:25:05.445229
4	MC Gorila	funk@funk.com	$2b$10$vcR.NOgF8a/X6.lzECNqUeN7yMW0jGnRRn0Huto8XLU3tnGMLq3li	2022-08-05 21:01:57.215323
5	bia	bia@bia.com	$2b$10$3LFkwFVp6GumIv9CHYJLgOSryRlSQsmxACztRj6.ttC7d.JbD25bq	2022-08-06 06:05:23.155173
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 7, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urls_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

