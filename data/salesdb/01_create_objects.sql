--
-- PostgreSQL database dump: SalesDb
-- Run 00_new_database.sql first
-- exectute from the salesdb
--

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
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    company_id bigint NOT NULL,
    company_name character varying(127) NOT NULL,
    ticker character varying(15) NOT NULL,
    sector_id bigint,
    industry_id bigint,
    market_segments_id bigint,
    number_of_employees bigint DEFAULT 0,
    market_cap money DEFAULT 0.0,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: companies_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.companies_company_id_seq OWNER TO postgres;

--
-- Name: companies_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_company_id_seq OWNED BY public.companies.company_id;


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
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id bigint NOT NULL,
    employee_roles_id bigint NOT NULL,
    name_last character varying(127) NOT NULL,
    name_first character varying(127) NOT NULL,
    email character varying(4096) NOT NULL,
    phone_cell character varying(64),
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) DEFAULT 'system'::character varying NOT NULL,
    is_deleted boolean DEFAULT false,
    region_id bigint DEFAULT 2
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_employee_id_seq OWNER TO postgres;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;


--
-- Name: employees_employee_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_employee_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_employee_roles_id_seq OWNER TO postgres;

--
-- Name: employees_employee_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_employee_roles_id_seq OWNED BY public.employees.employee_roles_id;


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


--
-- Name: incentives; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incentives (
    incentive_id bigint NOT NULL,
    incentive_name character varying(2048) NOT NULL,
    trip_value numeric DEFAULT 0,
    discount_value numeric DEFAULT 0,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false,
    incentive_groups_id bigint NOT NULL
);


ALTER TABLE public.incentives OWNER TO postgres;

--
-- Name: incentives_incentive_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incentives_incentive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incentives_incentive_id_seq OWNER TO postgres;

--
-- Name: incentives_incentive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incentives_incentive_id_seq OWNED BY public.incentives.incentive_id;


