--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.3 (Debian 13.3-1.pgdg100+1)

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

ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_authentication_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE ONLY public.core_ticket DROP CONSTRAINT core_ticket_operator_id_ac63c5f6_fk_authentication_user_id;
ALTER TABLE ONLY public.core_ticket DROP CONSTRAINT core_ticket_client_id_d0e54674_fk_authentication_user_id;
ALTER TABLE ONLY public.core_comment DROP CONSTRAINT core_comment_user_id_a9a9430c_fk_authentication_user_id;
ALTER TABLE ONLY public.core_comment DROP CONSTRAINT core_comment_ticket_id_1afafc74_fk_core_ticket_id;
ALTER TABLE ONLY public.core_comment DROP CONSTRAINT core_comment_reply_to_id_6baadb50_fk_core_comment_id;
ALTER TABLE ONLY public.core_comment DROP CONSTRAINT core_comment_prev_comment_id_aa68dad3_fk_core_comment_id;
ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_authentication_user_id;
ALTER TABLE ONLY public.authentication_user DROP CONSTRAINT authentication_user_role_id_24664e00_fk_authentication_role_id;
ALTER TABLE ONLY public.authentication_user_groups DROP CONSTRAINT authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id;
ALTER TABLE ONLY public.authentication_user_user_permissions DROP CONSTRAINT authentication_user__user_id_736ebf7e_fk_authentic;
ALTER TABLE ONLY public.authentication_user_groups DROP CONSTRAINT authentication_user__user_id_30868577_fk_authentic;
ALTER TABLE ONLY public.authentication_user_user_permissions DROP CONSTRAINT authentication_user__permission_id_ea6be19a_fk_auth_perm;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX public.django_site_domain_a2e37b91_like;
DROP INDEX public.django_session_session_key_c0390e0f_like;
DROP INDEX public.django_session_expire_date_a5c62663;
DROP INDEX public.django_admin_log_user_id_c564eba6;
DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX public.core_ticket_operator_id_ac63c5f6;
DROP INDEX public.core_ticket_client_id_d0e54674;
DROP INDEX public.core_comment_user_id_a9a9430c;
DROP INDEX public.core_comment_ticket_id_1afafc74;
DROP INDEX public.core_comment_reply_to_id_6baadb50;
DROP INDEX public.authtoken_token_key_10f0b77e_like;
DROP INDEX public.authentication_user_user_permissions_user_id_736ebf7e;
DROP INDEX public.authentication_user_user_permissions_permission_id_ea6be19a;
DROP INDEX public.authentication_user_role_id_24664e00;
DROP INDEX public.authentication_user_groups_user_id_30868577;
DROP INDEX public.authentication_user_groups_group_id_6b5c44b7;
DROP INDEX public.authentication_user_email_2220eff5_like;
DROP INDEX public.auth_permission_content_type_id_2f476e4b;
DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX public.auth_group_name_a6ea08ec_like;
ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_domain_a2e37b91_uniq;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.core_ticket DROP CONSTRAINT core_ticket_pkey;
ALTER TABLE ONLY public.core_comment DROP CONSTRAINT core_comment_prev_comment_id_key;
ALTER TABLE ONLY public.core_comment DROP CONSTRAINT core_comment_pkey;
ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
ALTER TABLE ONLY public.authentication_user_user_permissions DROP CONSTRAINT authentication_user_user_user_id_permission_id_ec51b09f_uniq;
ALTER TABLE ONLY public.authentication_user_user_permissions DROP CONSTRAINT authentication_user_user_permissions_pkey;
ALTER TABLE ONLY public.authentication_user DROP CONSTRAINT authentication_user_pkey;
ALTER TABLE ONLY public.authentication_user_groups DROP CONSTRAINT authentication_user_groups_user_id_group_id_8af031ac_uniq;
ALTER TABLE ONLY public.authentication_user_groups DROP CONSTRAINT authentication_user_groups_pkey;
ALTER TABLE ONLY public.authentication_user DROP CONSTRAINT authentication_user_email_key;
ALTER TABLE ONLY public.authentication_role DROP CONSTRAINT authentication_role_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_ticket ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_comment ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.authentication_user_user_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.authentication_user_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.authentication_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.authentication_role ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.django_site_id_seq;
DROP TABLE public.django_site;
DROP TABLE public.django_session;
DROP SEQUENCE public.django_migrations_id_seq;
DROP TABLE public.django_migrations;
DROP SEQUENCE public.django_content_type_id_seq;
DROP TABLE public.django_content_type;
DROP SEQUENCE public.django_admin_log_id_seq;
DROP TABLE public.django_admin_log;
DROP SEQUENCE public.core_ticket_id_seq;
DROP TABLE public.core_ticket;
DROP SEQUENCE public.core_comment_id_seq;
DROP TABLE public.core_comment;
DROP TABLE public.authtoken_token;
DROP SEQUENCE public.authentication_user_user_permissions_id_seq;
DROP TABLE public.authentication_user_user_permissions;
DROP SEQUENCE public.authentication_user_id_seq;
DROP SEQUENCE public.authentication_user_groups_id_seq;
DROP TABLE public.authentication_user_groups;
DROP TABLE public.authentication_user;
DROP SEQUENCE public.authentication_role_id_seq;
DROP TABLE public.authentication_role;
DROP SEQUENCE public.auth_permission_id_seq;
DROP TABLE public.auth_permission;
DROP SEQUENCE public.auth_group_permissions_id_seq;
DROP TABLE public.auth_group_permissions;
DROP SEQUENCE public.auth_group_id_seq;
DROP TABLE public.auth_group;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO support;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: support
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO support;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: support
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO support;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: support
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO support;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: support
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO support;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: support
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO support;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: support
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authentication_role; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.authentication_role (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.authentication_role OWNER TO support;

--
-- Name: authentication_role_id_seq; Type: SEQUENCE; Schema: public; Owner: support
--

CREATE SEQUENCE public.authentication_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authentication_role_id_seq OWNER TO support;

--
-- Name: authentication_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: support
--

ALTER SEQUENCE public.authentication_role_id_seq OWNED BY public.authentication_role.id;


--
-- Name: authentication_user; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.authentication_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    email character varying(254) NOT NULL,
    username character varying(100),
    first_name character varying(100),
    last_name character varying(100),
    age smallint,
    phone character varying(13),
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_superuser boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    role_id bigint,
    CONSTRAINT authentication_user_age_check CHECK ((age >= 0))
);


