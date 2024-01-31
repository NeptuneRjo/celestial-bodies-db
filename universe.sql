--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(32) NOT NULL,
    distance_mly numeric(4,1),
    constellation text,
    galaxy_type_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_pk_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_pk_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_pk_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(32) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(32) NOT NULL,
    radius_km numeric NOT NULL,
    local boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_pk_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_pk_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_pk_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(32) NOT NULL,
    radius_km numeric NOT NULL,
    moon_count integer NOT NULL,
    local boolean NOT NULL,
    planet_type_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_pk_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_pk_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_pk_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(32) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_pk_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_pk_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_pk_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(32) NOT NULL,
    radius_km numeric NOT NULL,
    planet_count integer,
    star_type_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_pk_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_pk_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_pk_seq OWNED BY public.star.star_id;


--
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(32) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_pk_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_pk_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_pk_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_pk_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_pk_seq'::regclass);


--
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2.5, 'Andromeda', 1);
INSERT INTO public.galaxy VALUES (3, 'Antennae', 65.0, 'Corvus', 3);
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 200.0, 'Centaurus', 1);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 17.3, 'Coma Berenices', 1);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel Galaxy', 500.0, 'Sculptor', 2);
INSERT INTO public.galaxy VALUES (8, 'Cigar Galaxy', 12.0, 'Ursa Major', 1);
INSERT INTO public.galaxy VALUES (6, 'Bodes Galaxy', 12.0, 'Ursa Major', 1);
INSERT INTO public.galaxy VALUES (1, 'Bear Paw Galaxy', 22.0, 'Lynx', 3);
INSERT INTO public.galaxy VALUES (9, 'Milky Way', 0.0, 'Sagittarius', 1);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Spiral-shaped galaxies with spiral arms');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Elliptial-shaped galaxies with little or no structure');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'Galaxies with irregular shapes and structures');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 7, 'Phobos', 11.2, true);
INSERT INTO public.moon VALUES (2, 7, 'Deimos', 6.2, true);
INSERT INTO public.moon VALUES (3, 10, 'Titan', 2574, true);
INSERT INTO public.moon VALUES (4, 10, 'Tethys', 531, true);
INSERT INTO public.moon VALUES (5, 10, 'Dione', 561, true);
INSERT INTO public.moon VALUES (6, 11, 'Triton', 1353, true);
INSERT INTO public.moon VALUES (7, 11, 'Nereid', 180, true);
INSERT INTO public.moon VALUES (8, 11, 'Proteus', 210, true);
INSERT INTO public.moon VALUES (9, 11, 'Despina', 74, true);
INSERT INTO public.moon VALUES (10, 9, 'Europa', 1560, true);
INSERT INTO public.moon VALUES (11, 9, 'Io', 1821, true);
INSERT INTO public.moon VALUES (12, 9, 'Ganymede', 2634, true);
INSERT INTO public.moon VALUES (13, 9, 'Callisto', 2400, true);
INSERT INTO public.moon VALUES (14, 9, 'Cyllene', 1, true);
INSERT INTO public.moon VALUES (15, 9, 'Amalthea', 83.5, true);
INSERT INTO public.moon VALUES (16, 9, 'Eirene', 2, true);
INSERT INTO public.moon VALUES (17, 10, 'Enceladus', 252, true);
INSERT INTO public.moon VALUES (18, 10, 'Mimas', 198, true);
INSERT INTO public.moon VALUES (19, 10, 'Hyperion', 135, true);
INSERT INTO public.moon VALUES (20, 10, 'Methone', 1.6, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 3, 'HIP 12961 b - Aumatex', 82494, 0, false, 1);
INSERT INTO public.planet VALUES (2, 4, 'HD 1461 b', 15100, 0, false, 5);
INSERT INTO public.planet VALUES (3, 5, 'Gliese 179 b', 85990, 0, false, 1);
INSERT INTO public.planet VALUES (4, 6, 'HD 69830 b', 19784, 0, false, 1);
INSERT INTO public.planet VALUES (5, 6, 'HD 69830 c', 19784, 0, false, 2);
INSERT INTO public.planet VALUES (6, 6, 'HD 69830 d', 19784, 0, false, 2);
INSERT INTO public.planet VALUES (7, 7, 'Mars', 3389, 2, true, 3);
INSERT INTO public.planet VALUES (8, 7, 'Venus', 6051, 0, true, 3);
INSERT INTO public.planet VALUES (9, 7, 'Jupiter', 69911, 95, true, 1);
INSERT INTO public.planet VALUES (10, 7, 'Saturn', 58232, 146, true, 1);
INSERT INTO public.planet VALUES (11, 7, 'Neptune', 24622, 14, true, 2);
INSERT INTO public.planet VALUES (12, 7, 'Mercury', 2439, 0, true, 3);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Gas Giant', 'Massive planets composed of thick hydrogen and helium atmospheres');
INSERT INTO public.planet_type VALUES (2, 'Ice Giant', 'Smaller than gas giants - Composed of elements such as oxygen, carbon, nitrogen, and sulfur');
INSERT INTO public.planet_type VALUES (3, 'Terrestrial', 'Composed of carbonaceous or silicate rocks or metals');
INSERT INTO public.planet_type VALUES (4, 'Gas Dwarf', 'Lower-mass planets composed of hydrogen and helium');
INSERT INTO public.planet_type VALUES (5, 'Unknown', 'The composition is unknown');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 9, 'V766 Centauri', 737760000, 0, 6);
INSERT INTO public.star VALUES (1, 2, 'J004514.95+414625.6', 921504000, 0, 7);
INSERT INTO public.star VALUES (3, 9, 'HIP 12961 - Koeia', 438480, 1, 7);
INSERT INTO public.star VALUES (4, 9, 'HD 1461', 863040, 2, 5);
INSERT INTO public.star VALUES (5, 9, 'Gliese 179', 278400, 1, 7);
INSERT INTO public.star VALUES (6, 9, 'HD 69830', 629880, 3, 5);
INSERT INTO public.star VALUES (7, 9, 'Sol', 696340, 8, 5);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'O', 'Hottest, 30 - 50k Kelvin, Blue in color');
INSERT INTO public.star_type VALUES (2, 'B', '10 - 30k Kelvin, Blue-white in color');
INSERT INTO public.star_type VALUES (3, 'A', '7.5 - 10k Kelvin, White in color');
INSERT INTO public.star_type VALUES (4, 'F', '6 - 7.5k Kelvin, Yellow-white in color');
INSERT INTO public.star_type VALUES (5, 'G', '5.2 - 6k Kelvin, Yellow in color');
INSERT INTO public.star_type VALUES (6, 'K', '3.7 - 5.2k Kelvin, Orange in color');
INSERT INTO public.star_type VALUES (7, 'M', 'Coldest, Under 3.7k Kelvin, Red in color');


--
-- Name: galaxy_galaxy_id_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_pk_seq', 9, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_pk_seq', 20, true);


--
-- Name: planet_planet_id_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_pk_seq', 12, true);


--
-- Name: planet_type_planet_type_id_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_pk_seq', 5, true);


--
-- Name: star_star_id_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_pk_seq', 7, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 7, true);


--
-- Name: galaxy g_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT g_unique_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: galaxy_type gt_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT gt_unique_name UNIQUE (name);


--
-- Name: moon m_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT m_unique_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet p_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT p_unique_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: planet_type pt_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT pt_unique_name UNIQUE (name);


--
-- Name: star s_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT s_unique_name UNIQUE (name);


--
-- Name: star_type st_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT st_unique_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--

