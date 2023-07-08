--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galactic_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galactic_cluster (
    galactic_cluster_id integer NOT NULL,
    name character varying(40) NOT NULL,
    approx_galaxy_count integer
);


ALTER TABLE public.galactic_cluster OWNER TO freecodecamp;

--
-- Name: galactic_cluster_galactic_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galactic_cluster_galactic_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galactic_cluster_galactic_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galactic_cluster_galactic_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galactic_cluster_galactic_cluster_id_seq OWNED BY public.galactic_cluster.galactic_cluster_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    diameter_in_kpc numeric(4,1),
    name character varying(40) NOT NULL,
    secondary_name text,
    galactic_cluster_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    apparent_magnitude real,
    planet_id integer NOT NULL,
    radius_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    mass real,
    radius_in_km real,
    number_of_moons integer,
    number_of_rings integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    radius numeric(5,4),
    mass numeric(5,4),
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    older_than_four_billion_years boolean,
    more_mass_than_sun boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galactic_cluster galactic_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galactic_cluster ALTER COLUMN galactic_cluster_id SET DEFAULT nextval('public.galactic_cluster_galactic_cluster_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galactic_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galactic_cluster VALUES (1, 'Local Group', 30);
INSERT INTO public.galactic_cluster VALUES (2, 'Leo Triplet', 3);
INSERT INTO public.galactic_cluster VALUES (3, 'Markarians Chain', 8);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 16.5, 'Black Eye', 'M64', 1);
INSERT INTO public.galaxy VALUES (4, 44.2, 'Cartwheel', 'PGC 2248', 1);
INSERT INTO public.galaxy VALUES (5, NULL, 'Backward', 'NGC 4622', 1);
INSERT INTO public.galaxy VALUES (6, 160.0, 'Condor', 'NGC 6872', 1);
INSERT INTO public.galaxy VALUES (1, 26.8, 'Milky Way', 'Via Lactea', 1);
INSERT INTO public.galaxy VALUES (2, 40.6, 'Andromeda', 'M31', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 'Europa', 5.29, 8, 1561);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.89, 3, 6);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.8, 3, 11);
INSERT INTO public.moon VALUES (1, 'Moon', -12.74, 2, 1737);
INSERT INTO public.moon VALUES (5, 'Io', 5.02, 8, 1822);
INSERT INTO public.moon VALUES (6, 'Callisto', 5.65, 8, 2410);
INSERT INTO public.moon VALUES (7, 'Thebe', NULL, 8, 49);
INSERT INTO public.moon VALUES (8, 'Pasithee', NULL, 8, 1);
INSERT INTO public.moon VALUES (9, 'Triton', 13.47, 1, 1353);
INSERT INTO public.moon VALUES (10, 'Galatea', 21.9, 1, 87);
INSERT INTO public.moon VALUES (11, 'Proteus', 19.7, 1, 210);
INSERT INTO public.moon VALUES (12, 'Larissa', 21.5, 1, 97);
INSERT INTO public.moon VALUES (13, 'Sao', NULL, 1, 44);
INSERT INTO public.moon VALUES (14, 'Titan', 8.2, 6, 2575);
INSERT INTO public.moon VALUES (15, 'Mimas', 12.9, 6, 198);
INSERT INTO public.moon VALUES (16, 'Enceladus', 11.7, 6, 252);
INSERT INTO public.moon VALUES (17, 'Tethys', 10.2, 6, 531);
INSERT INTO public.moon VALUES (18, 'Dione', 10.4, 6, 561);
INSERT INTO public.moon VALUES (19, 'Fenrir', 25, 6, 4);
INSERT INTO public.moon VALUES (20, 'Pandora', NULL, 6, 80);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Mars', 2, 0.107, 3389.5, 2, 0);
INSERT INTO public.planet VALUES (4, 'Venus', 2, 0.857, 6051.8, 0, 0);
INSERT INTO public.planet VALUES (5, 'Mercury', 2, 0.055, 2439.7, 0, 0);
INSERT INTO public.planet VALUES (6, 'Saturn', 2, 95.159, 58232, 136, 7);
INSERT INTO public.planet VALUES (2, 'Earth', 2, 1, 6371, 1, 0);
INSERT INTO public.planet VALUES (7, 'Uranus', 2, 14.425, 25362, 27, 13);
INSERT INTO public.planet VALUES (1, 'Neptune', 2, 17.147, 24622, 14, 5);
INSERT INTO public.planet VALUES (8, 'Jupiter', 2, 317.8, 69911, 95, 4);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 1, 1.07, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 1, 7, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 1, 0.26, 0.81, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Tau Ceti e', 5, 3.93, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 1.0000, 1.0000, 'Sol', 1, true, NULL);
INSERT INTO public.star VALUES (3, 7.7870, 1.2400, 'Lambda Andromedae', 2, NULL, true);
INSERT INTO public.star VALUES (4, 6.6000, 9.8500, 'Omicron Andromedae', 2, false, true);
INSERT INTO public.star VALUES (5, 0.7930, 0.7830, 'Tau Ceti', 1, true, false);
INSERT INTO public.star VALUES (6, 0.4230, 0.4230, 'AD Leonis', 1, false, false);
INSERT INTO public.star VALUES (1, 0.1542, 0.1221, 'Proxima Centauri', 1, true, false);


--
-- Name: galactic_cluster_galactic_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galactic_cluster_galactic_cluster_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galactic_cluster galactic_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galactic_cluster
    ADD CONSTRAINT galactic_cluster_name_key UNIQUE (name);


--
-- Name: galactic_cluster galactic_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galactic_cluster
    ADD CONSTRAINT galactic_cluster_pkey PRIMARY KEY (galactic_cluster_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galactic_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galactic_cluster_id_fkey FOREIGN KEY (galactic_cluster_id) REFERENCES public.galactic_cluster(galactic_cluster_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