--
-- Name: industries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.industries (
    industry_id bigint NOT NULL,
    industry_name character varying(127) NOT NULL,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.industries OWNER TO postgres;

--
-- Name: industries_industry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.industries_industry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.industries_industry_id_seq OWNER TO postgres;

--
-- Name: industries_industry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.industries_industry_id_seq OWNED BY public.industries.industry_id;


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
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    products_id bigint NOT NULL,
    product_name character varying(127) NOT NULL,
    product_types_id bigint NOT NULL,
    product_description text,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_products_id_seq OWNER TO postgres;

--
-- Name: products_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_products_id_seq OWNED BY public.products.products_id;


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
-- Name: sales_order_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_order_status (
    sales_order_status_id bigint NOT NULL,
    status_name character varying(2048) NOT NULL,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false,
    description character varying(2048)
);


ALTER TABLE public.sales_order_status OWNER TO postgres;

--
-- Name: sales_order_status_sales_order_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_order_status_sales_order_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_order_status_sales_order_status_id_seq OWNER TO postgres;

--
-- Name: sales_order_status_sales_order_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_order_status_sales_order_status_id_seq OWNED BY public.sales_order_status.sales_order_status_id;


--
-- Name: sales_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_orders (
    sales_order_id bigint NOT NULL,
    employee_id bigint NOT NULL,
    company_id bigint NOT NULL,
    incentive_id bigint DEFAULT 1,
    sales_order_date date DEFAULT now() NOT NULL,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false,
    sales_order_status_id bigint DEFAULT 1,
    region_id bigint DEFAULT 2
);


ALTER TABLE public.sales_orders OWNER TO postgres;

--
-- Name: sales_orders_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_orders_details (
    sales_orders_details_id bigint NOT NULL,
    sales_order_id bigint NOT NULL,
    quantity numeric DEFAULT 0,
    products_id bigint NOT NULL,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(127) DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.sales_orders_details OWNER TO postgres;

--
-- Name: sales_orders_details_sales_orders_details_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_orders_details_sales_orders_details_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_orders_details_sales_orders_details_seq OWNER TO postgres;

--
-- Name: sales_orders_details_sales_orders_details_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_orders_details_sales_orders_details_seq OWNED BY public.sales_orders_details.sales_orders_details_id;


--
-- Name: sales_orders_sales_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_orders_sales_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_orders_sales_order_id_seq OWNER TO postgres;

--
-- Name: sales_orders_sales_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_orders_sales_order_id_seq OWNED BY public.sales_orders.sales_order_id;


--
-- Name: sectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sectors (
    sector_id bigint NOT NULL,
    sector_name character varying(127) NOT NULL,
    inserted_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    inserted_by character varying(127) DEFAULT 'system'::character varying,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.sectors OWNER TO postgres;

--
-- Name: sectors_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sectors_sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sectors_sector_id_seq OWNER TO postgres;

--
-- Name: sectors_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sectors_sector_id_seq OWNED BY public.sectors.sector_id;


--
-- Name: vw_companies; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_companies AS
 SELECT comp.company_id,
    comp.company_name,
    comp.ticker,
    sect.sector_name,
    indu.industry_name,
    mark.market_segments_name,
    comp.number_of_employees,
    comp.market_cap
   FROM (((public.companies comp
     JOIN public.sectors sect ON ((comp.sector_id = sect.sector_id)))
     JOIN public.market_segments mark ON ((comp.market_segments_id = mark.market_segments_id)))
     JOIN public.industries indu ON ((comp.industry_id = indu.industry_id)))
  WHERE (comp.is_deleted = false);


ALTER VIEW public.vw_companies OWNER TO postgres;

--
-- Name: vw_employees; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_employees AS
 SELECT reg.regions_name,
    rol.role_name,
    emp.name_first,
    emp.name_last,
    emp.email,
    emp.phone_cell
   FROM ((public.employees emp
     JOIN public.regions reg ON ((emp.region_id = reg.regions_id)))
     JOIN public.employee_roles rol ON ((emp.employee_roles_id = rol.employee_roles_id)))
  WHERE (emp.is_deleted = false);


ALTER VIEW public.vw_employees OWNER TO postgres;

--
-- Name: vw_products; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_products AS
 SELECT pt.product_types_name,
    prod.products_id,
    prod.product_name,
    prod.product_description
   FROM (public.products prod
     JOIN public.product_types pt ON ((prod.product_types_id = pt.product_types_id)))
  WHERE (prod.is_deleted = false);


ALTER VIEW public.vw_products OWNER TO postgres;

--
-- Name: vw_sales_orders; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_sales_orders AS
 SELECT sod.sales_order_id,
    sod.sales_order_date,
    sos.status_name,
    comp.company_name,
    comp.ticker,
    reg.regions_name,
    emp.email AS sales_person,
    ince.incentive_name
   FROM (((((public.sales_orders sod
     JOIN public.sales_order_status sos ON ((sod.sales_order_status_id = sos.sales_order_status_id)))
     JOIN public.companies comp ON ((sod.company_id = comp.company_id)))
     JOIN public.regions reg ON ((sod.region_id = reg.regions_id)))
     JOIN public.incentives ince ON ((sod.incentive_id = ince.incentive_id)))
     JOIN public.employees emp ON ((sod.employee_id = emp.employee_id)));


ALTER VIEW public.vw_sales_orders OWNER TO postgres;

--
-- Name: companies company_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN company_id SET DEFAULT nextval('public.companies_company_id_seq'::regclass);


--
-- Name: employee_roles employee_roles_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_roles ALTER COLUMN employee_roles_id SET DEFAULT nextval('public.employee_roles_employee_roles_id_seq'::regclass);


--
-- Name: employees employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);


--
-- Name: employees employee_roles_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN employee_roles_id SET DEFAULT nextval('public.employees_employee_roles_id_seq'::regclass);


--
-- Name: incentive_groups incentive_groups_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incentive_groups ALTER COLUMN incentive_groups_id SET DEFAULT nextval('public.incentive_groups_incentive_groups_id_seq'::regclass);


--
-- Name: incentives incentive_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incentives ALTER COLUMN incentive_id SET DEFAULT nextval('public.incentives_incentive_id_seq'::regclass);


--
-- Name: industries industry_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries ALTER COLUMN industry_id SET DEFAULT nextval('public.industries_industry_id_seq'::regclass);


--
-- Name: products products_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN products_id SET DEFAULT nextval('public.products_products_id_seq'::regclass);


--
-- Name: regions regions_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN regions_id SET DEFAULT nextval('public.regions_regions_id_seq'::regclass);


--
-- Name: sales_order_status sales_order_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_order_status ALTER COLUMN sales_order_status_id SET DEFAULT nextval('public.sales_order_status_sales_order_status_id_seq'::regclass);


--
-- Name: sales_orders sales_order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_orders ALTER COLUMN sales_order_id SET DEFAULT nextval('public.sales_orders_sales_order_id_seq'::regclass);


--
-- Name: sales_orders_details sales_orders_details_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_orders_details ALTER COLUMN sales_orders_details_id SET DEFAULT nextval('public.sales_orders_details_sales_orders_details_seq'::regclass);


--
-- Name: sectors sector_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors ALTER COLUMN sector_id SET DEFAULT nextval('public.sectors_sector_id_seq'::regclass);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (company_id);


--
-- Name: employee_roles employee_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_roles
    ADD CONSTRAINT employee_roles_pkey PRIMARY KEY (employee_roles_id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: incentive_groups incentive_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incentive_groups
    ADD CONSTRAINT incentive_groups_pkey PRIMARY KEY (incentive_groups_id);


--
-- Name: incentives incentives_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incentives
    ADD CONSTRAINT incentives_pkey PRIMARY KEY (incentive_id);


--
-- Name: industries industries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries
    ADD CONSTRAINT industries_pkey PRIMARY KEY (industry_id);


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
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (products_id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (regions_id);


--
-- Name: sales_order_status sales_order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_order_status
    ADD CONSTRAINT sales_order_status_pkey PRIMARY KEY (sales_order_status_id);


--
-- Name: sales_orders_details sales_orders_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_orders_details
    ADD CONSTRAINT sales_orders_details_pkey PRIMARY KEY (sales_orders_details_id);


--
-- Name: sales_orders sales_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_pkey PRIMARY KEY (sales_order_id);


--
-- Name: sectors sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_pkey PRIMARY KEY (sector_id);


--
-- Name: sales_orders company_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT company_fk FOREIGN KEY (company_id) REFERENCES public.companies(company_id) NOT VALID;


--
-- Name: sales_orders employee_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT employee_fk FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id) NOT VALID;


--
-- Name: employees employees_employee_roles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_employee_roles_id_fkey FOREIGN KEY (employee_roles_id) REFERENCES public.employee_roles(employee_roles_id) NOT VALID;


--
-- Name: sales_orders incentive_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT incentive_fk FOREIGN KEY (incentive_id) REFERENCES public.incentives(incentive_id) NOT VALID;


--
-- Name: incentives incentive_groups_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incentives
    ADD CONSTRAINT incentive_groups_fk FOREIGN KEY (incentive_groups_id) REFERENCES public.incentive_groups(incentive_groups_id) NOT VALID;


--
-- Name: companies industry_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT industry_fk FOREIGN KEY (industry_id) REFERENCES public.industries(industry_id) NOT VALID;


--
-- Name: companies market_segments_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT market_segments_fk FOREIGN KEY (market_segments_id) REFERENCES public.market_segments(market_segments_id) NOT VALID;


--
-- Name: products product_types; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_types FOREIGN KEY (product_types_id) REFERENCES public.product_types(product_types_id);


--
-- Name: sales_orders_details products_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_orders_details
    ADD CONSTRAINT products_fk FOREIGN KEY (products_id) REFERENCES public.products(products_id) NOT VALID;


--
-- Name: employees region_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT region_fk FOREIGN KEY (region_id) REFERENCES public.regions(regions_id) NOT VALID;


--
-- Name: sales_orders region_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT region_fk FOREIGN KEY (region_id) REFERENCES public.regions(regions_id) NOT VALID;


--
-- Name: sales_orders sales_order_status_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_order_status_fk FOREIGN KEY (sales_order_status_id) REFERENCES public.sales_order_status(sales_order_status_id) NOT VALID;


--
-- Name: sales_orders_details sales_orders_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_orders_details
    ADD CONSTRAINT sales_orders_fk FOREIGN KEY (sales_order_id) REFERENCES public.sales_orders(sales_order_id) NOT VALID;


--
-- Name: companies sector_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT sector_fk FOREIGN KEY (sector_id) REFERENCES public.sectors(sector_id) NOT VALID;


--
-- PostgreSQL database dump complete
--
