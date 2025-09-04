/*
    Lookup Tables
*/

TRUNCATE TABLE public.product_types RESTART IDENTITY;
INSERT INTO public.product_types(product_types_name) VALUES ('Compute');
INSERT INTO public.product_types(product_types_name) VALUES ('Storage and Databases');
INSERT INTO public.product_types(product_types_name) VALUES ('Networking');
INSERT INTO public.product_types(product_types_name) VALUES ('Big Data and Analytics');
INSERT INTO public.product_types(product_types_name) VALUES ('AI and Machine Learning');
INSERT INTO public.product_types(product_types_name) VALUES ('Identity and Security');

TRUNCATE TABLE public.regions RESTART IDENTITY;
INSERT INTO public.regions(regions_name) VALUES ('Africa');
INSERT INTO public.regions(regions_name) VALUES ('Americas');
INSERT INTO public.regions(regions_name) VALUES ('Asia');
INSERT INTO public.regions(regions_name) VALUES ('Europe');
INSERT INTO public.regions(regions_name) VALUES ('Oceania');

TRUNCATE TABLE public.market_segments RESTART IDENTITY;
INSERT INTO public.market_segments(market_segments_name, is_deleted) VALUES ('unknown', true);
INSERT INTO public.market_segments(market_segments_name) VALUES ('smb');
INSERT INTO public.market_segments(market_segments_name) VALUES ('ent');
INSERT INTO public.market_segments(market_segments_name) VALUES ('gov');

TRUNCATE TABLE public.incentive_groups RESTART IDENTITY;
INSERT INTO public.incentive_groups(incentive_groups_name) VALUES ('none');
INSERT INTO public.incentive_groups(incentive_groups_name) VALUES ('percent');
INSERT INTO public.incentive_groups(incentive_groups_name) VALUES ('quantity');

TRUNCATE TABLE public.employee_roles RESTART IDENTITY;
INSERT INTO public.employee_roles(role_name) VALUES ('sales');
INSERT INTO public.employee_roles(role_name) VALUES ('marketing');
INSERT INTO public.employee_roles(role_name) VALUES ('support');
INSERT INTO public.employee_roles(role_name) VALUES ('product');
INSERT INTO public.employee_roles(role_name) VALUES ('clerical');
INSERT INTO public.employee_roles(role_name) VALUES ('finance');
INSERT INTO public.employee_roles(role_name) VALUES ('Humaan Resources');


