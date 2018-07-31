--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.13
-- Dumped by pg_dump version 9.5.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Manager_al_testnode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Manager_al_testnode" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    sib_order integer NOT NULL,
    parent_id integer,
    CONSTRAINT "Manager_al_testnode_sib_order_check" CHECK ((sib_order >= 0))
);


ALTER TABLE public."Manager_al_testnode" OWNER TO postgres;

--
-- Name: Manager_al_testnode_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Manager_al_testnode_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Manager_al_testnode_id_seq" OWNER TO postgres;

--
-- Name: Manager_al_testnode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Manager_al_testnode_id_seq" OWNED BY public."Manager_al_testnode".id;


--
-- Name: Manager_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Manager_client" (
    id integer NOT NULL,
    schema_name character varying(63) NOT NULL,
    name character varying(100) NOT NULL,
    paid_until date NOT NULL,
    on_trial boolean NOT NULL,
    created_on date NOT NULL
);


ALTER TABLE public."Manager_client" OWNER TO postgres;

--
-- Name: Manager_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Manager_client_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Manager_client_id_seq" OWNER TO postgres;

--
-- Name: Manager_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Manager_client_id_seq" OWNED BY public."Manager_client".id;


--
-- Name: Manager_domain; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Manager_domain" (
    id integer NOT NULL,
    domain character varying(253) NOT NULL,
    is_primary boolean NOT NULL,
    tenant_id integer NOT NULL
);


ALTER TABLE public."Manager_domain" OWNER TO postgres;

--
-- Name: Manager_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Manager_domain_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Manager_domain_id_seq" OWNER TO postgres;

--
-- Name: Manager_domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Manager_domain_id_seq" OWNED BY public."Manager_domain".id;


--
-- Name: Manager_userbase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Manager_userbase" (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    birthday date,
    avatar character varying(100),
    avatar_url character varying(200),
    opt character varying(255),
    is_email_verified boolean NOT NULL,
    fb_uid character varying(200),
    fb_access_token character varying(1000)
);


ALTER TABLE public."Manager_userbase" OWNER TO postgres;

--
-- Name: Manager_userbase_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Manager_userbase_groups" (
    id integer NOT NULL,
    userbase_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public."Manager_userbase_groups" OWNER TO postgres;

--
-- Name: Manager_userbase_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Manager_userbase_groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Manager_userbase_groups_id_seq" OWNER TO postgres;

--
-- Name: Manager_userbase_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Manager_userbase_groups_id_seq" OWNED BY public."Manager_userbase_groups".id;


--
-- Name: Manager_userbase_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Manager_userbase_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Manager_userbase_id_seq" OWNER TO postgres;

--
-- Name: Manager_userbase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Manager_userbase_id_seq" OWNED BY public."Manager_userbase".id;


--
-- Name: Manager_userbase_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Manager_userbase_user_permissions" (
    id integer NOT NULL,
    userbase_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public."Manager_userbase_user_permissions" OWNER TO postgres;

--
-- Name: Manager_userbase_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Manager_userbase_user_permissions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Manager_userbase_user_permissions_id_seq" OWNER TO postgres;

--
-- Name: Manager_userbase_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Manager_userbase_user_permissions_id_seq" OWNED BY public."Manager_userbase_user_permissions".id;


--
-- Name: Manager_userlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Manager_userlog" (
    id integer NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public."Manager_userlog" OWNER TO postgres;

--
-- Name: Manager_userlog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Manager_userlog_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Manager_userlog_id_seq" OWNER TO postgres;