ALTER TABLE public.authentication_user OWNER TO support;

--
-- Name: authentication_user_groups; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.authentication_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.authentication_user_groups OWNER TO support;

--
-- Name: authentication_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: support
--

CREATE SEQUENCE public.authentication_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authentication_user_groups_id_seq OWNER TO support;

--
-- Name: authentication_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: support
--

ALTER SEQUENCE public.authentication_user_groups_id_seq OWNED BY public.authentication_user_groups.id;


--
-- Name: authentication_user_id_seq; Type: SEQUENCE; Schema: public; Owner: support
--

CREATE SEQUENCE public.authentication_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authentication_user_id_seq OWNER TO support;

--
-- Name: authentication_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: support
--

ALTER SEQUENCE public.authentication_user_id_seq OWNED BY public.authentication_user.id;


--
-- Name: authentication_user_user_permissions; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.authentication_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.authentication_user_user_permissions OWNER TO support;

--
-- Name: authentication_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: support
--

CREATE SEQUENCE public.authentication_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authentication_user_user_permissions_id_seq OWNER TO support;

--
-- Name: authentication_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: support
--

ALTER SEQUENCE public.authentication_user_user_permissions_id_seq OWNED BY public.authentication_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO support;

--
-- Name: core_comment; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.core_comment (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    text text NOT NULL,
    prev_comment_id bigint,
    ticket_id bigint NOT NULL,
    user_id bigint,
    reply_to_id bigint
);


