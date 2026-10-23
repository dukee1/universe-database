--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: COLUMN galaxy.distance_from_earth; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.galaxy.distance_from_earth IS 'Distance from Earth in millions of light-years.';


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
    name character varying(30) NOT NULL,
    planet_id integer,
    is_spherical boolean,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric,
    description text,
    star_id integer,
    planet_type_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: COLUMN planet.distance_from_earth; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.planet.distance_from_earth IS 'Distance from Earth in millions of kilometers.';


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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean,
    distance_from_earth numeric,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: COLUMN star.distance_from_earth; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.star.distance_from_earth IS 'Distance from Earth in thousands of light-years';


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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0, 'Galaxy, which contains planet Earth and the Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2.5, 'The closest spiral galaxy to us, currently moving towards us.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 12000, 2.73, 'Known for its high rate of active star formation.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 13000, 31, 'Features a prominent bright nucleus and a dark dust lane');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 400, 23, 'A grand-design spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'JADES-GS', 13500, 33.8, 'The most distant known galaxy, discovered by the James Webb Space Telescope');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 'Earth s only natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 'The larger and of the two natural satellites of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 'The smaller of the two satellites of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, true, 'Third-largest Galilean moon of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, 'Icy moon of Jupiter');
INSERT INTO public.moon VALUES (6, 'Ganymade', 5, true, 'The largest natural satellite in the Solar System');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, 'Second-largest satellite of Jupiter');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, false, 'Irregularly shaped moon orbiting close to Jupiter.');
INSERT INTO public.moon VALUES (9, 'Himalia', 5, false, 'The largest irregular satellite of Jupiter.');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, true, 'Saturnian moon with a massive impact crater.');
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, true, 'Highly reflective icy moon of Saturn.');
INSERT INTO public.moon VALUES (12, 'Tethys', 6, true, 'Mid-sized icy moon of Saturn.');
INSERT INTO public.moon VALUES (13, 'Dione', 6, true, 'Heavily cratered icy moon orbiting Saturn.');
INSERT INTO public.moon VALUES (14, 'Hermes Moon A', 2, false, 'Theoretical small satellite of Mercury.');
INSERT INTO public.moon VALUES (15, 'Miranda', 7, true, 'Small moon of Uranus with extreme canyon topography.');
INSERT INTO public.moon VALUES (16, 'Titania', 7, true, 'The largest moon of Uranus.');
INSERT INTO public.moon VALUES (17, 'Triton', 8, true, 'Largest moon of Neptune with retrograde orbit.');
INSERT INTO public.moon VALUES (18, 'Proxima Moon A', 9, true, 'Exomoon orbiting planet Proxima b.');
INSERT INTO public.moon VALUES (19, 'Kepler Moon A', 10, true, 'Exomoon orbiting planet Kepler.');
INSERT INTO public.moon VALUES (20, 'Dinos Moon A', 11, false, 'Irregular exomoon orbiting Dinos.');
INSERT INTO public.moon VALUES (21, 'Snikers Moon A', 12, true, 'Ancient icy exomoon orbiting Snikers.');
INSERT INTO public.moon VALUES (22, 'Snikers Moon B', 12, false, 'Secondary irregular exomoon orbiting Snikers.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4540, true, true, 0, 'Our home rocky planet', 1, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 4500, false, true, 78, 'The smallest planet in the Solar System and closest to the Sun', 1, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 4500, false, true, 40, 'A planet with scorching surface temperatures.', 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4600, false, true, 55, 'A red desert planet.', 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4600, false, true, 588, 'The largest gas giant in the Solar System.', 1, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 4500, false, true, 1200, 'Known for its spectacular system of icy rings.', 1, 2);
INSERT INTO public.planet VALUES (11, 'Dinos', 6500, false, true, 8000, 'A deep-blue gas giant.', 4, 2);
INSERT INTO public.planet VALUES (12, 'Snikers', 12700, false, true, 9000, 'The oldest known exoplanet in the universe.', 6, 2);
INSERT INTO public.planet VALUES (9, 'Proxima', 4850, false, true, 6000, 'The closest Earth-sized exoplanet to us.', 2, 1);
INSERT INTO public.planet VALUES (10, 'Kepler', 6000, false, true, 7500, 'Exoplanet orbits a G-type star similar to the Sun.', 4, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4500, false, true, 2600, 'An ice giant with an extreme axial tilt.', 1, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 4500, false, true, 4300, 'The outermost planet in the Solar System.', 1, 3);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestria', 'Planets composed primarily of silicate rocks or metals with a solid surface.');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets composed mostly of hydrogen and helium gases.');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planets composed mainly of elements heavier than hydrogen and helium.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, true, 0, 'The central star of the Solar System.');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, true, 0.00424, 'The closest star to the Sun.');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 10, true, 0.6425, 'A red supergiant star in Orion.');
INSERT INTO public.star VALUES (4, 'Andromeda Star A', 2, 5000, true, 2500, 'A luminous star in Andromeda Galaxy.');
INSERT INTO public.star VALUES (5, 'Triangulum Star A', 3, 3000, true, 2730, 'A massive hot star in Triangulum Galaxy.');
INSERT INTO public.star VALUES (6, 'Whirlpool Star A', 5, 2000, true, 23000, 'A bright star in Whirlpool Galaxy');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- PostgreSQL database dump complete
--