--
-- Name: Manager_userlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Manager_userlog_id_seq" OWNED BY public."Manager_userlog".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_al_testnode" ALTER COLUMN id SET DEFAULT nextval('public."Manager_al_testnode_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_client" ALTER COLUMN id SET DEFAULT nextval('public."Manager_client_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_domain" ALTER COLUMN id SET DEFAULT nextval('public."Manager_domain_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userbase" ALTER COLUMN id SET DEFAULT nextval('public."Manager_userbase_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userbase_groups" ALTER COLUMN id SET DEFAULT nextval('public."Manager_userbase_groups_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userbase_user_permissions" ALTER COLUMN id SET DEFAULT nextval('public."Manager_userbase_user_permissions_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userlog" ALTER COLUMN id SET DEFAULT nextval('public."Manager_userlog_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: Manager_al_testnode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Manager_al_testnode" (id, name, sib_order, parent_id) FROM stdin;
3	N3	1	\N
4	N4	2	\N
8	pacificsoftdevld	3	4
5	N9	4	\N
1	N1	5	5
2	N2	6	\N
6	N7	7	\N
7	N5	8	\N
\.


--
-- Name: Manager_al_testnode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Manager_al_testnode_id_seq"', 8, true);


--
-- Data for Name: Manager_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Manager_client" (id, schema_name, name, paid_until, on_trial, created_on) FROM stdin;
1	public	Schemas Inc	2016-12-05	f	2018-07-26
2	tenant1	ninh le	2018-12-05	t	2018-07-26
\.


--
-- Name: Manager_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Manager_client_id_seq"', 3, true);


--
-- Data for Name: Manager_domain; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Manager_domain" (id, domain, is_primary, tenant_id) FROM stdin;
4	localhost	t	1
6	127.0.0.1	t	2
\.


--
-- Name: Manager_domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Manager_domain_id_seq"', 8, true);


--
-- Data for Name: Manager_userbase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Manager_userbase" (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email, birthday, avatar, avatar_url, opt, is_email_verified, fb_uid, fb_access_token) FROM stdin;
1	pbkdf2_sha256$100000$g0BJ8LIC6W7Y$0lsYL+u20se+iyebE0Rkj8cNhCcG7H+nVZDSvwWHHKo=	2018-07-31 14:02:23.465175+07	t	ninhle			t	t	2018-07-28 00:26:12.003366+07	n@gmail.om	\N		\N	\N	f	\N	\N
\.


--
-- Data for Name: Manager_userbase_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Manager_userbase_groups" (id, userbase_id, group_id) FROM stdin;
\.


--
-- Name: Manager_userbase_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Manager_userbase_groups_id_seq"', 1, false);


--
-- Name: Manager_userbase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Manager_userbase_id_seq"', 1, true);


--
-- Data for Name: Manager_userbase_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Manager_userbase_user_permissions" (id, userbase_id, permission_id) FROM stdin;
\.


--
-- Name: Manager_userbase_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Manager_userbase_user_permissions_id_seq"', 1, false);


--
-- Data for Name: Manager_userlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Manager_userlog" (id, creation_date, user_id) FROM stdin;
\.


--
-- Name: Manager_userlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Manager_userlog_id_seq"', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add a l_ test node	1	add_al_testnode
2	Can change a l_ test node	1	change_al_testnode
3	Can delete a l_ test node	1	delete_al_testnode
4	Can add domain	2	add_domain
5	Can change domain	2	change_domain
6	Can delete domain	2	delete_domain
7	Can add user log	3	add_userlog
8	Can change user log	3	change_userlog
9	Can delete user log	3	delete_userlog
10	Can add client	4	add_client
11	Can change client	4	change_client
12	Can delete client	4	delete_client
13	Can add user	5	add_userbase
14	Can change user	5	change_userbase
15	Can delete user	5	delete_userbase
16	Can add log entry	6	add_logentry
17	Can change log entry	6	change_logentry
18	Can delete log entry	6	delete_logentry
19	Can add permission	7	add_permission
20	Can change permission	7	change_permission
21	Can delete permission	7	delete_permission
22	Can add group	8	add_group
23	Can change group	8	change_group
24	Can delete group	8	delete_group
25	Can add content type	9	add_contenttype
26	Can change content type	9	change_contenttype
27	Can delete content type	9	delete_contenttype
28	Can add session	10	add_session
29	Can change session	10	change_session
30	Can delete session	10	delete_session
31	Can add Token	11	add_token
32	Can change Token	11	change_token
33	Can delete Token	11	delete_token
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 33, true);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
dfd80a910c43046a175ae858fb79c675ed9d0e03	2018-07-28 00:26:12.183769+07	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-07-28 00:27:03.203028+07	1	N1	1	[{"added": {}}]	1	1
2	2018-07-28 00:27:16.111583+07	2	N2	1	[{"added": {}}]	1	1
3	2018-07-28 00:27:25.588858+07	3	N3	1	[{"added": {}}]	1	1
4	2018-07-28 00:27:38.983011+07	4	N4	1	[{"added": {}}]	1	1
5	2018-07-28 00:34:09.190242+07	1	N1	2	[{"changed": {"fields": ["_ref_node_id"]}}]	1	1
6	2018-07-28 14:17:27.311122+07	1	N1	2	[{"changed": {"fields": ["name"]}}]	1	1
7	2018-07-28 14:17:52.633709+07	5	N9	1	[{"added": {}}]	1	1
8	2018-07-28 14:18:57.467505+07	6	N7	1	[{"added": {}}]	1	1
9	2018-07-28 14:51:33.288158+07	1	N1	2	[{"changed": {"fields": ["_position", "_ref_node_id"]}}]	1	1
10	2018-07-28 14:53:06.344457+07	7	N5	1	[{"added": {}}]	1	1
11	2018-07-31 14:08:10.112385+07	8	pacificsoftdevld	1	[{"added": {}}]	1	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 11, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	Manager	al_testnode
2	Manager	domain
3	Manager	userlog
4	Manager	client
5	Manager	userbase
6	admin	logentry
7	auth	permission
8	auth	group
9	contenttypes	contenttype
10	sessions	session
11	authtoken	token
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-07-28 00:16:30.530552+07
2	contenttypes	0002_remove_content_type_name	2018-07-28 00:16:30.586422+07
3	auth	0001_initial	2018-07-28 00:16:31.153798+07
4	auth	0002_alter_permission_name_max_length	2018-07-28 00:16:31.175583+07
5	auth	0003_alter_user_email_max_length	2018-07-28 00:16:31.192315+07
6	auth	0004_alter_user_username_opts	2018-07-28 00:16:31.213791+07
7	auth	0005_alter_user_last_login_null	2018-07-28 00:16:31.23666+07
8	auth	0006_require_contenttypes_0002	2018-07-28 00:16:31.253239+07
9	auth	0007_alter_validators_add_error_messages	2018-07-28 00:16:31.273621+07
10	auth	0008_alter_user_username_max_length	2018-07-28 00:16:31.293675+07
11	auth	0009_alter_user_last_name_max_length	2018-07-28 00:16:31.313998+07
12	Manager	0001_initial	2018-07-28 00:16:32.486755+07
13	admin	0001_initial	2018-07-28 00:16:32.708665+07
14	admin	0002_logentry_remove_auto_add	2018-07-28 00:16:32.730356+07
15	authtoken	0001_initial	2018-07-28 00:16:32.886557+07
16	authtoken	0002_auto_20160226_1747	2018-07-28 00:16:32.975831+07
17	sessions	0001_initial	2018-07-28 00:16:33.166419+07
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 17, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
5gmjdkd2aezxls4xqpdrrp3dldbr15eh	OTk0MjY0NTljN2Q1MWU4N2Q0NGNiZjZhZDU2NTAxODViMGQ5MDQ3ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI4ODVmODU4OTkzYjJmNWI3M2E1OTNhYjYyNjRkZDdiNjA0ZTVmNDI2In0=	2018-08-11 00:26:44.461326+07
kjh6l7ctg9tm003suemowajvyq0ipnjx	OTMwMGM3OWFhMWQxZWU2OGZmNzRkNmRkYzA3Y2U4NTc0N2RlZjI4YTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NWY4NTg5OTNiMmY1YjczYTU5M2FiNjI2NGRkN2I2MDRlNWY0MjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-08-11 00:54:15.984231+07
uuhv8eytmytyfde7ec39qcihz1briumq	ZmIzMzMxM2ViMGRkMjRjZDMxNGNiOWFmZmE4NTQ0NjgyZWE1NmY3YTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NWY4NTg5OTNiMmY1YjczYTU5M2FiNjI2NGRkN2I2MDRlNWY0MjYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-08-14 14:02:23.477776+07
\.


--
-- Name: Manager_al_testnode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_al_testnode"
    ADD CONSTRAINT "Manager_al_testnode_pkey" PRIMARY KEY (id);


--
-- Name: Manager_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_client"
    ADD CONSTRAINT "Manager_client_pkey" PRIMARY KEY (id);


--
-- Name: Manager_client_schema_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_client"
    ADD CONSTRAINT "Manager_client_schema_name_key" UNIQUE (schema_name);


--
-- Name: Manager_domain_domain_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_domain"
    ADD CONSTRAINT "Manager_domain_domain_key" UNIQUE (domain);


--
-- Name: Manager_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_domain"
    ADD CONSTRAINT "Manager_domain_pkey" PRIMARY KEY (id);


--
-- Name: Manager_userbase_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userbase"
    ADD CONSTRAINT "Manager_userbase_email_key" UNIQUE (email);


--
-- Name: Manager_userbase_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userbase_groups"
    ADD CONSTRAINT "Manager_userbase_groups_pkey" PRIMARY KEY (id);


--
-- Name: Manager_userbase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userbase"
    ADD CONSTRAINT "Manager_userbase_pkey" PRIMARY KEY (id);


--
-- Name: Manager_userbase_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userbase_user_permissions"
    ADD CONSTRAINT "Manager_userbase_user_permissions_pkey" PRIMARY KEY (id);


--
-- Name: Manager_userbase_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userbase"
    ADD CONSTRAINT "Manager_userbase_username_key" UNIQUE (username);


--
-- Name: Manager_userlog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userlog"
    ADD CONSTRAINT "Manager_userlog_pkey" PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: manager_userbase_groups_userbase_id_group_id_6bf39389_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userbase_groups"
    ADD CONSTRAINT manager_userbase_groups_userbase_id_group_id_6bf39389_uniq UNIQUE (userbase_id, group_id);


--
-- Name: manager_userbase_user_pe_userbase_id_permission_i_19f3958e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userbase_user_permissions"
    ADD CONSTRAINT manager_userbase_user_pe_userbase_id_permission_i_19f3958e_uniq UNIQUE (userbase_id, permission_id);


--
-- Name: Manager_al_testnode_parent_id_2df640b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Manager_al_testnode_parent_id_2df640b9" ON public."Manager_al_testnode" USING btree (parent_id);


--
-- Name: Manager_client_schema_name_c47ca14e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Manager_client_schema_name_c47ca14e_like" ON public."Manager_client" USING btree (schema_name varchar_pattern_ops);


--
-- Name: Manager_domain_domain_d117b86f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Manager_domain_domain_d117b86f_like" ON public."Manager_domain" USING btree (domain varchar_pattern_ops);


--
-- Name: Manager_domain_tenant_id_535dd9ea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Manager_domain_tenant_id_535dd9ea" ON public."Manager_domain" USING btree (tenant_id);


--
-- Name: Manager_userbase_email_412ae192_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Manager_userbase_email_412ae192_like" ON public."Manager_userbase" USING btree (email varchar_pattern_ops);


--
-- Name: Manager_userbase_groups_group_id_43afe519; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Manager_userbase_groups_group_id_43afe519" ON public."Manager_userbase_groups" USING btree (group_id);


--
-- Name: Manager_userbase_groups_userbase_id_1a810226; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Manager_userbase_groups_userbase_id_1a810226" ON public."Manager_userbase_groups" USING btree (userbase_id);


--
-- Name: Manager_userbase_user_permissions_permission_id_6a5e498e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Manager_userbase_user_permissions_permission_id_6a5e498e" ON public."Manager_userbase_user_permissions" USING btree (permission_id);


--
-- Name: Manager_userbase_user_permissions_userbase_id_baacaea1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Manager_userbase_user_permissions_userbase_id_baacaea1" ON public."Manager_userbase_user_permissions" USING btree (userbase_id);


--
-- Name: Manager_userbase_username_3e7fca6e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Manager_userbase_username_3e7fca6e_like" ON public."Manager_userbase" USING btree (username varchar_pattern_ops);


--
-- Name: Manager_userlog_user_id_9251265c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Manager_userlog_user_id_9251265c" ON public."Manager_userlog" USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: Manager_al_testnode_parent_id_2df640b9_fk_Manager_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_al_testnode"
    ADD CONSTRAINT "Manager_al_testnode_parent_id_2df640b9_fk_Manager_a" FOREIGN KEY (parent_id) REFERENCES public."Manager_al_testnode"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Manager_domain_tenant_id_535dd9ea_fk_Manager_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_domain"
    ADD CONSTRAINT "Manager_domain_tenant_id_535dd9ea_fk_Manager_client_id" FOREIGN KEY (tenant_id) REFERENCES public."Manager_client"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Manager_userbase_gro_userbase_id_1a810226_fk_Manager_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userbase_groups"
    ADD CONSTRAINT "Manager_userbase_gro_userbase_id_1a810226_fk_Manager_u" FOREIGN KEY (userbase_id) REFERENCES public."Manager_userbase"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Manager_userbase_groups_group_id_43afe519_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userbase_groups"
    ADD CONSTRAINT "Manager_userbase_groups_group_id_43afe519_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Manager_userbase_use_permission_id_6a5e498e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userbase_user_permissions"
    ADD CONSTRAINT "Manager_userbase_use_permission_id_6a5e498e_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Manager_userbase_use_userbase_id_baacaea1_fk_Manager_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userbase_user_permissions"
    ADD CONSTRAINT "Manager_userbase_use_userbase_id_baacaea1_fk_Manager_u" FOREIGN KEY (userbase_id) REFERENCES public."Manager_userbase"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Manager_userlog_user_id_9251265c_fk_Manager_userbase_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager_userlog"
    ADD CONSTRAINT "Manager_userlog_user_id_9251265c_fk_Manager_userbase_id" FOREIGN KEY (user_id) REFERENCES public."Manager_userbase"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token_user_id_35299eff_fk_Manager_userbase_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT "authtoken_token_user_id_35299eff_fk_Manager_userbase_id" FOREIGN KEY (user_id) REFERENCES public."Manager_userbase"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_Manager_userbase_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_Manager_userbase_id" FOREIGN KEY (user_id) REFERENCES public."Manager_userbase"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

