

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.comparisons DISABLE TRIGGER ALL;



ALTER TABLE public.comparisons ENABLE TRIGGER ALL;


ALTER TABLE public.make_list_jobs DISABLE TRIGGER ALL;



ALTER TABLE public.make_list_jobs ENABLE TRIGGER ALL;


ALTER TABLE public.skills DISABLE TRIGGER ALL;



ALTER TABLE public.skills ENABLE TRIGGER ALL;


