--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE ideals;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:ZbirinTY9pP4sdVtt+4M5Q==$8UyiSOwiUkD1ww9N1wJWwvEkxacwojfmWN5H+olqJkg=:hFZf5+IYQ92C3wYu3NB1jRjzHlAf36Xficy1T+U2z/g=';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "ideals" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: ideals; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE ideals WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE ideals OWNER TO postgres;

\connect ideals

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
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action_text_rich_texts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    body text,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.action_text_rich_texts OWNER TO postgres;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_text_rich_texts_id_seq OWNER TO postgres;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: assumptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assumptions (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.assumptions OWNER TO postgres;

--
-- Name: assumptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assumptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assumptions_id_seq OWNER TO postgres;

--
-- Name: assumptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assumptions_id_seq OWNED BY public.assumptions.id;


--
-- Name: assumptions_practices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assumptions_practices (
    assumption_id bigint NOT NULL,
    practice_id bigint NOT NULL
);


ALTER TABLE public.assumptions_practices OWNER TO postgres;

--
-- Name: assumptions_theories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assumptions_theories (
    assumption_id bigint NOT NULL,
    theory_id bigint NOT NULL
);


ALTER TABLE public.assumptions_theories OWNER TO postgres;

--
-- Name: practices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.practices (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.practices OWNER TO postgres;

--
-- Name: practices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.practices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.practices_id_seq OWNER TO postgres;

--
-- Name: practices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.practices_id_seq OWNED BY public.practices.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: theories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.theories (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.theories OWNER TO postgres;

--
-- Name: theories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.theories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theories_id_seq OWNER TO postgres;

--
-- Name: theories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.theories_id_seq OWNED BY public.theories.id;


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: assumptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assumptions ALTER COLUMN id SET DEFAULT nextval('public.assumptions_id_seq'::regclass);


--
-- Name: practices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.practices ALTER COLUMN id SET DEFAULT nextval('public.practices_id_seq'::regclass);


--
-- Name: theories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theories ALTER COLUMN id SET DEFAULT nextval('public.theories_id_seq'::regclass);


--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at) FROM stdin;
27	description	<div> learning involves socialization </div>	Assumption	14	2023-04-18 15:01:47.15018	2023-04-18 15:01:47.15018
28	description	<div> community is both context and driver of learning </div>	Assumption	15	2023-04-18 15:02:17.111133	2023-04-18 15:02:17.111133
7	description	<div>Situated learning theory defines learning as changes in patterns of participation in, and identification with, a community of practice.</div>	Theory	7	2023-04-18 14:36:09.367155	2023-04-18 14:36:09.367155
8	description	<div>Critical pedagogy defines learning as changes in ability to read and write (or right) the world, with an emphasis on understanding how power dynamics function within one's own context. </div>	Theory	8	2023-04-18 14:37:44.564108	2023-04-18 14:37:44.564108
9	description	<div>Transformative learning theory defines learning as transformation of beliefs, assumptions, and frames.</div>	Theory	9	2023-04-18 14:38:28.347295	2023-04-18 14:38:28.347295
10	description	<div>Constructionist theory defines learning as construction of knowledge through construction of things in a feedback loop.</div>	Theory	10	2023-04-18 14:39:22.116516	2023-04-18 14:39:22.116516
5	description	<div>Cognitive constructivist learning theory defines learning as a process of knowledge construction within individual human minds through schema building, accommodation, and reinforcement.</div>	Theory	5	2023-04-18 14:34:10.525639	2023-04-18 14:42:08.391047
6	description	<div>Social constructivist learning theory defines learning as a process of collaborative and collective knowledge construction.</div>	Theory	6	2023-04-18 14:35:05.681326	2023-04-18 14:42:40.839496
11	description	<div>Cultural-historical activity theory (CHAT) defines learning as a change in an activity system.</div>	Theory	11	2023-04-18 14:44:55.262469	2023-04-18 14:44:55.262469
12	description	<div>Dynamic systems model of role identity (DSMRI) is an identity theory which can be used to describe learning as change in one's role identity.</div>	Theory	12	2023-04-18 14:47:12.137381	2023-04-18 14:47:12.137381
13	description	<div>4E cognition theory defines cognition as enactive, embodied, embedded, and extended.</div>	Theory	13	2023-04-18 14:48:50.195164	2023-04-18 14:48:50.195164
14	description	<div>Self-determination theory is a motivation and engagement theory. In this theory, learning is optimal when there is learner agency and autonomy, positive competence beliefs, and interpersonal connections.</div>	Theory	14	2023-04-18 14:50:40.83556	2023-04-18 14:50:40.83556
15	description	<div>Learning requires cognitive dissonance </div>	Assumption	2	2023-04-18 14:51:59.830233	2023-04-18 14:51:59.830233
16	description	<div>schemas are built (making connections) </div>	Assumption	3	2023-04-18 14:52:39.028183	2023-04-18 14:52:39.028183
17	description	<div>Learning is construction of knowledge </div>	Assumption	4	2023-04-18 14:53:12.458452	2023-04-18 14:53:12.458452
18	description	<div>Learning requires scaffolding </div>	Assumption	5	2023-04-18 14:53:45.599219	2023-04-18 14:53:45.599219
19	description	<div>Learning is a generative process </div>	Assumption	6	2023-04-18 14:55:12.751648	2023-04-18 14:55:12.751648
20	description	<div> learning occurs within a zone of proximal development (ZPD) </div>	Assumption	7	2023-04-18 14:55:33.831736	2023-04-18 14:55:33.831736
21	description	<div> learning requires interpretation </div>	Assumption	8	2023-04-18 14:56:36.480348	2023-04-18 14:56:36.480348
22	description	<div> reality is created by joint experiences </div>	Assumption	9	2023-04-18 14:57:29.429491	2023-04-18 14:57:29.429491
23	description	<div> learning is not merely individual </div>	Assumption	10	2023-04-18 14:58:22.348717	2023-04-18 14:58:22.348717
24	description	<div>learning is in action, activity, interaction </div>	Assumption	11	2023-04-18 14:59:07.912717	2023-04-18 14:59:07.912717
25	description	<div>learning is collaborative (in the minds of many) </div>	Assumption	12	2023-04-18 15:00:01.445711	2023-04-18 15:00:01.445711
26	description	<div>Learning requires legitimate peripheral participation in community </div>	Assumption	13	2023-04-18 15:00:28.19612	2023-04-18 15:00:28.19612
30	description	<div> learning requires reading the world </div>	Assumption	17	2023-04-18 15:03:46.022193	2023-04-18 15:03:46.022193
31	description	<div> learning requires embracing constructivism </div>	Assumption	18	2023-04-18 15:04:04.913178	2023-04-18 15:04:04.913178
32	description	<div> learning requires writing and "righting" the world </div>	Assumption	19	2023-04-18 15:04:23.405371	2023-04-18 15:04:23.405371
33	description	<div> learning is changing the world </div>	Assumption	20	2023-04-18 15:04:35.133978	2023-04-18 15:04:35.133978
34	description	<div> learning involves identity change </div>	Assumption	21	2023-04-18 15:05:26.584552	2023-04-18 15:05:26.584552
35	description	<div>learning involves change in beliefs</div>	Assumption	22	2023-04-18 15:06:21.956701	2023-04-18 15:06:21.956701
36	description	<div>Learning involves becoming aware of learning process (metacognition) </div>	Assumption	23	2023-04-18 15:08:15.040422	2023-04-18 15:08:15.040422
37	description	<div> learning requires reflection </div>	Assumption	24	2023-04-18 15:08:50.005826	2023-04-18 15:08:50.005826
38	description	<div>Learning requires developing complex systems-based thinking </div>	Assumption	25	2023-04-18 15:09:40.612925	2023-04-18 15:09:40.612925
39	description	<div>Learning requires identifying and questioning assumptions </div>	Assumption	26	2023-04-18 15:10:34.897295	2023-04-18 15:10:34.897295
40	description	<div> learning is changing problematic frames of reference </div>	Assumption	27	2023-04-18 15:10:59.449622	2023-04-18 15:10:59.449622
41	description	<div> learning requires authentic audience, real-world purpose </div>	Assumption	28	2023-04-18 15:11:31.667495	2023-04-18 15:11:31.667495
42	description	<div> learning requires experimentation, exploration (learner driven) </div>	Assumption	29	2023-04-18 15:12:15.163269	2023-04-18 15:12:15.163269
43	description	<div> learning requires tinkering, productive failure </div>	Assumption	30	2023-04-18 15:12:51.725554	2023-04-18 15:12:51.725554
44	description	<div> learning requires externalization </div>	Assumption	31	2023-04-18 15:13:11.854094	2023-04-18 15:13:11.854094
45	description	<div> learning requires creation of things </div>	Assumption	32	2023-04-18 15:13:32.956552	2023-04-18 15:13:32.956552
46	description	<div> learning requires learner agency </div>	Assumption	33	2023-04-18 15:14:00.074757	2023-04-18 15:14:00.074757
47	description	<div> learning is individual </div>	Assumption	34	2023-04-18 15:14:21.890045	2023-04-18 15:14:21.890045
48	description	<div> learning happens only in the brain </div>	Assumption	35	2023-04-18 15:14:47.883672	2023-04-18 15:14:47.883672
29	description	<div>Learning is social within a group/community because people learn from one another, and the social context in which learning takes place plays a crucial role in shaping individuals' understanding and development.</div>	Assumption	16	2023-04-18 15:03:26.903198	2023-04-18 18:25:17.524753
49	description	<div> listening </div>	Practice	1	2023-04-18 15:15:47.322049	2023-04-18 15:15:47.322049
50	description	<div> reading </div>	Practice	2	2023-04-18 15:15:58.804842	2023-04-18 15:15:58.804842
51	description	<div> watching </div>	Practice	3	2023-04-18 15:16:07.867632	2023-04-18 15:16:07.867632
52	description	<div> knowledge activation activities </div>	Practice	4	2023-04-18 15:16:17.640128	2023-04-18 15:16:17.640128
53	description	<div> concept mapping </div>	Practice	5	2023-04-18 15:16:26.901214	2023-04-18 15:16:26.901214
54	description	<div> case-based learning </div>	Practice	6	2023-04-18 15:16:38.826698	2023-04-18 15:16:38.826698
55	description	<div> individual problem-solving </div>	Practice	7	2023-04-18 15:16:46.508116	2023-04-18 15:16:46.508116
56	description	<div> in-class observation </div>	Practice	8	2023-04-18 15:16:54.082782	2023-04-18 15:16:54.082782
57	description	<div> deliberate practice </div>	Practice	9	2023-04-18 15:17:01.279433	2023-04-18 15:17:01.279433
58	description	<div> using prior knowledge </div>	Practice	10	2023-04-18 15:17:19.783712	2023-04-18 15:17:19.783712
59	description	<div> think pair share </div>	Practice	11	2023-04-18 15:17:28.252594	2023-04-18 15:17:28.252594
60	description	<div> synergy, building on other's ideas </div>	Practice	12	2023-04-18 15:17:36.418825	2023-04-18 15:17:36.418825
61	description	<div> develop interpersonal relationships </div>	Practice	13	2023-04-18 15:17:51.646634	2023-04-18 15:17:51.646634
62	description	<div> reflecting on external knowledge </div>	Practice	14	2023-04-18 15:17:59.042171	2023-04-18 15:17:59.042171
63	description	<div> group simulation activities </div>	Practice	15	2023-04-18 15:18:19.541051	2023-04-18 15:18:19.541051
64	description	<div> joint or shared experiences </div>	Practice	16	2023-04-18 15:18:27.404681	2023-04-18 15:18:27.404681
65	description	<div> (social) group role negotiation </div>	Practice	17	2023-04-18 15:18:35.858012	2023-04-18 15:18:35.858012
66	description	<div> group problem-solving </div>	Practice	18	2023-04-18 15:18:47.443531	2023-04-18 15:18:47.443531
67	description	<div> group discussion </div>	Practice	19	2023-04-18 15:18:55.408565	2023-04-18 15:18:55.408565
68	description	<div> classroom discussion </div>	Practice	20	2023-04-18 15:19:04.501984	2023-04-18 15:19:04.501984
69	description	<div> group work </div>	Practice	21	2023-04-18 15:19:13.216369	2023-04-18 15:19:13.216369
70	description	<div> collaborative learning </div>	Practice	22	2023-04-18 15:19:34.482175	2023-04-18 15:19:34.482175
71	description	<div> peer mentoring </div>	Practice	23	2023-04-18 15:19:48.474764	2023-04-18 15:19:48.474764
72	description	<div> peer-to-peer teaching </div>	Practice	24	2023-04-18 15:19:58.059444	2023-04-18 15:19:58.059444
73	description	<div> job shadowing </div>	Practice	25	2023-04-18 15:20:06.404774	2023-04-18 15:20:06.404774
74	description	<div> community surveying </div>	Practice	26	2023-04-18 15:20:14.558867	2023-04-18 15:20:14.558867
75	description	<div> real-world observation, field trips </div>	Practice	27	2023-04-18 15:20:24.210855	2023-04-18 15:20:24.210855
76	description	<div> interdisciplinary collaborative projects /teams (ie. science and art student together) </div>	Practice	28	2023-04-18 15:22:23.371821	2023-04-18 15:22:23.371821
77	description	<div> equity and inclusion work </div>	Practice	29	2023-04-18 15:22:36.851748	2023-04-18 15:22:36.851748
78	description	<div> interviewing people who are different or have different experiences </div>	Practice	30	2023-04-18 15:22:48.866158	2023-04-18 15:22:48.866158
79	description	<div> identity exploration </div>	Practice	31	2023-04-18 15:22:59.348775	2023-04-18 15:22:59.348775
80	description	<div> debate </div>	Practice	32	2023-04-18 15:23:07.714905	2023-04-18 15:23:07.714905
81	description	<div> ontological questioning </div>	Practice	33	2023-04-18 15:23:22.42511	2023-04-18 15:23:22.42511
82	description	<div> reflection activities </div>	Practice	34	2023-04-18 15:23:36.219924	2023-04-18 15:23:36.219924
83	description	<div> epistemic questioning </div>	Practice	35	2023-04-18 15:23:44.575933	2023-04-18 15:23:44.575933
84	description	<div> framing, reframing </div>	Practice	36	2023-04-18 15:23:53.853091	2023-04-18 15:23:53.853091
85	description	<div> investigate the nature of science </div>	Practice	37	2023-04-18 15:24:05.06827	2023-04-18 15:24:05.06827
86	description	<div> critical review of topic </div>	Practice	38	2023-04-18 15:24:23.3708	2023-04-18 15:24:23.3708
87	description	<div> self-evaluation </div>	Practice	39	2023-04-18 15:24:35.608025	2023-04-18 15:24:35.608025
88	description	<div> challenge assumptions activities </div>	Practice	40	2023-04-18 15:24:56.58867	2023-04-18 15:24:56.58867
89	description	<div> students present research at conferences </div>	Practice	41	2023-04-18 15:25:06.438409	2023-04-18 15:25:06.438409
90	description	<div> community based intervention projects </div>	Practice	42	2023-04-18 15:25:16.74252	2023-04-18 15:25:16.74252
91	description	<div> internships </div>	Practice	43	2023-04-18 15:25:26.222868	2023-04-18 15:25:26.222868
92	description	<div> volunteer work </div>	Practice	44	2023-04-18 15:25:34.901704	2023-04-18 15:25:34.901704
93	description	<div> client based projects (ie. design, ads) </div>	Practice	45	2023-04-18 15:25:49.818337	2023-04-18 15:25:49.818337
94	description	<div> real-world impact work </div>	Practice	46	2023-04-18 15:25:59.351078	2023-04-18 15:25:59.351078
95	description	<div> research projects (student driven) </div>	Practice	47	2023-04-18 15:26:10.58964	2023-04-18 15:26:10.58964
96	description	<div> student choice (research, project, present) </div>	Practice	48	2023-04-18 15:26:19.291141	2023-04-18 15:26:19.291141
97	description	<div> playing games </div>	Practice	49	2023-04-18 15:26:28.510097	2023-04-18 15:26:28.510097
98	description	<div> simulation activities </div>	Practice	50	2023-04-18 15:26:37.904778	2023-04-18 15:26:37.904778
99	description	<div> human centered design </div>	Practice	51	2023-04-18 15:26:51.858988	2023-04-18 15:26:51.858988
100	description	<div> design work, projects </div>	Practice	52	2023-04-18 15:27:00.167042	2023-04-18 15:27:00.167042
101	description	<div> individual projects </div>	Practice	53	2023-04-18 15:27:07.904632	2023-04-18 15:27:07.904632
102	description	<div> co-creation, student-created learning activities </div>	Practice	54	2023-04-18 15:27:19.128271	2023-04-18 15:27:19.128271
103	description	<div> explanation papers </div>	Practice	55	2023-04-18 15:27:44.843487	2023-04-18 15:27:44.843487
104	description	<div> student-created games </div>	Practice	56	2023-04-18 15:27:55.015968	2023-04-18 15:27:55.015968
106	description	<div> making (apps, websites, media, etc)</div>	Practice	58	2023-04-18 15:30:26.505029	2023-04-18 15:30:26.505029
107	description	<div> build models, frameworks </div>	Practice	59	2023-04-18 15:30:35.158751	2023-04-18 15:30:35.158751
108	description	<div> open-ended problem solving </div>	Practice	60	2023-04-18 15:30:43.744503	2023-04-18 15:30:43.744503
109	description	<div> writing </div>	Practice	61	2023-04-18 15:30:57.539536	2023-04-18 15:30:57.539536
110	description	<div> preflection (pre-reflection)</div>	Practice	62	2023-04-18 15:31:31.766013	2023-04-18 15:31:31.766013
112	description	<div> learning requires competence self-efficacy </div>	Assumption	37	2023-04-18 15:32:39.441447	2023-04-18 15:32:39.441447
113	description	<div> learning requires intrinsic motivation </div>	Assumption	38	2023-04-18 15:32:53.727482	2023-04-18 15:32:53.727482
114	description	<div> cognition is embodied </div>	Assumption	39	2023-04-18 15:33:11.903776	2023-04-18 15:33:11.903776
115	description	<div> cognition is enactive </div>	Assumption	40	2023-04-18 15:33:22.774941	2023-04-18 15:33:22.774941
116	description	<div> cognition is embedded </div>	Assumption	41	2023-04-18 15:33:46.59644	2023-04-18 15:33:46.59644
117	description	<div> cognition is extended </div>	Assumption	42	2023-04-18 15:33:56.327065	2023-04-18 15:33:56.327065
118	description	<div> identity is emergent from a complex system </div>	Assumption	43	2023-04-18 15:34:14.263384	2023-04-18 15:34:14.263384
119	description	<div> identity involves purposes and goals </div>	Assumption	44	2023-04-18 15:34:26.615148	2023-04-18 15:34:26.615148
120	description	<div> identity is socially situated </div>	Assumption	45	2023-04-18 15:34:49.33334	2023-04-18 15:34:49.33334
121	description	<div> identity involves perceived action possibilities </div>	Assumption	46	2023-04-18 15:35:03.947985	2023-04-18 15:35:03.947985
122	description	<div> identity is situated in domain </div>	Assumption	47	2023-04-18 15:35:18.89585	2023-04-18 15:35:18.89585
123	description	<div> identity involves ontological and epistemological beliefs </div>	Assumption	48	2023-04-18 15:35:42.3187	2023-04-18 15:35:42.3187
124	description	<div> identity involves emotion </div>	Assumption	49	2023-04-18 15:35:53.029854	2023-04-18 15:35:53.029854
125	description	<div> identity depends on dispositions </div>	Assumption	50	2023-04-18 15:36:07.501385	2023-04-18 15:36:07.501385
126	description	<div> identity is situated in culture </div>	Assumption	51	2023-04-18 15:36:23.25168	2023-04-18 15:36:23.25168
127	description	<div> identity involves self-perceptions &amp; definitions </div>	Assumption	52	2023-04-18 15:36:36.319813	2023-04-18 15:36:36.319813
128	description	<div> learning is a change in an activity system </div>	Assumption	53	2023-04-18 15:36:58.270795	2023-04-18 15:36:58.270795
129	description	<div> learning happens when there is tension between elements of an activity system </div>	Assumption	54	2023-04-18 15:37:13.332935	2023-04-18 15:37:13.332935
130	description	<div> learning is mediated by tools, community, roles, rules, and objectives </div>	Assumption	55	2023-04-18 15:37:52.147185	2023-04-18 15:37:52.147185
131	description	<div>(teacher) just-in-time mini-lectures</div>	Practice	63	2023-04-18 15:39:42.487534	2023-04-18 15:39:42.487534
132	description	<div>(teacher) scaffolding</div>	Practice	64	2023-04-18 15:40:03.29064	2023-04-18 15:40:03.29064
133	description	<div>(teacher) mentoring learners</div>	Practice	65	2023-04-18 15:40:33.696568	2023-04-18 15:40:33.696568
134	description	<div>(teacher) build community</div>	Practice	66	2023-04-18 15:40:53.04283	2023-04-18 15:40:53.04283
135	description	<div>(teacher) encourage team facilitation roles (collaborative learning)</div>	Practice	67	2023-04-18 15:41:13.325658	2023-04-18 15:41:13.325658
136	description	<div>(teacher) discourage task roles (cooperative learning)</div>	Practice	68	2023-04-18 15:41:26.139858	2023-04-18 15:41:26.139858
137	description	<div>(teacher) design for interdependence</div>	Practice	69	2023-04-18 15:41:41.185732	2023-04-18 15:41:41.185732
138	description	<div>(teacher) design for inter-disciplinary learning (integrative)</div>	Practice	70	2023-04-18 15:41:56.788811	2023-04-18 15:41:56.788811
139	description	<div>(teacher) facilitate equity and inclusion skill development</div>	Practice	71	2023-04-18 15:42:11.147315	2023-04-18 15:42:11.147315
140	description	<div>(teacher) design for  experiences in local community (service learning)</div>	Practice	72	2023-04-18 15:42:45.582123	2023-04-18 15:42:45.582123
141	description	<div>(teacher) provide face-to-face dialogue with diverse groups ("others") on campus &amp; in community (social justice, concientizacion)</div>	Practice	73	2023-04-18 15:43:27.897731	2023-04-18 15:43:27.897731
142	description	<div>(teacher) challenge entrenched ideological values to more pluralistic worldview(s)</div>	Practice	74	2023-04-18 15:43:58.809055	2023-04-18 15:43:58.809055
143	description	<div> (teacher) meet students "who" and "where" they are</div>	Practice	75	2023-04-18 15:44:16.14583	2023-04-18 15:44:16.14583
144	description	<div>(teacher) educators challenging own assumptions</div>	Practice	76	2023-04-18 15:44:39.650901	2023-04-18 15:44:39.650901
145	description	<div>(teacher) model metacognition</div>	Practice	77	2023-04-18 15:44:56.256958	2023-04-18 15:44:56.256958
146	description	<div>(teacher) timely and effective feedback</div>	Practice	78	2023-04-18 15:45:23.652919	2023-04-18 15:45:23.652919
147	description	<div>(teacher) design for deep-dive learning</div>	Practice	79	2023-04-18 15:45:38.525017	2023-04-18 15:45:38.525017
148	description	<div>(teacher) move students from abstract to concrete (not concrete to abstract)</div>	Practice	80	2023-04-18 15:46:16.658568	2023-04-18 15:46:16.658568
149	description	<div>(teacher) design learning environments (not just activities)</div>	Practice	81	2023-04-18 15:46:42.191295	2023-04-18 15:46:42.191295
150	description	<div>(teacher) focus on process, not product</div>	Practice	82	2023-04-18 15:46:56.16845	2023-04-18 15:46:56.16845
151	description	<div>(teacher) facilitate embodied cognition</div>	Practice	83	2023-04-18 15:47:09.16586	2023-04-18 15:47:09.16586
152	description	<div>(teacher) discourage efficiency and effectiveness</div>	Practice	84	2023-04-18 15:47:25.542771	2023-04-18 15:47:25.542771
153	description	<div>(teacher) plan celebrations of failure</div>	Practice	85	2023-04-18 15:47:40.83813	2023-04-18 15:47:40.83813
154	description	<div>(teacher) design for tinkering</div>	Practice	86	2023-04-18 15:47:54.215535	2023-04-18 15:47:54.215535
155	description	<div>(teacher) sharing agency &amp; authority with students</div>	Practice	87	2023-04-18 15:48:07.507183	2023-04-18 15:48:07.507183
156	description	<div>(teacher) encourage exploration</div>	Practice	88	2023-04-18 15:48:21.404573	2023-04-18 15:48:21.404573
157	description	<div>(teacher) design for interest-based learning</div>	Practice	89	2023-04-18 15:48:34.286797	2023-04-18 15:48:34.286797
158	description	<div>(teacher) modeling, demonstrating</div>	Practice	90	2023-04-18 15:48:57.120627	2023-04-18 15:48:57.120627
159	description	<div>(teacher) discussion of concept map, teasing out connections</div>	Practice	91	2023-04-18 15:49:10.323767	2023-04-18 15:49:10.323767
111	description	<div>The quality of our relationships with others can impact our ability to learn, and we are more likely to learn when we feel a sense of connection and belonging with others.</div>	Assumption	36	2023-04-18 15:32:25.125433	2023-04-18 18:57:20.626708
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2023-04-06 20:34:10.91733	2023-04-06 20:34:10.91733
\.


--
-- Data for Name: assumptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assumptions (id, name, description, created_at, updated_at) FROM stdin;
2	learning requires cognitive dissonance	\N	2023-04-18 14:51:59.825906	2023-04-18 14:51:59.831111
3	schemas are built	\N	2023-04-18 14:52:39.025209	2023-04-18 14:52:39.029118
4	learning is construction of knowledge	\N	2023-04-18 14:53:12.454065	2023-04-18 14:53:12.459451
5	learning requires scaffolding	\N	2023-04-18 14:53:45.595535	2023-04-18 14:53:45.600175
6	learning is a generative process	\N	2023-04-18 14:55:12.747872	2023-04-18 14:55:12.7526
7	learning occurs within a zone of proximal development (ZPD)	\N	2023-04-18 14:55:33.828529	2023-04-18 14:55:33.832665
8	learning requires  interpretation	\N	2023-04-18 14:56:36.476337	2023-04-18 14:56:36.481339
9	reality is created by joint experiences	\N	2023-04-18 14:57:29.42644	2023-04-18 14:57:29.430401
10	learning is not merely individual	\N	2023-04-18 14:58:22.345038	2023-04-18 14:58:22.349955
11	learning is in action, activity, interaction	\N	2023-04-18 14:59:07.907782	2023-04-18 14:59:07.913652
12	learning is collaborative (in the minds of many)	\N	2023-04-18 15:00:01.440784	2023-04-18 15:00:01.447005
13	learning requires legitimate peripheral participation in community	\N	2023-04-18 15:00:28.192911	2023-04-18 15:00:28.197049
14	learning involves socialization	\N	2023-04-18 15:01:47.145802	2023-04-18 15:01:47.151193
15	community is both context and driver of learning	\N	2023-04-18 15:02:17.108181	2023-04-18 15:02:17.112047
17	learning requires reading the world	\N	2023-04-18 15:03:46.01898	2023-04-18 15:03:46.023176
18	learning requires embracing constructivism	\N	2023-04-18 15:04:04.910174	2023-04-18 15:04:04.91417
19	learning requires writing and "righting" the world	\N	2023-04-18 15:04:23.402359	2023-04-18 15:04:23.406317
20	learning is changing the world	\N	2023-04-18 15:04:35.130983	2023-04-18 15:04:35.134878
21	learning involves identity change	\N	2023-04-18 15:05:26.580058	2023-04-18 15:05:26.585493
22	learning involves change in beliefs	\N	2023-04-18 15:06:21.952638	2023-04-18 15:06:21.957593
23	learning involves becoming aware of learning process (metacognition)	\N	2023-04-18 15:08:15.034914	2023-04-18 15:08:15.041404
24	learning requires reflection	\N	2023-04-18 15:08:50.002175	2023-04-18 15:08:50.006774
25	learning requires developing complex systems-based thinking	\N	2023-04-18 15:09:40.609801	2023-04-18 15:09:40.613826
26	learning requires identifying and questioning assumptions	\N	2023-04-18 15:10:34.893725	2023-04-18 15:10:34.898229
27	learning is changing problematic frames of reference	\N	2023-04-18 15:10:59.445781	2023-04-18 15:10:59.450616
28	learning requires authentic audience, real-world purpose	\N	2023-04-18 15:11:31.66365	2023-04-18 15:11:31.66846
29	learning requires experimentation, exploration (learner driven)	\N	2023-04-18 15:12:15.15957	2023-04-18 15:12:15.164178
30	learning requires tinkering, productive failure	\N	2023-04-18 15:12:51.721517	2023-04-18 15:12:51.726491
31	learning requires externalization	\N	2023-04-18 15:13:11.851046	2023-04-18 15:13:11.855276
32	learning requires creation of things	\N	2023-04-18 15:13:32.953164	2023-04-18 15:13:32.957505
33	learning requires learner agency	\N	2023-04-18 15:14:00.070319	2023-04-18 15:14:00.075719
34	learning is individual	\N	2023-04-18 15:14:21.886999	2023-04-18 15:14:21.89097
35	learning happens only in the brain	\N	2023-04-18 15:14:47.880296	2023-04-18 15:14:47.884548
37	learning requires competence self-efficacy	\N	2023-04-18 15:32:39.438301	2023-04-18 15:32:39.442373
38	learning requires intrinsic motivation	\N	2023-04-18 15:32:53.724109	2023-04-18 15:32:53.728513
39	cognition is embodied	\N	2023-04-18 15:33:11.9006	2023-04-18 15:33:11.904812
40	cognition is enactive	\N	2023-04-18 15:33:22.772358	2023-04-18 15:33:22.775895
41	cognition is embedded	\N	2023-04-18 15:33:46.593423	2023-04-18 15:33:46.597343
42	cognition is extended	\N	2023-04-18 15:33:56.324534	2023-04-18 15:33:56.328026
43	identity is emergent from a complex system	\N	2023-04-18 15:34:14.260285	2023-04-18 15:34:14.264319
44	identity involves purposes and goals	\N	2023-04-18 15:34:26.61171	2023-04-18 15:34:26.616255
45	identity is socially situated	\N	2023-04-18 15:34:49.329865	2023-04-18 15:34:49.334368
46	identity involves perceived action possibilities	\N	2023-04-18 15:35:03.944768	2023-04-18 15:35:03.948926
47	identity is situated in domain	\N	2023-04-18 15:35:18.892238	2023-04-18 15:35:18.896774
48	identity involves ontological and epistemological beliefs	\N	2023-04-18 15:35:42.315501	2023-04-18 15:35:42.319632
49	identity involves emotion	\N	2023-04-18 15:35:53.026566	2023-04-18 15:35:53.030799
50	identity depends on dispositions	\N	2023-04-18 15:36:07.498216	2023-04-18 15:36:07.502334
51	identity is situated in culture	\N	2023-04-18 15:36:23.248591	2023-04-18 15:36:23.252574
52	identity involves self-perceptions & definitions	\N	2023-04-18 15:36:36.316812	2023-04-18 15:36:36.32071
53	learning is a change in an activity system	\N	2023-04-18 15:36:58.267817	2023-04-18 15:36:58.271724
54	learning happens when there is tension between elements of an activity system	\N	2023-04-18 15:37:13.330048	2023-04-18 15:37:13.33384
55	learning is mediated by tools, community, roles, rules, and objectives	\N	2023-04-18 15:37:52.144131	2023-04-18 15:37:52.148148
16	learning is social (within a group/community)	\N	2023-04-18 15:03:26.898714	2023-04-18 18:25:17.531435
36	learning requires relatedness (human relations)	\N	2023-04-18 15:32:25.122452	2023-04-18 18:57:20.632678
\.


--
-- Data for Name: assumptions_practices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assumptions_practices (assumption_id, practice_id) FROM stdin;
15	22
15	26
16	12
16	13
16	15
16	16
16	17
16	18
16	22
16	68
16	66
16	69
16	70
36	12
36	13
36	16
36	18
36	22
36	66
36	67
\.


--
-- Data for Name: assumptions_theories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assumptions_theories (assumption_id, theory_id) FROM stdin;
2	5
3	5
4	5
4	6
4	10
5	5
5	6
6	6
6	10
7	6
8	6
8	8
8	9
9	6
10	6
10	11
11	6
11	10
11	11
11	13
12	6
12	7
13	7
14	6
14	7
14	11
15	7
16	6
16	7
16	11
17	8
18	8
19	8
20	8
21	7
21	9
21	12
22	8
22	9
22	12
23	5
23	6
23	10
23	8
23	9
24	8
24	9
25	9
26	8
26	9
27	8
27	9
28	10
28	8
29	5
29	10
30	5
30	10
31	10
32	10
33	10
33	8
33	14
34	5
35	5
36	14
37	14
38	14
39	13
40	13
41	13
43	12
44	12
45	7
45	12
46	12
47	7
47	12
48	12
49	12
50	12
51	12
52	12
53	11
54	11
55	11
\.


--
-- Data for Name: practices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.practices (id, name, description, created_at, updated_at) FROM stdin;
1	listening	\N	2023-04-18 15:15:47.318385	2023-04-18 15:15:47.32387
2	reading	\N	2023-04-18 15:15:58.802227	2023-04-18 15:15:58.805828
3	watching	\N	2023-04-18 15:16:07.864965	2023-04-18 15:16:07.868585
4	knowledge activation activities	\N	2023-04-18 15:16:17.637532	2023-04-18 15:16:17.641048
5	concept mapping	\N	2023-04-18 15:16:26.898734	2023-04-18 15:16:26.902445
6	case-based learning	\N	2023-04-18 15:16:38.823976	2023-04-18 15:16:38.827699
7	individual problem-solving	\N	2023-04-18 15:16:46.505555	2023-04-18 15:16:46.509102
8	in-class observation	\N	2023-04-18 15:16:54.080123	2023-04-18 15:16:54.083779
9	deliberate practice	\N	2023-04-18 15:17:01.276576	2023-04-18 15:17:01.280394
10	using prior knowledge	\N	2023-04-18 15:17:19.780783	2023-04-18 15:17:19.784653
11	think pair share	\N	2023-04-18 15:17:28.249627	2023-04-18 15:17:28.253548
12	synergy, building on other's ideas	\N	2023-04-18 15:17:36.416005	2023-04-18 15:17:36.419786
13	develop interpersonal relationships	\N	2023-04-18 15:17:51.64402	2023-04-18 15:17:51.647614
14	reflecting on external knowledge	\N	2023-04-18 15:17:59.039511	2023-04-18 15:17:59.043097
15	group simulation activities	\N	2023-04-18 15:18:19.538411	2023-04-18 15:18:19.542078
16	joint or shared experiences	\N	2023-04-18 15:18:27.402094	2023-04-18 15:18:27.40563
17	(social) group role negotiation	\N	2023-04-18 15:18:35.855138	2023-04-18 15:18:35.858978
18	group problem-solving	\N	2023-04-18 15:18:47.441024	2023-04-18 15:18:47.444536
19	group discussion	\N	2023-04-18 15:18:55.40604	2023-04-18 15:18:55.409527
20	classroom discussion	\N	2023-04-18 15:19:04.499156	2023-04-18 15:19:04.502954
21	group work	\N	2023-04-18 15:19:13.213357	2023-04-18 15:19:13.217343
22	collaborative learning	\N	2023-04-18 15:19:34.479349	2023-04-18 15:19:34.483151
23	peer mentoring	\N	2023-04-18 15:19:48.471904	2023-04-18 15:19:48.475739
24	peer-to-peer teaching	\N	2023-04-18 15:19:58.056917	2023-04-18 15:19:58.060405
25	job shadowing	\N	2023-04-18 15:20:06.402258	2023-04-18 15:20:06.40573
26	community surveying	\N	2023-04-18 15:20:14.556053	2023-04-18 15:20:14.559831
27	real-world observation, field trips	\N	2023-04-18 15:20:24.20814	2023-04-18 15:20:24.211769
28	interdisciplinary collaborative projects	\N	2023-04-18 15:22:23.368584	2023-04-18 15:22:23.372777
29	equity and inclusion work	\N	2023-04-18 15:22:36.849163	2023-04-18 15:22:36.852693
30	interviewing people who are different or have different experiences	\N	2023-04-18 15:22:48.863193	2023-04-18 15:22:48.867153
31	identity exploration	\N	2023-04-18 15:22:59.346103	2023-04-18 15:22:59.349813
32	debate	\N	2023-04-18 15:23:07.712298	2023-04-18 15:23:07.716194
33	ontological questioning	\N	2023-04-18 15:23:22.422535	2023-04-18 15:23:22.426068
34	reflection activities	\N	2023-04-18 15:23:36.217192	2023-04-18 15:23:36.220873
35	epistemic questioning	\N	2023-04-18 15:23:44.573294	2023-04-18 15:23:44.577174
36	framing, reframing	\N	2023-04-18 15:23:53.850403	2023-04-18 15:23:53.854166
37	investigate the nature of science	\N	2023-04-18 15:24:05.065353	2023-04-18 15:24:05.069232
38	critical review of topic	\N	2023-04-18 15:24:23.367837	2023-04-18 15:24:23.371793
39	self-evaluation	\N	2023-04-18 15:24:35.60534	2023-04-18 15:24:35.609315
40	challenging assumptions	\N	2023-04-18 15:24:56.586004	2023-04-18 15:24:56.589674
41	students present research at conferences	\N	2023-04-18 15:25:06.435794	2023-04-18 15:25:06.439391
42	community based intervention projects	\N	2023-04-18 15:25:16.739772	2023-04-18 15:25:16.743427
43	internships	\N	2023-04-18 15:25:26.220017	2023-04-18 15:25:26.223828
44	volunteer work	\N	2023-04-18 15:25:34.898423	2023-04-18 15:25:34.902699
45	client based projects	\N	2023-04-18 15:25:49.815325	2023-04-18 15:25:49.819294
46	real-world impact work	\N	2023-04-18 15:25:59.34817	2023-04-18 15:25:59.352049
47	research projects (student driven)	\N	2023-04-18 15:26:10.586662	2023-04-18 15:26:10.590646
48	student choice (research, project, present)	\N	2023-04-18 15:26:19.288398	2023-04-18 15:26:19.292099
49	playing games	\N	2023-04-18 15:26:28.507186	2023-04-18 15:26:28.511015
50	simulation activities	\N	2023-04-18 15:26:37.901973	2023-04-18 15:26:37.905726
51	human centered design	\N	2023-04-18 15:26:51.856408	2023-04-18 15:26:51.859873
52	design work, projects	\N	2023-04-18 15:27:00.164383	2023-04-18 15:27:00.168155
53	individual projects	\N	2023-04-18 15:27:07.902103	2023-04-18 15:27:07.905596
54	co-creation, student-created learning activities	\N	2023-04-18 15:27:19.125566	2023-04-18 15:27:19.129252
55	explanation papers	\N	2023-04-18 15:27:44.840455	2023-04-18 15:27:44.844427
56	student-created games	\N	2023-04-18 15:27:55.013046	2023-04-18 15:27:55.017166
68	(teacher) discourage task roles (cooperative learning)	\N	2023-04-18 15:41:26.13728	2023-04-18 15:41:26.141142
58	making	\N	2023-04-18 15:30:26.502174	2023-04-18 15:30:26.506039
59	build models, frameworks	\N	2023-04-18 15:30:35.156233	2023-04-18 15:30:35.159663
60	open-ended problem solving	\N	2023-04-18 15:30:43.74205	2023-04-18 15:30:43.745419
61	writing	\N	2023-04-18 15:30:57.536972	2023-04-18 15:30:57.540835
62	preflection	\N	2023-04-18 15:31:31.763151	2023-04-18 15:31:31.767063
63	(teacher) just-in-time mini-lectures	\N	2023-04-18 15:39:42.484494	2023-04-18 15:39:42.488937
64	(teacher) scaffolding	\N	2023-04-18 15:40:03.287895	2023-04-18 15:40:03.291577
65	(teacher) mentoring learners	\N	2023-04-18 15:40:33.693645	2023-04-18 15:40:33.697563
66	(teacher) build community	\N	2023-04-18 15:40:53.040208	2023-04-18 15:40:53.044026
67	(teacher) encourage team facilitation roles (collaborative learning)	\N	2023-04-18 15:41:13.320414	2023-04-18 15:41:13.32666
69	(teacher) design for interdependence	\N	2023-04-18 15:41:41.183184	2023-04-18 15:41:41.186692
70	(teacher) design for inter-disciplinary learning (integrative)	\N	2023-04-18 15:41:56.785955	2023-04-18 15:41:56.789802
71	(teacher) facilitate equity and inclusion skill development	\N	2023-04-18 15:42:11.144512	2023-04-18 15:42:11.148248
72	(teacher) design for  experiences in local community (service learning)	\N	2023-04-18 15:42:45.579419	2023-04-18 15:42:45.583217
73	(teacher) provide face-to-face dialogue with diverse groups	\N	2023-04-18 15:43:27.894723	2023-04-18 15:43:27.898714
74	(teacher) challenge entrenched ideological values	\N	2023-04-18 15:43:58.806017	2023-04-18 15:43:58.809956
75	(teacher) meet students "who" and "where" they are	\N	2023-04-18 15:44:16.140405	2023-04-18 15:44:16.146818
76	(teacher) educators challenging own assumptions	\N	2023-04-18 15:44:39.648253	2023-04-18 15:44:39.652109
77	(teacher) model metacognition	\N	2023-04-18 15:44:56.254379	2023-04-18 15:44:56.25793
78	(teacher) timely and effective feedback	\N	2023-04-18 15:45:23.650328	2023-04-18 15:45:23.653889
79	(teacher) design for deep-dive learning	\N	2023-04-18 15:45:38.522441	2023-04-18 15:45:38.526544
80	(teacher) move students from abstract to concrete	\N	2023-04-18 15:46:16.655536	2023-04-18 15:46:16.659553
81	(teacher) design learning environments (not just activities)	\N	2023-04-18 15:46:42.188625	2023-04-18 15:46:42.19267
82	(teacher) focus on process, not product	\N	2023-04-18 15:46:56.165921	2023-04-18 15:46:56.169373
83	(teacher) facilitate embodied cognition	\N	2023-04-18 15:47:09.163236	2023-04-18 15:47:09.166757
84	(teacher) discourage efficiency and effectiveness	\N	2023-04-18 15:47:25.540185	2023-04-18 15:47:25.543718
85	(teacher) plan celebrations of failure	\N	2023-04-18 15:47:40.835636	2023-04-18 15:47:40.839042
86	(teacher) design for tinkering	\N	2023-04-18 15:47:54.195436	2023-04-18 15:47:54.216827
87	(teacher) sharing agency & authority with students	\N	2023-04-18 15:48:07.504596	2023-04-18 15:48:07.508152
88	(teacher) encourage exploration	\N	2023-04-18 15:48:21.402092	2023-04-18 15:48:21.405479
89	(teacher) design for interest-based learning	\N	2023-04-18 15:48:34.284314	2023-04-18 15:48:34.287703
90	(teacher) modeling, demonstrating	\N	2023-04-18 15:48:57.118019	2023-04-18 15:48:57.121548
91	(teacher) discussion of concept map, teasing out connections	\N	2023-04-18 15:49:10.321195	2023-04-18 15:49:10.325321
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20230219202020
20230403235351
20230403235352
\.


--
-- Data for Name: theories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.theories (id, name, description, created_at, updated_at) FROM stdin;
5	Cognitive Constructivist Theory (learning)	\N	2023-04-18 14:34:10.518783	2023-04-18 14:42:08.397054
6	Social Constructivist Theory (learning)	\N	2023-04-18 14:35:05.678526	2023-04-18 14:42:40.845946
7	Situated Learning Theory (learning)	\N	2023-04-18 14:36:09.3646	2023-04-18 14:42:59.106149
10	Constructionist Theory (learning)	\N	2023-04-18 14:39:22.113984	2023-04-18 14:43:13.106394
8	Critical Pedagogy (learning)	\N	2023-04-18 14:37:44.530236	2023-04-18 14:43:28.557597
9	Transformative Learning Theory (learning)	\N	2023-04-18 14:38:28.344623	2023-04-18 14:43:41.591462
11	Cultural-Historical Activity Theory (learning)	\N	2023-04-18 14:44:55.259477	2023-04-18 14:44:55.263512
12	Dynamic Systems Model of Role Identity (identity)	\N	2023-04-18 14:47:12.134957	2023-04-18 14:47:12.13841
13	4E Cognition Theory (cognition)	\N	2023-04-18 14:48:50.192638	2023-04-18 14:48:50.196405
14	Self-Determination Theory (motivation)	\N	2023-04-18 14:50:40.832561	2023-04-18 14:50:40.836582
\.


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 159, true);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 2, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 2, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, true);


--
-- Name: assumptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assumptions_id_seq', 55, true);


--
-- Name: practices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.practices_id_seq', 91, true);


--
-- Name: theories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.theories_id_seq', 14, true);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: assumptions assumptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assumptions
    ADD CONSTRAINT assumptions_pkey PRIMARY KEY (id);


--
-- Name: practices practices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.practices
    ADD CONSTRAINT practices_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: theories theories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theories
    ADD CONSTRAINT theories_pkey PRIMARY KEY (id);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_assumptions_practices_on_assumption_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_assumptions_practices_on_assumption_id ON public.assumptions_practices USING btree (assumption_id);


--
-- Name: index_assumptions_practices_on_practice_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_assumptions_practices_on_practice_id ON public.assumptions_practices USING btree (practice_id);


--
-- Name: index_assumptions_theories_on_assumption_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_assumptions_theories_on_assumption_id ON public.assumptions_theories USING btree (assumption_id);


--
-- Name: index_assumptions_theories_on_theory_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_assumptions_theories_on_theory_id ON public.assumptions_theories USING btree (theory_id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