ALTER TABLE public.core_comment OWNER TO support;

--
-- Name: core_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: support
--

CREATE SEQUENCE public.core_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_comment_id_seq OWNER TO support;

--
-- Name: core_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: support
--

ALTER SEQUENCE public.core_comment_id_seq OWNED BY public.core_comment.id;


--
-- Name: core_ticket; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.core_ticket (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    theme character varying(255) NOT NULL,
    description text NOT NULL,
    resolved boolean NOT NULL,
    client_id bigint,
    operator_id bigint
);


ALTER TABLE public.core_ticket OWNER TO support;

--
-- Name: core_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: support
--

CREATE SEQUENCE public.core_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_ticket_id_seq OWNER TO support;

--
-- Name: core_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: support
--

ALTER SEQUENCE public.core_ticket_id_seq OWNED BY public.core_ticket.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO support;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: support
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO support;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: support
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO support;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: support
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO support;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: support
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO support;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: support
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO support;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: support
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO support;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: support
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO support;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: support
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO support;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: support
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: authentication_role id; Type: DEFAULT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_role ALTER COLUMN id SET DEFAULT nextval('public.authentication_role_id_seq'::regclass);


--
-- Name: authentication_user id; Type: DEFAULT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_user ALTER COLUMN id SET DEFAULT nextval('public.authentication_user_id_seq'::regclass);


--
-- Name: authentication_user_groups id; Type: DEFAULT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_user_groups ALTER COLUMN id SET DEFAULT nextval('public.authentication_user_groups_id_seq'::regclass);


--
-- Name: authentication_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.authentication_user_user_permissions_id_seq'::regclass);


--
-- Name: core_comment id; Type: DEFAULT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.core_comment ALTER COLUMN id SET DEFAULT nextval('public.core_comment_id_seq'::regclass);


