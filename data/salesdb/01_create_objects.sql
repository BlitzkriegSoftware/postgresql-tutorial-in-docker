--
-- PostgreSQL database dump
--

-- \restrict 0rspkY2D5O1h4Z100rhMQSsrrY7cLKBEZeLxp9thmFmc9FrQKox8n3pdKKejUcR

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: employee_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_roles (
    employee_roles_id bigint NOT NULL,
    role_name character varying(127) NOT NULL,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.employee_roles OWNER TO postgres;

--
-- Name: employee_roles_employee_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_roles_employee_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_roles_employee_roles_id_seq OWNER TO postgres;

--
-- Name: employee_roles_employee_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_roles_employee_roles_id_seq OWNED BY public.employee_roles.employee_roles_id;


--
-- Name: incentive_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incentive_groups (
    incentive_groups_id bigint NOT NULL,
    incentive_groups_name character varying(127) NOT NULL,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.incentive_groups OWNER TO postgres;

--
-- Name: incentive_groups_incentive_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incentive_groups_incentive_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incentive_groups_incentive_groups_id_seq OWNER TO postgres;

--
-- Name: incentive_groups_incentive_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incentive_groups_incentive_groups_id_seq OWNED BY public.incentive_groups.incentive_groups_id;

-- SEQUENCE: public.incentives_incentive_id_seq

DROP SEQUENCE IF EXISTS public.incentives_incentive_id_seq;

CREATE SEQUENCE IF NOT EXISTS public.incentives_incentive_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.incentives_incentive_id_seq
    OWNED BY public.incentives.incentive_id;

ALTER SEQUENCE public.incentives_incentive_id_seq
    OWNER TO postgres;

-- Table: public.incentives

DROP TABLE IF EXISTS public.incentives;

CREATE TABLE IF NOT EXISTS public.incentives
(
    incentive_id bigint NOT NULL DEFAULT nextval('incentives_incentive_id_seq'::regclass),
    incentive_name character varying(2048) COLLATE pg_catalog."default" NOT NULL,
    trip_value numeric DEFAULT 0,
    discount_value numeric DEFAULT 0,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) COLLATE pg_catalog."default" DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false,
    incentive_groups_id bigint NOT NULL,
    CONSTRAINT incentives_pkey PRIMARY KEY (incentive_id),
    CONSTRAINT incentive_groups_fk FOREIGN KEY (incentive_groups_id)
        REFERENCES public.incentive_groups (incentive_groups_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.incentives
    OWNER to postgres;
--
-- Name: market_segments_market_segments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.market_segments_market_segments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.market_segments_market_segments_id_seq OWNER TO postgres;

--
-- Name: market_segments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.market_segments (
    market_segments_id bigint DEFAULT nextval('public.market_segments_market_segments_id_seq'::regclass) NOT NULL,
    market_segments_name character varying(127) NOT NULL,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.market_segments OWNER TO postgres;

--
-- Name: product_types_product_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_types_product_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_types_product_types_id_seq OWNER TO postgres;

--
-- Name: product_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_types (
    product_types_id bigint DEFAULT nextval('public.product_types_product_types_id_seq'::regclass) NOT NULL,
    product_types_name character varying(127) NOT NULL,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.product_types OWNER TO postgres;

--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    regions_id bigint NOT NULL,
    regions_name character varying(127) NOT NULL,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.regions OWNER TO postgres;

-- Table: public.sectors

-- DROP TABLE IF EXISTS public.sectors;

CREATE TABLE IF NOT EXISTS public.sectors
(
    sector_id bigint NOT NULL DEFAULT nextval('sectors_sector_id_seq'::regclass),
    sector_name character varying(127) COLLATE pg_catalog."default" NOT NULL,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) COLLATE pg_catalog."default" DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false,
    CONSTRAINT sectors_pkey PRIMARY KEY (sector_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.sectors
    OWNER to postgres;

-- Table: public.employees

DROP TABLE IF EXISTS public.employees;

CREATE TABLE IF NOT EXISTS public.employees
(
    employee_id bigint NOT NULL DEFAULT nextval('employees_employee_id_seq'::regclass),
    employee_roles_id bigint NOT NULL DEFAULT nextval('employees_employee_roles_id_seq'::regclass),
    name_last character varying(127) COLLATE pg_catalog."default" NOT NULL,
    name_first character varying(127) COLLATE pg_catalog."default" NOT NULL,
    email character varying(4096) COLLATE pg_catalog."default" NOT NULL,
    phone_cell character varying(64) COLLATE pg_catalog."default",
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) COLLATE pg_catalog."default" NOT NULL DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false,
    CONSTRAINT employees_pkey PRIMARY KEY (employee_id),
    CONSTRAINT employees_employee_roles_id_fkey FOREIGN KEY (employee_roles_id)
        REFERENCES public.employee_roles (employee_roles_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.employees
    OWNER to postgres;

-- Table: public.companies

DROP TABLE IF EXISTS public.companies;

CREATE TABLE IF NOT EXISTS public.companies
(
    company_id bigint NOT NULL DEFAULT nextval('companies_company_id_seq'::regclass),
    company_name character varying(127) COLLATE pg_catalog."default" NOT NULL,
    ticker character varying(15) COLLATE pg_catalog."default" NOT NULL,
    sector_id bigint,
    industry_id bigint,
    market_segments_id bigint,
    number_of_employees bigint DEFAULT 0,
    market_cap money DEFAULT 0.0,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) COLLATE pg_catalog."default" DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false,
    CONSTRAINT companies_pkey PRIMARY KEY (company_id),
    CONSTRAINT industry_fk FOREIGN KEY (industry_id)
        REFERENCES public.industries (industry_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT market_segments_fk FOREIGN KEY (market_segments_id)
        REFERENCES public.market_segments (market_segments_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT sector_fk FOREIGN KEY (sector_id)
        REFERENCES public.sectors (sector_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.companies
    OWNER to postgres;


--
-- Name: regions_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.regions_regions_id_seq OWNER TO postgres;

--
-- Name: regions_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regions_regions_id_seq OWNED BY public.regions.regions_id;


--
-- Name: employee_roles employee_roles_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_roles ALTER COLUMN employee_roles_id SET DEFAULT nextval('public.employee_roles_employee_roles_id_seq'::regclass);


--
-- Name: incentive_groups incentive_groups_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incentive_groups ALTER COLUMN incentive_groups_id SET DEFAULT nextval('public.incentive_groups_incentive_groups_id_seq'::regclass);


--
-- Name: regions regions_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN regions_id SET DEFAULT nextval('public.regions_regions_id_seq'::regclass);


--
-- Name: employee_roles employee_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_roles
    ADD CONSTRAINT employee_roles_pkey PRIMARY KEY (employee_roles_id);


--
-- Name: incentive_groups incentive_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incentive_groups
    ADD CONSTRAINT incentive_groups_pkey PRIMARY KEY (incentive_groups_id);


--
-- Name: market_segments market_segments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.market_segments
    ADD CONSTRAINT market_segments_pkey PRIMARY KEY (market_segments_id);


--
-- Name: product_types product_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_types
    ADD CONSTRAINT product_types_pkey PRIMARY KEY (product_types_id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (regions_id);


--
-- PostgreSQL database dump complete
--

-- \unrestrict 0rspkY2D5O1h4Z100rhMQSsrrY7cLKBEZeLxp9thmFmc9FrQKox8n3pdKKejUcR

