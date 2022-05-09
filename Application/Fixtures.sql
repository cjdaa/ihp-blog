

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

ALTER TABLE public.post DISABLE TRIGGER ALL;

INSERT INTO public.post (id, title, body, created_at) VALUES ('1d9315fb-87f1-4983-b0f9-8528c39f6348', 'aaaaaaaaaaaaa', 'bbb', '2022-05-08 17:27:18.770497+08');
INSERT INTO public.post (id, title, body, created_at) VALUES ('fd70b0a8-a7c0-4e34-beb8-93c98036f009', 'sdd', 'sdds', '2022-05-08 17:27:18.770497+08');
INSERT INTO public.post (id, title, body, created_at) VALUES ('9d0c19c6-590a-4bf2-a0df-3f8217de7f85', 'sdshh', '# head11', '2022-05-08 18:07:42.835314+08');


ALTER TABLE public.post ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;

INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('78ead131-8bbf-4bbe-9137-a037e175859b', '9d0c19c6-590a-4bf2-a0df-3f8217de7f85', 'cjd', 'haha', '2022-05-09 13:25:33.017284+08');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('1bdc1497-33fe-4b6a-8ac7-b77cd1b7b0cc', '9d0c19c6-590a-4bf2-a0df-3f8217de7f85', 'cjd', 'hahahahha', '2022-05-09 13:25:33.017284+08');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('82fb71b8-2a27-455d-9bdd-ba209a2dcdfa', '9d0c19c6-590a-4bf2-a0df-3f8217de7f85', 'cjd', 'hhhhhh', '2022-05-09 13:25:33.017284+08');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('1d8b8e1d-30b4-4add-9056-bdf3774f8f40', '9d0c19c6-590a-4bf2-a0df-3f8217de7f85', 'ddd', 'aaaaa', '2022-05-09 13:25:33.017284+08');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('bf9b49c1-8915-4c88-bfff-3f6e0672e79f', '9d0c19c6-590a-4bf2-a0df-3f8217de7f85', 'cjd1', 'bbbb', '2022-05-09 13:31:55.171528+08');


ALTER TABLE public.comments ENABLE TRIGGER ALL;


ALTER TABLE public.schema_migrations DISABLE TRIGGER ALL;

INSERT INTO public.schema_migrations (revision) VALUES (1651908929);
INSERT INTO public.schema_migrations (revision) VALUES (1652002039);
INSERT INTO public.schema_migrations (revision) VALUES (1652005907);
INSERT INTO public.schema_migrations (revision) VALUES (1652073933);


ALTER TABLE public.schema_migrations ENABLE TRIGGER ALL;


