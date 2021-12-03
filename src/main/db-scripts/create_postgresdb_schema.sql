CREATE ROLE sc_rw
    NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
--------------------------------------------------
-- SUPERUSER
CREATE ROLE sc_admin LOGIN
     INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
GRANT sc_rw TO sc_admin;
--------------------------------------------------
CREATE ROLE sc_user LOGIN
    NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
GRANT sc_rw TO sc_user;
--------------------------------------------------
CREATE ROLE sc_ro
    NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
--------------------------------------------------
ALTER USER "sc_admin" WITH PASSWORD 'sc_admin';
ALTER USER "sc_user" WITH PASSWORD 'sc_user';
-------------------------------------------------
CREATE DATABASE simplechat
    WITH OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;
GRANT CONNECT, TEMPORARY ON DATABASE simplechat TO public;
GRANT ALL ON DATABASE simplechat  TO postgres;
GRANT CONNECT ON DATABASE simplechat  TO sc_user;
GRANT CONNECT ON DATABASE simplechat TO sc_admin;
----------------------------------------------
--     TABLESPACE = pg_default
--     LC_COLLATE = 'German_Germany'
--    LC_CTYPE = 'German_Germany'

