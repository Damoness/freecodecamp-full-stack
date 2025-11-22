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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    abbreviation character varying(10) NOT NULL,
    area numeric(8,2) NOT NULL,
    visible boolean DEFAULT true NOT NULL,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mass numeric(20,3) NOT NULL,
    num_stars integer NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    mass numeric(10,6) NOT NULL,
    radius numeric(8,3) NOT NULL,
    discovery_year integer NOT NULL,
    has_atmosphere boolean DEFAULT false NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    mass numeric(12,6) NOT NULL,
    radius numeric(8,3) NOT NULL,
    orbital_period integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(10) NOT NULL,
    mass numeric(12,6) NOT NULL,
    age integer NOT NULL,
    is_main_sequence boolean DEFAULT true NOT NULL,
    description text
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 594.10, true, 'Prominent winter constellation');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'UMa', 1280.00, true, 'Large northern constellation');
INSERT INTO public.constellation VALUES (3, 'Scorpius', 'Sco', 497.00, true, 'Summer constellation');
INSERT INTO public.constellation VALUES (4, 'Lyra', 'Lyr', 286.20, true, 'Contains Vega');
INSERT INTO public.constellation VALUES (5, 'Crux', 'Cru', 68.00, true, 'Southern cross');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 1500000000000.000, 250000000, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1200000000000.000, 1000000000, true, 'Nearest large spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 50000000000.000, 30000000, true, 'Smaller neighbor');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 800000000000.000, 100000000, true, 'Bright bulge');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 160000000000.000, 100000000, true, 'Interacting spiral');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 10000000000.000, 30000000, true, 'Satellite of MW');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 0.012300, 0.273, 0, false, 'Earth''s Moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.000000, 0.011, 1877, false, 'Mars inner moon');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 0.000000, 0.006, 1877, false, 'Mars outer moon');
INSERT INTO public.moon VALUES (4, 'Io', 11, 0.015000, 0.285, 1610, false, 'Volcanic moon analog');
INSERT INTO public.moon VALUES (5, 'Europa', 11, 0.008000, 0.245, 1610, true, 'Ice ocean moon analog');
INSERT INTO public.moon VALUES (6, 'Ganymede', 11, 0.025000, 0.413, 1610, false, 'Large moon analog');
INSERT INTO public.moon VALUES (7, 'Callisto', 11, 0.018000, 0.378, 1610, false, 'Cratery moon analog');
INSERT INTO public.moon VALUES (8, 'Charon', 12, 0.012000, 0.186, 1978, false, 'Pluto-like large moon');
INSERT INTO public.moon VALUES (9, 'Nix', 12, 0.000100, 0.020, 2005, false, 'Small outer moon');
INSERT INTO public.moon VALUES (10, 'Hydra', 12, 0.000090, 0.015, 2005, false, 'Small outer moon');
INSERT INTO public.moon VALUES (11, 'Luna-2', 1, 0.005000, 0.200, 1900, false, 'Fictional additional moon');
INSERT INTO public.moon VALUES (12, 'Phobos-2', 4, 0.000800, 0.050, 1999, false, 'Fictional second Mars moon');
INSERT INTO public.moon VALUES (13, 'Europa-2', 11, 0.003000, 0.150, 2020, false, 'Fictional second Europa analog');
INSERT INTO public.moon VALUES (14, 'Titan', 11, 0.022500, 0.404, 1655, true, 'Thick atmosphere moon analog');
INSERT INTO public.moon VALUES (15, 'Enceladus', 11, 0.000700, 0.053, 1789, true, 'Cryovolcanic moon analog');
INSERT INTO public.moon VALUES (16, 'Mimas', 11, 0.000200, 0.039, 1789, false, 'Small icy moon analog');
INSERT INTO public.moon VALUES (17, 'Tethys', 11, 0.001000, 0.105, 1684, false, 'Icy moon analog');
INSERT INTO public.moon VALUES (18, 'Dione', 11, 0.001200, 0.112, 1684, false, 'Icy moon analog');
INSERT INTO public.moon VALUES (19, 'Rhea', 11, 0.002000, 0.153, 1672, false, 'Icy moon analog');
INSERT INTO public.moon VALUES (20, 'Iapetus', 11, 0.002300, 0.147, 1671, false, 'Outer analog moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.000330, 0.383, 88, false, 'Innermost planet');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.002570, 0.949, 225, false, 'Thick atmosphere');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1.000000, 1.000, 365, true, 'Home planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.107000, 0.532, 687, false, 'Red planet');
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, 1.270000, 1.100, 11, false, 'Exoplanet around Proxima');
INSERT INTO public.planet VALUES (6, 'Sirius b Companion', 3, 1.018000, 0.008, 50, false, 'White dwarf companion');
INSERT INTO public.planet VALUES (7, 'Kepler-62f', 4, 2.800000, 1.410, 267, false, 'Potentially habitable');
INSERT INTO public.planet VALUES (8, 'Vega I', 5, 0.500000, 0.900, 120, false, 'Hypothetical around Vega');
INSERT INTO public.planet VALUES (9, 'Alpha Cen Bb', 7, 1.130000, 1.020, 3, false, 'Candidate close-in');
INSERT INTO public.planet VALUES (10, 'Gliese 581d', 8, 6.980000, 1.700, 67, false, 'Super-Earth candidate');
INSERT INTO public.planet VALUES (11, 'Planet-X-1', 1, 0.300000, 0.700, 400, false, 'Distant gas dwarf');
INSERT INTO public.planet VALUES (12, 'Planet-X-2', 2, 0.450000, 0.800, 500, false, 'Companion dwarf');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.000000, 4600, true, 'Sol, the Sun');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M5V', 0.122000, 4500, true, 'Nearest star to Sun');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A1V', 2.063000, 242, true, 'Bright star');
INSERT INTO public.star VALUES (4, 'Rigel', 2, 'B8Ia', 18.000000, 8, false, 'Blue supergiant');
INSERT INTO public.star VALUES (5, 'Vega', 2, 'A0V', 2.135000, 455, true, 'Bright in Lyra');
INSERT INTO public.star VALUES (6, 'Betelgeuse', 3, 'M2Iab', 11.600000, 8000, false, 'Red supergiant');
INSERT INTO public.star VALUES (7, 'Alpha Centauri A', 1, 'G2V', 1.100000, 5200, true, 'Alpha Centauri system');
INSERT INTO public.star VALUES (8, 'Barnards Star', 1, 'M4V', 0.144000, 10000, true, 'High proper motion');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

