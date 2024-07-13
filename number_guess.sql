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

DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing_game OWNER TO freecodecamp;

\connect number_guessing_game

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (41, 'user_1720863033753', 1, 113);
INSERT INTO public.users VALUES (27, 'user_1720862124555', 2, 891);
INSERT INTO public.users VALUES (40, 'user_1720863033754', 1, 405);
INSERT INTO public.users VALUES (26, 'user_1720862124556', 5, 104);
INSERT INTO public.users VALUES (57, 'user_1720863267748', 2, 410);
INSERT INTO public.users VALUES (29, 'user_1720862146554', 2, 578);
INSERT INTO public.users VALUES (43, 'user_1720863044375', 1, 485);
INSERT INTO public.users VALUES (28, 'user_1720862146555', 5, 31);
INSERT INTO public.users VALUES (56, 'user_1720863267749', 5, 101);
INSERT INTO public.users VALUES (42, 'user_1720863044377', 1, 166);
INSERT INTO public.users VALUES (31, 'user_1720862334022', 1, 679);
INSERT INTO public.users VALUES (77, 'user_1720863386529', 2, 94);
INSERT INTO public.users VALUES (30, 'user_1720862334023', 1, 311);
INSERT INTO public.users VALUES (33, 'user_1720862432542', 1, 325);
INSERT INTO public.users VALUES (45, 'user_1720863051774', 1, 342);
INSERT INTO public.users VALUES (32, 'user_1720862432543', 1, 26);
INSERT INTO public.users VALUES (59, 'user_1720863302757', 2, 127);
INSERT INTO public.users VALUES (44, 'user_1720863051775', 1, 339);
INSERT INTO public.users VALUES (35, 'user_1720862446099', 1, 594);
INSERT INTO public.users VALUES (76, 'user_1720863386530', 5, 26);
INSERT INTO public.users VALUES (34, 'user_1720862446100', 1, 53);
INSERT INTO public.users VALUES (58, 'user_1720863302758', 5, 262);
INSERT INTO public.users VALUES (47, 'user_1720863089159', 2, 597);
INSERT INTO public.users VALUES (37, 'user_1720862950860', 1, 31);
INSERT INTO public.users VALUES (36, 'user_1720862950861', 1, 241);
INSERT INTO public.users VALUES (46, 'user_1720863089160', 5, 137);
INSERT INTO public.users VALUES (39, 'user_1720862983962', 1, 651);
INSERT INTO public.users VALUES (38, 'user_1720862983963', 1, 247);
INSERT INTO public.users VALUES (61, 'user_1720863332732', 2, 163);
INSERT INTO public.users VALUES (49, 'user_1720863097303', 2, 595);
INSERT INTO public.users VALUES (79, 'user_1720863403929', 2, 353);
INSERT INTO public.users VALUES (48, 'user_1720863097304', 5, 231);
INSERT INTO public.users VALUES (60, 'user_1720863332733', 5, 136);
INSERT INTO public.users VALUES (51, 'user_1720863110646', 2, 102);
INSERT INTO public.users VALUES (50, 'user_1720863110647', 5, 46);
INSERT INTO public.users VALUES (78, 'user_1720863403930', 5, 139);
INSERT INTO public.users VALUES (25, 'gamer', 3, 1);
INSERT INTO public.users VALUES (63, 'user_1720863337573', 2, 141);
INSERT INTO public.users VALUES (53, 'user_1720863187487', 2, 321);
INSERT INTO public.users VALUES (62, 'user_1720863337574', 5, 290);
INSERT INTO public.users VALUES (52, 'user_1720863187488', 5, 305);
INSERT INTO public.users VALUES (55, 'user_1720863259460', 2, 215);
INSERT INTO public.users VALUES (65, 'user_1720863346868', 2, 252);
INSERT INTO public.users VALUES (54, 'user_1720863259461', 5, 10);
INSERT INTO public.users VALUES (64, 'user_1720863346869', 5, 449);
INSERT INTO public.users VALUES (67, 'user_1720863372438', 2, 579);
INSERT INTO public.users VALUES (66, 'user_1720863372439', 5, 103);
INSERT INTO public.users VALUES (69, 'user_1720863375058', 2, 611);
INSERT INTO public.users VALUES (68, 'user_1720863375059', 5, 123);
INSERT INTO public.users VALUES (71, 'user_1720863378767', 2, 882);
INSERT INTO public.users VALUES (70, 'user_1720863378768', 5, 189);
INSERT INTO public.users VALUES (73, 'user_1720863381647', 2, 610);
INSERT INTO public.users VALUES (72, 'user_1720863381648', 5, 104);
INSERT INTO public.users VALUES (75, 'user_1720863384414', 2, 152);
INSERT INTO public.users VALUES (74, 'user_1720863384415', 5, 247);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 79, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