--
-- Name: core_ticket id; Type: DEFAULT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.core_ticket ALTER COLUMN id SET DEFAULT nextval('public.core_ticket_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add site	6	add_site
22	Can change site	6	change_site
23	Can delete site	6	delete_site
24	Can view site	6	view_site
25	Can add Token	7	add_token
26	Can change Token	7	change_token
27	Can delete Token	7	delete_token
28	Can view Token	7	view_token
29	Can add token	8	add_tokenproxy
30	Can change token	8	change_tokenproxy
31	Can delete token	8	delete_tokenproxy
32	Can view token	8	view_tokenproxy
33	Can add ticket	9	add_ticket
34	Can change ticket	9	change_ticket
35	Can delete ticket	9	delete_ticket
36	Can view ticket	9	view_ticket
37	Can add comment	10	add_comment
38	Can change comment	10	change_comment
39	Can delete comment	10	delete_comment
40	Can view comment	10	view_comment
41	Can add role	11	add_role
42	Can change role	11	change_role
43	Can delete role	11	delete_role
44	Can view role	11	view_role
45	Can add user	12	add_user
46	Can change user	12	change_user
47	Can delete user	12	delete_user
48	Can view user	12	view_user
\.


--
-- Data for Name: authentication_role; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.authentication_role (id, created_at, updated_at, name) FROM stdin;
1	2022-09-24 19:16:57.605166+00	2022-09-24 19:16:57.605185+00	admin
2	2022-09-24 19:16:57.606306+00	2022-09-24 19:16:57.606331+00	user
\.


--
-- Data for Name: authentication_user; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.authentication_user (id, password, last_login, email, username, first_name, last_name, age, phone, is_active, is_staff, is_superuser, created_at, updated_at, role_id) FROM stdin;
1	pbkdf2_sha256$260000$keHM8k7XbJNfRSsnX4RgNz$qlv3Cw0buRn/s9XgvXnO4pn6pBEU7fZOCB6IUMcFLsw=	2022-09-24 19:20:18.999904+00	admin@admin.com	admin	Admin	Adminovich	27	0001234567	t	t	t	2022-09-24 19:16:57.732907+00	2022-09-24 19:16:57.732924+00	1
\.


--
-- Data for Name: authentication_user_groups; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.authentication_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: authentication_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.authentication_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: core_comment; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.core_comment (id, created_at, updated_at, text, prev_comment_id, ticket_id, user_id, reply_to_id) FROM stdin;
\.


--
-- Data for Name: core_ticket; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.core_ticket (id, created_at, updated_at, theme, description, resolved, client_id, operator_id) FROM stdin;
1	2022-09-24 19:20:29.05813+00	2022-09-24 19:20:29.05815+00	123	123	f	\N	\N
2	2022-09-25 10:42:29.090021+00	2022-09-25 10:42:29.090048+00	12	12	f	\N	\N
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-09-24 19:20:29.059722+00	1	None | 123	1	[{"added": {}}]	9	1
2	2022-09-25 10:42:29.093282+00	2	None | 12	1	[{"added": {}}]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	authtoken	token
8	authtoken	tokenproxy
9	core	ticket
10	core	comment
11	authentication	role
12	authentication	user
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-09-24 19:16:57.161174+00
2	contenttypes	0002_remove_content_type_name	2022-09-24 19:16:57.173591+00
3	auth	0001_initial	2022-09-24 19:16:57.292313+00
4	auth	0002_alter_permission_name_max_length	2022-09-24 19:16:57.300142+00
5	auth	0003_alter_user_email_max_length	2022-09-24 19:16:57.309781+00
6	auth	0004_alter_user_username_opts	2022-09-24 19:16:57.317912+00
7	auth	0005_alter_user_last_login_null	2022-09-24 19:16:57.325998+00
8	auth	0006_require_contenttypes_0002	2022-09-24 19:16:57.331173+00
9	auth	0007_alter_validators_add_error_messages	2022-09-24 19:16:57.338188+00
10	auth	0008_alter_user_username_max_length	2022-09-24 19:16:57.348923+00
11	auth	0009_alter_user_last_name_max_length	2022-09-24 19:16:57.356659+00
12	auth	0010_alter_group_name_max_length	2022-09-24 19:16:57.366205+00
13	auth	0011_update_proxy_permissions	2022-09-24 19:16:57.373482+00
14	auth	0012_alter_user_first_name_max_length	2022-09-24 19:16:57.3836+00
15	authentication	0001_initial	2022-09-24 19:16:57.528197+00
16	admin	0001_initial	2022-09-24 19:16:57.57188+00
17	admin	0002_logentry_remove_auto_add	2022-09-24 19:16:57.583196+00
18	admin	0003_logentry_add_action_flag_choices	2022-09-24 19:16:57.595763+00
19	authentication	0002_auto_20220804_0404	2022-09-24 19:16:57.607923+00
20	authentication	0003_auto_20220804_0431	2022-09-24 19:16:57.745285+00
21	authtoken	0001_initial	2022-09-24 19:16:57.792519+00
22	authtoken	0002_auto_20160226_1747	2022-09-24 19:16:57.830928+00
23	authtoken	0003_tokenproxy	2022-09-24 19:16:57.836265+00
24	core	0001_initial	2022-09-24 19:16:57.894442+00
25	core	0002_alter_ticket_client_alter_ticket_operator	2022-09-24 19:16:57.962672+00
26	core	0003_comment	2022-09-24 19:16:58.053242+00
27	core	0004_comment_reply_to	2022-09-24 19:16:58.084515+00
28	sessions	0001_initial	2022-09-24 19:16:58.120305+00
29	sites	0001_initial	2022-09-24 19:16:58.132622+00
30	sites	0002_alter_domain_unique	2022-09-24 19:16:58.15081+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
2miyif2li0ehop3j2b7tjlyajcrrj2f5	.eJxVjDsOwjAQBe_iGln-Jl5Kes5grXdtHECOFCcV4u4QKQW0b2beS0Tc1hq3npc4sTgLLU6_W0J65LYDvmO7zZLmti5TkrsiD9rldeb8vBzu30HFXr-1U8m4wgG1sZm0paJ9LgMbBG-BS4AUKBVtR4TROKWYhoAFPKqkSIN4fwDwkTgr:1ocAhH:dNuWKwxmC9xf1OQXon2jvDTf2SB7pXvmQXd6Q7UUN14	2022-10-08 19:20:19.012968+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: support
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: support
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: support
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: support
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: authentication_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: support
--

SELECT pg_catalog.setval('public.authentication_role_id_seq', 2, true);


--
-- Name: authentication_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: support
--

SELECT pg_catalog.setval('public.authentication_user_groups_id_seq', 1, false);


--
-- Name: authentication_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: support
--

SELECT pg_catalog.setval('public.authentication_user_id_seq', 1, true);


--
-- Name: authentication_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: support
--

SELECT pg_catalog.setval('public.authentication_user_user_permissions_id_seq', 1, false);


--
-- Name: core_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: support
--

SELECT pg_catalog.setval('public.core_comment_id_seq', 1, false);


--
-- Name: core_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: support
--

SELECT pg_catalog.setval('public.core_ticket_id_seq', 2, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: support
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 2, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: support
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: support
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: support
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authentication_role authentication_role_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_role
    ADD CONSTRAINT authentication_role_pkey PRIMARY KEY (id);


--
-- Name: authentication_user authentication_user_email_key; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_user
    ADD CONSTRAINT authentication_user_email_key UNIQUE (email);


--
-- Name: authentication_user_groups authentication_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_user_groups
    ADD CONSTRAINT authentication_user_groups_pkey PRIMARY KEY (id);


--
-- Name: authentication_user_groups authentication_user_groups_user_id_group_id_8af031ac_uniq; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_user_groups
    ADD CONSTRAINT authentication_user_groups_user_id_group_id_8af031ac_uniq UNIQUE (user_id, group_id);


--
-- Name: authentication_user authentication_user_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_user
    ADD CONSTRAINT authentication_user_pkey PRIMARY KEY (id);


--
-- Name: authentication_user_user_permissions authentication_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_user_user_permissions
    ADD CONSTRAINT authentication_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: authentication_user_user_permissions authentication_user_user_user_id_permission_id_ec51b09f_uniq; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_user_user_permissions
    ADD CONSTRAINT authentication_user_user_user_id_permission_id_ec51b09f_uniq UNIQUE (user_id, permission_id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: core_comment core_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.core_comment
    ADD CONSTRAINT core_comment_pkey PRIMARY KEY (id);


--
-- Name: core_comment core_comment_prev_comment_id_key; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.core_comment
    ADD CONSTRAINT core_comment_prev_comment_id_key UNIQUE (prev_comment_id);


--
-- Name: core_ticket core_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.core_ticket
    ADD CONSTRAINT core_ticket_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authentication_user_email_2220eff5_like; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX authentication_user_email_2220eff5_like ON public.authentication_user USING btree (email varchar_pattern_ops);


--
-- Name: authentication_user_groups_group_id_6b5c44b7; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX authentication_user_groups_group_id_6b5c44b7 ON public.authentication_user_groups USING btree (group_id);


--
-- Name: authentication_user_groups_user_id_30868577; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX authentication_user_groups_user_id_30868577 ON public.authentication_user_groups USING btree (user_id);


--
-- Name: authentication_user_role_id_24664e00; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX authentication_user_role_id_24664e00 ON public.authentication_user USING btree (role_id);


--
-- Name: authentication_user_user_permissions_permission_id_ea6be19a; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX authentication_user_user_permissions_permission_id_ea6be19a ON public.authentication_user_user_permissions USING btree (permission_id);


--
-- Name: authentication_user_user_permissions_user_id_736ebf7e; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX authentication_user_user_permissions_user_id_736ebf7e ON public.authentication_user_user_permissions USING btree (user_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: core_comment_reply_to_id_6baadb50; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX core_comment_reply_to_id_6baadb50 ON public.core_comment USING btree (reply_to_id);


--
-- Name: core_comment_ticket_id_1afafc74; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX core_comment_ticket_id_1afafc74 ON public.core_comment USING btree (ticket_id);


--
-- Name: core_comment_user_id_a9a9430c; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX core_comment_user_id_a9a9430c ON public.core_comment USING btree (user_id);


--
-- Name: core_ticket_client_id_d0e54674; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX core_ticket_client_id_d0e54674 ON public.core_ticket USING btree (client_id);


--
-- Name: core_ticket_operator_id_ac63c5f6; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX core_ticket_operator_id_ac63c5f6 ON public.core_ticket USING btree (operator_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: support
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authentication_user_user_permissions authentication_user__permission_id_ea6be19a_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_user_user_permissions
    ADD CONSTRAINT authentication_user__permission_id_ea6be19a_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authentication_user_groups authentication_user__user_id_30868577_fk_authentic; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_user_groups
    ADD CONSTRAINT authentication_user__user_id_30868577_fk_authentic FOREIGN KEY (user_id) REFERENCES public.authentication_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authentication_user_user_permissions authentication_user__user_id_736ebf7e_fk_authentic; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_user_user_permissions
    ADD CONSTRAINT authentication_user__user_id_736ebf7e_fk_authentic FOREIGN KEY (user_id) REFERENCES public.authentication_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authentication_user_groups authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_user_groups
    ADD CONSTRAINT authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authentication_user authentication_user_role_id_24664e00_fk_authentication_role_id; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authentication_user
    ADD CONSTRAINT authentication_user_role_id_24664e00_fk_authentication_role_id FOREIGN KEY (role_id) REFERENCES public.authentication_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_authentication_user_id; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_authentication_user_id FOREIGN KEY (user_id) REFERENCES public.authentication_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_comment core_comment_prev_comment_id_aa68dad3_fk_core_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.core_comment
    ADD CONSTRAINT core_comment_prev_comment_id_aa68dad3_fk_core_comment_id FOREIGN KEY (prev_comment_id) REFERENCES public.core_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_comment core_comment_reply_to_id_6baadb50_fk_core_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.core_comment
    ADD CONSTRAINT core_comment_reply_to_id_6baadb50_fk_core_comment_id FOREIGN KEY (reply_to_id) REFERENCES public.core_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_comment core_comment_ticket_id_1afafc74_fk_core_ticket_id; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.core_comment
    ADD CONSTRAINT core_comment_ticket_id_1afafc74_fk_core_ticket_id FOREIGN KEY (ticket_id) REFERENCES public.core_ticket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_comment core_comment_user_id_a9a9430c_fk_authentication_user_id; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.core_comment
    ADD CONSTRAINT core_comment_user_id_a9a9430c_fk_authentication_user_id FOREIGN KEY (user_id) REFERENCES public.authentication_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_ticket core_ticket_client_id_d0e54674_fk_authentication_user_id; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.core_ticket
    ADD CONSTRAINT core_ticket_client_id_d0e54674_fk_authentication_user_id FOREIGN KEY (client_id) REFERENCES public.authentication_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_ticket core_ticket_operator_id_ac63c5f6_fk_authentication_user_id; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.core_ticket
    ADD CONSTRAINT core_ticket_operator_id_ac63c5f6_fk_authentication_user_id FOREIGN KEY (operator_id) REFERENCES public.authentication_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_authentication_user_id; Type: FK CONSTRAINT; Schema: public; Owner: support
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_authentication_user_id FOREIGN KEY (user_id) REFERENCES public.authentication_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

