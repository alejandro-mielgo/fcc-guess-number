--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    id integer NOT NULL,
    name text,
    games_played integer,
    best_game integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO freecodecamp;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (20, 'alejandro', 1, 4);
INSERT INTO public.games VALUES (22, 'user_1726735504441', 2, 4);
INSERT INTO public.games VALUES (21, 'user_1726735504442', 5, 4);
INSERT INTO public.games VALUES (24, 'user_1726735545379', 2, 8);
INSERT INTO public.games VALUES (23, 'user_1726735545380', 5, 3);
INSERT INTO public.games VALUES (26, 'user_1726735567877', 2, 2);
INSERT INTO public.games VALUES (25, 'user_1726735567878', 5, 1);
INSERT INTO public.games VALUES (28, 'user_1726735578720', 2, 2);
INSERT INTO public.games VALUES (27, 'user_1726735578721', 5, 2);
INSERT INTO public.games VALUES (30, 'user_1726735597446', 2, 3);
INSERT INTO public.games VALUES (29, 'user_1726735597447', 5, 4);
INSERT INTO public.games VALUES (31, 'user_1726735728552', 1, 4);
INSERT INTO public.games VALUES (32, 'user_1726735728551', 1, 5);
INSERT INTO public.games VALUES (33, 'user_1726735748906', 1, 467);
INSERT INTO public.games VALUES (34, 'user_1726735748905', 1, 827);
INSERT INTO public.games VALUES (35, 'user_1726735833974', 1, 184);
INSERT INTO public.games VALUES (36, 'user_1726735833973', 1, 426);
INSERT INTO public.games VALUES (37, 'user_1726735851439', 1, 249);
INSERT INTO public.games VALUES (38, 'user_1726735851438', 1, 503);
INSERT INTO public.games VALUES (39, 'user_1726735897633', 1, 891);
INSERT INTO public.games VALUES (40, 'user_1726735897632', 1, 601);
INSERT INTO public.games VALUES (41, 'user_1726735904606', 1, 374);
INSERT INTO public.games VALUES (42, 'user_1726735904605', 1, 341);
INSERT INTO public.games VALUES (43, 'user_1726735933428', 1, 781);
INSERT INTO public.games VALUES (44, 'user_1726735933427', 1, 593);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_id_seq', 44, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

