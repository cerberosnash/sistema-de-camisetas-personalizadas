--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.tb_usuarios DROP CONSTRAINT fk_tb_usuar_perfil_do_tb_perfi;
ALTER TABLE ONLY public.tb_usuarios DROP CONSTRAINT fk_tb_usuar_municipio_tb_munic;
ALTER TABLE ONLY public.tb_telefones DROP CONSTRAINT fk_tb_telef_relations_tb_usuar;
ALTER TABLE ONLY public.tb_produto_pedido DROP CONSTRAINT fk_tb_produ_produtos__tb_produ;
ALTER TABLE ONLY public.tb_produto_pedido DROP CONSTRAINT fk_tb_produ_produtos__tb_pedid;
ALTER TABLE ONLY public.tb_pedidos DROP CONSTRAINT fk_tb_pedid_relations_tb_usuar;
ALTER TABLE ONLY public.tb_pedidos DROP CONSTRAINT fk_tb_pedid_relations_tb_statu;
ALTER TABLE ONLY public.tb_municipios DROP CONSTRAINT fk_tb_munic_uf_do_mun_tb_ufs;
ALTER TABLE ONLY public.tb_historico_atividades DROP CONSTRAINT fk_tb_histo_relations_tb_usuar;
ALTER TABLE ONLY public.tb_historico_atividades DROP CONSTRAINT fk_tb_histo_relations_tb_ativi;
ALTER TABLE ONLY public.tb_historico_atividades DROP CONSTRAINT fk_tb_histo_reference_tb_pedid;
ALTER TABLE ONLY public.tb_favoritos DROP CONSTRAINT fk_tb_favor_produtos__tb_usuar;
ALTER TABLE ONLY public.tb_favoritos DROP CONSTRAINT fk_tb_favor_produtos__tb_produ;
DROP INDEX public.index_5;
DROP INDEX public.index_4;
ALTER TABLE ONLY public.tb_pedidos DROP CONSTRAINT tb_pedidos_cd_rastreamento_key;
ALTER TABLE ONLY public.tb_usuarios DROP CONSTRAINT pk_tb_usuarios;
ALTER TABLE ONLY public.tb_ufs DROP CONSTRAINT pk_tb_ufs;
ALTER TABLE ONLY public.tb_telefones DROP CONSTRAINT pk_tb_telefones;
ALTER TABLE ONLY public.tb_status DROP CONSTRAINT pk_tb_status;
ALTER TABLE ONLY public.tb_produtos DROP CONSTRAINT pk_tb_produtos;
ALTER TABLE ONLY public.tb_produto_pedido DROP CONSTRAINT pk_tb_produto_pedido;
ALTER TABLE ONLY public.tb_perfil DROP CONSTRAINT pk_tb_perfil;
ALTER TABLE ONLY public.tb_pedidos DROP CONSTRAINT pk_tb_pedidos;
ALTER TABLE ONLY public.tb_municipios DROP CONSTRAINT pk_tb_municipios;
ALTER TABLE ONLY public.tb_historico_atividades DROP CONSTRAINT pk_tb_historico_atividades;
ALTER TABLE ONLY public.tb_favoritos DROP CONSTRAINT pk_tb_favoritos;
ALTER TABLE ONLY public.tb_atividades DROP CONSTRAINT pk_tb_atividades;
ALTER TABLE public.tb_usuarios ALTER COLUMN sq_usuario DROP DEFAULT;
ALTER TABLE public.tb_ufs ALTER COLUMN sq_uf DROP DEFAULT;
ALTER TABLE public.tb_telefones ALTER COLUMN sq_telefone DROP DEFAULT;
ALTER TABLE public.tb_status ALTER COLUMN sq_status DROP DEFAULT;
ALTER TABLE public.tb_produtos ALTER COLUMN sq_produto DROP DEFAULT;
ALTER TABLE public.tb_produto_pedido ALTER COLUMN sq_produto_pedido DROP DEFAULT;
ALTER TABLE public.tb_perfil ALTER COLUMN sq_perfil DROP DEFAULT;
ALTER TABLE public.tb_pedidos ALTER COLUMN sq_pedido DROP DEFAULT;
ALTER TABLE public.tb_municipios ALTER COLUMN sq_municipio DROP DEFAULT;
ALTER TABLE public.tb_historico_atividades ALTER COLUMN sq_historico_atividade DROP DEFAULT;
ALTER TABLE public.tb_favoritos ALTER COLUMN sq_favorito DROP DEFAULT;
ALTER TABLE public.tb_atividades ALTER COLUMN sq_atividade DROP DEFAULT;
DROP SEQUENCE public.tb_usuarios_sq_usuario_seq;
DROP TABLE public.tb_usuarios;
DROP SEQUENCE public.tb_ufs_sq_uf_seq;
DROP TABLE public.tb_ufs;
DROP SEQUENCE public.tb_telefones_sq_telefone_seq;
DROP TABLE public.tb_telefones;
DROP SEQUENCE public.tb_status_sq_status_seq;
DROP TABLE public.tb_status;
DROP SEQUENCE public.tb_produtos_sq_produto_seq;
DROP TABLE public.tb_produtos;
DROP SEQUENCE public.tb_produto_pedido_sq_produto_pedido_seq;
DROP TABLE public.tb_produto_pedido;
DROP SEQUENCE public.tb_perfil_sq_perfil_seq;
DROP TABLE public.tb_perfil;
DROP SEQUENCE public.tb_pedidos_sq_pedido_seq;
DROP TABLE public.tb_pedidos;
DROP SEQUENCE public.tb_municipios_sq_municipio_seq;
DROP TABLE public.tb_municipios;
DROP SEQUENCE public.tb_historico_atividades_sq_historico_atividade_seq;
DROP TABLE public.tb_historico_atividades;
DROP SEQUENCE public.tb_favoritos_sq_favorito_seq;
DROP TABLE public.tb_favoritos;
DROP SEQUENCE public.tb_atividades_sq_atividade_seq;
DROP TABLE public.tb_atividades;
DROP PROCEDURAL LANGUAGE plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tb_atividades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_atividades (
    sq_atividade integer NOT NULL,
    tx_atividade character varying(100) NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_atividades OWNER TO postgres;

--
-- Name: tb_atividades_sq_atividade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tb_atividades_sq_atividade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_atividades_sq_atividade_seq OWNER TO postgres;

--
-- Name: tb_atividades_sq_atividade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_atividades_sq_atividade_seq OWNED BY tb_atividades.sq_atividade;


--
-- Name: tb_atividades_sq_atividade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_atividades_sq_atividade_seq', 1, false);


--
-- Name: tb_favoritos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_favoritos (
    sq_favorito integer NOT NULL,
    sq_usuario integer NOT NULL,
    sq_produto integer NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_favoritos OWNER TO postgres;

--
-- Name: tb_favoritos_sq_favorito_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tb_favoritos_sq_favorito_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_favoritos_sq_favorito_seq OWNER TO postgres;

--
-- Name: tb_favoritos_sq_favorito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_favoritos_sq_favorito_seq OWNED BY tb_favoritos.sq_favorito;


--
-- Name: tb_favoritos_sq_favorito_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_favoritos_sq_favorito_seq', 39, true);


--
-- Name: tb_historico_atividades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_historico_atividades (
    sq_historico_atividade integer NOT NULL,
    sq_usuario integer NOT NULL,
    sq_atividade integer NOT NULL,
    sq_pedido integer NOT NULL,
    dt_atividade date DEFAULT now() NOT NULL
);


ALTER TABLE public.tb_historico_atividades OWNER TO postgres;

--
-- Name: tb_historico_atividades_sq_historico_atividade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tb_historico_atividades_sq_historico_atividade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_historico_atividades_sq_historico_atividade_seq OWNER TO postgres;

--
-- Name: tb_historico_atividades_sq_historico_atividade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_historico_atividades_sq_historico_atividade_seq OWNED BY tb_historico_atividades.sq_historico_atividade;


--
-- Name: tb_historico_atividades_sq_historico_atividade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_historico_atividades_sq_historico_atividade_seq', 1, false);


--
-- Name: tb_municipios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_municipios (
    sq_municipio integer NOT NULL,
    sq_uf integer NOT NULL,
    nm_municipio character varying(100) NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_municipios OWNER TO postgres;

--
-- Name: tb_municipios_sq_municipio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tb_municipios_sq_municipio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_municipios_sq_municipio_seq OWNER TO postgres;

--
-- Name: tb_municipios_sq_municipio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_municipios_sq_municipio_seq OWNED BY tb_municipios.sq_municipio;


--
-- Name: tb_municipios_sq_municipio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_municipios_sq_municipio_seq', 5597, true);


--
-- Name: tb_pedidos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_pedidos (
    sq_pedido integer NOT NULL,
    sq_status integer NOT NULL,
    sq_usuario integer NOT NULL,
    dt_pedido date DEFAULT ('now'::text)::date NOT NULL,
    vl_pedido double precision NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL,
    cd_rastreamento character varying(13)
);


ALTER TABLE public.tb_pedidos OWNER TO postgres;

--
-- Name: tb_pedidos_sq_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tb_pedidos_sq_pedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_pedidos_sq_pedido_seq OWNER TO postgres;

--
-- Name: tb_pedidos_sq_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_pedidos_sq_pedido_seq OWNED BY tb_pedidos.sq_pedido;


--
-- Name: tb_pedidos_sq_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_pedidos_sq_pedido_seq', 42, true);


--
-- Name: tb_perfil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_perfil (
    sq_perfil integer NOT NULL,
    tx_perfil character varying(100) NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_perfil OWNER TO postgres;

--
-- Name: tb_perfil_sq_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tb_perfil_sq_perfil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_perfil_sq_perfil_seq OWNER TO postgres;

--
-- Name: tb_perfil_sq_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_perfil_sq_perfil_seq OWNED BY tb_perfil.sq_perfil;


--
-- Name: tb_perfil_sq_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_perfil_sq_perfil_seq', 5, true);


--
-- Name: tb_produto_pedido; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_produto_pedido (
    sq_produto_pedido integer NOT NULL,
    sq_pedido integer NOT NULL,
    sq_produto integer NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL,
    nu_quantidade integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.tb_produto_pedido OWNER TO postgres;

--
-- Name: tb_produto_pedido_sq_produto_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tb_produto_pedido_sq_produto_pedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_produto_pedido_sq_produto_pedido_seq OWNER TO postgres;

--
-- Name: tb_produto_pedido_sq_produto_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_produto_pedido_sq_produto_pedido_seq OWNED BY tb_produto_pedido.sq_produto_pedido;


--
-- Name: tb_produto_pedido_sq_produto_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_produto_pedido_sq_produto_pedido_seq', 35, true);


--
-- Name: tb_produtos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_produtos (
    sq_produto integer NOT NULL,
    vl_produto double precision NOT NULL,
    co_produto character varying(7) NOT NULL,
    tm_produto character(1) NOT NULL,
    nm_produto character varying(25) NOT NULL,
    ds_produto character varying(100) NOT NULL,
    hs_produto character varying(32) NOT NULL,
    st_privado boolean DEFAULT true NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL,
    fg_verso boolean DEFAULT false NOT NULL
);


ALTER TABLE public.tb_produtos OWNER TO postgres;

--
-- Name: tb_produtos_sq_produto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tb_produtos_sq_produto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_produtos_sq_produto_seq OWNER TO postgres;

--
-- Name: tb_produtos_sq_produto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_produtos_sq_produto_seq OWNED BY tb_produtos.sq_produto;


--
-- Name: tb_produtos_sq_produto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_produtos_sq_produto_seq', 44, true);


--
-- Name: tb_status; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_status (
    sq_status integer NOT NULL,
    tx_status character varying(100) NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_status OWNER TO postgres;

--
-- Name: tb_status_sq_status_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tb_status_sq_status_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_status_sq_status_seq OWNER TO postgres;

--
-- Name: tb_status_sq_status_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_status_sq_status_seq OWNED BY tb_status.sq_status;


--
-- Name: tb_status_sq_status_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_status_sq_status_seq', 5, true);


--
-- Name: tb_telefones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_telefones (
    sq_telefone integer NOT NULL,
    sq_usuario integer NOT NULL,
    tp_telefone character varying(100) NOT NULL,
    nu_telefone character varying(8) NOT NULL,
    nu_ddd character varying(3) NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_telefones OWNER TO postgres;

--
-- Name: tb_telefones_sq_telefone_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tb_telefones_sq_telefone_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_telefones_sq_telefone_seq OWNER TO postgres;

--
-- Name: tb_telefones_sq_telefone_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_telefones_sq_telefone_seq OWNED BY tb_telefones.sq_telefone;


--
-- Name: tb_telefones_sq_telefone_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_telefones_sq_telefone_seq', 10, true);


--
-- Name: tb_ufs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_ufs (
    sq_uf integer NOT NULL,
    nm_uf character varying(100) NOT NULL,
    sg_uf character(2) NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_ufs OWNER TO postgres;

--
-- Name: tb_ufs_sq_uf_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tb_ufs_sq_uf_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_ufs_sq_uf_seq OWNER TO postgres;

--
-- Name: tb_ufs_sq_uf_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_ufs_sq_uf_seq OWNED BY tb_ufs.sq_uf;


--
-- Name: tb_ufs_sq_uf_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_ufs_sq_uf_seq', 27, true);


--
-- Name: tb_usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_usuarios (
    sq_usuario integer NOT NULL,
    sq_perfil integer NOT NULL,
    sq_municipio integer NOT NULL,
    nm_usuario character varying(100) NOT NULL,
    nu_cpf character varying(11) NOT NULL,
    tx_senha text NOT NULL,
    tx_email character varying(100) NOT NULL,
    tx_endereco character varying(100) NOT NULL,
    nu_cep character varying(8) NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_usuarios OWNER TO postgres;

--
-- Name: tb_usuarios_sq_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tb_usuarios_sq_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_usuarios_sq_usuario_seq OWNER TO postgres;

--
-- Name: tb_usuarios_sq_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_usuarios_sq_usuario_seq OWNED BY tb_usuarios.sq_usuario;


--
-- Name: tb_usuarios_sq_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_usuarios_sq_usuario_seq', 26, true);


--
-- Name: sq_atividade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_atividades ALTER COLUMN sq_atividade SET DEFAULT nextval('tb_atividades_sq_atividade_seq'::regclass);


--
-- Name: sq_favorito; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_favoritos ALTER COLUMN sq_favorito SET DEFAULT nextval('tb_favoritos_sq_favorito_seq'::regclass);


--
-- Name: sq_historico_atividade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_historico_atividades ALTER COLUMN sq_historico_atividade SET DEFAULT nextval('tb_historico_atividades_sq_historico_atividade_seq'::regclass);


--
-- Name: sq_municipio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_municipios ALTER COLUMN sq_municipio SET DEFAULT nextval('tb_municipios_sq_municipio_seq'::regclass);


--
-- Name: sq_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_pedidos ALTER COLUMN sq_pedido SET DEFAULT nextval('tb_pedidos_sq_pedido_seq'::regclass);


--
-- Name: sq_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_perfil ALTER COLUMN sq_perfil SET DEFAULT nextval('tb_perfil_sq_perfil_seq'::regclass);


--
-- Name: sq_produto_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_produto_pedido ALTER COLUMN sq_produto_pedido SET DEFAULT nextval('tb_produto_pedido_sq_produto_pedido_seq'::regclass);


--
-- Name: sq_produto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_produtos ALTER COLUMN sq_produto SET DEFAULT nextval('tb_produtos_sq_produto_seq'::regclass);


--
-- Name: sq_status; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_status ALTER COLUMN sq_status SET DEFAULT nextval('tb_status_sq_status_seq'::regclass);


--
-- Name: sq_telefone; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_telefones ALTER COLUMN sq_telefone SET DEFAULT nextval('tb_telefones_sq_telefone_seq'::regclass);


--
-- Name: sq_uf; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_ufs ALTER COLUMN sq_uf SET DEFAULT nextval('tb_ufs_sq_uf_seq'::regclass);


--
-- Name: sq_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_usuarios ALTER COLUMN sq_usuario SET DEFAULT nextval('tb_usuarios_sq_usuario_seq'::regclass);


--
-- Data for Name: tb_atividades; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tb_favoritos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (5, 9, 23, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (6, 9, 20, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (8, 10, 26, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (7, 1, 23, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (22, 1, 11, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (21, 1, 17, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (12, 1, 22, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (24, 1, 29, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (11, 1, 28, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (13, 1, 15, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (14, 1, 12, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (15, 1, 9, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (2, 1, 20, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (4, 1, 27, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (10, 1, 14, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (16, 1, 16, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (18, 26, 14, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (17, 26, 21, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (19, 26, 23, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (20, 26, 27, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (3, 1, 26, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (25, 1, 30, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (23, 1, 10, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (26, 1, 31, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (1, 1, 25, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (27, 1, 32, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (28, 1, 33, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (30, 1, 35, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (31, 1, 36, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (32, 1, 37, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (33, 1, 38, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (34, 1, 39, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (35, 1, 40, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (36, 1, 41, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (37, 1, 42, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (38, 1, 43, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (39, 1, 44, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (29, 1, 34, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (9, 1, 21, true);


--
-- Data for Name: tb_historico_atividades; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tb_municipios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1, 1, 'Recanto das Emas', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5539, 9, 'SAO MIGUEL DO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5538, 9, 'SAO LUIZ DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5536, 9, 'SAO JOAO DA PARAUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5535, 9, 'SAO JOAO D''ALIANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5534, 9, 'SAO FRANCISCO DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5537, 9, 'SAO LUIS DE MONTES BELOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5544, 9, 'SERRANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5533, 9, 'SAO DOMINGOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5532, 9, 'SANTO ANTONIO DO DESCOBERTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5531, 9, 'SANTO ANTONIO DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5530, 9, 'SANTO ANTONIO DA BARRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5529, 9, 'SANTA TEREZINHA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5528, 9, 'SANTA TEREZA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5526, 9, 'SANTA RITA DO NOVO DESTINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5525, 9, 'SANTA RITA DO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5524, 9, 'SANTA ISABEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5523, 9, 'SANTA HELENA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5522, 9, 'SANTA FE DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5521, 9, 'SANTA CRUZ DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5520, 9, 'SANTA BARBARA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5519, 9, 'SANCLERLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5518, 9, 'RUBIATABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5517, 9, 'RIO VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5516, 9, 'RIO QUENTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5515, 9, 'RIANAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5514, 9, 'RIALMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5513, 9, 'QUIRINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5512, 9, 'PROFESSOR JAMIL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5511, 9, 'POSSE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5510, 9, 'PORTELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5509, 9, 'PORTEIRAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5508, 9, 'PORANGATU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5507, 9, 'PONTALINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5506, 9, 'PLANALTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5504, 9, 'PIRENOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5503, 9, 'PIRANHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5502, 9, 'PIRACANJUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5501, 9, 'PILAR DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5500, 9, 'PETROLINA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5499, 9, 'PEROLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5498, 9, 'PARAUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5497, 9, 'PARANAIGUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5496, 9, 'PANAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5495, 9, 'PALMINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5494, 9, 'PALMELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5493, 9, 'PALMEIRAS DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5492, 9, 'PALESTINA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5491, 9, 'PADRE BERNARDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5490, 9, 'OUVIDOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5489, 9, 'OURO VERDE DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5488, 9, 'ORIZONA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5487, 9, 'NOVO PLANALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5486, 9, 'NOVO GAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5485, 9, 'NOVO BRASIL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5484, 9, 'NOVA VENEZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5483, 9, 'NOVA ROMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5482, 9, 'NOVA IGUACU DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5481, 9, 'NOVA GLORIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5480, 9, 'NOVA CRIXAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5479, 9, 'NOVA AURORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5477, 9, 'NIQUELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5476, 9, 'NEROPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5475, 9, 'NAZARIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5474, 9, 'MUTUNOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5473, 9, 'MUNDO NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5472, 9, 'MOZARLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5471, 9, 'MOSSAMEDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5470, 9, 'MORRO AGUDO DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5469, 9, 'MORRINHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5468, 9, 'MONTIVIDIU DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5467, 9, 'MONTIVIDIU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5466, 9, 'MONTES CLAROS DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5465, 9, 'MONTE ALEGRE DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5464, 9, 'MOIPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5463, 9, 'MINEIROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5462, 9, 'MINACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5461, 9, 'MIMOSO DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5460, 9, 'MAURILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5459, 9, 'MATRINCHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5458, 9, 'MARZAGAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5457, 9, 'MARA ROSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5456, 9, 'MAMBAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5455, 9, 'MAIRIPOTABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5454, 9, 'LUZIANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5453, 9, 'LEOPOLDO DE BULHOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5452, 9, 'LAGOA SANTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5451, 9, 'JUSSARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5450, 9, 'JOVIANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5449, 9, 'JESUPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5448, 9, 'JAUPACI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5447, 9, 'JATAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5446, 9, 'JARAGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5445, 9, 'JANDAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5444, 9, 'IVOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5443, 9, 'ITUMBIARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5442, 9, 'ITAUCU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5441, 9, 'ITARUMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5527, 9, 'SANTA ROSA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5554, 9, 'TURVANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5440, 9, 'ITAPURANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5439, 9, 'ITAPIRAPUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5438, 9, 'ITAPACI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5437, 9, 'ITAJA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5436, 9, 'ITAGUARU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5435, 9, 'ITAGUARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5434, 9, 'ITABERAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5433, 9, 'ISRAELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5432, 9, 'IPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5431, 9, 'IPIRANGA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5430, 9, 'IPAMERI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5429, 9, 'INHUMAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5428, 9, 'INDIARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5427, 9, 'INACIOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5426, 9, 'IACIARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5425, 9, 'HIDROLINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5424, 9, 'HIDROLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5422, 9, 'GUARINOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5421, 9, 'GUARANI DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5420, 9, 'GUARAITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5419, 9, 'GUAPO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5418, 9, 'GOUVELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5417, 9, 'GOIATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5416, 9, 'GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5415, 9, 'GOIANIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5414, 9, 'GOIANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5413, 9, 'GOIANESIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5412, 9, 'GOIANDIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5411, 9, 'GOIANAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5410, 9, 'DIVINOPOLIS DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5409, 9, 'GAMELEIRA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5408, 9, 'FORMOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5407, 9, 'FORMOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5406, 9, 'FLORES DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5405, 9, 'FIRMINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5404, 9, 'FAZENDA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5403, 9, 'FAINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5402, 9, 'ESTRELA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5401, 9, 'EDEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5399, 9, 'DOVERLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5398, 9, 'DIORAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5397, 9, 'DAVINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5396, 9, 'DAMOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5395, 9, 'DAMIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5394, 9, 'CUMARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5393, 9, 'CROMINIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5392, 9, 'CRIXAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5391, 9, 'CRISTIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5390, 9, 'CRISTALINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5389, 9, 'CORUMBAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5388, 9, 'CORUMBA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5387, 9, 'CORREGO DO OURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5386, 9, 'COLINAS DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5385, 9, 'COCALZINHO DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5384, 9, 'CIDADE OCIDENTAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5383, 9, 'CHAPADAO DO CEU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5382, 9, 'CEZARINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5381, 9, 'CERES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5380, 9, 'CAVALCANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5379, 9, 'CATURAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5378, 9, 'CATALAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5377, 9, 'CASTELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5376, 9, 'CARMO DO RIO VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5375, 9, 'CAMPOS VERDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5374, 9, 'CAMPOS BELOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5373, 9, 'CAMPO LIMPO DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5372, 9, 'CAMPO ALEGRE DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5371, 9, 'CAMPINORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5370, 9, 'CAMPINACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5369, 9, 'CAMPESTRE DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5368, 9, 'CALDAZINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5367, 9, 'CALDAS NOVAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5366, 9, 'CAIAPONIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5365, 9, 'CACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5364, 9, 'CACHOEIRA DOURADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5363, 9, 'CACHOEIRA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5362, 9, 'CACHOEIRA ALTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5361, 9, 'CABECEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5360, 9, 'BURITINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5359, 9, 'BURITI DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5358, 9, 'BURITI ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5357, 9, 'BRITANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5356, 9, 'BRAZABRANTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5355, 9, 'BONOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5354, 9, 'BONFINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5353, 9, 'BOM JESUS DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5352, 9, 'BOM JARDIM DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5351, 9, 'BELA VISTA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5350, 9, 'BARRO ALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5349, 9, 'BALIZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5348, 9, 'AVELINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5347, 9, 'AURILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5346, 9, 'ARUANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5345, 9, 'ARENOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5344, 9, 'ARAGUAPAZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5343, 9, 'ARAGOIANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5342, 9, 'ARAGARCAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5341, 9, 'ARACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5340, 9, 'APORE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5339, 9, 'APARECIDA DO RIO DOCE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5338, 9, 'APARECIDA DE GOIANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5337, 9, 'ANICUNS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5336, 9, 'ANHANGUERA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5335, 9, 'ANAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5334, 9, 'AMORINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5333, 9, 'AMERICANO DO BRASIL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5332, 9, 'AMARALINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5331, 9, 'ALVORADA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5505, 9, 'PIRES DO RIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5330, 9, 'ALTO PARAISO DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5329, 9, 'ALTO HORIZONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5328, 9, 'ALOANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5327, 9, 'ALEXANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5326, 9, 'AGUAS LINDAS DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5325, 9, 'AGUA LIMPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5324, 9, 'AGUA FRIA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5323, 9, 'ADELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5322, 9, 'ACREUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5321, 9, 'ABADIANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5320, 9, 'ABADIA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3174, 8, 'VITORIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3173, 8, 'VILA VELHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3172, 8, 'VILA VALERIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3171, 8, 'VILA PAVAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3170, 8, 'VIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3169, 8, 'VENDA NOVA DO IMIGRANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3168, 8, 'VARGEM ALTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3167, 8, 'SOORETAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3166, 8, 'SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3165, 8, 'SAO ROQUE DO CANAA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3164, 8, 'SAO MATEUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3163, 8, 'SAO JOSE DO CALCADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3162, 8, 'SAO GABRIEL DA PALHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3161, 8, 'SAO DOMINGOS DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3160, 8, 'SANTA TERESA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3159, 8, 'SANTA MARIA DE JETIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3158, 8, 'SANTA LEOPOLDINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3157, 8, 'RIO NOVO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3156, 8, 'RIO BANANAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3155, 8, 'PRESIDENTE KENNEDY', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3154, 8, 'PONTO BELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3153, 8, 'PIUMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3152, 8, 'PINHEIROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3151, 8, 'PEDRO CANARIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3150, 8, 'PANCAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3149, 8, 'NOVA VENECIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5423, 9, 'HEITORAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3148, 8, 'MUQUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3147, 8, 'MUNIZ FREIRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3146, 8, 'MUCURICI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3145, 8, 'MONTANHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3144, 8, 'MIMOSO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3143, 8, 'MARILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3142, 8, 'MARECHAL FLORIANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3141, 8, 'MARATAIZES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3140, 8, 'MANTENOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3139, 8, 'LINHARES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3138, 8, 'LARANJA DA TERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3137, 8, 'JOAO NEIVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3136, 8, 'JERONIMO MONTEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3135, 8, 'JAGUARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3134, 8, 'IUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3133, 8, 'ITARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3132, 8, 'ITAPEMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3131, 8, 'ITAGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3130, 8, 'IRUPI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3129, 8, 'ICONHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3128, 8, 'IBITIRAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3127, 8, 'IBIRACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3126, 8, 'IBATIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3125, 8, 'GUARAPARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3124, 8, 'GUACUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3123, 8, 'GOVERNADOR LINDENBERG', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3122, 8, 'FUNDAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3121, 8, 'ECOPORANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3120, 8, 'DORES DO RIO PRETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3119, 8, 'DOMINGOS MARTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3118, 8, 'DIVINO DE SAO LOURENCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3117, 8, 'CONCEICAO DO CASTELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3116, 8, 'CONCEICAO DA BARRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3115, 8, 'COLATINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3114, 8, 'CASTELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3113, 8, 'CARIACICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3112, 8, 'CACHOEIRO DE ITAPEMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5478, 9, 'NOVA AMERICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5400, 9, 'EDEALINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5565, 9, 'VILA PROPICIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5564, 9, 'VILA BOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5563, 9, 'VICENTINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5562, 9, 'VIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5561, 9, 'VARJAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5560, 9, 'VALPARAISO DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5559, 9, 'URUTAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5558, 9, 'URUANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5557, 9, 'URUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5556, 9, 'UIRAPURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5555, 9, 'TURVELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5553, 9, 'TROMBAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5552, 9, 'TRINDADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5551, 9, 'TRES RANCHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5550, 9, 'TEREZOPOLIS DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5549, 9, 'TERESINA DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5548, 9, 'TAQUARAL DE GOIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5547, 9, 'SITIO D''ABADIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5546, 9, 'SIMOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5545, 9, 'SILVANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5543, 9, 'SENADOR CANEDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5542, 9, 'SAO SIMAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5541, 9, 'SAO PATRICIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5540, 9, 'SAO MIGUEL DO PASSA QUATRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3111, 8, 'BREJETUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3110, 8, 'BOM JESUS DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3109, 8, 'BOA ESPERANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3108, 8, 'BARRA DE SAO FRANCISCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3107, 8, 'BAIXO GUANDU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3106, 8, 'ATILIO VIVACQUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3105, 8, 'ARACRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3104, 8, 'APIACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3103, 8, 'ANCHIETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3102, 8, 'ALTO RIO NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3101, 8, 'ALFREDO CHAVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3100, 8, 'ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3099, 8, 'AGUA DOCE DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3098, 8, 'AGUIA BRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3097, 8, 'AFONSO CLAUDIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5597, 7, 'VICENTE PIRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5596, 7, 'SETOR DE INDUSTRIA E ABASTECIMENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5595, 7, 'SUDOESTE/OCTOGONAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5594, 7, 'JARDIM BOTANICO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5593, 7, 'SCIA-ESTRUTURAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5592, 7, 'ITAPOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5591, 7, 'VARJAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5590, 7, 'SOBRADINHO II', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5589, 7, 'RIACHO FUNDO II', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5588, 7, 'PARK WAY', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5587, 7, 'AGUAS CLARAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5586, 7, 'TAGUATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5585, 7, 'SOBRADINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5584, 7, 'SAO SEBASTIAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5583, 7, 'SANTA MARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5582, 7, 'SAMAMBAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5581, 7, 'RIACHO FUNDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5580, 7, 'RECANTO DAS EMAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5579, 7, 'PLANALTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5578, 7, 'PARANOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5577, 7, 'NUCLEO BANDEIRANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5576, 7, 'LAGO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5575, 7, 'LAGO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5574, 7, 'GUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5573, 7, 'GAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5572, 7, 'CRUZEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5571, 7, 'CEILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5570, 7, 'CANDANGOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5569, 7, 'BRAZLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5568, 7, 'BRASILIA - ASA SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5567, 7, 'BRASILIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5566, 7, 'BRASILIA - ASA NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (999, 6, 'MAURITI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (998, 6, 'MASSAPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (997, 6, 'MARTINOPOLE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (996, 6, 'MARCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (995, 6, 'MARANGUAPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (994, 6, 'MARACANAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (993, 6, 'MADALENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (992, 6, 'LIMOEIRO DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (991, 6, 'LAVRAS DA MANGABEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (990, 6, 'JUCAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (989, 6, 'JUAZEIRO DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (988, 6, 'JIJOCA DE JERICOACOARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (987, 6, 'JATI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (986, 6, 'JARDIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (985, 6, 'JAGUARUANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (984, 6, 'JAGUARIBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (983, 6, 'JAGUARIBARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (982, 6, 'JAGUARETAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (981, 6, 'ITATIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (980, 6, 'ITAREMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (979, 6, 'ITAPIUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (978, 6, 'ITAPIPOCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (977, 6, 'ITAPAGE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (976, 6, 'ITAITINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (975, 6, 'ITAICABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (974, 6, 'IRAUCUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (973, 6, 'IRACEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (972, 6, 'IPUEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (971, 6, 'IPU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (970, 6, 'IPAUMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (969, 6, 'IPAPORANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (968, 6, 'INDEPENDENCIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (967, 6, 'IGUATU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (966, 6, 'ICO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (965, 6, 'ICAPUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (964, 6, 'IBICUITINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (963, 6, 'IBIAPINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (962, 6, 'IBARETAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (961, 6, 'HORIZONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (960, 6, 'HIDROLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (959, 6, 'GUARAMIRANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (958, 6, 'GUARACIABA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (957, 6, 'GUAIUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (956, 6, 'GROAIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (955, 6, 'GRANJEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (954, 6, 'GRANJA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (953, 6, 'GRACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (952, 6, 'GENERAL SAMPAIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (951, 6, 'FRECHEIRINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (950, 6, 'FORTIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (949, 6, 'FORTALEZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (948, 6, 'FORQUILHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (947, 6, 'FARIAS BRITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (946, 6, 'EUSEBIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (945, 6, 'ERERE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (944, 6, 'DEPUTADO IRAPUAN PINHEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (943, 6, 'CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (942, 6, 'CROATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (941, 6, 'CRATO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (940, 6, 'CRATEUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (939, 6, 'COREAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (938, 6, 'CHOROZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (937, 6, 'CHORO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (936, 6, 'CHAVAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (935, 6, 'CEDRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (934, 6, 'CAUCAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (933, 6, 'CATUNDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (932, 6, 'CATARINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (931, 6, 'CASCAVEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (930, 6, 'CARNAUBAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (929, 6, 'CARIUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (928, 6, 'CARIRIACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (927, 6, 'CARIRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (926, 6, 'CARIDADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (925, 6, 'CAPISTRANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (924, 6, 'CANINDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (923, 6, 'CAMPOS SALES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (922, 6, 'CAMOCIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (921, 6, 'BREJO SANTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (920, 6, 'BOA VIAGEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (919, 6, 'BELA CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (918, 6, 'BEBERIBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (917, 6, 'BATURITE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (916, 6, 'BARROQUINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (915, 6, 'BARRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (914, 6, 'BARREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (913, 6, 'BARBALHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (912, 6, 'BANABUIU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (911, 6, 'BAIXIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (910, 6, 'AURORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (909, 6, 'ASSARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (908, 6, 'ARNEIROZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (907, 6, 'ARATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (906, 6, 'ARARIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (905, 6, 'ARARENDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (904, 6, 'ARACOIABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (903, 6, 'ARACATI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (902, 6, 'AQUIRAZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (901, 6, 'APUIARES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (900, 6, 'ANTONINA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (899, 6, 'AMONTADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (898, 6, 'ALTO SANTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (897, 6, 'ALTANEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (896, 6, 'ALCANTARAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (895, 6, 'AIUABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (894, 6, 'ACOPIARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (893, 6, 'ACARAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (892, 6, 'ACARAPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (891, 6, 'ABAIARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1074, 6, 'VICOSA DO CEARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1073, 6, 'VARZEA ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1072, 6, 'VARJOTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1071, 6, 'URUOCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1070, 6, 'URUBURETAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1069, 6, 'UMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1068, 6, 'UMARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1067, 6, 'UBAJARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1066, 6, 'TURURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1065, 6, 'TRAIRI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1064, 6, 'TIANGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1063, 6, 'TEJUCUOCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1062, 6, 'TAUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1061, 6, 'TARRAFAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1060, 6, 'TAMBORIL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1059, 6, 'TABULEIRO DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1058, 6, 'SOLONOPOLE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1057, 6, 'SOBRAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1056, 6, 'SENADOR SA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1055, 6, 'SENADOR POMPEU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1054, 6, 'SAO LUIS DO CURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1053, 6, 'SAO JOAO DO JAGUARIBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1052, 6, 'SAO GONCALO DO AMARANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1051, 6, 'SAO BENEDITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1050, 6, 'SANTA QUITERIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1049, 6, 'SANTANA DO CARIRI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1048, 6, 'SANTANA DO ACARAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1047, 6, 'SALITRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1046, 6, 'SABOEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1045, 6, 'RUSSAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1044, 6, 'RERIUTABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1043, 6, 'REDENCAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1042, 6, 'QUIXERE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1041, 6, 'QUIXERAMOBIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1040, 6, 'QUIXELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1039, 6, 'QUIXADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1038, 6, 'QUITERIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1037, 6, 'POTIRETAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1036, 6, 'POTENGI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1035, 6, 'PORTEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1034, 6, 'PORANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1033, 6, 'PIRES FERREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1032, 6, 'PIQUET CARNEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1031, 6, 'PINDORETAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1030, 6, 'PEREIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1029, 6, 'PENTECOSTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1028, 6, 'PENAFORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1027, 6, 'PEDRA BRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1026, 6, 'PARAMOTI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1025, 6, 'PARAMBU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1024, 6, 'PARAIPABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1023, 6, 'PARACURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1022, 6, 'PALMACIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1021, 6, 'PALHANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1020, 6, 'PACUJA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1019, 6, 'PACOTI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1018, 6, 'PACATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1017, 6, 'PACAJUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1016, 6, 'OROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1015, 6, 'OCARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1014, 6, 'NOVO ORIENTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1013, 6, 'NOVA RUSSAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1012, 6, 'NOVA OLINDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1011, 6, 'MULUNGU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1010, 6, 'MUCAMBO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1009, 6, 'MORRINHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1008, 6, 'MORAUJO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1007, 6, 'MORADA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1006, 6, 'MONSENHOR TABOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1005, 6, 'MOMBACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1004, 6, 'MISSAO VELHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1003, 6, 'MIRAIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1002, 6, 'MILHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1001, 6, 'MILAGRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1000, 6, 'MERUOCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2243, 5, 'XIQUE-XIQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2242, 5, 'WENCESLAU GUIMARAES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2241, 5, 'WANDERLEY', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2240, 5, 'WAGNER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2239, 5, 'VITORIA DA CONQUISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2238, 5, 'VEREDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2237, 5, 'VERA CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2236, 5, 'VARZEDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2235, 5, 'VARZEA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2234, 5, 'VARZEA DO POCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2233, 5, 'VARZEA DA ROCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2232, 5, 'VALENTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2231, 5, 'VALENCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2230, 5, 'UTINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2229, 5, 'URUCUCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2228, 5, 'URANDI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2227, 5, 'UNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2226, 5, 'UMBURANAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2225, 5, 'UIBAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2224, 5, 'UBATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2223, 5, 'UBAITABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2222, 5, 'UBAIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2221, 5, 'UAUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2220, 5, 'TUCANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2219, 5, 'TREMEDAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2218, 5, 'TERRA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2217, 5, 'TEOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2216, 5, 'TEOFILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2215, 5, 'TEODORO SAMPAIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2214, 5, 'TEIXEIRA DE FREITAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2213, 5, 'TAPIRAMUTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2212, 5, 'TAPEROA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2211, 5, 'TANQUINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2210, 5, 'TANQUE NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2209, 5, 'TANHACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2208, 5, 'TABOCAS DO BREJO VELHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2207, 5, 'SOUTO SOARES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2206, 5, 'SOBRADINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2205, 5, 'SITIO DO QUINTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2204, 5, 'SITIO DO MATO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2203, 5, 'SIMOES FILHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2202, 5, 'SERROLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2201, 5, 'SERRINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2200, 5, 'SERRA PRETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2199, 5, 'SERRA DOURADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2198, 5, 'SENTO SE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2197, 5, 'SERRA DO RAMALHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2196, 5, 'SENHOR DO BONFIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2195, 5, 'SEBASTIAO LARANJEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2194, 5, 'SEABRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2193, 5, 'SAUDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2192, 5, 'SAUBARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2191, 5, 'SATIRO DIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2190, 5, 'SAPEACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2189, 5, 'SAO SEBASTIAO DO PASSE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2188, 5, 'SAO MIGUEL DAS MATAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2187, 5, 'SAO JOSE DO JACUIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2186, 5, 'SAO JOSE DA VITORIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2185, 5, 'SAO GONCALO DOS CAMPOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2184, 5, 'SAO GABRIEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2183, 5, 'SAO FRANCISCO DO CONDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2182, 5, 'SAO FELIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2181, 5, 'SAO FELIX DO CORIBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2180, 5, 'SAO FELIX', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2179, 5, 'SAO DOMINGOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2178, 5, 'SAO DESIDERIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2177, 5, 'SANTO ESTEVAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2176, 5, 'SANTO ANTONIO DE JESUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2175, 5, 'SANTO AMARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2174, 5, 'SANTA TERESINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2173, 5, 'SANTA RITA DE CASSIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2172, 5, 'SANTANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2171, 5, 'SANTANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2170, 5, 'SANTA MARIA DA VITORIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2169, 5, 'SANTA LUZIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2168, 5, 'SANTALUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2167, 5, 'SANTA INES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2166, 5, 'SANTA CRUZ DA VITORIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2165, 5, 'SANTA CRUZ CABRALIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2164, 5, 'SANTA BRIGIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2163, 5, 'SANTA BARBARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2162, 5, 'SALVADOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2161, 5, 'SALINAS DA MARGARIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2160, 5, 'RUY BARBOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2159, 5, 'RODELAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2158, 5, 'RIO REAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2157, 5, 'RIO DO PIRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2156, 5, 'RIO DO ANTONIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2155, 5, 'RIO DE CONTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2154, 5, 'RIBEIRAO DO LARGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2153, 5, 'RIBEIRA DO POMBAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2152, 5, 'RIBEIRA DO AMPARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2151, 5, 'RIACHO DE SANTANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2150, 5, 'RIACHAO DO JACUIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2149, 5, 'RIACHAO DAS NEVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2148, 5, 'RETIROLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2147, 5, 'REMANSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2146, 5, 'RAFAEL JAMBEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2145, 5, 'QUIXABEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2144, 5, 'QUIJINGUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2143, 5, 'QUEIMADAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2142, 5, 'PRESIDENTE TANCREDO NEVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2141, 5, 'PRESIDENTE JANIO QUADROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2140, 5, 'PRESIDENTE DUTRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2139, 5, 'PRADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2138, 5, 'POTIRAGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2137, 5, 'PORTO SEGURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2136, 5, 'PONTO NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2135, 5, 'POJUCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2134, 5, 'POCOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2133, 5, 'PLANALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2132, 5, 'PLANALTINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2131, 5, 'PIRITIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2130, 5, 'PIRIPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2129, 5, 'PIRAI DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2128, 5, 'PINTADAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2127, 5, 'PINDOBACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2126, 5, 'PINDAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2125, 5, 'PILAO ARCADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2124, 5, 'PIATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2123, 5, 'PEDRO ALEXANDRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2122, 5, 'PEDRAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2121, 5, 'PE DE SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2120, 5, 'PAULO AFONSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2119, 5, 'PAU BRASIL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2118, 5, 'PARIPIRANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2117, 5, 'PARATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2116, 5, 'PARAMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2115, 5, 'PALMEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2114, 5, 'PALMAS DE MONTE ALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2113, 5, 'OUROLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2112, 5, 'OURICANGAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2111, 5, 'OLIVEIRA DOS BREJINHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2110, 5, 'OLINDINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2109, 5, 'NOVO TRIUNFO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2108, 5, 'NOVO HORIZONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2107, 5, 'NOVA VICOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2106, 5, 'NOVA SOURE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2105, 5, 'NOVA REDENCAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2104, 5, 'NOVA ITARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2103, 5, 'NOVA IBIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2102, 5, 'NOVA FATIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2101, 5, 'NOVA CANAA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2100, 5, 'NORDESTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2099, 5, 'NILO PECANHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2098, 5, 'NAZARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2097, 5, 'MUTUIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2096, 5, 'MURITIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2095, 5, 'MUQUEM DE SAO FRANCISCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2094, 5, 'MUNIZ FERREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2093, 5, 'MUNDO NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2092, 5, 'MULUNGU DO MORRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2091, 5, 'MUCURI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2090, 5, 'MUCUGE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2089, 5, 'MORTUGABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2088, 5, 'MORRO DO CHAPEU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2087, 5, 'MORPARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2086, 5, 'MONTE SANTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2085, 5, 'MIRANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2084, 5, 'MIRANGABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2083, 5, 'MILAGRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2082, 5, 'MIGUEL CALMON', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2081, 5, 'MEDEIROS NETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2080, 5, 'MATINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2079, 5, 'MATA DE SAO JOAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2078, 5, 'MASCOTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2077, 5, 'MARCIONILIO SOUZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2076, 5, 'MARAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2075, 5, 'MARAGOGIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2074, 5, 'MARACAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2073, 5, 'MANSIDAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2072, 5, 'MANOEL VITORINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2071, 5, 'MALHADA DE PEDRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2070, 5, 'MALHADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2069, 5, 'MAIRI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2068, 5, 'MAIQUINIQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2067, 5, 'MAETINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2066, 5, 'MADRE DE DEUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2065, 5, 'MACURURE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2064, 5, 'MACAUBAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2063, 5, 'MACARANI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2062, 5, 'MACAJUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2061, 5, 'LUIS EDUARDO MAGALHAES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2060, 5, 'LIVRAMENTO DE NOSSA SENHORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2059, 5, 'LICINIO DE ALMEIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2058, 5, 'LENCOIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2057, 5, 'LAURO DE FREITAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2056, 5, 'LAPAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2055, 5, 'LAMARAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2054, 5, 'LAJEDO DO TABOCAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2053, 5, 'LAJEDINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2052, 5, 'LAJEDAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2051, 5, 'LAJE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2050, 5, 'LAGOA REAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2049, 5, 'LAFAIETE COUTINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2048, 5, 'JUSSIAPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2047, 5, 'JUSSARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2046, 5, 'JUSSARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2045, 5, 'JUCURUCU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2044, 5, 'JUAZEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2043, 5, 'JOAO DOURADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2042, 5, 'JITAUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2041, 5, 'JIQUIRICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2040, 5, 'JEREMOABO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2039, 5, 'JEQUIE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2038, 5, 'JANDAIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2037, 5, 'JAGUARIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2036, 5, 'JAGUARARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2035, 5, 'JAGUAQUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2034, 5, 'JACOBINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2033, 5, 'JACARACI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2032, 5, 'JABORANDI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2031, 5, 'IUIU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2030, 5, 'ITUBERA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2029, 5, 'ITUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2028, 5, 'ITORORO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2027, 5, 'ITIUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2026, 5, 'ITIRUCU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2025, 5, 'ITATIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2024, 5, 'ITARANTIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2023, 5, 'ITAQUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2022, 5, 'ITAPITANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2021, 5, 'ITAPICURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2020, 5, 'ITAPETINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2019, 5, 'ITAPEBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2018, 5, 'ITAPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2017, 5, 'ITAPARICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2016, 5, 'ITANHEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2015, 5, 'ITANAGRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2014, 5, 'ITAMBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2013, 5, 'ITAMARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2012, 5, 'ITAMARAJU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2011, 5, 'ITAJUIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2010, 5, 'ITAJU DO COLONIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2009, 5, 'ITAGUACU DA BAHIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2008, 5, 'ITAGIMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2007, 5, 'ITAGIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2006, 5, 'ITAGI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2005, 5, 'ITAETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2004, 5, 'ITACARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2003, 5, 'ITABUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2002, 5, 'ITABERABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2001, 5, 'ITABELA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2000, 5, 'IRECE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1999, 5, 'IRARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1998, 5, 'IRAQUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1997, 5, 'IRAMAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1996, 5, 'IRAJUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1995, 5, 'IPUPIARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1994, 5, 'IPIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1993, 5, 'IPIAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1992, 5, 'IPECAETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1991, 5, 'INHAMBUPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1990, 5, 'ILHEUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1989, 5, 'IGUAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1988, 5, 'IGRAPIUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1987, 5, 'IGAPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1986, 5, 'ICHU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1985, 5, 'IBOTIRAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1984, 5, 'IBITITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1983, 5, 'IBITIARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1982, 5, 'IBIRATAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1981, 5, 'IBIRAPUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1980, 5, 'IBIRAPITANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1979, 5, 'IBIQUERA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1978, 5, 'IBIPITANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1977, 5, 'IBIPEBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1976, 5, 'IBICUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1975, 5, 'IBICOARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1974, 5, 'IBICARAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1973, 5, 'IBIASSUCE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1972, 5, 'IACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1971, 5, 'HELIOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1970, 5, 'GUARATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1969, 5, 'GUANAMBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1968, 5, 'GUAJERU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1967, 5, 'GOVERNADOR MANGABEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1966, 5, 'GONGOGI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1965, 5, 'GLORIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1964, 5, 'GENTIO DO OURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1963, 5, 'GAVIAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1962, 5, 'GANDU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1961, 5, 'FORMOSA DO RIO PRETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1960, 5, 'FLORESTA AZUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1959, 5, 'FIRMINO ALVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1958, 5, 'FILADELFIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1957, 5, 'FEIRA DE SANTANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1956, 5, 'FEIRA DA MATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1955, 5, 'FATIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1954, 5, 'EUNAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1953, 5, 'EUCLIDES DA CUNHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1952, 5, 'ESPLANADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1951, 5, 'ENTRE RIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1950, 5, 'ENCRUZILHADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1949, 5, 'ELISIO MEDRADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1948, 5, 'DOM MACEDO COSTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1947, 5, 'DOM BASILIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1946, 5, 'DIAS D''AVILA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1945, 5, 'DARIO MEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1944, 5, 'CURACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1943, 5, 'CRUZ DAS ALMAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1942, 5, 'CRISTOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1941, 5, 'CRISOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1940, 5, 'CRAVOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1939, 5, 'COTEGIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1938, 5, 'CORRENTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1937, 5, 'CORONEL JOAO SA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1936, 5, 'CORIBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1935, 5, 'CORDEIROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1934, 5, 'CORACAO DE MARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1933, 5, 'CONTENDAS DO SINCORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1932, 5, 'CONDEUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1931, 5, 'CONDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1930, 5, 'CONCEICAO DO JACUIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1929, 5, 'CONCEICAO DO COITE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1928, 5, 'CONCEICAO DO ALMEIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1927, 5, 'CONCEICAO DA FEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1926, 5, 'COCOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1925, 5, 'COARACI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1924, 5, 'CIPO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1923, 5, 'CICERO DANTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1922, 5, 'CHORROCHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1921, 5, 'CENTRAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1920, 5, 'CATURAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1919, 5, 'CATU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1918, 5, 'CATOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1917, 5, 'CASTRO ALVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1916, 5, 'CASA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1915, 5, 'CARINHANHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1914, 5, 'CARDEAL DA SILVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1913, 5, 'CARAVELAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1912, 5, 'CARAIBAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1911, 5, 'CAPIM GROSSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1910, 5, 'CAPELA DO ALTO ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1909, 5, 'CANUDOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1908, 5, 'CANSANCAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1907, 5, 'CANDIDO SALES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1906, 5, 'CANDIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1905, 5, 'CANDEIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1904, 5, 'CANDEAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1903, 5, 'CANAVIEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1902, 5, 'CANARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1901, 5, 'CANAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1900, 5, 'CAMPO FORMOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1899, 5, 'CAMPO ALEGRE DE LOURDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1898, 5, 'CAMAMU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1897, 5, 'CAMACARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1896, 5, 'CAMACAN', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1895, 5, 'CALDEIRAO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1894, 5, 'CAIRU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1893, 5, 'CAFARNAUM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1892, 5, 'CAETITE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1891, 5, 'CAETANOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1890, 5, 'CAEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1889, 5, 'CACULE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1888, 5, 'CACHOEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1887, 5, 'CABACEIRAS DO PARAGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1886, 5, 'CAATIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1885, 5, 'BURITIRAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1884, 5, 'BUERAREMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1883, 5, 'BRUMADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1882, 5, 'BROTAS DE MACAUBAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1881, 5, 'BREJOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1880, 5, 'BREJOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1879, 5, 'BOTUPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1878, 5, 'BOQUIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1877, 5, 'BONITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1876, 5, 'BONINAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1875, 5, 'BOM JESUS DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1874, 5, 'BOM JESUS DA LAPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1873, 5, 'BOA VISTA DO TUPIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1872, 5, 'BOA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1871, 5, 'BIRITINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1870, 5, 'BELO CAMPO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1869, 5, 'BELMONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1868, 5, 'BARRO PRETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1867, 5, 'BARROCAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1866, 5, 'BARRO ALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1865, 5, 'BARREIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1864, 5, 'BARRA DO ROCHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1863, 5, 'BARRA DO MENDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1862, 5, 'BARRA DO CHOCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1861, 5, 'BARRA DA ESTIVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1860, 5, 'BARRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1859, 5, 'BANZAE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1858, 5, 'BAIXA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1857, 5, 'BAIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1856, 5, 'AURELINO LEAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1855, 5, 'ARATUIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1854, 5, 'ARATACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1853, 5, 'ARAMARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1852, 5, 'ARACI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1851, 5, 'ARACAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1850, 5, 'ARACATU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1849, 5, 'APUAREMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1848, 5, 'APORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1847, 5, 'ANTONIO GONCALVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1846, 5, 'ANTONIO CARDOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1845, 5, 'ANTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1844, 5, 'ANGUERA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1843, 5, 'ANGICAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1842, 5, 'ANDORINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1841, 5, 'ANDARAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1840, 5, 'ANAGE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1839, 5, 'AMERICA DOURADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1838, 5, 'AMELIA RODRIGUES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1837, 5, 'AMARGOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1836, 5, 'ALMADINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1835, 5, 'ALCOBACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1834, 5, 'ALAGOINHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1833, 5, 'AIQUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1832, 5, 'ERICO CARDOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1831, 5, 'AGUA FRIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1830, 5, 'ADUSTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1829, 5, 'ACAJUTIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1828, 5, 'ABARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1827, 5, 'ABAIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (99, 4, 'GUAJARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (98, 4, 'FONTE BOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (97, 4, 'ENVIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (96, 4, 'EIRUNEPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (95, 4, 'CODAJAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (94, 4, 'COARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (93, 4, 'CAREIRO DA VARZEA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (92, 4, 'CAREIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (91, 4, 'CARAUARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (90, 4, 'CANUTAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (89, 4, 'CAAPIRANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (88, 4, 'BORBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (87, 4, 'BOCA DO ACRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (86, 4, 'BOA VISTA DO RAMOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (85, 4, 'BERURI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (84, 4, 'BENJAMIN CONSTANT', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (83, 4, 'BARREIRINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (82, 4, 'BARCELOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (81, 4, 'AUTAZES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (80, 4, 'ATALAIA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (79, 4, 'APUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (78, 4, 'ANORI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (77, 4, 'ANAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (76, 4, 'AMATURA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (75, 4, 'ALVARAES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (136, 4, 'URUCURITUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (135, 4, 'URUCARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (134, 4, 'UARINI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (133, 4, 'TONANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (132, 4, 'TEFE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (131, 4, 'TAPAUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (130, 4, 'TABATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (129, 4, 'SILVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (128, 4, 'SAO SEBASTIAO DO UATUMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (127, 4, 'SAO PAULO DE OLIVENCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (126, 4, 'SAO GABRIEL DA CACHOEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (125, 4, 'SANTO ANTONIO DO ICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (124, 4, 'SANTA ISABEL DO RIO NEGRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (123, 4, 'RIO PRETO DA EVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (122, 4, 'PRESIDENTE FIGUEIREDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (121, 4, 'PAUINI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (120, 4, 'PARINTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (119, 4, 'NOVO ARIPUANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (118, 4, 'NOVO AIRAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (117, 4, 'NOVA OLINDA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (116, 4, 'NHAMUNDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (115, 4, 'MAUES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (114, 4, 'MARAA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (113, 4, 'MANICORE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (112, 4, 'MANAUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (111, 4, 'MANAQUIRI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (110, 4, 'MANACAPURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (109, 4, 'LABREA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (108, 4, 'JUTAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (107, 4, 'JURUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (106, 4, 'JAPURA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (105, 4, 'ITAPIRANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (104, 4, 'ITAMARATI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (103, 4, 'ITACOATIARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (102, 4, 'IRANDUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (101, 4, 'IPIXUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (100, 4, 'HUMAITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (310, 3, 'VITORIA DO JARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (309, 3, 'TARTARUGALZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (308, 3, 'SANTANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (307, 3, 'PRACUUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (306, 3, 'PORTO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (305, 3, 'OIAPOQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (304, 3, 'MAZAGAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (303, 3, 'MACAPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (302, 3, 'LARANJAL DO JARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (301, 3, 'ITAUBAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (300, 3, 'FERREIRA GOMES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (299, 3, 'CUTIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (298, 3, 'CALCOENE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (297, 3, 'PEDRA BRANCA DO AMAPARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (296, 3, 'AMAPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (295, 3, 'SERRA DO NAVIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1751, 2, 'VICOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1750, 2, 'UNIAO DOS PALMARES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1749, 2, 'TRAIPU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1748, 2, 'TEOTONIO VILELA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1747, 2, 'TAQUARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1746, 2, 'TANQUE D''ARCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1745, 2, 'SENADOR RUI PALMEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1744, 2, 'SATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1743, 2, 'SAO SEBASTIAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1742, 2, 'SAO MIGUEL DOS MILAGRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1741, 2, 'SAO MIGUEL DOS CAMPOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1740, 2, 'SAO LUIS DO QUITUNDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1739, 2, 'SAO JOSE DA TAPERA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1738, 2, 'SAO JOSE DA LAJE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1737, 2, 'SAO BRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1736, 2, 'SANTANA DO MUNDAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1735, 2, 'SANTANA DO IPANEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1734, 2, 'SANTA LUZIA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1733, 2, 'ROTEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1732, 2, 'RIO LARGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1731, 2, 'QUEBRANGULO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1730, 2, 'PORTO REAL DO COLEGIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1729, 2, 'PORTO DE PEDRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1728, 2, 'PORTO CALVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1727, 2, 'POCO DAS TRINCHEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1726, 2, 'PIRANHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1725, 2, 'PINDOBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1724, 2, 'PILAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1723, 2, 'PIACABUCU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1722, 2, 'PENEDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1721, 2, 'PAULO JACINTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1720, 2, 'PASSO DE CAMARAGIBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1719, 2, 'PARIPUEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1718, 2, 'PARICONHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1717, 2, 'PAO DE ACUCAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1716, 2, 'PALMEIRA DOS INDIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1715, 2, 'PALESTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1714, 2, 'OURO BRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1713, 2, 'OLIVENCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1712, 2, 'OLHO D''AGUA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1711, 2, 'OLHO D''AGUA DO CASADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1710, 2, 'OLHO D''AGUA DAS FLORES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1709, 2, 'NOVO LINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1708, 2, 'MURICI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1707, 2, 'MONTEIROPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1706, 2, 'MINADOR DO NEGRAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1705, 2, 'MESSIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1704, 2, 'MATRIZ DE CAMARAGIBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1703, 2, 'MATA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1702, 2, 'MAR VERMELHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1701, 2, 'MARIBONDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1700, 2, 'MARECHAL DEODORO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1699, 2, 'MARAVILHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1698, 2, 'MARAGOGI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1697, 2, 'MAJOR ISIDORO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1696, 2, 'MACEIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1695, 2, 'LIMOEIRO DE ANADIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1694, 2, 'LAGOA DA CANOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1693, 2, 'JUNQUEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1692, 2, 'JUNDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1691, 2, 'JOAQUIM GOMES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1690, 2, 'JEQUIA DA PRAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1689, 2, 'JARAMATAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1688, 2, 'JAPARATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1687, 2, 'JACUIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1686, 2, 'JACARE DOS HOMENS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1685, 2, 'INHAPI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1684, 2, 'IGREJA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1683, 2, 'IGACI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1682, 2, 'IBATEGUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1681, 2, 'GIRAU DO PONCIANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1680, 2, 'FLEXEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1679, 2, 'FELIZ DESERTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1678, 2, 'FEIRA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1677, 2, 'ESTRELA DE ALAGOAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1676, 2, 'DOIS RIACHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1675, 2, 'DELMIRO GOUVEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1674, 2, 'CRAIBAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1673, 2, 'CORURIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1672, 2, 'COQUEIRO SECO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1671, 2, 'COLONIA LEOPOLDINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1670, 2, 'COITE DO NOIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1669, 2, 'CHA PRETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1668, 2, 'CARNEIROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1667, 2, 'CAPELA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1666, 2, 'CANAPI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1665, 2, 'CAMPO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1664, 2, 'CAMPO ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1663, 2, 'CAMPESTRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1662, 2, 'CAJUEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1661, 2, 'CACIMBINHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1660, 2, 'BRANQUINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1659, 2, 'BOCA DA MATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1658, 2, 'BELO MONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1657, 2, 'BELEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1656, 2, 'BATALHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1655, 2, 'BARRA DE SAO MIGUEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1654, 2, 'BARRA DE SANTO ANTONIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1653, 2, 'ATALAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1652, 2, 'ARAPIRACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1651, 2, 'ANADIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1650, 2, 'AGUA BRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (449, 27, 'XAMBIOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (448, 27, 'WANDERLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (447, 27, 'TUPIRATINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (446, 27, 'TUPIRAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (445, 27, 'TOCANTINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (444, 27, 'TOCANTINIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (443, 27, 'PALMAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (442, 27, 'TALISMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (441, 27, 'TAIPAS DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (440, 27, 'TAGUATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (439, 27, 'SUCUPIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (438, 27, 'SITIO NOVO DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (437, 27, 'SILVANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (436, 27, 'SAO VALERIO DA NATIVIDADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (435, 27, 'SAO SEBASTIAO DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (434, 27, 'SAO SALVADOR DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (433, 27, 'SAO MIGUEL DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (432, 27, 'SAO FELIX DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (431, 27, 'SAO BENTO DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (430, 27, 'SANTA TEREZINHA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (429, 27, 'SANTA TEREZA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (428, 27, 'SANTA ROSA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (427, 27, 'SANTA RITA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (426, 27, 'SANTA MARIA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (425, 27, 'SANTA FE DO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (424, 27, 'SANDOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (423, 27, 'SAMPAIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (422, 27, 'RIO SONO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (421, 27, 'RIO DOS BOIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (420, 27, 'RIO DA CONCEICAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (419, 27, 'RIACHINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (418, 27, 'RECURSOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (417, 27, 'PUGMIL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (416, 27, 'PRESIDENTE KENNEDY', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (415, 27, 'PRAIA NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (414, 27, 'PORTO NACIONAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (413, 27, 'PORTO ALEGRE DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (412, 27, 'PONTE ALTA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (411, 27, 'PONTE ALTA DO BOM JESUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (410, 27, 'PIUM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (409, 27, 'PIRAQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (408, 27, 'PINDORAMA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (407, 27, 'COLMEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (406, 27, 'PEQUIZEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (405, 27, 'PEIXE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (404, 27, 'PEDRO AFONSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (403, 27, 'PAU D''ARCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (402, 27, 'PARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (401, 27, 'PARAISO DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (400, 27, 'PALMEIROPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (399, 27, 'PALMEIRANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (398, 27, 'OLIVEIRA DE FATIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (397, 27, 'NOVO JARDIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (396, 27, 'NOVO ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (395, 27, 'NOVO ACORDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (394, 27, 'NOVA ROSALANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (393, 27, 'NOVA OLINDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (392, 27, 'NAZARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (391, 27, 'NATIVIDADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (390, 27, 'MURICILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (389, 27, 'PALMEIRAS DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (388, 27, 'MONTE SANTO DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (387, 27, 'MONTE DO CARMO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (386, 27, 'MIRANORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (385, 27, 'MIRACEMA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (384, 27, 'MAURILANDIA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (383, 27, 'MATEIROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (382, 27, 'MARIANOPOLIS DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (381, 27, 'LUZINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (380, 27, 'LIZARDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (379, 27, 'LAVANDEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (378, 27, 'LAJEADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (377, 27, 'LAGOA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (376, 27, 'LAGOA DA CONFUSAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (375, 27, 'JUARINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (374, 27, 'JAU DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (373, 27, 'ITAPORA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (372, 27, 'ITAPIRATINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (371, 27, 'ITAGUATINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (370, 27, 'ITACAJA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (369, 27, 'IPUEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (368, 27, 'GURUPI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (367, 27, 'GUARAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (366, 27, 'GOIATINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (365, 27, 'GOIANORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (364, 27, 'FORTALEZA DO TABOCAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (363, 27, 'FORMOSO DO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (362, 27, 'FILADELFIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (361, 27, 'FIGUEIROPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (360, 27, 'FATIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (359, 27, 'ESPERANTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (358, 27, 'DUERE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (357, 27, 'DOIS IRMAOS DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (356, 27, 'DIVINOPOLIS DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (355, 27, 'DIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (354, 27, 'DARCINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (353, 27, 'CRIXAS DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (352, 27, 'CRISTALANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (351, 27, 'COUTO MAGALHAES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (350, 27, 'CONCEICAO DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (349, 27, 'COMBINADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (348, 27, 'COLINAS DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (347, 27, 'CHAPADA DA NATIVIDADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (346, 27, 'CHAPADA DE AREIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (345, 27, 'CENTENARIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (344, 27, 'CASEARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (343, 27, 'CARRASCO BONITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (342, 27, 'CARMOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (341, 27, 'CARIRI DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (340, 27, 'CAMPOS LINDOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (339, 27, 'CACHOEIRINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (338, 27, 'BURITI DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (337, 27, 'BREJINHO DE NAZARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (336, 27, 'BRASILANDIA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (335, 27, 'BOM JESUS DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (334, 27, 'BERNARDO SAYAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (333, 27, 'BARROLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (332, 27, 'BARRA DO OURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (331, 27, 'BANDEIRANTES DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (330, 27, 'BABACULANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (329, 27, 'AXIXA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (328, 27, 'AURORA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (327, 27, 'AUGUSTINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (326, 27, 'ARRAIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (325, 27, 'ARAPOEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (324, 27, 'ARAGUATINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (323, 27, 'ARAGUANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (322, 27, 'ARAGUAINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (321, 27, 'ARAGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (320, 27, 'ARAGUACEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (319, 27, 'ARAGOMINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (318, 27, 'APARECIDA DO RIO NEGRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (317, 27, 'ANGICO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (316, 27, 'ANANAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (315, 27, 'ALVORADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (314, 27, 'ALMAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (313, 27, 'ALIANCA DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (312, 27, 'AGUIARNOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (311, 27, 'ABREULANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1826, 26, 'UMBAUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1825, 26, 'TOMAR DO GERU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1824, 26, 'TOBIAS BARRETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1823, 26, 'TELHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1822, 26, 'SIRIRI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1821, 26, 'SIMAO DIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1820, 26, 'SAO MIGUEL DO ALEIXO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1819, 26, 'SAO FRANCISCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1818, 26, 'SAO DOMINGOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1817, 26, 'SAO CRISTOVAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1816, 26, 'SANTO AMARO DAS BROTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1815, 26, 'SANTA ROSA DE LIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1814, 26, 'SANTANA DO SAO FRANCISCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1813, 26, 'SANTA LUZIA DO ITANHY', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1812, 26, 'SALGADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1811, 26, 'ROSARIO DO CATETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1810, 26, 'RIBEIROPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1809, 26, 'RIACHUELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1808, 26, 'RIACHAO DO DANTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1807, 26, 'PROPRIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1806, 26, 'PORTO DA FOLHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1805, 26, 'POCO VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1804, 26, 'POCO REDONDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1803, 26, 'PIRAMBU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1802, 26, 'PINHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1801, 26, 'PEDRINHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1800, 26, 'PEDRA MOLE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1799, 26, 'PACATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1798, 26, 'NOSSA SENHORA DO SOCORRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1797, 26, 'NOSSA SENHORA DE LOURDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1796, 26, 'NOSSA SENHORA DAS DORES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1795, 26, 'NOSSA SENHORA DA GLORIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1794, 26, 'NOSSA SENHORA APARECIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1793, 26, 'NEOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1792, 26, 'MURIBECA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1791, 26, 'MONTE ALEGRE DE SERGIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1790, 26, 'MOITA BONITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1789, 26, 'MARUIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1788, 26, 'MALHADOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1787, 26, 'MALHADA DOS BOIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1786, 26, 'MACAMBIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1785, 26, 'LARANJEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1784, 26, 'LAGARTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1783, 26, 'JAPOATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1782, 26, 'JAPARATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1781, 26, 'ITAPORANGA D''AJUDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1780, 26, 'ITABI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1779, 26, 'ITABAIANINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1778, 26, 'ITABAIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1777, 26, 'INDIAROBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1776, 26, 'ILHA DAS FLORES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1775, 26, 'GRACHO CARDOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1774, 26, 'GENERAL MAYNARD', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1773, 26, 'GARARU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1772, 26, 'FREI PAULO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1771, 26, 'FEIRA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1770, 26, 'ESTANCIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1769, 26, 'DIVINA PASTORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1768, 26, 'CUMBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1767, 26, 'CRISTINAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1766, 26, 'CEDRO DE SAO JOAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1765, 26, 'CARMOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1764, 26, 'CARIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1763, 26, 'CAPELA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1762, 26, 'CANINDE DE SAO FRANCISCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1761, 26, 'CANHOBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1760, 26, 'CAMPO DO BRITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1759, 26, 'BREJO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1758, 26, 'BOQUIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1757, 26, 'BARRA DOS COQUEIROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1756, 26, 'AREIA BRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1755, 26, 'ARAUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1754, 26, 'ARACAJU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1753, 26, 'AQUIDABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1752, 26, 'AMPARO DE SAO FRANCISCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3911, 25, 'ESTIVA GERBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3910, 25, 'CHAVANTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3909, 25, 'ZACARIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3908, 25, 'VOTUPORANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3907, 25, 'VOTORANTIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3906, 25, 'VITORIA BRASIL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3905, 25, 'VISTA ALEGRE DO ALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3904, 25, 'VIRADOURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3903, 25, 'VINHEDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3902, 25, 'VERA CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3901, 25, 'VARZEA PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3900, 25, 'VARGEM GRANDE PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3899, 25, 'VARGEM GRANDE DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3898, 25, 'VARGEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3897, 25, 'VALPARAISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3896, 25, 'VALINHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3895, 25, 'VALENTIM GENTIL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3894, 25, 'URUPES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3893, 25, 'URU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3892, 25, 'URANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3891, 25, 'UNIAO PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3890, 25, 'UCHOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3889, 25, 'UBIRAJARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3888, 25, 'UBATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3887, 25, 'UBARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3886, 25, 'TURMALINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3885, 25, 'TURIUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3884, 25, 'TUPI PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3883, 25, 'TUPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3882, 25, 'TUIUTI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3881, 25, 'TRES FRONTEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3880, 25, 'TREMEMBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3879, 25, 'TRABIJU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3878, 25, 'TORRINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3877, 25, 'TORRE DE PEDRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3876, 25, 'TIMBURI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3875, 25, 'TIETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3874, 25, 'TERRA ROXA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3873, 25, 'TEODORO SAMPAIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3872, 25, 'TEJUPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3871, 25, 'TAUBATE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3870, 25, 'TATUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3869, 25, 'TARUMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3868, 25, 'TARABAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3867, 25, 'TAQUARIVAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3866, 25, 'TAQUARITUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3865, 25, 'TAQUARITINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3864, 25, 'TAQUARAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3863, 25, 'TAPIRATIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3862, 25, 'TAPIRAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3861, 25, 'TANABI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3860, 25, 'TAMBAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3859, 25, 'TAIUVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3858, 25, 'TAIACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3857, 25, 'TAGUAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3856, 25, 'TACIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3855, 25, 'TABOAO DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3854, 25, 'TABATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3853, 25, 'TABAPUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3852, 25, 'SUZANAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3851, 25, 'SUZANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3850, 25, 'SUMARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3849, 25, 'SUD MENNUCCI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3848, 25, 'SOROCABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3847, 25, 'SOCORRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3846, 25, 'SILVEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3845, 25, 'SEVERINIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3844, 25, 'SETE BARRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3843, 25, 'SERTAOZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3842, 25, 'SERRA NEGRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3841, 25, 'SERRANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3840, 25, 'SERRA AZUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3839, 25, 'SEBASTIANOPOLIS DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3838, 25, 'SARUTAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3837, 25, 'SARAPUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3836, 25, 'SAO VICENTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3835, 25, 'SAO SIMAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3834, 25, 'SAO SEBASTIAO DA GRAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3833, 25, 'SAO SEBASTIAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3832, 25, 'SAO ROQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3831, 25, 'SAO PEDRO DO TURVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3830, 25, 'SAO PEDRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3829, 25, 'SAO PAULO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3828, 25, 'SAO MIGUEL ARCANJO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3827, 25, 'SAO MANUEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3826, 25, 'SAO LUIS DO PARAITINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3825, 25, 'SAO LOURENCO DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3824, 25, 'SAO JOSE DOS CAMPOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3823, 25, 'SAO JOSE DO RIO PRETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3822, 25, 'SAO JOSE DO RIO PARDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3821, 25, 'SAO JOSE DO BARREIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3820, 25, 'SAO JOSE DA BELA VISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3819, 25, 'SAO JOAQUIM DA BARRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3818, 25, 'SAO JOAO DO PAU D''ALHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3817, 25, 'SAO JOAO DE IRACEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3816, 25, 'SAO JOAO DAS DUAS PONTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3815, 25, 'SAO JOAO DA BOA VISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3814, 25, 'SAO FRANCISCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3813, 25, 'SAO CARLOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3812, 25, 'SAO CAETANO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3811, 25, 'SAO BERNARDO DO CAMPO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3810, 25, 'SAO BENTO DO SAPUCAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3809, 25, 'SANTOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3808, 25, 'SANTOPOLIS DO AGUAPEI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3807, 25, 'SANTO EXPEDITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3806, 25, 'SANTO ANTONIO DO PINHAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3805, 25, 'SANTO ANTONIO DO JARDIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3804, 25, 'SANTO ANTONIO DO ARACANGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3803, 25, 'SANTO ANTONIO DE POSSE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3802, 25, 'SANTO ANTONIO DA ALEGRIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3801, 25, 'SANTO ANDRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3800, 25, 'SANTO ANASTACIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3799, 25, 'SANTA SALETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3798, 25, 'SANTA ROSA DE VITERBO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3797, 25, 'SANTA RITA DO PASSA QUATRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3796, 25, 'SANTA RITA D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3795, 25, 'SANTANA DE PARNAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3794, 25, 'SANTANA DA PONTE PENSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3793, 25, 'SANTA MERCEDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3792, 25, 'SANTA MARIA DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3791, 25, 'SANTA LUCIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3790, 25, 'SANTA ISABEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3789, 25, 'SANTA GERTRUDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3788, 25, 'SANTA FE DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3787, 25, 'SANTA ERNESTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3786, 25, 'SANTA CRUZ DO RIO PARDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3785, 25, 'SANTA CRUZ DAS PALMEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3784, 25, 'SANTA CRUZ DA ESPERANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3783, 25, 'SANTA CRUZ DA CONCEICAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3782, 25, 'SANTA CLARA D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3781, 25, 'SANTA BRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3780, 25, 'SANTA BARBARA D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3779, 25, 'SANTA ALBERTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3778, 25, 'SANTA ADELIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3777, 25, 'SANDOVALINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3776, 25, 'SALTO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3775, 25, 'SALTO DE PIRAPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3774, 25, 'SALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3773, 25, 'SALTINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3772, 25, 'SALMOURAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3771, 25, 'SALESOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3770, 25, 'SALES OLIVEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3769, 25, 'SALES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3768, 25, 'SAGRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3767, 25, 'SABINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3766, 25, 'RUBINEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3765, 25, 'RUBIACEA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3764, 25, 'ROSEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3763, 25, 'ROSANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3762, 25, 'RIOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3761, 25, 'RIO GRANDE DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3760, 25, 'RIO DAS PEDRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3759, 25, 'RIO CLARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3758, 25, 'RINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3757, 25, 'RINCAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3756, 25, 'RIFAINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3755, 25, 'RIVERSUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3754, 25, 'RIBEIRAO PRETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3753, 25, 'RIBEIRAO PIRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3752, 25, 'RIBEIRAO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3751, 25, 'RIBEIRAO DOS INDIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3750, 25, 'RIBEIRAO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3749, 25, 'RIBEIRAO CORRENTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3748, 25, 'RIBEIRAO BRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3747, 25, 'RIBEIRAO BONITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3746, 25, 'RIBEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3745, 25, 'RESTINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3744, 25, 'REGISTRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3743, 25, 'REGINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3742, 25, 'REGENTE FEIJO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3741, 25, 'REDENCAO DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3740, 25, 'RANCHARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3739, 25, 'RAFARD', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3738, 25, 'QUINTANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3737, 25, 'QUELUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3736, 25, 'QUEIROZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3735, 25, 'QUATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3734, 25, 'QUADRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3733, 25, 'PROMISSAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3732, 25, 'PRESIDENTE VENCESLAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3731, 25, 'PRESIDENTE PRUDENTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3730, 25, 'PRESIDENTE EPITACIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3729, 25, 'PRESIDENTE BERNARDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3728, 25, 'PRESIDENTE ALVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3727, 25, 'PRATANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3726, 25, 'PRAIA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3725, 25, 'PRADOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3724, 25, 'PRACINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3723, 25, 'POTIRENDABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3722, 25, 'POTIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3721, 25, 'PORTO FERREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3720, 25, 'PORTO FELIZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3719, 25, 'PORANGABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3718, 25, 'POPULINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3717, 25, 'PONTES GESTAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3716, 25, 'PONTALINDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3715, 25, 'PONTAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3714, 25, 'PONGAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3713, 25, 'POMPEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3712, 25, 'POLONI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3711, 25, 'POA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3710, 25, 'PLATINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3709, 25, 'PLANALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3708, 25, 'PITANGUEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3707, 25, 'PIRATININGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3706, 25, 'PIRASSUNUNGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3705, 25, 'PIRAPOZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3704, 25, 'PIRAPORA DO BOM JESUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3703, 25, 'PIRANGI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3702, 25, 'PIRAJUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3701, 25, 'PIRAJU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3700, 25, 'PIRACICABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3699, 25, 'PIRACAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3698, 25, 'PIQUETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3697, 25, 'PIQUEROBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3696, 25, 'PINHALZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3695, 25, 'PINDORAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3694, 25, 'PINDAMONHANGABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3693, 25, 'PILAR DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3692, 25, 'PIEDADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3691, 25, 'PIACATU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3690, 25, 'PERUIBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3689, 25, 'PEREIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3688, 25, 'PEREIRA BARRETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3687, 25, 'PENAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3686, 25, 'PEDRO DE TOLEDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3685, 25, 'PEDRINHAS PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3684, 25, 'PEDREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3683, 25, 'PEDREGULHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3682, 25, 'PEDRANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3681, 25, 'PEDRA BELA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3680, 25, 'PEDERNEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3679, 25, 'PAULO DE FARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3678, 25, 'PAULISTANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3677, 25, 'PAULINIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3676, 25, 'PAULICEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3675, 25, 'PATROCINIO PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3674, 25, 'PARISI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3673, 25, 'PARIQUERA-ACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3672, 25, 'PARDINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3671, 25, 'PARAPUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3670, 25, 'PARANAPUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3669, 25, 'PARANAPANEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3668, 25, 'PARAISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3667, 25, 'PARAIBUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3666, 25, 'PARAGUACU PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3665, 25, 'PANORAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3664, 25, 'PALMITAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3663, 25, 'PALMEIRA D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3662, 25, 'PALMARES PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3661, 25, 'PALESTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3660, 25, 'PACAEMBU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3659, 25, 'OURO VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3658, 25, 'OUROESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3657, 25, 'OURINHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3656, 25, 'OSVALDO CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3655, 25, 'OSCAR BRESSANE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3654, 25, 'OSASCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3653, 25, 'ORLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3652, 25, 'ORINDIUVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3651, 25, 'ORIENTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3650, 25, 'ONDA VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3649, 25, 'OLIMPIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3648, 25, 'OLEO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3647, 25, 'OCAUCU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3646, 25, 'NUPORANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3645, 25, 'NOVO HORIZONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3644, 25, 'NOVA ODESSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3643, 25, 'NOVA LUZITANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3642, 25, 'NOVAIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3641, 25, 'NOVA INDEPENDENCIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3640, 25, 'NOVA GUATAPORANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3639, 25, 'NOVA GRANADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3638, 25, 'NOVA EUROPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3637, 25, 'NOVA CASTILHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3636, 25, 'NOVA CANAA PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3635, 25, 'NOVA CAMPINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3634, 25, 'NOVA ALIANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3633, 25, 'NIPOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3632, 25, 'NHANDEARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3631, 25, 'NEVES PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3630, 25, 'NAZARE PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3629, 25, 'NATIVIDADE DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3628, 25, 'NARANDIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3627, 25, 'NANTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3626, 25, 'MURUTINGA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3625, 25, 'MOTUCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3624, 25, 'MORUNGABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3623, 25, 'MORRO AGUDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3622, 25, 'MONTE MOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3621, 25, 'MONTEIRO LOBATO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3620, 25, 'MONTE CASTELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3619, 25, 'MONTE AZUL PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3618, 25, 'MONTE APRAZIVEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3617, 25, 'MONTE ALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3616, 25, 'MONTE ALEGRE DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3615, 25, 'MONGAGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3614, 25, 'MONCOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3613, 25, 'MOMBUCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3612, 25, 'MOJI MIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3611, 25, 'MOGI GUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3610, 25, 'MOGI DAS CRUZES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3609, 25, 'MOCOCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3608, 25, 'MIRASSOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3607, 25, 'MIRASSOL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3606, 25, 'MIRANTE DO PARANAPANEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3605, 25, 'MIRANDOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3604, 25, 'MIRA ESTRELA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3603, 25, 'MIRACATU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3602, 25, 'MINEIROS DO TIETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3601, 25, 'MIGUELOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3600, 25, 'MESOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3599, 25, 'MERIDIANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3598, 25, 'MENDONCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3597, 25, 'MAUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3596, 25, 'MATAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3595, 25, 'MARTINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3594, 25, 'MARINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3593, 25, 'MARILIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3592, 25, 'MARIAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3591, 25, 'MARAPOAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3590, 25, 'MARACAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3589, 25, 'MARABA PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3588, 25, 'MANDURI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3587, 25, 'MAIRIPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3586, 25, 'MAIRINQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3585, 25, 'MAGDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3584, 25, 'MACEDONIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3583, 25, 'MACAUBAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3582, 25, 'MACATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3581, 25, 'LUTECIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3580, 25, 'LUPERCIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3579, 25, 'LUIZIANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3578, 25, 'LUIS ANTONIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3577, 25, 'LUCIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3576, 25, 'LUCELIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3575, 25, 'LOUVEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3574, 25, 'LOURDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3573, 25, 'LORENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3572, 25, 'LINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3571, 25, 'LINDOIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3570, 25, 'LIMEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3569, 25, 'LENCOIS PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3568, 25, 'LEME', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3567, 25, 'LAVRINHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3566, 25, 'LAVINIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3565, 25, 'LARANJAL PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3564, 25, 'LAGOINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3563, 25, 'JUQUITIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3562, 25, 'JUQUIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3561, 25, 'JUNQUEIROPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3560, 25, 'JUNDIAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3559, 25, 'JUMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3558, 25, 'JULIO MESQUITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3557, 25, 'JOSE BONIFACIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3556, 25, 'JOAO RAMALHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3555, 25, 'JOANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3554, 25, 'JERIQUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3553, 25, 'JAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3552, 25, 'JARINU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3551, 25, 'JARDINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3550, 25, 'JANDIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3549, 25, 'JAMBEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3548, 25, 'JALES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3547, 25, 'JAGUARIUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3546, 25, 'JACUPIRANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3545, 25, 'JACI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3544, 25, 'JACAREI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3543, 25, 'JABOTICABAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3542, 25, 'JABORANDI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3541, 25, 'ITUVERAVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3540, 25, 'ITUPEVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3539, 25, 'ITU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3538, 25, 'ITOBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3537, 25, 'ITIRAPUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3536, 25, 'ITIRAPINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3535, 25, 'ITATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3534, 25, 'ITATIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3533, 25, 'ITARIRI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3532, 25, 'ITARARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3531, 25, 'ITAQUAQUECETUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3530, 25, 'ITAPURA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3529, 25, 'ITAPUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3528, 25, 'ITAPORANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3527, 25, 'ITAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3526, 25, 'ITAPIRAPUA PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3525, 25, 'ITAPIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3524, 25, 'ITAPEVI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3523, 25, 'ITAPEVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3522, 25, 'ITAPETININGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3521, 25, 'ITAPECERICA DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3520, 25, 'ITAOCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3519, 25, 'ITANHAEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3518, 25, 'ITAJU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3517, 25, 'ITAJOBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3516, 25, 'ITAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3515, 25, 'ITABERA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3514, 25, 'IRAPURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3513, 25, 'IRAPUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3512, 25, 'IRACEMAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3511, 25, 'IPUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3510, 25, 'IPORANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3509, 25, 'IPIGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3508, 25, 'IPEUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3507, 25, 'IPERO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3506, 25, 'IPAUSSU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3505, 25, 'INUBIA PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3504, 25, 'INDIAPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3503, 25, 'INDIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3502, 25, 'INDAIATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3501, 25, 'ILHA SOLTEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3500, 25, 'ILHA COMPRIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3499, 25, 'ILHABELA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3498, 25, 'IGUAPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3497, 25, 'IGARATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3496, 25, 'IGARAPAVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3495, 25, 'IGARACU DO TIETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3494, 25, 'IEPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3493, 25, 'ICEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3492, 25, 'IBIUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3491, 25, 'IBITINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3490, 25, 'IBIRAREMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3489, 25, 'IBIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3488, 25, 'IBATE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3487, 25, 'IARAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3486, 25, 'IACRI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3485, 25, 'IACANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3484, 25, 'HORTOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3483, 25, 'HOLAMBRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3482, 25, 'HERCULANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3481, 25, 'GUZOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3480, 25, 'GUATAPARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3479, 25, 'GUARULHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3478, 25, 'GUARUJA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3477, 25, 'GUARIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3476, 25, 'GUAREI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3475, 25, 'GUARATINGUETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3474, 25, 'GUARAREMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3473, 25, 'GUARARAPES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3472, 25, 'GUARANTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3471, 25, 'GUARANI D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3470, 25, 'GUARACI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3469, 25, 'GUARACAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3468, 25, 'GUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3467, 25, 'GUAPIARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3466, 25, 'GUAPIACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3465, 25, 'GUAIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3464, 25, 'GUAIMBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3463, 25, 'GUAICARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3462, 25, 'GLICERIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3461, 25, 'GETULINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3460, 25, 'GENERAL SALGADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3459, 25, 'GAVIAO PEIXOTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3458, 25, 'GASTAO VIDIGAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3457, 25, 'GARCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3456, 25, 'GALIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3455, 25, 'GABRIEL MONTEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3454, 25, 'FRANCO DA ROCHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3453, 25, 'FRANCISCO MORATO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3452, 25, 'FRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3451, 25, 'FLORINIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3450, 25, 'FLORIDA PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3449, 25, 'FLOREAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3448, 25, 'FLORA RICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3447, 25, 'FERRAZ DE VASCONCELOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3446, 25, 'FERNAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3445, 25, 'FERNANDO PRESTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3444, 25, 'FERNANDOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3443, 25, 'FARTURA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3442, 25, 'EUCLIDES DA CUNHA PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3441, 25, 'ESTRELA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3440, 25, 'ESTRELA D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3439, 25, 'ESPIRITO SANTO DO TURVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3438, 25, 'ESPIRITO SANTO DO PINHAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3437, 25, 'ENGENHEIRO COELHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3436, 25, 'EMILIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3435, 25, 'EMBU-GUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3434, 25, 'EMBU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3433, 25, 'EMBAUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3432, 25, 'ELISIARIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3431, 25, 'ELIAS FAUSTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3430, 25, 'ELDORADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3429, 25, 'ECHAPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3428, 25, 'DUMONT', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3427, 25, 'DUARTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3426, 25, 'DRACENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3425, 25, 'DOURADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3424, 25, 'DOLCINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3423, 25, 'DOIS CORREGOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3422, 25, 'DOBRADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3421, 25, 'DIVINOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3420, 25, 'DIRCE REIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3419, 25, 'DIADEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3418, 25, 'DESCALVADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3417, 25, 'CUNHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3416, 25, 'CUBATAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3415, 25, 'CRUZEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3414, 25, 'CRUZALIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3413, 25, 'CRISTAIS PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3412, 25, 'CRAVINHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3411, 25, 'COTIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3410, 25, 'COSMORAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3409, 25, 'COSMOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3408, 25, 'CORUMBATAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3407, 25, 'CORONEL MACEDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3406, 25, 'COROADOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3405, 25, 'CORDEIROPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3404, 25, 'CONCHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3403, 25, 'CONCHAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3402, 25, 'COLOMBIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3401, 25, 'COLINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3400, 25, 'CLEMENTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3399, 25, 'CHARQUEADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3398, 25, 'CESARIO LANGE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3397, 25, 'CERQUILHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3396, 25, 'CERQUEIRA CESAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3395, 25, 'CEDRAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3394, 25, 'CATIGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3393, 25, 'CATANDUVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3392, 25, 'CASTILHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3391, 25, 'CASSIA DOS COQUEIROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3390, 25, 'CASA BRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3389, 25, 'CARDOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3388, 25, 'CARAPICUIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3387, 25, 'CARAGUATATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3386, 25, 'CAPIVARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3385, 25, 'CAPELA DO ALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3384, 25, 'CAPAO BONITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3383, 25, 'CANITAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3382, 25, 'CANDIDO RODRIGUES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3381, 25, 'CANDIDO MOTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3380, 25, 'CANAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3379, 25, 'CANANEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3378, 25, 'CAMPOS NOVOS PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3377, 25, 'CAMPOS DO JORDAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3376, 25, 'CAMPO LIMPO PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3375, 25, 'CAMPINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3374, 25, 'CAMPINA DO MONTE ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3373, 25, 'CAJURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3372, 25, 'CAJOBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3371, 25, 'CAJATI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3370, 25, 'CAJAMAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3369, 25, 'CAIUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3368, 25, 'CAIEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3367, 25, 'CAIABU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3366, 25, 'CAFELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3365, 25, 'CACONDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3364, 25, 'CACHOEIRA PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3363, 25, 'CACAPAVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3362, 25, 'CABREUVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3361, 25, 'CABRALIA PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3360, 25, 'BURITIZAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3359, 25, 'BURITAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3358, 25, 'BURI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3357, 25, 'BROTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3356, 25, 'BRODOWSKI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3355, 25, 'BREJO ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3354, 25, 'BRAUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3353, 25, 'BRAGANCA PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3352, 25, 'BOTUCATU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3351, 25, 'BOREBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3350, 25, 'BORBOREMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3349, 25, 'BORACEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3348, 25, 'BORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3347, 25, 'BOM SUCESSO DE ITARARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3346, 25, 'BOM JESUS DOS PERDOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3345, 25, 'BOITUVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3344, 25, 'BOFETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3343, 25, 'BOCAINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3342, 25, 'BOA ESPERANCA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3341, 25, 'BIRITIBA-MIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3340, 25, 'BIRIGUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3339, 25, 'BILAC', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3338, 25, 'BERTIOGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3337, 25, 'BERNARDINO DE CAMPOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3336, 25, 'BENTO DE ABREU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3335, 25, 'BEBEDOURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3334, 25, 'BAURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3333, 25, 'BATATAIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3332, 25, 'BASTOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3331, 25, 'BARUERI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3330, 25, 'BARRINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3329, 25, 'BARRETOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3328, 25, 'BARRA DO TURVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3327, 25, 'BARRA DO CHAPEU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3326, 25, 'BARRA BONITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3325, 25, 'BARIRI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3324, 25, 'BARBOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3323, 25, 'BARAO DE ANTONINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3322, 25, 'BANANAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3321, 25, 'BALSAMO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3320, 25, 'BALBINOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3319, 25, 'BADY BASSITT', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3318, 25, 'AVARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3317, 25, 'AVANHANDAVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3316, 25, 'AVAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3315, 25, 'AURIFLAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3314, 25, 'ATIBAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3313, 25, 'ASSIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3312, 25, 'ASPASIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3311, 25, 'ARUJA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3310, 25, 'ARTUR NOGUEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3309, 25, 'ARIRANHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3308, 25, 'AREIOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3307, 25, 'AREIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3306, 25, 'AREALVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3305, 25, 'ARCO-IRIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3304, 25, 'ARARAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3303, 25, 'ARARAQUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3302, 25, 'ARAPEI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3301, 25, 'ARANDU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3300, 25, 'ARAMINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3299, 25, 'ARACOIABA DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3298, 25, 'ARACATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3297, 25, 'ARACARIGUAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3296, 25, 'APIAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3295, 25, 'APARECIDA D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3294, 25, 'APARECIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3293, 25, 'ANHUMAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3292, 25, 'ANHEMBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3291, 25, 'ANGATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3290, 25, 'ANDRADINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3289, 25, 'ANALANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3288, 25, 'AMPARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3287, 25, 'AMERICO DE CAMPOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3286, 25, 'AMERICO BRASILIENSE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3285, 25, 'AMERICANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3284, 25, 'ALVINLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3283, 25, 'ALVARO DE CARVALHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3282, 25, 'ALVARES MACHADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3281, 25, 'ALVARES FLORENCE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3280, 25, 'ALUMINIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3279, 25, 'ALTO ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3278, 25, 'ALTINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3277, 25, 'ALTAIR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3276, 25, 'ALFREDO MARCONDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3275, 25, 'ALAMBARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3274, 25, 'AGUDOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3273, 25, 'AGUAS DE SAO PEDRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3272, 25, 'AGUAS DE SANTA BARBARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3271, 25, 'AGUAS DE LINDOIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3270, 25, 'AGUAS DA PRATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3269, 25, 'AGUAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3268, 25, 'ADOLFO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3267, 25, 'ADAMANTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4603, 24, 'ZORTEA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4602, 24, 'XAXIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4601, 24, 'XAVANTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4600, 24, 'XANXERE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4599, 24, 'WITMARSUM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4598, 24, 'VITOR MEIRELES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4597, 24, 'VIDEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4596, 24, 'VIDAL RAMOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4595, 24, 'VARGEM BONITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4594, 24, 'VARGEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4593, 24, 'VARGEAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4592, 24, 'URUSSANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4591, 24, 'URUPEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4590, 24, 'URUBICI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4589, 24, 'UNIAO DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4588, 24, 'TURVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4587, 24, 'TUNAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4586, 24, 'TUBARAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4585, 24, 'TROMBUDO CENTRAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4584, 24, 'TREZE TILIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4583, 24, 'TREZE DE MAIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4582, 24, 'TREVISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4581, 24, 'TRES BARRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4580, 24, 'TIMBO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4579, 24, 'TIMBO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4578, 24, 'TIMBE DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4577, 24, 'TIJUCAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4576, 24, 'TIGRINHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4575, 24, 'TANGARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4574, 24, 'TAIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4573, 24, 'SUL BRASIL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4572, 24, 'SOMBRIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4571, 24, 'SIDEROPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4570, 24, 'SERRA ALTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4569, 24, 'SEARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4568, 24, 'SCHROEDER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4567, 24, 'SAUDADES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4566, 24, 'SAO PEDRO DE ALCANTARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4565, 24, 'SAO MIGUEL DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4564, 24, 'SAO MIGUEL DA BOA VISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4563, 24, 'SAO MARTINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4562, 24, 'SAO LUDGERO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4561, 24, 'SAO LOURENCO DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4560, 24, 'SAO JOSE DO CERRITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4559, 24, 'SAO JOSE DO CEDRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4558, 24, 'SAO JOSE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4557, 24, 'SAO JOAQUIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4556, 24, 'SAO JOAO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4555, 24, 'SAO JOAO DO ITAPERIU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4554, 24, 'SAO JOAO BATISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4553, 24, 'SAO JOAO DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4552, 24, 'SAO FRANCISCO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4551, 24, 'SAO DOMINGOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4550, 24, 'SAO CRISTOVAO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4549, 24, 'SAO CARLOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4548, 24, 'SAO BONIFACIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4547, 24, 'SAO BENTO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4546, 24, 'SAO BERNARDINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4545, 24, 'SANTO AMARO DA IMPERATRIZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4544, 24, 'SANTIAGO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4543, 24, 'SANTA TEREZINHA DO PROGRESSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4542, 24, 'SANTA TEREZINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4541, 24, 'SANTA ROSA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4540, 24, 'SANTA ROSA DE LIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4539, 24, 'SANTA HELENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4538, 24, 'SANTA CECILIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4537, 24, 'SANGAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4536, 24, 'SALTO VELOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4535, 24, 'SALTINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4534, 24, 'SALETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4533, 24, 'ROMELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4532, 24, 'RODEIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4531, 24, 'RIQUEZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4530, 24, 'RIO RUFINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4529, 24, 'RIO NEGRINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4528, 24, 'RIO FORTUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4527, 24, 'RIO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4526, 24, 'RIO DOS CEDROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4525, 24, 'RIO DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4524, 24, 'RIO DO CAMPO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4523, 24, 'RIO DAS ANTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4522, 24, 'RANCHO QUEIMADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4521, 24, 'QUILOMBO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4520, 24, 'PRINCESA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4519, 24, 'PRESIDENTE NEREU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4518, 24, 'PRESIDENTE GETULIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4517, 24, 'PRESIDENTE CASTELLO BRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4516, 24, 'PRAIA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4515, 24, 'POUSO REDONDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4514, 24, 'PORTO UNIAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4513, 24, 'PORTO BELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4512, 24, 'PONTE SERRADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4511, 24, 'PONTE ALTA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4510, 24, 'PONTE ALTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4509, 24, 'POMERODE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4508, 24, 'PLANALTO ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4507, 24, 'PIRATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4506, 24, 'PINHEIRO PRETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4505, 24, 'PINHALZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4504, 24, 'BALNEARIO PICARRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4503, 24, 'PETROLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4502, 24, 'PERITIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4501, 24, 'PENHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4500, 24, 'PEDRAS GRANDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4499, 24, 'PAULO LOPES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4498, 24, 'PASSOS MAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4497, 24, 'PASSO DE TORRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4496, 24, 'PARAISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4495, 24, 'PAPANDUVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4494, 24, 'PALMITOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4493, 24, 'PALMEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4492, 24, 'PALMA SOLA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4491, 24, 'PALHOCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4490, 24, 'PAINEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4489, 24, 'PAIAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4488, 24, 'OURO VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4487, 24, 'OURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4486, 24, 'OTACILIO COSTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4485, 24, 'ORLEANS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4484, 24, 'NOVO HORIZONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4483, 24, 'NOVA VENEZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4482, 24, 'NOVA TRENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4481, 24, 'NOVA ITABERABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4480, 24, 'NOVA ERECHIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4479, 24, 'NAVEGANTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4478, 24, 'MORRO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4477, 24, 'MORRO DA FUMACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4476, 24, 'MONTE CASTELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4475, 24, 'MONTE CARLO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4474, 24, 'MONDAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4473, 24, 'MODELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4472, 24, 'MIRIM DOCE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4471, 24, 'MELEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4470, 24, 'MATOS COSTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4469, 24, 'MASSARANDUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4468, 24, 'MAREMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4467, 24, 'MARAVILHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4466, 24, 'MARACAJA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4465, 24, 'MAJOR VIEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4464, 24, 'MAJOR GERCINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4463, 24, 'MAFRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4462, 24, 'MACIEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4461, 24, 'LUZERNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4460, 24, 'LUIZ ALVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4459, 24, 'LONTRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4458, 24, 'LINDOIA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4457, 24, 'LEOBERTO LEAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4456, 24, 'LEBON REGIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4455, 24, 'LAURO MULLER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4454, 24, 'LAURENTINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4453, 24, 'LAJEADO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4452, 24, 'LAGUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4451, 24, 'LAGES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4450, 24, 'LACERDOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4449, 24, 'JUPIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4448, 24, 'JOSE BOITEUX', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4447, 24, 'JOINVILLE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4446, 24, 'JOACABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4445, 24, 'JARDINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4444, 24, 'JARAGUA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4443, 24, 'JAGUARUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4442, 24, 'JACINTO MACHADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4441, 24, 'JABORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4440, 24, 'ITUPORANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4439, 24, 'ITAPOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4438, 24, 'ITAPIRANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4437, 24, 'ITAPEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4436, 24, 'ITAJAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4435, 24, 'ITAIOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4434, 24, 'ITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4433, 24, 'IRINEOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4432, 24, 'IRATI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4431, 24, 'IRANI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4430, 24, 'IRACEMINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4429, 24, 'IPUMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4428, 24, 'IPUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4427, 24, 'IPORA DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4426, 24, 'IPIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4425, 24, 'IOMERE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4424, 24, 'INDAIAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4423, 24, 'IMBUIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4422, 24, 'IMBITUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4421, 24, 'IMARUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4420, 24, 'ILHOTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4419, 24, 'ICARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4418, 24, 'IBIRAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4417, 24, 'IBICARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4416, 24, 'IBIAM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4415, 24, 'HERVAL D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4414, 24, 'GUATAMBU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4413, 24, 'GUARUJA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4412, 24, 'GUARAMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4411, 24, 'GUARACIABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4410, 24, 'GUABIRUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4409, 24, 'GRAVATAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4408, 24, 'GRAO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4407, 24, 'GOVERNADOR CELSO RAMOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4406, 24, 'GASPAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4405, 24, 'GARUVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4404, 24, 'GAROPABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4403, 24, 'GALVAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4402, 24, 'FREI ROGERIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4401, 24, 'FRAIBURGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4400, 24, 'FORQUILHINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4399, 24, 'FORMOSA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4398, 24, 'FLORIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4397, 24, 'FLOR DO SERTAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4396, 24, 'FAXINAL DOS GUEDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4395, 24, 'ERVAL VELHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4394, 24, 'ERMO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4393, 24, 'ENTRE RIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4392, 24, 'DOUTOR PEDRINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4391, 24, 'DONA EMMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4390, 24, 'DIONISIO CERQUEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4389, 24, 'DESCANSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4388, 24, 'CURITIBANOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4387, 24, 'CUNHATAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4386, 24, 'CUNHA PORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4385, 24, 'CRICIUMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4384, 24, 'CORREIA PINTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4383, 24, 'CORUPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4382, 24, 'CORONEL MARTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4381, 24, 'CORONEL FREITAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4380, 24, 'CORDILHEIRA ALTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4379, 24, 'CONCORDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4378, 24, 'COCAL DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4377, 24, 'CHAPECO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4376, 24, 'CHAPADAO DO LAGEADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4375, 24, 'CERRO NEGRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4374, 24, 'CELSO RAMOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4373, 24, 'CAXAMBU DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4372, 24, 'CATANDUVAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4371, 24, 'CAPIVARI DE BAIXO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4370, 24, 'CAPINZAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4369, 24, 'CANOINHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4368, 24, 'CANELINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4367, 24, 'CAMPOS NOVOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4366, 24, 'CAMPO ERE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4365, 24, 'CAMPO BELO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4364, 24, 'CAMPO ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4363, 24, 'CAPAO ALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4362, 24, 'CAMBORIU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4361, 24, 'CALMON', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4360, 24, 'CAIBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4359, 24, 'CACADOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4358, 24, 'BRUSQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4357, 24, 'BRUNOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4356, 24, 'BRACO DO TROMBUDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4355, 24, 'BRACO DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4354, 24, 'BOTUVERA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4353, 24, 'BOM RETIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4352, 24, 'BOM JESUS DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4351, 24, 'BOM JESUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4350, 24, 'BOM JARDIM DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4349, 24, 'BOMBINHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4348, 24, 'BOCAINA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4347, 24, 'BLUMENAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4346, 24, 'BIGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4345, 24, 'BENEDITO NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4344, 24, 'BELMONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4343, 24, 'BELA VISTA DO TOLDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4342, 24, 'BARRA VELHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4341, 24, 'BARRA BONITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4340, 24, 'BANDEIRANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4339, 24, 'BALNEARIO GAIVOTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4338, 24, 'BALNEARIO BARRA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4337, 24, 'BALNEARIO CAMBORIU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4336, 24, 'BALNEARIO ARROIO DO SILVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4335, 24, 'AURORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4334, 24, 'ATALANTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4333, 24, 'ASCURRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4332, 24, 'ARVOREDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4331, 24, 'ARROIO TRINTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4330, 24, 'ARMAZEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4329, 24, 'ARARANGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4328, 24, 'ARAQUARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4327, 24, 'ARABUTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4326, 24, 'APIUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4325, 24, 'ANTONIO CARLOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4324, 24, 'ANITAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4323, 24, 'ANITA GARIBALDI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4322, 24, 'ANGELINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4321, 24, 'ANCHIETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4320, 24, 'ALTO BELA VISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4319, 24, 'ALFREDO WAGNER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4318, 24, 'AGUAS MORNAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4317, 24, 'AGUAS FRIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4316, 24, 'AGUAS DE CHAPECO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4315, 24, 'AGUA DOCE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4314, 24, 'AGRONOMICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4313, 24, 'AGROLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4312, 24, 'ABELARDO LUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4311, 24, 'ABDON BATISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (151, 23, 'UIRAMUTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (150, 23, 'SAO LUIZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (149, 23, 'SAO JOAO DA BALIZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (148, 23, 'RORAINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (147, 23, 'PACARAIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (146, 23, 'NORMANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (145, 23, 'MUCAJAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (144, 23, 'IRACEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (143, 23, 'CAROEBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (142, 23, 'CARACARAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (141, 23, 'CANTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (140, 23, 'BONFIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (139, 23, 'BOA VISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (138, 23, 'ALTO ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (137, 23, 'AMAJARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (9, 22, 'ESPIGAO D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (8, 22, 'COSTA MARQUES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (7, 22, 'CORUMBIARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (6, 22, 'COLORADO DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (52, 22, 'VALE DO PARAISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (51, 22, 'VALE DO ANARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (50, 22, 'URUPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5, 22, 'CEREJEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (49, 22, 'THEOBROMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (48, 22, 'TEIXEIROPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (47, 22, 'SERINGUEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (46, 22, 'SAO FRANCISCO DO GUAPORE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (45, 22, 'SAO FELIPE D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (44, 22, 'PRIMAVERA DE RONDONIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (43, 22, 'PIMENTEIRAS DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (42, 22, 'PARECIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (41, 22, 'NOVA UNIAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (40, 22, 'MONTE NEGRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4, 22, 'CACOAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (39, 22, 'MIRANTE DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (38, 22, 'MINISTRO ANDREAZZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (37, 22, 'ITAPUA DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (36, 22, 'GOVERNADOR JORGE TEIXEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (35, 22, 'CUJUBIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (34, 22, 'CHUPINGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (33, 22, 'CASTANHEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (32, 22, 'CANDEIAS DO JAMARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (31, 22, 'CAMPO NOVO DE RONDONIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (30, 22, 'CACAULANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3, 22, 'CABIXI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (29, 22, 'NOVO HORIZONTE DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (28, 22, 'BURITIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (27, 22, 'ALTO PARAISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (26, 22, 'ALTO ALEGRE DOS PARECIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (25, 22, 'ALVORADA D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (24, 22, 'NOVA MAMORE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (23, 22, 'SAO MIGUEL DO GUAPORE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (22, 22, 'VILHENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (21, 22, 'SANTA LUZIA D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (20, 22, 'ROLIM DE MOURA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2, 22, 'ARIQUEMES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (19, 22, 'RIO CRESPO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (18, 22, 'PRESIDENTE MEDICI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (17, 22, 'PORTO VELHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (16, 22, 'PIMENTA BUENO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (15, 22, 'OURO PRETO DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (14, 22, 'NOVA BRASILANDIA D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (13, 22, 'MACHADINHO D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (12, 22, 'JI-PARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (11, 22, 'JARU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (10, 22, 'GUAJARA-MIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5100, 21, 'XANGRI-LA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5099, 21, 'WESTFALIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5098, 21, 'VITORIA DAS MISSOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5097, 21, 'VISTA GAUCHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5096, 21, 'VISTA ALEGRE DO PRATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5095, 21, 'VISTA ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5094, 21, 'VILA NOVA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5093, 21, 'VILA MARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5092, 21, 'VILA LANGARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5091, 21, 'VILA FLORES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5090, 21, 'VICTOR GRAEFF', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5089, 21, 'VICENTE DUTRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5088, 21, 'VIAMAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5087, 21, 'VIADUTOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5086, 21, 'VESPASIANO CORREA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5085, 21, 'VERANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5084, 21, 'VERA CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5083, 21, 'VENANCIO AIRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5082, 21, 'VANINI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5081, 21, 'VALE REAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5080, 21, 'VALE DO SOL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5079, 21, 'VALE VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5078, 21, 'VACARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5077, 21, 'URUGUAIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5076, 21, 'UNISTALDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5075, 21, 'UNIAO DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5074, 21, 'UBIRETAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5073, 21, 'TURUCU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5072, 21, 'TUPARENDI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5071, 21, 'TUPANDI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5070, 21, 'TUPANCIRETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5069, 21, 'TUPANCI DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5068, 21, 'TUNAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5067, 21, 'TUCUNDUVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5066, 21, 'TRIUNFO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5065, 21, 'TRINDADE DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5064, 21, 'TRES PASSOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5063, 21, 'TRES PALMEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5062, 21, 'TRES FORQUILHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5061, 21, 'TRES DE MAIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5060, 21, 'TRES COROAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5059, 21, 'TRES CACHOEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5058, 21, 'TRES ARROIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5057, 21, 'TRAVESSEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5056, 21, 'TRAMANDAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5055, 21, 'TORRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5054, 21, 'TOROPI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5053, 21, 'TIRADENTES DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5052, 21, 'TIO HUGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5051, 21, 'TEUTONIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5050, 21, 'TERRA DE AREIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5049, 21, 'TENENTE PORTELA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5048, 21, 'TAVARES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5047, 21, 'TAQUARUCU DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5046, 21, 'TAQUARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5045, 21, 'TAQUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5044, 21, 'TAPES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5043, 21, 'TAPERA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5042, 21, 'TAPEJARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5041, 21, 'TABAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5040, 21, 'SOLEDADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5039, 21, 'SOBRADINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5038, 21, 'SINIMBU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5037, 21, 'SILVEIRA MARTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5036, 21, 'SEVERIANO DE ALMEIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5035, 21, 'SETE DE SETEMBRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5034, 21, 'SERTAO SANTANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5033, 21, 'SERTAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5032, 21, 'SERIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5031, 21, 'SERAFINA CORREA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5030, 21, 'SENTINELA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5029, 21, 'SENADOR SALGADO FILHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5028, 21, 'SELBACH', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5027, 21, 'SEGREDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5026, 21, 'SEDE NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5025, 21, 'SEBERI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5024, 21, 'SARANDI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5023, 21, 'SAPUCAIA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5022, 21, 'SAPIRANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5021, 21, 'SAO VICENTE DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5020, 21, 'SAO VENDELINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5019, 21, 'SAO VALERIO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5018, 21, 'SAO VALENTIM DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5017, 21, 'SAO VALENTIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5016, 21, 'SAO SEPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5015, 21, 'SAO SEBASTIAO DO CAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5014, 21, 'SAO PEDRO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5013, 21, 'SAO PEDRO DO BUTIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5012, 21, 'SAO PEDRO DAS MISSOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5011, 21, 'SAO PEDRO DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5010, 21, 'SAO PAULO DAS MISSOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5009, 21, 'SAO NICOLAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5008, 21, 'SAO MIGUEL DAS MISSOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5007, 21, 'SAO MARTINHO DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5006, 21, 'SAO MARTINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5005, 21, 'SAO MARCOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5004, 21, 'SAO LUIZ GONZAGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5003, 21, 'SAO LOURENCO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5002, 21, 'SAO LEOPOLDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5001, 21, 'SAO JOSE DOS AUSENTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5000, 21, 'SAO JOSE DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4999, 21, 'SAO JOSE DO OURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4998, 21, 'SAO JOSE DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4997, 21, 'SAO JOSE DO INHACORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4996, 21, 'SAO JOSE DO HORTENCIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4995, 21, 'SAO JOSE DO HERVAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4994, 21, 'SAO JOSE DAS MISSOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4993, 21, 'SAO JORGE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4992, 21, 'SAO JOAO DO POLESINE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4991, 21, 'SAO JOAO DA URTIGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4990, 21, 'SAO JERONIMO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4989, 21, 'SAO GABRIEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4988, 21, 'SAO FRANCISCO DE PAULA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4987, 21, 'SAO FRANCISCO DE ASSIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4986, 21, 'SAO DOMINGOS DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4985, 21, 'SAO BORJA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4984, 21, 'SANTO EXPEDITO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4983, 21, 'SANTO CRISTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4982, 21, 'SANTO AUGUSTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4981, 21, 'SANTO ANTONIO DO PLANALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4980, 21, 'SANTO ANTONIO DAS MISSOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4979, 21, 'SANTO ANTONIO DA PATRULHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4978, 21, 'SANTO ANTONIO DO PALMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4977, 21, 'SANTO ANGELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4976, 21, 'SANTIAGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4975, 21, 'SANTA VITORIA DO PALMAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4974, 21, 'SANTA TEREZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4973, 21, 'SANTA ROSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4972, 21, 'SANTANA DO LIVRAMENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4971, 21, 'SANTANA DA BOA VISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4970, 21, 'SANTA MARGARIDA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4969, 21, 'SANTA MARIA DO HERVAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4968, 21, 'SANTA MARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4967, 21, 'SANTA CRUZ DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4966, 21, 'SANTA CLARA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4965, 21, 'SANTA CECILIA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4964, 21, 'SANTA BARBARA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4963, 21, 'SANANDUVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4962, 21, 'SALVADOR DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4961, 21, 'SALVADOR DAS MISSOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4960, 21, 'SALTO DO JACUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4959, 21, 'SALDANHA MARINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4958, 21, 'SAGRADA FAMILIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4957, 21, 'ROSARIO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4956, 21, 'ROQUE GONZALES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4955, 21, 'RONDINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4954, 21, 'RONDA ALTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4953, 21, 'ROLANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4952, 21, 'ROLADOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4951, 21, 'RODEIO BONITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4950, 21, 'ROCA SALES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4949, 21, 'RIOZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4948, 21, 'RIO PARDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4947, 21, 'RIO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4946, 21, 'RIO DOS INDIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4945, 21, 'RESTINGA SECA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4944, 21, 'RELVADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4943, 21, 'REDENTORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4942, 21, 'QUINZE DE NOVEMBRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4941, 21, 'QUEVEDOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4940, 21, 'QUATRO IRMAOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4939, 21, 'QUARAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4938, 21, 'PUTINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4937, 21, 'PROTASIO ALVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4936, 21, 'PROGRESSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4935, 21, 'PRESIDENTE LUCENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4934, 21, 'POUSO NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4933, 21, 'PORTO XAVIER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4932, 21, 'PORTO VERA CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4931, 21, 'PORTO MAUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4930, 21, 'PORTO LUCENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4929, 21, 'PORTO ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4928, 21, 'PORTAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4927, 21, 'PONTE PRETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4926, 21, 'PONTAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4925, 21, 'POCO DAS ANTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4924, 21, 'PLANALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4923, 21, 'PIRATINI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4922, 21, 'PIRAPO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4921, 21, 'PINTO BANDEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4920, 21, 'PINHEIRO MACHADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4919, 21, 'PINHEIRINHO DO VALE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4918, 21, 'PINHAL GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4917, 21, 'PINHAL DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4916, 21, 'PINHAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4915, 21, 'PICADA CAFE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4914, 21, 'PELOTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4913, 21, 'PEJUCARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4912, 21, 'PEDRO OSORIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4911, 21, 'PEDRAS ALTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4910, 21, 'PAVERAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4909, 21, 'PAULO BENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4908, 21, 'PASSO FUNDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4907, 21, 'PASSO DO SOBRADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4906, 21, 'PASSA SETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4905, 21, 'PAROBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4904, 21, 'PARECI NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4903, 21, 'PARAISO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4902, 21, 'PARAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4901, 21, 'PANTANO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4900, 21, 'PANAMBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4899, 21, 'PALMITINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4898, 21, 'PALMEIRA DAS MISSOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4897, 21, 'PALMARES DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4896, 21, 'PAIM FILHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4895, 21, 'OSORIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4894, 21, 'NOVO BARREIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4893, 21, 'NOVO XINGU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4892, 21, 'NOVO TIRADENTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4891, 21, 'NOVO MACHADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4890, 21, 'NOVO HAMBURGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4889, 21, 'NOVO CABRAIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4888, 21, 'NOVA SANTA RITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4887, 21, 'NOVA ROMA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4886, 21, 'NOVA RAMADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4885, 21, 'NOVA PRATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4884, 21, 'NOVA PETROPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4883, 21, 'NOVA PALMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4882, 21, 'NOVA PADUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4881, 21, 'NOVA HARTZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4880, 21, 'NOVA ESPERANCA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4879, 21, 'NOVA CANDELARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4878, 21, 'NOVA BRESCIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4877, 21, 'NOVA BOA VISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4876, 21, 'NOVA BASSANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4875, 21, 'NOVA ARACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4874, 21, 'NOVA ALVORADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4873, 21, 'NONOAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4872, 21, 'NICOLAU VERGUEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4871, 21, 'NAO-ME-TOQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4870, 21, 'MULITERNO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4869, 21, 'MUITOS CAPOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4868, 21, 'MUCUM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4867, 21, 'MOSTARDAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4866, 21, 'MORRO REUTER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4865, 21, 'MORRO REDONDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4864, 21, 'MORRINHOS DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4863, 21, 'MORMACO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4862, 21, 'MONTENEGRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4861, 21, 'MONTE BELO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4860, 21, 'MONTE ALEGRE DOS CAMPOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4859, 21, 'MONTAURI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4858, 21, 'MIRAGUAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4857, 21, 'MINAS DO LEAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4856, 21, 'MAXIMILIANO DE ALMEIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4855, 21, 'MATO QUEIMADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4854, 21, 'MATO LEITAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4853, 21, 'MATO CASTELHANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4852, 21, 'MATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4851, 21, 'MARQUES DE SOUZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4850, 21, 'MARIANO MORO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4849, 21, 'MARIANA PIMENTEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4848, 21, 'MARCELINO RAMOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4847, 21, 'MARAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4846, 21, 'MARATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4845, 21, 'MAQUINE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4844, 21, 'MANOEL VIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4843, 21, 'MAMPITUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4842, 21, 'MACAMBARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4841, 21, 'MACHADINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4840, 21, 'LINHA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4839, 21, 'LINDOLFO COLLOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4838, 21, 'LIBERATO SALZANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4837, 21, 'LAVRAS DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4836, 21, 'LAJEADO DO BUGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4835, 21, 'LAJEADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4834, 21, 'LAGOA VERMELHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4833, 21, 'LAGOA DOS TRES CANTOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4832, 21, 'LAGOAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4831, 21, 'LAGOA BONITA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4830, 21, 'JULIO DE CASTILHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4829, 21, 'JOIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4828, 21, 'JARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4827, 21, 'JAQUIRANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4826, 21, 'JAGUARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4825, 21, 'JAGUARAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4824, 21, 'JACUTINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4823, 21, 'JACUIZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4822, 21, 'JABOTICABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4821, 21, 'IVOTI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4820, 21, 'IVORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4819, 21, 'ITATIBA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4818, 21, 'ITATI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4817, 21, 'ITAQUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4816, 21, 'ITAPUCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4815, 21, 'ITACURUBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4814, 21, 'ITAARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4813, 21, 'IRAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4812, 21, 'IPIRANGA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4811, 21, 'IPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4810, 21, 'INHACORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4809, 21, 'INDEPENDENCIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4808, 21, 'IMIGRANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4807, 21, 'IMBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4806, 21, 'ILOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4805, 21, 'IJUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4804, 21, 'IGREJINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4803, 21, 'IBIRUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4802, 21, 'IBIRAPUITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4801, 21, 'IBIRAIARAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4800, 21, 'IBIACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4799, 21, 'IBARAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4798, 21, 'HUMAITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4797, 21, 'HULHA NEGRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4796, 21, 'HORIZONTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4795, 21, 'HERVEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4794, 21, 'HARMONIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4793, 21, 'GUARANI DAS MISSOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4792, 21, 'GUAPORE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4791, 21, 'GUAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4790, 21, 'GUABIJU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4789, 21, 'GRAVATAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4788, 21, 'GRAMADO XAVIER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4787, 21, 'GRAMADO DOS LOUREIROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4786, 21, 'GRAMADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4785, 21, 'GLORINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4784, 21, 'GIRUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4783, 21, 'GETULIO VARGAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4782, 21, 'GENTIL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4781, 21, 'GENERAL CAMARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4780, 21, 'GAURAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4779, 21, 'GARRUCHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4778, 21, 'GARIBALDI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4777, 21, 'FREDERICO WESTPHALEN', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4776, 21, 'FORTALEZA DOS VALOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4775, 21, 'FORQUETINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4774, 21, 'FORMIGUEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4773, 21, 'FONTOURA XAVIER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4772, 21, 'FLORIANO PEIXOTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4771, 21, 'FLORES DA CUNHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4770, 21, 'FELIZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4769, 21, 'FAZENDA VILANOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4768, 21, 'FAXINALZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4767, 21, 'FAXINAL DO SOTURNO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4766, 21, 'FARROUPILHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4765, 21, 'FAGUNDES VARELA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4764, 21, 'EUGENIO DE CASTRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4763, 21, 'ESTRELA VELHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4762, 21, 'ESTRELA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4761, 21, 'ESTEIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4760, 21, 'ESTANCIA VELHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4759, 21, 'ESTACAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4758, 21, 'ESPUMOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4757, 21, 'ESPERANCA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4756, 21, 'ESMERALDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4755, 21, 'ERVAL SECO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4754, 21, 'ERVAL GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4753, 21, 'HERVAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4752, 21, 'ERNESTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4751, 21, 'ERECHIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4750, 21, 'EREBANGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4749, 21, 'ENTRE RIOS DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4748, 21, 'ENTRE-IJUIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4747, 21, 'ENGENHO VELHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4746, 21, 'ENCRUZILHADA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4745, 21, 'ENCANTADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4744, 21, 'ELDORADO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4743, 21, 'DOUTOR RICARDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4742, 21, 'DOUTOR MAURICIO CARDOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4741, 21, 'DONA FRANCISCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4740, 21, 'DOM PEDRITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4739, 21, 'DOM PEDRO DE ALCANTARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4738, 21, 'DOM FELICIANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4737, 21, 'DOIS LAJEADOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4736, 21, 'DOIS IRMAOS DAS MISSOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4735, 21, 'DOIS IRMAOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4734, 21, 'DILERMANDO DE AGUIAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4733, 21, 'DEZESSEIS DE NOVEMBRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4732, 21, 'DERRUBADAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4731, 21, 'DAVID CANABARRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4730, 21, 'CRUZEIRO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4729, 21, 'CRUZALTENSE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4728, 21, 'CRUZ ALTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4727, 21, 'CRISTAL DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4726, 21, 'CRISTAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4725, 21, 'CRISSIUMAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4724, 21, 'COXILHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4723, 21, 'COTIPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4722, 21, 'CORONEL PILAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4721, 21, 'CORONEL BICACO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4720, 21, 'CORONEL BARROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4719, 21, 'COQUEIROS DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4718, 21, 'COQUEIRO BAIXO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4717, 21, 'CONSTANTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4716, 21, 'CONDOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4715, 21, 'COLORADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4714, 21, 'COLINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4713, 21, 'CIRIACO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4712, 21, 'CIDREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4711, 21, 'CHUVISCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4710, 21, 'CHUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4709, 21, 'CHIAPETTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4708, 21, 'CHARRUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4707, 21, 'CHARQUEADAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4706, 21, 'CHAPADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4705, 21, 'CERRO LARGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4704, 21, 'CERRO GRANDE DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4703, 21, 'CERRO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4702, 21, 'CERRO BRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4701, 21, 'CERRITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4700, 21, 'CENTENARIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4699, 21, 'CAXIAS DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4698, 21, 'CATUIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4697, 21, 'CASEIROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4696, 21, 'CASCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4695, 21, 'CARLOS GOMES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4694, 21, 'CARLOS BARBOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4693, 21, 'CARAA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4692, 21, 'CARAZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4691, 21, 'CAPITAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4690, 21, 'CAPELA DE SANTANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4689, 21, 'CAPIVARI DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4688, 21, 'CAPAO DO LEAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4687, 21, 'CAPAO DO CIPO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4686, 21, 'CAPAO DA CANOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4685, 21, 'CAPAO BONITO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4684, 21, 'CANUDOS DO VALE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4683, 21, 'CANOAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4682, 21, 'CANGUCU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4681, 21, 'CANELA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4680, 21, 'CANDIOTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4679, 21, 'CANDIDO GODOI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4678, 21, 'CANDELARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4677, 21, 'CAMPOS BORGES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4676, 21, 'CAMPO NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4675, 21, 'CAMPO BOM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4674, 21, 'CAMPINAS DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4673, 21, 'CAMPINA DAS MISSOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4672, 21, 'CAMPESTRE DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4671, 21, 'CAMBARA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4670, 21, 'CAMARGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4669, 21, 'CAMAQUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4668, 21, 'CAICARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4667, 21, 'CAIBATE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4666, 21, 'CACIQUE DOBLE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4665, 21, 'CACHOEIRINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4664, 21, 'CACHOEIRA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4663, 21, 'CACEQUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4662, 21, 'CACAPAVA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4661, 21, 'BUTIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4660, 21, 'BROCHIER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4659, 21, 'BRAGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4658, 21, 'BOZANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4657, 21, 'BOSSOROCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4656, 21, 'BOQUEIRAO DO LEAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4655, 21, 'BOM RETIRO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4654, 21, 'BOM PROGRESSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4653, 21, 'BOM PRINCIPIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4652, 21, 'BOM JESUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4651, 21, 'BOA VISTA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4650, 21, 'BOA VISTA DO INCRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4649, 21, 'BOA VISTA DO CADEADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4648, 21, 'BOA VISTA DO BURICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4647, 21, 'BOA VISTA DAS MISSOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4646, 21, 'BENTO GONCALVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4645, 21, 'BENJAMIN CONSTANT DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4644, 21, 'BARROS CASSAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4643, 21, 'BARRA FUNDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4642, 21, 'BARRA DO RIO AZUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4641, 21, 'BARRA DO RIBEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4640, 21, 'BARRA DO QUARAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4639, 21, 'BARRA DO GUARITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4638, 21, 'BARRACAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4637, 21, 'BARAO DO TRIUNFO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4636, 21, 'BARAO DE COTEGIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4635, 21, 'BARAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4634, 21, 'BALNEARIO PINHAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4633, 21, 'BAGE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4632, 21, 'AUREA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4631, 21, 'AUGUSTO PESTANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4630, 21, 'ARVOREZINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4629, 21, 'ARROIO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4628, 21, 'ARROIO DO TIGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4627, 21, 'ARROIO DOS RATOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4626, 21, 'ARROIO DO PADRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4625, 21, 'ARROIO DO SAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4624, 21, 'ARROIO DO MEIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4623, 21, 'ARATIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4622, 21, 'ARARICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4621, 21, 'ARAMBARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4620, 21, 'ANTONIO PRADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4619, 21, 'ANTA GORDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4618, 21, 'ANDRE DA ROCHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4617, 21, 'AMETISTA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4616, 21, 'AMARAL FERRADOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4615, 21, 'ALVORADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4614, 21, 'ALTO FELIZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4613, 21, 'ALTO ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4612, 21, 'ALPESTRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4611, 21, 'ALMIRANTE TAMANDARE DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4610, 21, 'ALEGRIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4609, 21, 'ALEGRETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4608, 21, 'ALECRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4607, 21, 'AJURICABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4606, 21, 'AGUDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4605, 21, 'AGUA SANTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4604, 21, 'ACEGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1241, 20, 'VILA FLOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1240, 20, 'VICOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1239, 20, 'VERA CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1238, 20, 'VENHA-VER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1237, 20, 'VARZEA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1236, 20, 'UPANEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1235, 20, 'UMARIZAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1234, 20, 'TRIUNFO POTIGUAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1233, 20, 'TOUROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1232, 20, 'TIMBAUBA DOS BATISTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1231, 20, 'TIBAU DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1230, 20, 'TENENTE LAURENTINO CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1229, 20, 'TENENTE ANANIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1228, 20, 'TANGARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1227, 20, 'TAIPU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1226, 20, 'TABOLEIRO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1225, 20, 'SITIO NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1224, 20, 'SEVERIANO MELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1223, 20, 'SERRINHA DOS PINTOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1222, 20, 'SERRINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1221, 20, 'SERRA NEGRA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1220, 20, 'SERRA DO MEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1219, 20, 'SERRA DE SAO BENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1218, 20, 'SENADOR GEORGINO AVELINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1217, 20, 'SENADOR ELOI DE SOUZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1216, 20, 'SAO VICENTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1215, 20, 'SAO TOME', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1214, 20, 'SAO RAFAEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1213, 20, 'SAO PEDRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1212, 20, 'SAO PAULO DO POTENGI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1211, 20, 'SAO MIGUEL DO GOSTOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1210, 20, 'SAO MIGUEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1209, 20, 'SAO JOSE DO SERIDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1208, 20, 'SAO JOSE DO CAMPESTRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1207, 20, 'SAO JOSE DE MIPIBU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1206, 20, 'SAO JOAO DO SABUGI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1205, 20, 'SAO GONCALO DO AMARANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1204, 20, 'SAO FRANCISCO DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1203, 20, 'SAO FERNANDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1202, 20, 'SAO BENTO DO TRAIRI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1201, 20, 'SAO BENTO DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1200, 20, 'SANTO ANTONIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1199, 20, 'SANTANA DO SERIDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1198, 20, 'SANTANA DO MATOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1197, 20, 'SANTA CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1196, 20, 'RUY BARBOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1195, 20, 'TIBAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1194, 20, 'RODOLFO FERNANDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1193, 20, 'RIACHUELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1192, 20, 'RIACHO DE SANTANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1191, 20, 'RIACHO DA CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1190, 20, 'RAFAEL GODEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1189, 20, 'RAFAEL FERNANDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1188, 20, 'PUREZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1187, 20, 'PRESIDENTE JUSCELINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1186, 20, 'PORTO DO MANGUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1185, 20, 'PORTALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1184, 20, 'POCO BRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1183, 20, 'PILOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1182, 20, 'PENDENCIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1181, 20, 'PEDRO VELHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1180, 20, 'PEDRO AVELINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1179, 20, 'PEDRA PRETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1178, 20, 'PEDRA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1177, 20, 'PAU DOS FERROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1176, 20, 'SANTA MARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1175, 20, 'PATU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1174, 20, 'PASSAGEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1173, 20, 'PASSA E FICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1172, 20, 'RIO DO FOGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1171, 20, 'PARELHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1170, 20, 'PARAZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1169, 20, 'PARAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1168, 20, 'PARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1167, 20, 'OURO BRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1166, 20, 'OLHO-D''AGUA DO BORGES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1165, 20, 'NOVA CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1164, 20, 'NISIA FLORESTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1163, 20, 'NATAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1162, 20, 'MOSSORO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1161, 20, 'MONTE DAS GAMELEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1160, 20, 'MONTE ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1159, 20, 'MONTANHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1158, 20, 'MESSIAS TARGINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1157, 20, 'MAXARANGUAPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1156, 20, 'MARTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1155, 20, 'MARCELINO VIEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1154, 20, 'MAJOR SALES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1153, 20, 'MACAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1152, 20, 'MACAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1151, 20, 'LUIS GOMES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1150, 20, 'LUCRECIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1149, 20, 'LAJES PINTADAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1148, 20, 'LAJES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1147, 20, 'LAGOA SALGADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1146, 20, 'LAGOA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1145, 20, 'LAGOA DE VELHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1144, 20, 'LAGOA DE PEDRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1143, 20, 'LAGOA D''ANTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1142, 20, 'JUNDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1141, 20, 'JUCURUTU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1140, 20, 'JOSE DA PENHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1139, 20, 'JOAO DIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1138, 20, 'JOAO CAMARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1137, 20, 'JARDIM DO SERIDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1136, 20, 'JARDIM DE PIRANHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1135, 20, 'JARDIM DE ANGICOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1134, 20, 'JAPI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1133, 20, 'JANUARIO CICCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1132, 20, 'JANDUIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1131, 20, 'JANDAIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1130, 20, 'JACANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1129, 20, 'ITAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1128, 20, 'ITAJA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1127, 20, 'IPUEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1126, 20, 'IPANGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1125, 20, 'IELMO MARINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1124, 20, 'GUAMARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1123, 20, 'GROSSOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1122, 20, 'GOVERNADOR DIX-SEPT ROSADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1121, 20, 'GOIANINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1120, 20, 'GALINHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1119, 20, 'FRUTUOSO GOMES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1118, 20, 'FRANCISCO DANTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1117, 20, 'FLORANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1116, 20, 'FERNANDO PEDROZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1115, 20, 'FELIPE GUERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1114, 20, 'EXTREMOZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1113, 20, 'ESPIRITO SANTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1112, 20, 'EQUADOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1111, 20, 'ENCANTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1110, 20, 'PARNAMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1109, 20, 'DOUTOR SEVERIANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1108, 20, 'CURRAIS NOVOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1107, 20, 'CRUZETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1106, 20, 'CORONEL JOAO PESSOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1105, 20, 'CORONEL EZEQUIEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1104, 20, 'CERRO CORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1103, 20, 'CEARA-MIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1102, 20, 'CARNAUBAIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1101, 20, 'CARNAUBA DOS DANTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1100, 20, 'CARAUBAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1099, 20, 'CANGUARETAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1098, 20, 'CAMPO REDONDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1097, 20, 'CAICO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1096, 20, 'CAICARA DO RIO DO VENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1095, 20, 'CAICARA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1094, 20, 'BREJINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1093, 20, 'BOM JESUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1092, 20, 'BODO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1091, 20, 'BENTO FERNANDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1090, 20, 'BARCELONA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1089, 20, 'BARAUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1088, 20, 'BAIA FORMOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1087, 20, 'AUGUSTO SEVERO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1086, 20, 'ARES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1085, 20, 'AREIA BRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1084, 20, 'APODI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1083, 20, 'ANTONIO MARTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1082, 20, 'ANGICOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1081, 20, 'ALTO DO RODRIGUES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1080, 20, 'ALMINO AFONSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1079, 20, 'ALEXANDRIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1078, 20, 'AGUA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1077, 20, 'AFONSO BEZERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1076, 20, 'ACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1075, 20, 'ACARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (74, 1, 'PORTO ACRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (73, 1, 'XAPURI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (72, 1, 'TARAUACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (71, 1, 'SENA MADUREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (70, 1, 'SENADOR GUIOMARD', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (69, 1, 'SANTA ROSA DO PURUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (68, 1, 'RODRIGUES ALVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (67, 1, 'RIO BRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (66, 1, 'PORTO WALTER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (65, 1, 'PLACIDO DE CASTRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (64, 1, 'MARECHAL THAUMATURGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (63, 1, 'MANOEL URBANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (62, 1, 'MANCIO LIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (61, 1, 'JORDAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (60, 1, 'FEIJO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (59, 1, 'EPITACIOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (58, 1, 'CRUZEIRO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (57, 1, 'CAPIXABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (56, 1, 'BUJARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (55, 1, 'BRASILEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (54, 1, 'ASSIS BRASIL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (53, 1, 'ACRELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3266, 19, 'VOLTA REDONDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3265, 19, 'VASSOURAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3264, 19, 'VARRE-SAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3263, 19, 'VALENCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3262, 19, 'TRES RIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3261, 19, 'TRAJANO DE MORAIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3260, 19, 'TERESOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3259, 19, 'TANGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3258, 19, 'SUMIDOURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3257, 19, 'SILVA JARDIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3256, 19, 'SEROPEDICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3255, 19, 'SAQUAREMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3254, 19, 'SAPUCAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3253, 19, 'SAO SEBASTIAO DO ALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3252, 19, 'SAO PEDRO DA ALDEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3251, 19, 'SAO JOSE DO VALE DO RIO PRETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3250, 19, 'SAO JOSE DE UBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3249, 19, 'SAO JOAO DE MERITI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3248, 19, 'SAO JOAO DA BARRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3247, 19, 'SAO GONCALO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3246, 19, 'SAO FIDELIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3245, 19, 'SAO FRANCISCO DE ITABAPOANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3244, 19, 'SANTO ANTONIO DE PADUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3243, 19, 'SANTA MARIA MADALENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3242, 19, 'RIO DE JANEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3241, 19, 'RIO DAS OSTRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3240, 19, 'RIO DAS FLORES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3239, 19, 'RIO CLARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3238, 19, 'RIO BONITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3237, 19, 'RESENDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3236, 19, 'QUISSAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3235, 19, 'QUEIMADOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3234, 19, 'QUATIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3233, 19, 'PORTO REAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3232, 19, 'PORCIUNCULA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3231, 19, 'PIRAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3230, 19, 'PINHEIRAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3229, 19, 'PETROPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3228, 19, 'PATY DO ALFERES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3227, 19, 'PARATI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3226, 19, 'PARAIBA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3225, 19, 'PARACAMBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3224, 19, 'NOVA IGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3223, 19, 'NOVA FRIBURGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3222, 19, 'NITEROI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3221, 19, 'NILOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3220, 19, 'NATIVIDADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3219, 19, 'MIRACEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3218, 19, 'MIGUEL PEREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3217, 19, 'MESQUITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3216, 19, 'MENDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3215, 19, 'MARICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3214, 19, 'MANGARATIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3213, 19, 'MAGE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3212, 19, 'MACUCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3211, 19, 'MACAE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3210, 19, 'LAJE DO MURIAE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3209, 19, 'JAPERI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3208, 19, 'ITATIAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3207, 19, 'ITAPERUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3206, 19, 'ITAOCARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3205, 19, 'ITALVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3204, 19, 'ITAGUAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3203, 19, 'ITABORAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3202, 19, 'IGUABA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3201, 19, 'GUAPIMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3200, 19, 'ENGENHEIRO PAULO DE FRONTIN', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3199, 19, 'DUQUE DE CAXIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3198, 19, 'DUAS BARRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3197, 19, 'CORDEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3196, 19, 'CONCEICAO DE MACABU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3195, 19, 'CASIMIRO DE ABREU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3194, 19, 'CARMO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3193, 19, 'CARDOSO MOREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3192, 19, 'CANTAGALO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3191, 19, 'CAMPOS DOS GOYTACAZES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3190, 19, 'COMENDADOR LEVY GASPARIAN', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3189, 19, 'CARAPEBUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3188, 19, 'CAMBUCI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3187, 19, 'CACHOEIRAS DE MACACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3186, 19, 'CABO FRIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3185, 19, 'BOM JESUS DO ITABAPOANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3184, 19, 'BOM JARDIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3183, 19, 'BELFORD ROXO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3182, 19, 'BARRA MANSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3181, 19, 'BARRA DO PIRAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3180, 19, 'ARRAIAL DO CABO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3179, 19, 'ARMACAO DOS BUZIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3178, 19, 'AREAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3177, 19, 'ARARUAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3176, 19, 'APERIBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3175, 19, 'ANGRA DOS REIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (890, 18, 'WALL FERRAZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (889, 18, 'VILA NOVA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (888, 18, 'VERA MENDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (887, 18, 'VARZEA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (886, 18, 'VARZEA BRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (885, 18, 'VALENCA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (884, 18, 'URUCUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (883, 18, 'UNIAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (882, 18, 'TERESINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (881, 18, 'TANQUE DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (880, 18, 'TAMBORIL DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (879, 18, 'SUSSUAPARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (878, 18, 'SOCORRO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (877, 18, 'SIMPLICIO MENDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (876, 18, 'SIMOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (875, 18, 'SIGEFREDO PACHECO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (874, 18, 'SEBASTIAO LEAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (873, 18, 'SEBASTIAO BARROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (872, 18, 'SAO RAIMUNDO NONATO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (871, 18, 'SAO PEDRO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (870, 18, 'SAO MIGUEL DO TAPUIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (869, 18, 'SAO MIGUEL DO FIDALGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (868, 18, 'SAO MIGUEL DA BAIXA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (867, 18, 'SAO LUIS DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (866, 18, 'SAO LOURENCO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (865, 18, 'SAO JULIAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (864, 18, 'SAO JOSE DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (863, 18, 'SAO JOSE DO PEIXE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (862, 18, 'SAO JOSE DO DIVINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (861, 18, 'SAO JOAO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (860, 18, 'SAO JOAO DO ARRAIAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (859, 18, 'SAO JOAO DA VARJOTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (858, 18, 'SAO JOAO DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (857, 18, 'SAO JOAO DA FRONTEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (856, 18, 'SAO JOAO DA CANABRAVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (855, 18, 'SAO GONCALO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (854, 18, 'SAO GONCALO DO GURGUEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (853, 18, 'SAO FRANCISCO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (852, 18, 'SAO FRANCISCO DE ASSIS DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (851, 18, 'SAO FELIX DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (850, 18, 'SAO BRAZ DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (849, 18, 'SANTO INACIO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (848, 18, 'SANTO ANTONIO DOS MILAGRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (847, 18, 'SANTO ANTONIO DE LISBOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (846, 18, 'SANTA ROSA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (845, 18, 'SANTANA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (844, 18, 'SANTA LUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (843, 18, 'SANTA FILOMENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (842, 18, 'SANTA CRUZ DOS MILAGRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (841, 18, 'SANTA CRUZ DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (840, 18, 'RIO GRANDE DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (839, 18, 'RIBEIRO GONCALVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (838, 18, 'RIBEIRA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (837, 18, 'RIACHO FRIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (836, 18, 'REGENERACAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (835, 18, 'REDENCAO DO GURGUEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (834, 18, 'QUEIMADA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (833, 18, 'PRATA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (832, 18, 'PORTO ALEGRE DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (831, 18, 'PORTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (830, 18, 'PIRIPIRI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (829, 18, 'PIRACURUCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (828, 18, 'PIO IX', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (827, 18, 'PIMENTEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (826, 18, 'PICOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (825, 18, 'NOVA SANTA RITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (824, 18, 'PEDRO LAURENTINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (823, 18, 'PEDRO II', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (822, 18, 'PAVUSSU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (821, 18, 'PAULISTANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (820, 18, 'PAU D''ARCO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (819, 18, 'PATOS DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (818, 18, 'PASSAGEM FRANCA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (817, 18, 'PARNAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (816, 18, 'PARNAGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (815, 18, 'PAQUETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (814, 18, 'PALMEIRAIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (813, 18, 'PALMEIRA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (812, 18, 'PAJEU DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (811, 18, 'PAES LANDIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (810, 18, 'PADRE MARCOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (809, 18, 'OLHO D''AGUA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (808, 18, 'OEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (807, 18, 'NOVO SANTO ANTONIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (806, 18, 'NOVO ORIENTE DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (805, 18, 'NOSSA SENHORA DOS REMEDIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (804, 18, 'NOSSA SENHORA DE NAZARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (803, 18, 'NAZARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (802, 18, 'NAZARE DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (801, 18, 'MURICI DOS PORTELAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (800, 18, 'MORRO DO CHAPEU DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (799, 18, 'MORRO CABECA NO TEMPO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (798, 18, 'MONTE ALEGRE DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (797, 18, 'MONSENHOR HIPOLITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (796, 18, 'MONSENHOR GIL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (795, 18, 'MILTON BRANDAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (794, 18, 'MIGUEL LEAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (793, 18, 'MIGUEL ALVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (792, 18, 'MATIAS OLIMPIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (791, 18, 'MASSAPE DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (790, 18, 'MARCOS PARENTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (789, 18, 'MARCOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (788, 18, 'MANOEL EMIDIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (787, 18, 'MADEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (786, 18, 'LUZILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (785, 18, 'LUIS CORREIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (784, 18, 'LANDRI SALES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (783, 18, 'LAGOA DO SITIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (782, 18, 'LAGOA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (781, 18, 'LAGOA DE SAO FRANCISCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (780, 18, 'LAGOA DO BARRO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (779, 18, 'LAGOA ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (778, 18, 'LAGOINHA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (777, 18, 'JUREMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (776, 18, 'JULIO BORGES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (775, 18, 'JUAZEIRO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (774, 18, 'JOSE DE FREITAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (773, 18, 'JOCA MARQUES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (772, 18, 'JOAQUIM PIRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (771, 18, 'JOAO COSTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (770, 18, 'JERUMENHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (769, 18, 'JATOBA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (768, 18, 'JARDIM DO MULATO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (767, 18, 'JAICOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (766, 18, 'JACOBINA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (765, 18, 'ITAUEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (764, 18, 'ITAINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (763, 18, 'ISAIAS COELHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (762, 18, 'IPIRANGA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (761, 18, 'INHUMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (760, 18, 'ILHA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (759, 18, 'HUGO NAPOLEAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (758, 18, 'GUARIBAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (757, 18, 'GUADALUPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (756, 18, 'GILBUES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (755, 18, 'GEMINIANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (754, 18, 'FRONTEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (753, 18, 'FRANCISCO SANTOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (752, 18, 'FRANCISCO MACEDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (751, 18, 'FRANCISCO AYRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (750, 18, 'FRANCINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (749, 18, 'FLORIANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (748, 18, 'FLORESTA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (747, 18, 'FLORES DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (746, 18, 'FARTURA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (745, 18, 'ESPERANTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (744, 18, 'ELISEU MARTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (743, 18, 'ELESBAO VELOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (742, 18, 'DOM INOCENCIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (741, 18, 'DOMINGOS MOURAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (740, 18, 'DOM EXPEDITO LOPES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (739, 18, 'DIRCEU ARCOVERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (738, 18, 'DEMERVAL LOBAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (737, 18, 'CURRAL NOVO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (736, 18, 'CURRALINHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (735, 18, 'CURRAIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (734, 18, 'CURIMATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (733, 18, 'CRISTINO CASTRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (732, 18, 'CRISTALANDIA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (731, 18, 'CORRENTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (730, 18, 'CORONEL JOSE DIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (729, 18, 'CONCEICAO DO CANINDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (728, 18, 'COLONIA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (727, 18, 'COLONIA DO GURGUEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (726, 18, 'COIVARAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (725, 18, 'COCAL DOS ALVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (724, 18, 'COCAL DE TELHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (723, 18, 'COCAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (722, 18, 'CAXINGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (721, 18, 'CASTELO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (720, 18, 'CARIDADE DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (719, 18, 'CARAUBAS DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (718, 18, 'CARACOL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (717, 18, 'CAPITAO GERVASIO OLIVEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (716, 18, 'CAPITAO DE CAMPOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (715, 18, 'CANTO DO BURITI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (714, 18, 'CANAVIEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (713, 18, 'CAMPO MAIOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (712, 18, 'CAMPO LARGO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (711, 18, 'CAMPO GRANDE DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (710, 18, 'CAMPO ALEGRE DO FIDALGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (709, 18, 'CAMPINAS DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (708, 18, 'CALDEIRAO GRANDE DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (707, 18, 'CAJUEIRO DA PRAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (706, 18, 'CAJAZEIRAS DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (705, 18, 'CABECEIRAS DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (704, 18, 'BURITI DOS MONTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (703, 18, 'BURITI DOS LOPES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (702, 18, 'BREJO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (701, 18, 'BRASILEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (700, 18, 'BOQUEIRAO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (699, 18, 'BONFIM DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (698, 18, 'BOM PRINCIPIO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (697, 18, 'BOM JESUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (696, 18, 'BOCAINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (695, 18, 'BOA HORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (694, 18, 'BETANIA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (693, 18, 'BERTOLINIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (692, 18, 'BENEDITINOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (691, 18, 'BELEM DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (690, 18, 'BELA VISTA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (689, 18, 'BATALHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (688, 18, 'BARRO DURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (687, 18, 'BARREIRAS DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (686, 18, 'BARRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (685, 18, 'BARRA D''ALCANTARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (684, 18, 'BAIXA GRANDE DO RIBEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (683, 18, 'AVELINO LOPES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (682, 18, 'ASSUNCAO DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (681, 18, 'ARRAIAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (680, 18, 'AROEIRAS DO ITAIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (679, 18, 'AROAZES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (678, 18, 'ANTONIO ALMEIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (677, 18, 'ANISIO DE ABREU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (676, 18, 'ANGICAL DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (675, 18, 'AMARANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (674, 18, 'ALVORADA DO GURGUEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (673, 18, 'ALTOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (672, 18, 'ALTO LONGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (671, 18, 'ALEGRETE DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (670, 18, 'ALAGOINHA DO PIAUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (669, 18, 'AGUA BRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (668, 18, 'AGRICOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (667, 18, 'ACAUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1649, 17, 'XEXEU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1648, 17, 'VITORIA DE SANTO ANTAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1647, 17, 'VICENCIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1646, 17, 'VERTENTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1645, 17, 'VERTENTE DO LERIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1644, 17, 'VERDEJANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1643, 17, 'VENTUROSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1642, 17, 'TUPARETAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1641, 17, 'TUPANATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1640, 17, 'TRIUNFO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1639, 17, 'TRINDADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1638, 17, 'TRACUNHAEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1637, 17, 'TORITAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1636, 17, 'TIMBAUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1635, 17, 'TERRA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1634, 17, 'TEREZINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1633, 17, 'TAQUARITINGA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1632, 17, 'TAMANDARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1631, 17, 'TACARATU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1630, 17, 'TACAIMBO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1629, 17, 'TABIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1628, 17, 'SURUBIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1627, 17, 'SOLIDAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1626, 17, 'MOREILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1625, 17, 'SIRINHAEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1624, 17, 'SERTANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1623, 17, 'SERRITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1622, 17, 'SERRA TALHADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1621, 17, 'SAO VICENTE FERRER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1620, 17, 'SAO LOURENCO DA MATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1619, 17, 'SAO JOSE DO EGITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1618, 17, 'SAO JOSE DO BELMONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1617, 17, 'SAO JOSE DA COROA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1616, 17, 'SAO JOAQUIM DO MONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1615, 17, 'SAO JOAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1614, 17, 'SAO CAITANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1613, 17, 'SAO BENTO DO UNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1612, 17, 'SAO BENEDITO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1611, 17, 'SANTA TEREZINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1610, 17, 'SANTA MARIA DO CAMBUCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1609, 17, 'SANTA MARIA DA BOA VISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1608, 17, 'SANTA FILOMENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1607, 17, 'SANTA CRUZ DO CAPIBARIBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1606, 17, 'SANTA CRUZ DA BAIXA VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1605, 17, 'SANTA CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1604, 17, 'SANHARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1603, 17, 'SALOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1602, 17, 'SALGUEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1601, 17, 'SALGADINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1600, 17, 'SAIRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1599, 17, 'RIO FORMOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1598, 17, 'RIBEIRAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1597, 17, 'RIACHO DAS ALMAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1596, 17, 'RECIFE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1595, 17, 'QUIXABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1594, 17, 'QUIPAPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1593, 17, 'PRIMAVERA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1592, 17, 'POMBOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1591, 17, 'POCAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1590, 17, 'PETROLINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1589, 17, 'PETROLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1588, 17, 'PESQUEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1587, 17, 'PEDRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1586, 17, 'PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1585, 17, 'PAUDALHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1584, 17, 'PASSIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1583, 17, 'PARNAMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1582, 17, 'PARANATAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1581, 17, 'PANELAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1580, 17, 'PALMEIRINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1579, 17, 'PALMARES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1578, 17, 'OURICURI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1577, 17, 'OROCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1576, 17, 'OROBO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1575, 17, 'OLINDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1574, 17, 'NAZARE DA MATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1573, 17, 'MORENO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1572, 17, 'MIRANDIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1571, 17, 'MARAIAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1570, 17, 'MANARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1569, 17, 'MACHADOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1568, 17, 'MACAPARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1567, 17, 'LIMOEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1566, 17, 'LAJEDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1565, 17, 'LAGOA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1564, 17, 'LAGOA DOS GATOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1563, 17, 'LAGOA DO OURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1562, 17, 'LAGOA DO ITAENGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1561, 17, 'LAGOA DO CARRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1560, 17, 'JUREMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1559, 17, 'JUPI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1558, 17, 'JUCATI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1557, 17, 'JOAQUIM NABUCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1556, 17, 'JOAO ALFREDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1555, 17, 'JATOBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1554, 17, 'JATAUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1553, 17, 'JAQUEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1552, 17, 'JABOATAO DOS GUARARAPES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1551, 17, 'ITAQUITINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1550, 17, 'ITAPISSUMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1549, 17, 'ITAPETIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1548, 17, 'ITAMBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1547, 17, 'ILHA DE ITAMARACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1546, 17, 'ITAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1545, 17, 'ITACURUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1544, 17, 'IPUBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1543, 17, 'IPOJUCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1542, 17, 'INGAZEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1541, 17, 'INAJA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1540, 17, 'IGUARACI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1539, 17, 'IGARASSU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1538, 17, 'IBIRAJUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1537, 17, 'IBIMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1536, 17, 'IATI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1535, 17, 'GRAVATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1534, 17, 'GRANITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1533, 17, 'GOIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1532, 17, 'GLORIA DO GOITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1531, 17, 'GARANHUNS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1530, 17, 'GAMELEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1529, 17, 'FREI MIGUELINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1528, 17, 'FLORESTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1527, 17, 'FLORES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1526, 17, 'FERREIROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1525, 17, 'FERNANDO DE NORONHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1524, 17, 'FEIRA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1523, 17, 'EXU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1522, 17, 'ESCADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1521, 17, 'DORMENTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1520, 17, 'CUSTODIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1519, 17, 'CUPIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1518, 17, 'CUMARU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1517, 17, 'CORTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1516, 17, 'CORRENTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1515, 17, 'CONDADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1514, 17, 'CHA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1513, 17, 'CHA DE ALEGRIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1512, 17, 'CEDRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1511, 17, 'CATENDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1510, 17, 'CASINHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1509, 17, 'CARUARU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1508, 17, 'CARPINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1507, 17, 'CARNAUBEIRA DA PENHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1506, 17, 'CARNAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1505, 17, 'CAPOEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1504, 17, 'CANHOTINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1503, 17, 'CAMUTANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1502, 17, 'CAMOCIM DE SAO FELIX', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1501, 17, 'CAMARAGIBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1500, 17, 'CALUMBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1499, 17, 'CALCADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1498, 17, 'CAETES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1497, 17, 'CACHOEIRINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1496, 17, 'CABROBO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1495, 17, 'CABO DE SANTO AGOSTINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1494, 17, 'BUIQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1493, 17, 'BUENOS AIRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1492, 17, 'BREJO DA MADRE DE DEUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1491, 17, 'BREJINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1490, 17, 'BREJAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1489, 17, 'BONITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1488, 17, 'BOM JARDIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1487, 17, 'BOM CONSELHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1486, 17, 'BODOCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1485, 17, 'BEZERROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1484, 17, 'BETANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1483, 17, 'BELO JARDIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1482, 17, 'BELEM DE SAO FRANCISCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1481, 17, 'BELEM DE MARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1480, 17, 'BARREIROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1479, 17, 'BARRA DE GUABIRABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1478, 17, 'ARCOVERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1477, 17, 'ARARIPINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1476, 17, 'ARACOIABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1475, 17, 'ANGELIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1474, 17, 'AMARAJI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1473, 17, 'ALTINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1472, 17, 'ALIANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1471, 17, 'ALAGOINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1470, 17, 'AGUAS BELAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1469, 17, 'AGUA PRETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1468, 17, 'AGRESTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1467, 17, 'AFRANIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1466, 17, 'AFOGADOS DA INGAZEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1465, 17, 'ABREU E LIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4310, 16, 'XAMBRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4309, 16, 'VITORINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4308, 16, 'VIRMOND', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4307, 16, 'DOUTOR ULYSSES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4306, 16, 'ALTO PARAISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4305, 16, 'VERE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4304, 16, 'VERA CRUZ DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4303, 16, 'VENTANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4302, 16, 'WENCESLAU BRAZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4301, 16, 'URAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4300, 16, 'UNIFLOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4299, 16, 'UNIAO DA VITORIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4298, 16, 'UMUARAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4297, 16, 'UBIRATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4296, 16, 'TURVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4295, 16, 'TUPASSI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4294, 16, 'TUNEIRAS DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4293, 16, 'TUNAS DO PARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4292, 16, 'TRES BARRAS DO PARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4291, 16, 'TOMAZINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4290, 16, 'TOLEDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4289, 16, 'TIJUCAS DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4288, 16, 'TIBAGI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4287, 16, 'TERRA ROXA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4286, 16, 'TERRA RICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4285, 16, 'TERRA BOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4284, 16, 'TELEMACO BORBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4283, 16, 'TEIXEIRA SOARES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4282, 16, 'TAPIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4281, 16, 'TAPEJARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4280, 16, 'TAMBOARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4279, 16, 'TAMARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4278, 16, 'SULINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4277, 16, 'SIQUEIRA CAMPOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4276, 16, 'SERTANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4275, 16, 'SERTANEJA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4274, 16, 'SERRANOPOLIS DO IGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4273, 16, 'SENGES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4272, 16, 'SAUDADE DO IGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4271, 16, 'SARANDI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4270, 16, 'SAPOPEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4269, 16, 'SAO TOME', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4268, 16, 'SAO SEBASTIAO DA AMOREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4267, 16, 'SAO PEDRO DO PARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4266, 16, 'SAO PEDRO DO IVAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4265, 16, 'SAO PEDRO DO IGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4264, 16, 'SAO MIGUEL DO IGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4263, 16, 'SAO MATEUS DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4262, 16, 'SAO MANOEL DO PARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4261, 16, 'SAO JOSE DOS PINHAIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4260, 16, 'SAO JOSE DAS PALMEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4259, 16, 'SAO JOSE DA BOA VISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4258, 16, 'SAO JORGE DO PATROCINIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4257, 16, 'SAO JORGE DO IVAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4256, 16, 'SAO JORGE D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4255, 16, 'SAO JOAO DO TRIUNFO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4254, 16, 'SAO JOAO DO IVAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4253, 16, 'SAO JOAO DO CAIUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4252, 16, 'SAO JOAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4251, 16, 'SAO JERONIMO DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4250, 16, 'SAO CARLOS DO IVAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4249, 16, 'SANTO INACIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4248, 16, 'SANTO ANTONIO DO SUDOESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4247, 16, 'SANTO ANTONIO DO PARAISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4246, 16, 'SANTO ANTONIO DO CAIUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4245, 16, 'SANTO ANTONIO DA PLATINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4244, 16, 'SANTA TEREZINHA DE ITAIPU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4243, 16, 'SANTA TEREZA DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4242, 16, 'SANTANA DO ITARARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4241, 16, 'SANTA MONICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4240, 16, 'SANTA MARIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4239, 16, 'SANTA MARIA DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4238, 16, 'SANTA LUCIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4237, 16, 'SANTA IZABEL DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4236, 16, 'SANTA ISABEL DO IVAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4235, 16, 'SANTA INES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4234, 16, 'SANTA HELENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4233, 16, 'SANTA FE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4232, 16, 'SANTA CRUZ DE MONTE CASTELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4231, 16, 'SANTA CECILIA DO PAVAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4230, 16, 'SANTA AMELIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4229, 16, 'SALTO DO LONTRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4228, 16, 'SALTO DO ITARARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4227, 16, 'SALGADO FILHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4226, 16, 'SABAUDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4225, 16, 'ROSARIO DO IVAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4224, 16, 'RONDON', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4223, 16, 'RONCADOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4222, 16, 'ROLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4221, 16, 'RIO NEGRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4220, 16, 'RIO BRANCO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4219, 16, 'RIO BRANCO DO IVAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4218, 16, 'RIO BONITO DO IGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4217, 16, 'RIO BOM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4216, 16, 'RIO AZUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4215, 16, 'RIBEIRAO DO PINHAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4214, 16, 'RIBEIRAO CLARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4213, 16, 'RESERVA DO IGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4212, 16, 'RESERVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4211, 16, 'RENASCENCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4210, 16, 'REBOUCAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4209, 16, 'REALEZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4208, 16, 'RANCHO ALEGRE D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4207, 16, 'RANCHO ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4206, 16, 'RAMILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4205, 16, 'QUITANDINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4204, 16, 'QUINTA DO SOL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4203, 16, 'QUERENCIA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4202, 16, 'QUEDAS DO IGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4201, 16, 'QUATRO PONTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4200, 16, 'QUATRO BARRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4199, 16, 'QUATIGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4198, 16, 'QUARTO CENTENARIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4197, 16, 'PRUDENTOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4196, 16, 'PRIMEIRO DE MAIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4195, 16, 'PRESIDENTE CASTELO BRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4194, 16, 'PRANCHITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4193, 16, 'PRADO FERREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4192, 16, 'PORTO VITORIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4191, 16, 'PORTO RICO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4190, 16, 'PORTO BARREIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4189, 16, 'PORTO AMAZONAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4188, 16, 'PORECATU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4187, 16, 'PONTAL DO PARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4186, 16, 'PONTA GROSSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4185, 16, 'PLANALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4184, 16, 'PLANALTINA DO PARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4183, 16, 'PITANGUEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4182, 16, 'PITANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4181, 16, 'PIRAQUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4180, 16, 'PIRAI DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4179, 16, 'PINHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4178, 16, 'PINHAL DE SAO BENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4177, 16, 'PINHALAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4176, 16, 'PINHAIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4175, 16, 'PIEN', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4174, 16, 'PEROLA D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4173, 16, 'PEROLA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4172, 16, 'PEROBAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4171, 16, 'PEABIRU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4170, 16, 'PAULO FRONTIN', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4169, 16, 'PAULA FREITAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4168, 16, 'PATO BRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4167, 16, 'PATO BRAGADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4166, 16, 'PARANAVAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4165, 16, 'PARANAPOEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4164, 16, 'PARANAGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4163, 16, 'PARANACITY', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4162, 16, 'PARAISO DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4161, 16, 'PALOTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4160, 16, 'PALMITAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4159, 16, 'PALMEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4158, 16, 'PALMAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4157, 16, 'PAICANDU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4156, 16, 'OURO VERDE DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4155, 16, 'OURIZONA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4154, 16, 'ORTIGUEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4153, 16, 'NOVO ITACOLOMI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4152, 16, 'NOVA TEBAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4151, 16, 'NOVA PRATA DO IGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4150, 16, 'NOVA SANTA ROSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4149, 16, 'NOVA SANTA BARBARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4148, 16, 'NOVA OLIMPIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4147, 16, 'NOVA LONDRINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4146, 16, 'NOVA LARANJEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4145, 16, 'NOVA FATIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4144, 16, 'NOVA ESPERANCA DO SUDOESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4143, 16, 'NOVA ESPERANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4142, 16, 'NOVA CANTU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4141, 16, 'NOVA AURORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4140, 16, 'NOVA AMERICA DA COLINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4139, 16, 'NOVA ALIANCA DO IVAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4138, 16, 'NOSSA SENHORA DAS GRACAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4137, 16, 'MUNHOZ DE MELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4136, 16, 'MORRETES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4135, 16, 'MOREIRA SALES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4134, 16, 'MISSAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4133, 16, 'MIRASELVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4132, 16, 'MIRADOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4131, 16, 'MERCEDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4130, 16, 'MEDIANEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4129, 16, 'MAUA DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4128, 16, 'MATO RICO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4127, 16, 'MATINHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4126, 16, 'MATELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4125, 16, 'MARUMBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4124, 16, 'MARQUINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4123, 16, 'MARMELEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4122, 16, 'MARIPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4121, 16, 'MARIOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4120, 16, 'MARINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4119, 16, 'MARILUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4118, 16, 'MARILENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4117, 16, 'MARILANDIA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4116, 16, 'MARIALVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4115, 16, 'MARIA HELENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4114, 16, 'MARECHAL CANDIDO RONDON', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4113, 16, 'MANOEL RIBAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4112, 16, 'MANGUEIRINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4111, 16, 'MANFRINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4110, 16, 'MANDIRITUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4109, 16, 'MANDAGUARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4108, 16, 'MANDAGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4107, 16, 'MAMBORE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4106, 16, 'MALLET', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4105, 16, 'LUPIONOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4104, 16, 'LUNARDELLI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4103, 16, 'LUIZIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4102, 16, 'LONDRINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4101, 16, 'LOBATO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4100, 16, 'LOANDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4099, 16, 'LINDOESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4098, 16, 'LIDIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4097, 16, 'LEOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4096, 16, 'LARANJEIRAS DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4095, 16, 'LARANJAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4094, 16, 'LAPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4093, 16, 'KALORE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4092, 16, 'JUSSARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4091, 16, 'JURANDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4090, 16, 'JUNDIAI DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4089, 16, 'JOAQUIM TAVORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4088, 16, 'JESUITAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4087, 16, 'JATAIZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4086, 16, 'JARDIM OLINDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4085, 16, 'JARDIM ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4084, 16, 'JAPURA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4083, 16, 'JAPIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4082, 16, 'JANIOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4081, 16, 'JANDAIA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4080, 16, 'JAGUARIAIVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4079, 16, 'JAGUAPITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4078, 16, 'JACAREZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4077, 16, 'JABOTI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4076, 16, 'IVATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4075, 16, 'IVATE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4074, 16, 'IVAIPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4073, 16, 'IVAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4072, 16, 'ITAUNA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4071, 16, 'ITAPERUCU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4070, 16, 'ITAPEJARA D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4069, 16, 'ITAMBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4068, 16, 'ITAMBARACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4067, 16, 'ITAIPULANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4066, 16, 'ITAGUAJE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4065, 16, 'IRETAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4064, 16, 'IRATI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4063, 16, 'IRACEMA DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4062, 16, 'IPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4061, 16, 'IPIRANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4060, 16, 'INDIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4059, 16, 'INAJA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4058, 16, 'INACIO MARTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4057, 16, 'IMBITUVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4056, 16, 'IMBAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4055, 16, 'IGUATU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4054, 16, 'IGUARACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4053, 16, 'ICARAIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4052, 16, 'IBIPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4051, 16, 'IBEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4050, 16, 'IBAITI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4049, 16, 'HONORIO SERPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4048, 16, 'GUARATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4047, 16, 'GUARAQUECABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4046, 16, 'GUARAPUAVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4045, 16, 'GUARANIACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4044, 16, 'GUARACI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4043, 16, 'GUAPOREMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4042, 16, 'GUAPIRAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4041, 16, 'GUAMIRANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4040, 16, 'GUAIRACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4039, 16, 'GUAIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4038, 16, 'GRANDES RIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4037, 16, 'GOIOXIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4036, 16, 'GOIOERE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4035, 16, 'GODOY MOREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4034, 16, 'GENERAL CARNEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4033, 16, 'FOZ DO JORDAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4032, 16, 'FRANCISCO BELTRAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4031, 16, 'FRANCISCO ALVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4030, 16, 'FOZ DO IGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4029, 16, 'FORMOSA DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4028, 16, 'FLORIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4027, 16, 'FLORESTOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4026, 16, 'FLORESTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4025, 16, 'FLOR DA SERRA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4024, 16, 'FLORAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4023, 16, 'FIGUEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4022, 16, 'FERNANDES PINHEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4021, 16, 'FENIX', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4020, 16, 'FAZENDA RIO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4019, 16, 'FAXINAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4018, 16, 'FAROL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4017, 16, 'ESPIGAO ALTO DO IGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4016, 16, 'ENTRE RIOS DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4015, 16, 'ESPERANCA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4014, 16, 'ENGENHEIRO BELTRAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4013, 16, 'ENEAS MARQUES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4012, 16, 'DOUTOR CAMARGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4011, 16, 'DOURADINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4010, 16, 'DOIS VIZINHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4009, 16, 'DIAMANTE D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4008, 16, 'DIAMANTE DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4007, 16, 'DIAMANTE DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4006, 16, 'CURIUVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4005, 16, 'CURITIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4004, 16, 'CRUZMALTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4003, 16, 'CRUZ MACHADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4002, 16, 'CRUZEIRO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4001, 16, 'CRUZEIRO DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (4000, 16, 'CRUZEIRO DO IGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3999, 16, 'CORUMBATAI DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3998, 16, 'CORONEL VIVIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3997, 16, 'CORONEL DOMINGOS SOARES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3996, 16, 'CORNELIO PROCOPIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3995, 16, 'CORBELIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3994, 16, 'CONTENDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3993, 16, 'CONSELHEIRO MAIRINCK', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3992, 16, 'CONGONHINHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3991, 16, 'COLORADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3990, 16, 'COLOMBO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3989, 16, 'CLEVELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3988, 16, 'CIDADE GAUCHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3987, 16, 'CIANORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3986, 16, 'CHOPINZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3985, 16, 'CEU AZUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3984, 16, 'CERRO AZUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3983, 16, 'CENTENARIO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3982, 16, 'CATANDUVAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3981, 16, 'CASTRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3980, 16, 'CASCAVEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3979, 16, 'CARLOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3978, 16, 'CARAMBEI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3977, 16, 'CAPITAO LEONIDAS MARQUES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3976, 16, 'CAPANEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3975, 16, 'CANTAGALO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3974, 16, 'CANDOI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3973, 16, 'CANDIDO DE ABREU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3972, 16, 'CAMPO MOURAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3971, 16, 'CAMPO MAGRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3970, 16, 'CAMPO LARGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3969, 16, 'CAMPO DO TENENTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3968, 16, 'CAMPO BONITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3967, 16, 'CAMPINA GRANDE DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3966, 16, 'CAMPINA DO SIMAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3965, 16, 'CAMPINA DA LAGOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3964, 16, 'CAMBIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3963, 16, 'CAMBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3962, 16, 'CAMBARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3961, 16, 'CALIFORNIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3960, 16, 'CAFEZAL DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3959, 16, 'CAFELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3958, 16, 'CAFEARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3957, 16, 'BRASILANDIA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3956, 16, 'BRAGANEY', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3955, 16, 'BORRAZOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3954, 16, 'BOM SUCESSO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3953, 16, 'BOM SUCESSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3952, 16, 'BOM JESUS DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3951, 16, 'BOCAIUVA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3950, 16, 'BOA VISTA DA APARECIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3949, 16, 'BOA VENTURA DE SAO ROQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3948, 16, 'BOA ESPERANCA DO IGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3947, 16, 'BOA ESPERANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3946, 16, 'BITURUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3945, 16, 'BELA VISTA DO PARAISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3944, 16, 'BELA VISTA DA CAROBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3943, 16, 'BARRA DO JACARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3942, 16, 'BARRACAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3941, 16, 'BARBOSA FERRAZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3940, 16, 'BANDEIRANTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3939, 16, 'BALSA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3938, 16, 'ATALAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3937, 16, 'ASTORGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3936, 16, 'ASSIS CHATEAUBRIAND', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3935, 16, 'ASSAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3934, 16, 'ARIRANHA DO IVAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3933, 16, 'ARAUCARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3932, 16, 'ARARUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3931, 16, 'ARAPUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3930, 16, 'ARAPOTI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3929, 16, 'ARAPONGAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3928, 16, 'APUCARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3927, 16, 'ANTONIO OLINTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3926, 16, 'ANTONINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3925, 16, 'ANGULO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3924, 16, 'ANDIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3923, 16, 'ANAHY', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3922, 16, 'AMPERE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3921, 16, 'AMAPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3920, 16, 'ALVORADA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3919, 16, 'ALTO PIQUIRI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3918, 16, 'ALTO PARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3917, 16, 'ALTONIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3916, 16, 'ALTAMIRA DO PARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3915, 16, 'ALMIRANTE TAMANDARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3914, 16, 'AGUDOS DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3913, 16, 'ADRIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3912, 16, 'ABATIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1464, 15, 'ZABELE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1463, 15, 'VIEIROPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1462, 15, 'VARZEA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1461, 15, 'UMBUZEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1460, 15, 'UIRAUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1459, 15, 'TRIUNFO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1458, 15, 'TENORIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1457, 15, 'TEIXEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1456, 15, 'TAVARES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1455, 15, 'TAPEROA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1454, 15, 'CAMPO DE SANTANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1453, 15, 'SUME', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1452, 15, 'SOUSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1451, 15, 'SOSSEGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1450, 15, 'SOLEDADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1449, 15, 'SOLANEA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1448, 15, 'SOBRADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1447, 15, 'SERTAOZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1446, 15, 'SERRARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1445, 15, 'SERRA REDONDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1444, 15, 'SERRA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1443, 15, 'SERRA DA RAIZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1442, 15, 'SERRA BRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1441, 15, 'SERIDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1440, 15, 'SAPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1439, 15, 'SAO SEBASTIAO DO UMBUZEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1438, 15, 'SAO SEBASTIAO DE LAGOA DE ROCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1437, 15, 'SAO MIGUEL DE TAIPU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1436, 15, 'SAO MAMEDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1435, 15, 'SAO JOSE DOS CORDEIROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1434, 15, 'SAO JOSE DO SABUGI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1433, 15, 'SAO JOSE DO BREJO DO CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1432, 15, 'SAO JOSE DO BONFIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1431, 15, 'SAO JOSE DE PRINCESA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1430, 15, 'SAO JOSE DE PIRANHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1429, 15, 'SAO JOSE DOS RAMOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1428, 15, 'SAO JOSE DE ESPINHARAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1427, 15, 'SAO JOSE DE CAIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1426, 15, 'SAO JOSE DA LAGOA TAPADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1425, 15, 'SAO JOAO DO TIGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1424, 15, 'SAO JOAO DO CARIRI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1423, 15, 'SAO FRANCISCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1422, 15, 'SAO DOMINGOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1421, 15, 'SAO DOMINGOS DO CARIRI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1420, 15, 'SAO BENTINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1419, 15, 'SAO BENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1418, 15, 'SANTO ANDRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1417, 15, 'SANTA TERESINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1416, 15, 'SANTA RITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1415, 15, 'SANTAREM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1414, 15, 'SANTANA DOS GARROTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1413, 15, 'SANTANA DE MANGUEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1412, 15, 'SANTA LUZIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1411, 15, 'SANTA INES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1410, 15, 'SANTA HELENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1409, 15, 'SANTA CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1408, 15, 'SANTA CECILIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1407, 15, 'SALGADO DE SAO FELIX', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1406, 15, 'SALGADINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1405, 15, 'RIO TINTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1404, 15, 'RIACHO DOS CAVALOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1403, 15, 'RIACHO DE SANTO ANTONIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1402, 15, 'RIACHAO DO POCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1401, 15, 'RIACHAO DO BACAMARTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1400, 15, 'RIACHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1399, 15, 'PEDRO REGIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1398, 15, 'REMIGIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1397, 15, 'QUIXABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1396, 15, 'QUEIMADAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1395, 15, 'PUXINANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1394, 15, 'PRINCESA ISABEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1393, 15, 'PRATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1392, 15, 'POMBAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1391, 15, 'POCO DE JOSE DE MOURA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1390, 15, 'POCO DANTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1389, 15, 'POCINHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1388, 15, 'PITIMBU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1387, 15, 'PIRPIRITUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1386, 15, 'PILOEZINHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1385, 15, 'PILOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1384, 15, 'PILAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1383, 15, 'PICUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1382, 15, 'PIANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1381, 15, 'PEDRAS DE FOGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1380, 15, 'PEDRA LAVRADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1379, 15, 'PEDRA BRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1378, 15, 'PAULISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1377, 15, 'PATOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1376, 15, 'PASSAGEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1375, 15, 'PARARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1374, 15, 'OURO VELHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1373, 15, 'OLIVEDOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1372, 15, 'OLHO D''AGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1371, 15, 'NOVA PALMEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1370, 15, 'NOVA OLINDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1369, 15, 'NOVA FLORESTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1368, 15, 'NAZAREZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1367, 15, 'NATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1366, 15, 'MULUNGU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1365, 15, 'MONTEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1364, 15, 'MONTE HOREBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1363, 15, 'MONTADAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1362, 15, 'MOGEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1361, 15, 'MATUREIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1360, 15, 'MATO GROSSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1359, 15, 'MATINHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1358, 15, 'MATARACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1357, 15, 'MASSARANDUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1356, 15, 'MARIZOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1355, 15, 'MARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1354, 15, 'MARCACAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1353, 15, 'MANAIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1352, 15, 'MAMANGUAPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1351, 15, 'MALTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1350, 15, 'MAE D''AGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1349, 15, 'LUCENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1348, 15, 'LOGRADOURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1347, 15, 'LIVRAMENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1346, 15, 'LASTRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1345, 15, 'LAGOA SECA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1344, 15, 'LAGOA DE DENTRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1343, 15, 'LAGOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1342, 15, 'JURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1341, 15, 'JURIPIRANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1340, 15, 'JUNCO DO SERIDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1339, 15, 'JUAZEIRINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1338, 15, 'JUAREZ TAVORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1337, 15, 'JOAO PESSOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1336, 15, 'JERICO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1335, 15, 'JACARAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1334, 15, 'ITATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1333, 15, 'ITAPOROROCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1332, 15, 'ITAPORANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1331, 15, 'ITABAIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1330, 15, 'INGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1329, 15, 'IMACULADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1328, 15, 'IBIARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1327, 15, 'GURJAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1326, 15, 'GURINHEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1325, 15, 'GUARABIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1324, 15, 'GADO BRAVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1323, 15, 'FREI MARTINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1322, 15, 'FAGUNDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1321, 15, 'ESPERANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1320, 15, 'EMAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1319, 15, 'DUAS ESTRADAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1318, 15, 'DONA INES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1317, 15, 'DIAMANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1316, 15, 'VISTA SERRANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1315, 15, 'DESTERRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1314, 15, 'DAMIAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1313, 15, 'CURRAL VELHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1312, 15, 'CURRAL DE CIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1311, 15, 'CUITE DE MAMANGUAPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1310, 15, 'CUITEGI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1309, 15, 'CUITE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1308, 15, 'CUBATI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1307, 15, 'CRUZ DO ESPIRITO SANTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1306, 15, 'COXIXOLA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1305, 15, 'COREMAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1304, 15, 'CONGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1303, 15, 'CONDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1302, 15, 'CONDADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1301, 15, 'CONCEICAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1300, 15, 'CATURITE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1299, 15, 'CATOLE DO ROCHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1298, 15, 'CATINGUEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1297, 15, 'CASSERENGUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1296, 15, 'CARRAPATEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1295, 15, 'CARAUBAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1294, 15, 'CAPIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1293, 15, 'CAMPINA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1292, 15, 'CAMALAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1291, 15, 'CALDAS BRANDAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1290, 15, 'CAJAZEIRINHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1289, 15, 'CAJAZEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1288, 15, 'CAICARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1287, 15, 'CACIMBAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1286, 15, 'CACIMBA DE DENTRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1285, 15, 'CACIMBA DE AREIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1284, 15, 'CACHOEIRA DOS INDIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1283, 15, 'CABEDELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1282, 15, 'CABACEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1281, 15, 'CAAPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1280, 15, 'BREJO DOS SANTOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1279, 15, 'BREJO DO CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1278, 15, 'BORBOREMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1277, 15, 'IGARACY', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1276, 15, 'BOQUEIRAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1275, 15, 'BONITO DE SANTA FE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1274, 15, 'BOM SUCESSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1273, 15, 'BOM JESUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1272, 15, 'BOA VISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1271, 15, 'BOA VENTURA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1270, 15, 'BERNARDINO BATISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1269, 15, 'BELEM DO BREJO DO CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1268, 15, 'BELEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1267, 15, 'BAYEUX', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1266, 15, 'BARRA DE SAO MIGUEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1265, 15, 'BARRA DE SANTA ROSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1264, 15, 'BARRA DE SANTANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1263, 15, 'BARAUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1262, 15, 'BANANEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1261, 15, 'BAIA DA TRAICAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1260, 15, 'ASSUNCAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1259, 15, 'AROEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1258, 15, 'AREIAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1257, 15, 'AREIA DE BARAUNAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1256, 15, 'AREIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1255, 15, 'ARARUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1254, 15, 'ARARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1253, 15, 'ARACAGI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1252, 15, 'APARECIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1251, 15, 'AMPARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1250, 15, 'SAO JOAO DO RIO DO PEIXE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1249, 15, 'ALHANDRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1248, 15, 'ALGODAO DE JANDAIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1247, 15, 'ALCANTIL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1246, 15, 'ALAGOINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1245, 15, 'ALAGOA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1244, 15, 'ALAGOA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1243, 15, 'AGUIAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1242, 15, 'AGUA BRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (294, 14, 'XINGUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (293, 14, 'VITORIA DO XINGU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (292, 14, 'VISEU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (291, 14, 'VIGIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (290, 14, 'URUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (289, 14, 'ULIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (288, 14, 'TUCURUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (287, 14, 'TUCUMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (286, 14, 'TRAIRAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (285, 14, 'TRACUATEUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (284, 14, 'TOME-ACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (283, 14, 'TERRA SANTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (282, 14, 'TERRA ALTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (281, 14, 'TAILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (280, 14, 'SOURE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (279, 14, 'SENADOR JOSE PORFIRIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (278, 14, 'SAPUCAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (277, 14, 'SAO SEBASTIAO DA BOA VISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (276, 14, 'SAO MIGUEL DO GUAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (275, 14, 'SAO JOAO DO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (274, 14, 'SAO JOAO DE PIRABAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (273, 14, 'SAO JOAO DA PONTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (272, 14, 'SAO GERALDO DO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (271, 14, 'SAO FRANCISCO DO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (270, 14, 'SAO FELIX DO XINGU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (269, 14, 'SAO DOMINGOS DO CAPIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (268, 14, 'SAO DOMINGOS DO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (267, 14, 'SAO CAETANO DE ODIVELAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (266, 14, 'SANTO ANTONIO DO TAUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (265, 14, 'SANTAREM NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (264, 14, 'SANTAREM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (263, 14, 'SANTANA DO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (262, 14, 'SANTA MARIA DO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (261, 14, 'SANTA MARIA DAS BARREIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (260, 14, 'SANTA LUZIA DO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (259, 14, 'SANTA ISABEL DO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (258, 14, 'SANTA CRUZ DO ARARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (257, 14, 'SANTA BARBARA DO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (256, 14, 'SALVATERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (255, 14, 'SALINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (254, 14, 'RUROPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (253, 14, 'RONDON DO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (252, 14, 'RIO MARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (251, 14, 'REDENCAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (250, 14, 'QUATIPURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (249, 14, 'PRIMAVERA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (248, 14, 'PRAINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (247, 14, 'PORTO DE MOZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (246, 14, 'PORTEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (245, 14, 'PONTA DE PEDRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (244, 14, 'PLACAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (243, 14, 'PICARRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (242, 14, 'PEIXE-BOI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (241, 14, 'PAU D''ARCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (240, 14, 'PARAUAPEBAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (239, 14, 'PARAGOMINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (238, 14, 'PALESTINA DO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (237, 14, 'PACAJA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (236, 14, 'OURILANDIA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (235, 14, 'OUREM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (234, 14, 'ORIXIMINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (233, 14, 'OEIRAS DO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (232, 14, 'OBIDOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (231, 14, 'NOVO REPARTIMENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (230, 14, 'NOVO PROGRESSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (229, 14, 'NOVA TIMBOTEUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (228, 14, 'NOVA IPIXUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (227, 14, 'NOVA ESPERANCA DO PIRIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (226, 14, 'MUANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (225, 14, 'MONTE ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (224, 14, 'MOJU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (223, 14, 'MOCAJUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (222, 14, 'MELGACO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (221, 14, 'MEDICILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (220, 14, 'MARITUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (219, 14, 'MARAPANIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (218, 14, 'MARACANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (217, 14, 'MARABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (216, 14, 'MAGALHAES BARATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (215, 14, 'MAE DO RIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (214, 14, 'LIMOEIRO DO AJURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (213, 14, 'JURUTI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (212, 14, 'JACUNDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (211, 14, 'JACAREACANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (210, 14, 'ITUPIRANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (209, 14, 'ITAITUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (208, 14, 'IRITUIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (207, 14, 'IPIXUNA DO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (206, 14, 'INHANGAPI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (205, 14, 'IGARAPE-MIRI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (204, 14, 'IGARAPE-ACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (203, 14, 'GURUPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (202, 14, 'GOIANESIA DO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (201, 14, 'GARRAFAO DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (200, 14, 'FLORESTA DO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (199, 14, 'FARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (198, 14, 'ELDORADO DOS CARAJAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (197, 14, 'DOM ELISEU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (196, 14, 'CURUCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (195, 14, 'CURUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (194, 14, 'CURRALINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (193, 14, 'CURIONOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (192, 14, 'CUMARU DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (191, 14, 'CONCORDIA DO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (190, 14, 'CONCEICAO DO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (189, 14, 'COLARES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (188, 14, 'CHAVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (187, 14, 'CASTANHAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (186, 14, 'CAPITAO POCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (185, 14, 'CAPANEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (184, 14, 'CANAA DOS CARAJAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (183, 14, 'CAMETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (182, 14, 'CACHOEIRA DO ARARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (181, 14, 'CACHOEIRA DO PIRIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (180, 14, 'BUJARU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (179, 14, 'BREVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (178, 14, 'BREU BRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (177, 14, 'BREJO GRANDE DO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (176, 14, 'BRASIL NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (175, 14, 'BRAGANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (174, 14, 'BONITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (173, 14, 'BOM JESUS DO TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (172, 14, 'BENEVIDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (171, 14, 'BELTERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (170, 14, 'BELEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (169, 14, 'BARCARENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (168, 14, 'BANNACH', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (167, 14, 'BAIAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (166, 14, 'BAGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (165, 14, 'AVEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (164, 14, 'AURORA DO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (163, 14, 'AUGUSTO CORREA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (162, 14, 'ANAPU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (161, 14, 'ANANINDEUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (160, 14, 'ANAJAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (159, 14, 'ALTAMIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (158, 14, 'ALMEIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (157, 14, 'ALENQUER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (156, 14, 'AGUA AZUL DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (155, 14, 'AFUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (154, 14, 'ACARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (153, 14, 'ABEL FIGUEIREDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (152, 14, 'ABAETETUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3096, 13, 'WENCESLAU BRAZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3095, 13, 'VOLTA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3094, 13, 'VISCONDE DO RIO BRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3093, 13, 'VIRGOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3092, 13, 'VIRGINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3091, 13, 'VIRGINIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3090, 13, 'VIRGEM DA LAPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3089, 13, 'MATHIAS LOBATO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3088, 13, 'VIEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3087, 13, 'VICOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3086, 13, 'VESPASIANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3085, 13, 'VERMELHO NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3084, 13, 'VERISSIMO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3083, 13, 'VEREDINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3082, 13, 'VERDELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3081, 13, 'VAZANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3080, 13, 'VARZELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3079, 13, 'VARZEA DA PALMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3078, 13, 'VARJAO DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3077, 13, 'VARGINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3076, 13, 'VARGEM GRANDE DO RIO PARDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3075, 13, 'VARGEM BONITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3074, 13, 'VARGEM ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3073, 13, 'URUCUIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3072, 13, 'URUCANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3071, 13, 'URUANA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3070, 13, 'UNIAO DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3069, 13, 'UNAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3068, 13, 'UMBURATIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3067, 13, 'UBERLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3066, 13, 'UBERABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3065, 13, 'UBAPORANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3064, 13, 'UBAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3063, 13, 'UBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3062, 13, 'TURVOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3061, 13, 'TURMALINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3060, 13, 'TUPACIGUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3059, 13, 'TUMIRITINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3058, 13, 'TRES PONTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3057, 13, 'TRES MARIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3056, 13, 'TRES CORACOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3055, 13, 'TOMBOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3054, 13, 'TOLEDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3053, 13, 'TOCOS DO MOJI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3052, 13, 'TOCANTINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3051, 13, 'TIROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3050, 13, 'TIRADENTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3049, 13, 'TIMOTEO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3048, 13, 'TEOFILO OTONI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3047, 13, 'TEIXEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3046, 13, 'TARUMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3045, 13, 'TAQUARACU DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3044, 13, 'TAPIRAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3043, 13, 'TAPIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3042, 13, 'TAPARUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3041, 13, 'TAIOBEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3040, 13, 'TABULEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3039, 13, 'SOLEDADE DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3038, 13, 'SOBRALIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3037, 13, 'SIMONESIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3036, 13, 'SIMAO PEREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3035, 13, 'SILVIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3034, 13, 'SILVEIRANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3033, 13, 'SETE LAGOAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3032, 13, 'SERRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3031, 13, 'SERRANOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3030, 13, 'SERRANOPOLIS DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3029, 13, 'SERRANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3028, 13, 'SERRA DO SALITRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3027, 13, 'SERRA DOS AIMORES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3026, 13, 'SERRA DA SAUDADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3025, 13, 'SERRA AZUL DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3024, 13, 'SERITINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3023, 13, 'SERICITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3022, 13, 'SENHORA DOS REMEDIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3021, 13, 'SENHORA DO PORTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3020, 13, 'SENHORA DE OLIVEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3019, 13, 'SENADOR MODESTINO GONCALVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3018, 13, 'SENADOR JOSE BENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3017, 13, 'SENADOR FIRMINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3016, 13, 'SENADOR CORTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3015, 13, 'SENADOR AMARAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3014, 13, 'SEM-PEIXE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3013, 13, 'SETUBINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3012, 13, 'SARZEDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3011, 13, 'SARDOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3010, 13, 'SAPUCAI-MIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3009, 13, 'SAO VICENTE DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3008, 13, 'SAO THOME DAS LETRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3007, 13, 'SAO TOMAS DE AQUINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3006, 13, 'SAO TIAGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3005, 13, 'SAO SEBASTIAO DO RIO VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3004, 13, 'SAO SEBASTIAO DO RIO PRETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3003, 13, 'SAO SEBASTIAO DO PARAISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3002, 13, 'SAO SEBASTIAO DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3001, 13, 'SAO SEBASTIAO DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (3000, 13, 'SAO SEBASTIAO DO ANTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2999, 13, 'SAO SEBASTIAO DA VARGEM ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2998, 13, 'SAO SEBASTIAO DA BELA VISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2997, 13, 'SAO ROQUE DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2996, 13, 'SAO ROMAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2995, 13, 'SAO PEDRO DO SUACUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2994, 13, 'SAO PEDRO DOS FERROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2993, 13, 'SAO PEDRO DA UNIAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2992, 13, 'SAO MIGUEL DO ANTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2991, 13, 'SAO LOURENCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2990, 13, 'SAO JOSE DO MANTIMENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2989, 13, 'SAO JOSE DO JACURI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2988, 13, 'SAO JOSE DO GOIABAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2987, 13, 'SAO JOSE DO DIVINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2986, 13, 'SAO JOSE DO ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2985, 13, 'SAO JOSE DA VARGINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2984, 13, 'SAO JOSE DA SAFIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2983, 13, 'SAO JOSE DA LAPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2982, 13, 'SAO JOSE DA BARRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2981, 13, 'SAO JOAQUIM DE BICAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2980, 13, 'SAO JOAO NEPOMUCENO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2979, 13, 'SAO JOAO EVANGELISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2978, 13, 'SAO JOAO DO PARAISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2977, 13, 'SAO JOAO DO PACUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2976, 13, 'SAO JOAO DO ORIENTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2975, 13, 'SAO JOAO DO MANTENINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2974, 13, 'SAO JOAO DO MANHUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2973, 13, 'SAO JOAO DEL REI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2972, 13, 'SAO JOAO DAS MISSOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2971, 13, 'SAO JOAO DA PONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2970, 13, 'SAO JOAO DA MATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2969, 13, 'SAO JOAO DA LAGOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2968, 13, 'SAO JOAO BATISTA DO GLORIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2967, 13, 'SAO GOTARDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2966, 13, 'SAO GONCALO DO SAPUCAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2965, 13, 'SAO GONCALO DO RIO ABAIXO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2964, 13, 'SAO GONCALO DO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2963, 13, 'SAO GONCALO DO ABAETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2962, 13, 'SAO GERALDO DO BAIXIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2961, 13, 'SAO GERALDO DA PIEDADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2960, 13, 'SAO GERALDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2959, 13, 'SAO FRANCISCO DO GLORIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2958, 13, 'SAO FRANCISCO DE SALES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2957, 13, 'SAO FRANCISCO DE PAULA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2956, 13, 'SAO FRANCISCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2955, 13, 'SAO FELIX DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2954, 13, 'SAO DOMINGOS DO PRATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2953, 13, 'SAO DOMINGOS DAS DORES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2952, 13, 'SAO BRAS DO SUACUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2951, 13, 'SAO BENTO ABADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2950, 13, 'SANTOS DUMONT', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2949, 13, 'SANTO HIPOLITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2948, 13, 'SANTO ANTONIO DO RIO ABAIXO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2947, 13, 'SANTO ANTONIO DO RETIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2946, 13, 'SANTO ANTONIO DO MONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2945, 13, 'SANTO ANTONIO DO JACINTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2944, 13, 'SANTO ANTONIO DO ITAMBE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2943, 13, 'SANTO ANTONIO DO GRAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2942, 13, 'SANTO ANTONIO DO AVENTUREIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2941, 13, 'SANTO ANTONIO DO AMPARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2940, 13, 'SANTA VITORIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2939, 13, 'SANTA ROSA DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2938, 13, 'SANTA RITA DO SAPUCAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2937, 13, 'SANTA RITA DO ITUETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2936, 13, 'SANTA RITA DE IBITIPOCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2935, 13, 'SANTA RITA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2934, 13, 'SANTA RITA DE JACUTINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2933, 13, 'SANTA RITA DE CALDAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2932, 13, 'SANTANA DOS MONTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2931, 13, 'SANTANA DO RIACHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2930, 13, 'SANTANA DO PARAISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2929, 13, 'SANTANA DO MANHUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2928, 13, 'SANTANA DO JACARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2927, 13, 'SANTANA DO GARAMBEU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2926, 13, 'SANTANA DO DESERTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2925, 13, 'SANTANA DE PIRAPAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2924, 13, 'SANTANA DE CATAGUASES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2923, 13, 'SANTANA DA VARGEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2922, 13, 'SANTA MARIA DO SUACUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2921, 13, 'SANTA MARIA DO SALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2920, 13, 'SANTA MARIA DE ITABIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2919, 13, 'SANTA MARGARIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2918, 13, 'SANTA LUZIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2917, 13, 'SANTA JULIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2916, 13, 'SANTA HELENA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2915, 13, 'SANTA FE DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2914, 13, 'SANTA EFIGENIA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2913, 13, 'SANTA CRUZ DO ESCALVADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2912, 13, 'SANTA CRUZ DE SALINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2911, 13, 'SANTA CRUZ DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2910, 13, 'SANTA BARBARA DO TUGURIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2909, 13, 'SANTA BARBARA DO MONTE VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2908, 13, 'SANTA BARBARA DO LESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2907, 13, 'SANTA BARBARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2906, 13, 'SALTO DA DIVISA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2905, 13, 'SALINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2904, 13, 'SACRAMENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2903, 13, 'SABINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2902, 13, 'SABARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2901, 13, 'RUBIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2900, 13, 'RUBELITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2899, 13, 'ROSARIO DA LIMEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2898, 13, 'ROMARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2897, 13, 'RODEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2896, 13, 'ROCHEDO DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2895, 13, 'RITAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2894, 13, 'RIO VERMELHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2893, 13, 'RIO PRETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2892, 13, 'RIO POMBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2891, 13, 'RIO PIRACICABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2890, 13, 'RIO PARDO DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2889, 13, 'RIO PARANAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2888, 13, 'RIO NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2887, 13, 'RIO MANSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2886, 13, 'RIO ESPERA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2885, 13, 'RIO DO PRADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2884, 13, 'RIO DOCE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2883, 13, 'RIO CASCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2882, 13, 'RIO ACIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2881, 13, 'RIBEIRAO VERMELHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2880, 13, 'RIBEIRAO DAS NEVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2879, 13, 'RIACHO DOS MACHADOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2878, 13, 'RIACHINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2877, 13, 'RESSAQUINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2876, 13, 'RESPLENDOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2875, 13, 'RESENDE COSTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2874, 13, 'REDUTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2873, 13, 'RECREIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2872, 13, 'RAUL SOARES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2871, 13, 'RAPOSOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2870, 13, 'QUELUZITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2869, 13, 'QUARTEL GERAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2868, 13, 'PRUDENTE DE MORAIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2867, 13, 'ALTO JEQUITIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2866, 13, 'PRESIDENTE OLEGARIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2865, 13, 'PRESIDENTE KUBITSCHEK', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2864, 13, 'PRESIDENTE JUSCELINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2863, 13, 'PRESIDENTE BERNARDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2862, 13, 'PRATINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2861, 13, 'PRATAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2860, 13, 'PRATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2859, 13, 'PRADOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2858, 13, 'POUSO ALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2857, 13, 'POUSO ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2856, 13, 'POTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2855, 13, 'PORTO FIRME', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2854, 13, 'PORTEIRINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2853, 13, 'PONTO DOS VOLANTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2852, 13, 'PONTO CHIQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2851, 13, 'PONTE NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2850, 13, 'POMPEU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2849, 13, 'POCRANE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2848, 13, 'POCOS DE CALDAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2847, 13, 'POCO FUNDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2846, 13, 'PLANURA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2845, 13, 'PIUMHI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2844, 13, 'PITANGUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2843, 13, 'PIRAUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2842, 13, 'PIRAPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2841, 13, 'PIRAPETINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2840, 13, 'PIRANGUINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2839, 13, 'PIRANGUCU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2838, 13, 'PIRANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2837, 13, 'PIRAJUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2836, 13, 'PIRACEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2835, 13, 'PINTOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2834, 13, 'PINGO-D''AGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2833, 13, 'PIMENTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2832, 13, 'PIEDADE DOS GERAIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2831, 13, 'PIEDADE DO RIO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2830, 13, 'PIEDADE DE PONTE NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2829, 13, 'PIEDADE DE CARATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2828, 13, 'PIAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2827, 13, 'PESCADOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2826, 13, 'PERIQUITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2825, 13, 'PERDOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2824, 13, 'PERDIZES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2823, 13, 'PERDIGAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2822, 13, 'PEQUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2821, 13, 'PEQUERI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2820, 13, 'PEDRO TEIXEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2819, 13, 'PEDRO LEOPOLDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2818, 13, 'PEDRINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2817, 13, 'PEDRAS DE MARIA DA CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2816, 13, 'PEDRALVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2815, 13, 'PEDRA DOURADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2814, 13, 'PEDRA DO INDAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2813, 13, 'PEDRA DO ANTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2812, 13, 'PEDRA BONITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2811, 13, 'PEDRA AZUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2810, 13, 'PECANHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2809, 13, 'PAVAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2808, 13, 'PAULISTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2807, 13, 'PAULA CANDIDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2806, 13, 'PATROCINIO DO MURIAE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2805, 13, 'PATROCINIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2804, 13, 'PATOS DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2803, 13, 'PATIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2802, 13, 'PASSOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2801, 13, 'PASSA-VINTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2800, 13, 'PASSA TEMPO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2799, 13, 'PASSA QUATRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2798, 13, 'PASSABEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2797, 13, 'PARAOPEBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2796, 13, 'PARAISOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2795, 13, 'PARAGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2794, 13, 'PARA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2793, 13, 'PARACATU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2792, 13, 'PAPAGAIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2791, 13, 'PALMOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2790, 13, 'PALMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2789, 13, 'PAIVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2788, 13, 'PAI PEDRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2787, 13, 'PAINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2786, 13, 'PAINEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2785, 13, 'PADRE PARAISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2784, 13, 'PADRE CARVALHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2783, 13, 'OURO VERDE DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2782, 13, 'OURO PRETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2781, 13, 'OURO FINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2780, 13, 'OURO BRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2779, 13, 'ORIZANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2778, 13, 'ORATORIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2777, 13, 'ONCA DE PITANGUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2776, 13, 'OLIVEIRA FORTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2775, 13, 'OLIVEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2774, 13, 'OLIMPIO NORONHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2773, 13, 'OLHOS-D''AGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2772, 13, 'OLARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2771, 13, 'NOVORIZONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2770, 13, 'NOVO ORIENTE DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2769, 13, 'NOVO CRUZEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2768, 13, 'NOVA SERRANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2767, 13, 'NOVA RESENDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2766, 13, 'NOVA PORTEIRINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2765, 13, 'NOVA PONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2764, 13, 'NOVA MODICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2763, 13, 'NOVA LIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2762, 13, 'NOVA ERA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2761, 13, 'NOVA BELEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2760, 13, 'NINHEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2759, 13, 'NEPOMUCENO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2758, 13, 'NAZARENO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2757, 13, 'NATERCIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2756, 13, 'NATALANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2755, 13, 'NAQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2754, 13, 'NANUQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2753, 13, 'NACIP RAYDAN', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2752, 13, 'MUZAMBINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2751, 13, 'MUTUM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2750, 13, 'MURIAE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2749, 13, 'MUNHOZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2748, 13, 'MORRO DO PILAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2747, 13, 'MORRO DA GARCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2746, 13, 'MORADA NOVA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2745, 13, 'MONTEZUMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2744, 13, 'MONTE SIAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2743, 13, 'MONTES CLAROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2742, 13, 'MONTE SANTO DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2741, 13, 'MONTE FORMOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2740, 13, 'MONTE CARMELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2739, 13, 'MONTE BELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2738, 13, 'MONTE AZUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2737, 13, 'MONTE ALEGRE DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2736, 13, 'MONTALVANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2735, 13, 'MONSENHOR PAULO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2734, 13, 'MONJOLOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2733, 13, 'MOEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2732, 13, 'MOEDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2731, 13, 'MIRAVANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2730, 13, 'MIRAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2729, 13, 'MIRADOURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2728, 13, 'MIRABELA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2727, 13, 'MINDURI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2726, 13, 'MINAS NOVAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2725, 13, 'MESQUITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2724, 13, 'MERCES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2723, 13, 'MENDES PIMENTEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2722, 13, 'MEDINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2721, 13, 'MEDEIROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2720, 13, 'MATUTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2719, 13, 'MATOZINHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2718, 13, 'MATO VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2717, 13, 'MATIPO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2716, 13, 'MATIAS CARDOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2715, 13, 'MATIAS BARBOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2714, 13, 'MATEUS LEME', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2713, 13, 'MATERLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2712, 13, 'MATA VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2711, 13, 'MARTINS SOARES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2710, 13, 'MARTINHO CAMPOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2709, 13, 'MARMELOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2708, 13, 'MARLIERIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2707, 13, 'MARIPA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2706, 13, 'MARIO CAMPOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2705, 13, 'MARILAC', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2704, 13, 'MARIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2703, 13, 'MARIA DA FE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2702, 13, 'MAR DE ESPANHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2701, 13, 'MARAVILHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2700, 13, 'MANTENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2699, 13, 'MANHUMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2698, 13, 'MANHUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2697, 13, 'MANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2696, 13, 'MAMONAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2695, 13, 'MALACACHETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2694, 13, 'MADRE DE DEUS DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2693, 13, 'MACHADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2692, 13, 'MACHACALIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2691, 13, 'LUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2690, 13, 'LUMINARIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2689, 13, 'LUISLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2688, 13, 'LUISBURGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2687, 13, 'LONTRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2686, 13, 'LIMEIRA DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2685, 13, 'LIMA DUARTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2684, 13, 'LIBERDADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2683, 13, 'LEOPOLDINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2682, 13, 'LEME DO PRADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2681, 13, 'LEANDRO FERREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2680, 13, 'LAVRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2679, 13, 'LASSANCE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2678, 13, 'LARANJAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2677, 13, 'LAMIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2676, 13, 'LAMBARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2675, 13, 'LAJINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2674, 13, 'LAGOA SANTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2673, 13, 'LAGOA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2672, 13, 'LAGOA FORMOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2671, 13, 'LAGOA DOURADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2670, 13, 'LAGOA DOS PATOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2669, 13, 'LAGOA DA PRATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2668, 13, 'LAGAMAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2667, 13, 'LADAINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2666, 13, 'JUVENILIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2665, 13, 'JURUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2664, 13, 'JURAMENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2663, 13, 'JUIZ DE FORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2662, 13, 'JUATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2661, 13, 'NOVA UNIAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2660, 13, 'JOSENOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2659, 13, 'JOSE RAYDAN', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2658, 13, 'JOSE GONCALVES DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2657, 13, 'JORDANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2656, 13, 'JOAQUIM FELICIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2655, 13, 'JOAO PINHEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2654, 13, 'JOAO MONLEVADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2653, 13, 'JOANESIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2652, 13, 'JOAIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2651, 13, 'JESUANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2650, 13, 'JEQUITINHONHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2649, 13, 'JEQUITIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2648, 13, 'JEQUITAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2647, 13, 'JEQUERI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2646, 13, 'JENIPAPO DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2645, 13, 'JECEABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2644, 13, 'JAPONVAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2643, 13, 'JAPARAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2642, 13, 'JANUARIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2641, 13, 'JANAUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2640, 13, 'JAMPRUCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2639, 13, 'JAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2638, 13, 'JAGUARACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2637, 13, 'JACUTINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2636, 13, 'JACUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2635, 13, 'JACINTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2634, 13, 'JABOTICATUBAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2633, 13, 'ITUTINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2632, 13, 'ITURAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2631, 13, 'ITUMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2630, 13, 'ITUIUTABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2629, 13, 'ITUETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2628, 13, 'ITINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2627, 13, 'ITAVERAVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2626, 13, 'ITAUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2625, 13, 'ITAU DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2624, 13, 'ITATIAIUCU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2623, 13, 'ITAPEVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2622, 13, 'ITAPECERICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2621, 13, 'ITAPAGIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2620, 13, 'ITAOBIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2619, 13, 'ITANHOMI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2618, 13, 'ITANHANDU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2617, 13, 'ITAMONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2616, 13, 'ITAMOGI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2615, 13, 'ITAMBE DO MATO DENTRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2614, 13, 'ITAMBACURI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2613, 13, 'ITAMARATI DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2612, 13, 'ITAMARANDIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2611, 13, 'ITAJUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2610, 13, 'ITAIPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2609, 13, 'ITAGUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2608, 13, 'ITACARAMBI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2607, 13, 'ITACAMBIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2606, 13, 'ITABIRITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2605, 13, 'ITABIRINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2604, 13, 'ITABIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2603, 13, 'IRAI DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2602, 13, 'IPUIUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2601, 13, 'IPIACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2600, 13, 'IPATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2599, 13, 'IPANEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2598, 13, 'IPABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2597, 13, 'INIMUTABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2596, 13, 'INHAUMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2595, 13, 'INHAPIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2594, 13, 'INGAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2593, 13, 'INDIANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2592, 13, 'INDAIABIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2591, 13, 'INCONFIDENTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2590, 13, 'IMBE DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2589, 13, 'ILICINEA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2588, 13, 'IJACI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2587, 13, 'IGUATAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2586, 13, 'IGARATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2585, 13, 'IGARAPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2584, 13, 'ICARAI DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2583, 13, 'IBITURUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2582, 13, 'IBITIURA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2581, 13, 'IBIRITE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2580, 13, 'IBIRACI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2579, 13, 'IBIRACATU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2578, 13, 'IBIAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2577, 13, 'IBIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2576, 13, 'IBERTIOGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2575, 13, 'IAPU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2574, 13, 'HELIODORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2573, 13, 'GURINHATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2572, 13, 'GUIRICEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2571, 13, 'GUIMARANIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2570, 13, 'GUIDOVAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2569, 13, 'GUAXUPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2568, 13, 'GUARDA-MOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2567, 13, 'GUARARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2566, 13, 'GUARANI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2565, 13, 'GUARANESIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2564, 13, 'GUARACIAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2563, 13, 'GUARACIABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2562, 13, 'GUAPE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2561, 13, 'GUANHAES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2560, 13, 'GRUPIARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2559, 13, 'GRAO MOGOL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2558, 13, 'GOVERNADOR VALADARES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2557, 13, 'GOUVEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2556, 13, 'GONZAGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2555, 13, 'GONCALVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2554, 13, 'GOIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2553, 13, 'GOIABEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2552, 13, 'GLAUCILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2551, 13, 'GAMELEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2550, 13, 'GALILEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2549, 13, 'FUNILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2548, 13, 'FRUTAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2547, 13, 'FRUTA DE LEITE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2546, 13, 'FRONTEIRA DOS VALES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2545, 13, 'FRONTEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2544, 13, 'FREI LAGONEGRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2543, 13, 'FREI INOCENCIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2542, 13, 'FREI GASPAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2541, 13, 'FRANCISCOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2540, 13, 'FRANCISCO SA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2539, 13, 'FRANCISCO DUMONT', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2538, 13, 'FRANCISCO BADARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2537, 13, 'FORTUNA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2536, 13, 'FORTALEZA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2535, 13, 'FORMOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2534, 13, 'FORMIGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2533, 13, 'FLORESTAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2532, 13, 'FERVEDOURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2531, 13, 'FERROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2530, 13, 'FERNANDES TOURINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2529, 13, 'FELIXLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2528, 13, 'FELISBURGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2527, 13, 'SAO GONCALO DO RIO PRETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2526, 13, 'FELICIO DOS SANTOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2525, 13, 'FARIA LEMOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2524, 13, 'FAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2523, 13, 'EXTREMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2522, 13, 'EWBANK DA CAMARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2521, 13, 'EUGENOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2520, 13, 'ESTRELA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2519, 13, 'ESTRELA DO INDAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2518, 13, 'ESTRELA DALVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2517, 13, 'ESTIVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2516, 13, 'ESPIRITO SANTO DO DOURADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2515, 13, 'ESPINOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2514, 13, 'ESPERA FELIZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2513, 13, 'ESMERALDAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2512, 13, 'ERVALIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2511, 13, 'ENTRE RIOS DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2510, 13, 'ENTRE FOLHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2509, 13, 'ENGENHEIRO NAVARRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2508, 13, 'ENGENHEIRO CALDAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2507, 13, 'ELOI MENDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2506, 13, 'DURANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2505, 13, 'DOURADOQUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2504, 13, 'DORESOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2503, 13, 'DORES DO TURVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2502, 13, 'DORES DO INDAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2501, 13, 'DORES DE GUANHAES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2500, 13, 'DORES DE CAMPOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2499, 13, 'DONA EUSEBIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2498, 13, 'DOM VICOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2497, 13, 'DOM SILVERIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2496, 13, 'DOM JOAQUIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2495, 13, 'DOM CAVATI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2494, 13, 'DOM BOSCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2493, 13, 'DIVISOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2492, 13, 'DIVISA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2491, 13, 'DIVISA ALEGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2490, 13, 'DIVINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2489, 13, 'DIVINOLANDIA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2488, 13, 'DIVINO DAS LARANJEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2487, 13, 'DIVINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2486, 13, 'DIVINESIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2485, 13, 'DIONISIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2484, 13, 'DIOGO DE VASCONCELOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2483, 13, 'DIAMANTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2482, 13, 'DESTERRO DO MELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2481, 13, 'DESTERRO DE ENTRE RIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2480, 13, 'DESCOBERTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2479, 13, 'DELTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2478, 13, 'DELFINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2477, 13, 'DELFIM MOREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2476, 13, 'DATAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2475, 13, 'CURVELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2474, 13, 'CURRAL DE DENTRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2473, 13, 'CUPARAQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2472, 13, 'CRUZILIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2471, 13, 'CRUZEIRO DA FORTALEZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2470, 13, 'CRUCILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2469, 13, 'CRISTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2468, 13, 'CRISTIANO OTONI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2467, 13, 'CRISTALIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2466, 13, 'CRISTAIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2465, 13, 'CRISOLITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2464, 13, 'COUTO DE MAGALHAES DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2463, 13, 'CORREGO NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2462, 13, 'CORREGO FUNDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2461, 13, 'CORREGO DO BOM JESUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2460, 13, 'CORREGO DANTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2459, 13, 'CORONEL XAVIER CHAVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2458, 13, 'CORONEL PACHECO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2457, 13, 'CORONEL MURTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2456, 13, 'CORONEL FABRICIANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2455, 13, 'COROMANDEL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2454, 13, 'COROACI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2453, 13, 'CORINTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2452, 13, 'CORDISLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2451, 13, 'CORDISBURGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2450, 13, 'CORACAO DE JESUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2449, 13, 'COQUEIRAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2448, 13, 'CONTAGEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2447, 13, 'CONSOLACAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2446, 13, 'CONSELHEIRO PENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2445, 13, 'CONSELHEIRO LAFAIETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2444, 13, 'CONQUISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2443, 13, 'CONGONHAS DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2442, 13, 'CONGONHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2441, 13, 'CONGONHAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2440, 13, 'CONFINS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2439, 13, 'CONEGO MARINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2438, 13, 'CONCEICAO DOS OUROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2437, 13, 'CONCEICAO DO RIO VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2436, 13, 'CONCEICAO DO PARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2435, 13, 'CONCEICAO DO MATO DENTRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2434, 13, 'CONCEICAO DE IPANEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2433, 13, 'CONCEICAO DAS ALAGOAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2432, 13, 'CONCEICAO DAS PEDRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2431, 13, 'CONCEICAO DA APARECIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2430, 13, 'COMERCINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2429, 13, 'COMENDADOR GOMES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2428, 13, 'COLUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2427, 13, 'COIMBRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2426, 13, 'CLAUDIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2425, 13, 'CLARO DOS POCOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2424, 13, 'CLARAVAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2423, 13, 'CIPOTANEA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2422, 13, 'CHIADOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2421, 13, 'CHAPADA GAUCHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2420, 13, 'CHAPADA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2419, 13, 'CHALE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2418, 13, 'CHACARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2417, 13, 'CENTRALINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2416, 13, 'CENTRAL DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2415, 13, 'CEDRO DO ABAETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2414, 13, 'CAXAMBU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2413, 13, 'CATUTI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2412, 13, 'CATUJI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2411, 13, 'CATAS ALTAS DA NORUEGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2410, 13, 'CATAS ALTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2409, 13, 'CATAGUASES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2408, 13, 'CONCEICAO DA BARRA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2407, 13, 'CASSIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2406, 13, 'CASCALHO RICO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2405, 13, 'CASA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2404, 13, 'CARVALHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2403, 13, 'CARVALHOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2402, 13, 'CARRANCAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2401, 13, 'CARNEIRINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2400, 13, 'CARMOPOLIS DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2399, 13, 'CARMO DO RIO CLARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2398, 13, 'CARMO DO PARANAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2397, 13, 'CARMO DO CAJURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2396, 13, 'CARMO DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2395, 13, 'CARMO DA MATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2394, 13, 'CARMO DA CACHOEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2393, 13, 'CARMESIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2392, 13, 'CARLOS CHAGAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2391, 13, 'CAREACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2390, 13, 'CARBONITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2389, 13, 'CARATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2388, 13, 'CARANGOLA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2387, 13, 'CARANDAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2386, 13, 'CARANAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2385, 13, 'CARAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2384, 13, 'CAPUTIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2383, 13, 'CAPITOLIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2382, 13, 'CAPITAO ENEAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2381, 13, 'CAPITAO ANDRADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2380, 13, 'CAPINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2379, 13, 'CAPIM BRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2378, 13, 'CAPETINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2377, 13, 'CAPELINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2376, 13, 'CAPELA NOVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2375, 13, 'CAPARAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2374, 13, 'CANTAGALO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2373, 13, 'CANDEIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2372, 13, 'CANA VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2371, 13, 'CANAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2370, 13, 'CANAA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2369, 13, 'CAMPOS GERAIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2368, 13, 'CAMPOS ALTOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2367, 13, 'CAMPO FLORIDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2366, 13, 'CAMPO DO MEIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2365, 13, 'CAMPO BELO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2364, 13, 'CAMPO AZUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2363, 13, 'CAMPINA VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2362, 13, 'CAMPESTRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2361, 13, 'CAMPANHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2360, 13, 'CAMPANARIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2359, 13, 'CAMBUQUIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2358, 13, 'CAMBUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2357, 13, 'CAMANDUCAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2356, 13, 'CAMACHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2355, 13, 'CALDAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2354, 13, 'CAJURI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2353, 13, 'CAIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2352, 13, 'CAETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2351, 13, 'CAETANOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2350, 13, 'CACHOEIRA DOURADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2349, 13, 'CACHOEIRA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2348, 13, 'CACHOEIRA DA PRATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2347, 13, 'CABO VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2346, 13, 'CABECEIRA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2345, 13, 'BURITIZEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2344, 13, 'BURITIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2343, 13, 'BUGRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2342, 13, 'BUENOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2341, 13, 'BUENO BRANDAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2340, 13, 'BRUMADINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2339, 13, 'BRASOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2338, 13, 'BRAUNAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2337, 13, 'BRAS PIRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2336, 13, 'BRASILIA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2335, 13, 'BRASILANDIA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2334, 13, 'BOTUMIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2333, 13, 'BOTELHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2332, 13, 'BORDA DA MATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2331, 13, 'BONITO DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2330, 13, 'BONFINOPOLIS DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2329, 13, 'BONFIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2328, 13, 'BOM SUCESSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2327, 13, 'BOM REPOUSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2326, 13, 'BOM JESUS DO GALHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2325, 13, 'BOM JESUS DO AMPARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2324, 13, 'BOM JESUS DA PENHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2323, 13, 'BOM JARDIM DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2322, 13, 'BOM DESPACHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2321, 13, 'BOCAIUVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2320, 13, 'BOCAINA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2319, 13, 'BOA ESPERANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2318, 13, 'BIQUINHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2317, 13, 'BICAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2316, 13, 'BIAS FORTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2315, 13, 'BETIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2314, 13, 'BERIZAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2313, 13, 'BERTOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2312, 13, 'BERILO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2311, 13, 'BELO VALE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2310, 13, 'BELO ORIENTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2309, 13, 'BELO HORIZONTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2308, 13, 'BELMIRO BRAGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2307, 13, 'BELA VISTA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2306, 13, 'BARROSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2305, 13, 'BARRA LONGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2304, 13, 'BARBACENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2303, 13, 'BARAO DE MONTE ALTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2302, 13, 'BARAO DE COCAIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2301, 13, 'BANDEIRA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2300, 13, 'BANDEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2299, 13, 'BAMBUI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2298, 13, 'BALDIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2297, 13, 'BAEPENDI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2296, 13, 'AUGUSTO DE LIMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2295, 13, 'ATALEIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2294, 13, 'ASTOLFO DUTRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2293, 13, 'ARINOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2292, 13, 'ARICANDUVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2291, 13, 'ARGIRITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2290, 13, 'AREADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2289, 13, 'ARCOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2288, 13, 'ARCEBURGO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2287, 13, 'ARAXA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2286, 13, 'ARAUJOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2285, 13, 'ARAPUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2284, 13, 'ARAPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2283, 13, 'ARAPONGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2282, 13, 'ARANTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2281, 13, 'ARAGUARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2280, 13, 'ARACUAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2279, 13, 'ARACITABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2278, 13, 'ARACAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2277, 13, 'ANTONIO PRADO DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2276, 13, 'ANTONIO DIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2275, 13, 'ANTONIO CARLOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2274, 13, 'ANGELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2273, 13, 'ANDRELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2272, 13, 'CACHOEIRA DE PAJEU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2271, 13, 'ANDRADAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2270, 13, 'AMPARO DO SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2269, 13, 'ALVORADA DE MINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2268, 13, 'ALVINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2267, 13, 'ALVARENGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2266, 13, 'ALTO RIO DOCE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2265, 13, 'ALTO CAPARAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2264, 13, 'ALTEROSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2263, 13, 'ALPINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2262, 13, 'ALPERCATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2261, 13, 'ALMENARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2260, 13, 'ALFREDO VASCONCELOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2259, 13, 'ALFENAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2258, 13, 'ALEM PARAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2257, 13, 'ALBERTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2256, 13, 'ALAGOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2255, 13, 'AIURUOCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2254, 13, 'AIMORES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2253, 13, 'AGUAS VERMELHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2252, 13, 'AGUAS FORMOSAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2251, 13, 'AGUANIL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2250, 13, 'AGUA COMPRIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2249, 13, 'AGUA BOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2248, 13, 'ACUCENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2247, 13, 'ACAIACA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2246, 13, 'ABRE CAMPO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2245, 13, 'ABAETE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (2244, 13, 'ABADIA DOS DOURADOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5178, 12, 'VICENTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5177, 12, 'TRES LAGOAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5176, 12, 'TERENOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5175, 12, 'TAQUARUSSU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5174, 12, 'TACURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5173, 12, 'SONORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5172, 12, 'SIDROLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5171, 12, 'SELVIRIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5170, 12, 'SETE QUEDAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5169, 12, 'SAO GABRIEL DO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5168, 12, 'SANTA RITA DO PARDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5167, 12, 'ROCHEDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5166, 12, 'RIO VERDE DE MATO GROSSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5165, 12, 'RIO NEGRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5164, 12, 'RIO BRILHANTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5163, 12, 'RIBAS DO RIO PARDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5162, 12, 'PORTO MURTINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5161, 12, 'PONTA PORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5160, 12, 'PEDRO GOMES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5159, 12, 'PARANHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5158, 12, 'PARANAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5157, 12, 'NOVO HORIZONTE DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5156, 12, 'NOVA ANDRADINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5155, 12, 'NOVA ALVORADA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5154, 12, 'NIOAQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5153, 12, 'NAVIRAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5152, 12, 'MUNDO NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5151, 12, 'MIRANDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5150, 12, 'MARACAJU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5149, 12, 'LAGUNA CARAPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5148, 12, 'LADARIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5147, 12, 'JUTI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5146, 12, 'JATEI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5145, 12, 'JARDIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5144, 12, 'JARAGUARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5143, 12, 'JAPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5142, 12, 'IVINHEMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5141, 12, 'ITAQUIRAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5140, 12, 'ITAPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5139, 12, 'INOCENCIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5138, 12, 'IGUATEMI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5137, 12, 'GUIA LOPES DA LAGUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5136, 12, 'GLORIA DE DOURADOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5135, 12, 'FIGUEIRAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5134, 12, 'FATIMA DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5133, 12, 'ELDORADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5132, 12, 'DOURADOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5131, 12, 'DOURADINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5130, 12, 'DOIS IRMAOS DO BURITI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5129, 12, 'DEODAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5128, 12, 'COXIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5127, 12, 'COSTA RICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5126, 12, 'CORUMBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5125, 12, 'CORONEL SAPUCAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5124, 12, 'CORGUINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5123, 12, 'CHAPADAO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5122, 12, 'CASSILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5121, 12, 'CARACOL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5120, 12, 'CAMPO GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5119, 12, 'CAMAPUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5118, 12, 'CAARAPO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5117, 12, 'BRASILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5116, 12, 'BONITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5115, 12, 'BODOQUENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5114, 12, 'BELA VISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5113, 12, 'BATAYPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5112, 12, 'BATAGUASSU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5111, 12, 'BANDEIRANTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5110, 12, 'ARAL MOREIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5109, 12, 'AQUIDAUANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5108, 12, 'APARECIDA DO TABOADO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5107, 12, 'ANTONIO JOAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5106, 12, 'ANGELICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5105, 12, 'ANAURILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5104, 12, 'ANASTACIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5103, 12, 'AMAMBAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5102, 12, 'ALCINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5101, 12, 'AGUA CLARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5319, 11, 'NOVA MONTE VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5318, 11, 'NOVA MARINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5317, 11, 'NOVA MARILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5316, 11, 'NOVA GUARITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5315, 11, 'VILA RICA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5314, 11, 'VERA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5313, 11, 'VARZEA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5312, 11, 'VALE DE SAO DOMINGOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5311, 11, 'UNIAO DO SUL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5310, 11, 'TORIXOREU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5309, 11, 'TESOURO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5308, 11, 'TERRA NOVA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5307, 11, 'TAPURAH', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5306, 11, 'TANGARA DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5305, 11, 'TABAPORA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5304, 11, 'SORRISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5303, 11, 'SINOP', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5302, 11, 'SERRA NOVA DOURADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5301, 11, 'SAPEZAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5300, 11, 'SAO FELIX DO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5299, 11, 'SANTO ANTONIO DO LEVERGER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5298, 11, 'SANTO ANTONIO DO LESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5297, 11, 'SANTA TEREZINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5296, 11, 'SANTA RITA DO TRIVELATO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5295, 11, 'SALTO DO CEU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5294, 11, 'SANTA CRUZ DO XINGU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5293, 11, 'ROSARIO OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5292, 11, 'RONDONOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5291, 11, 'RONDOLANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5290, 11, 'SAO PEDRO DA CIPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5289, 11, 'SAO JOSE DO XINGU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5288, 11, 'SAO JOSE DO RIO CLARO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5287, 11, 'SAO JOSE DO POVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5286, 11, 'SANTO AFONSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5285, 11, 'SANTA CARMEM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5284, 11, 'RIO BRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5283, 11, 'RIBEIRAOZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5282, 11, 'RIBEIRAO CASCALHEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5281, 11, 'RESERVA DO CABACAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5280, 11, 'SAO JOSE DOS QUATRO MARCOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5279, 11, 'QUERENCIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5278, 11, 'PRIMAVERA DO LESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5277, 11, 'POXOREO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5276, 11, 'PORTO ESTRELA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5275, 11, 'PORTO ESPERIDIAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5274, 11, 'PORTO DOS GAUCHOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5273, 11, 'PORTO ALEGRE DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5272, 11, 'PONTES E LACERDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5271, 11, 'PONTE BRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5270, 11, 'PONTAL DO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5269, 11, 'POCONE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5268, 11, 'PLANALTO DA SERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5267, 11, 'PEIXOTO DE AZEVEDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5266, 11, 'PEDRA PRETA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5265, 11, 'NOVO SANTO ANTONIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5264, 11, 'PARANATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5263, 11, 'PARANAITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5262, 11, 'NOVO SAO JOAQUIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5261, 11, 'NOVO HORIZONTE DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5260, 11, 'NOVO MUNDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5259, 11, 'NOVA XAVANTINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5258, 11, 'NOVA UBIRATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5257, 11, 'NOVA OLIMPIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5256, 11, 'NOVA MUTUM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5255, 11, 'NOVA CANAA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5254, 11, 'NOVA BRASILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5253, 11, 'NOVA SANTA HELENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5252, 11, 'NOVA LACERDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5251, 11, 'NOVA NAZARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5250, 11, 'NOVA BANDEIRANTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5249, 11, 'NOSSA SENHORA DO LIVRAMENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5248, 11, 'NORTELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5247, 11, 'NOBRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5246, 11, 'MIRASSOL D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5245, 11, 'MATUPA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5244, 11, 'MARCELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5243, 11, 'VILA BELA DA SANTISSIMA TRINDADE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5242, 11, 'LUCIARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5241, 11, 'LUCAS DO RIO VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5240, 11, 'LAMBARI D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5239, 11, 'JUSCIMEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5238, 11, 'JURUENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5237, 11, 'JUINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5236, 11, 'JUARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5235, 11, 'JAURU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5234, 11, 'JANGADA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5233, 11, 'JACIARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5232, 11, 'ITIQUIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5231, 11, 'ITAUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5230, 11, 'ITANHANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5229, 11, 'IPIRANGA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5228, 11, 'INDIAVAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5227, 11, 'GUIRATINGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5226, 11, 'GUARANTA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5225, 11, 'GLORIA D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5224, 11, 'GENERAL CARNEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5223, 11, 'GAUCHA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5222, 11, 'FIGUEIROPOLIS D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5221, 11, 'FELIZ NATAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5220, 11, 'DOM AQUINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5219, 11, 'DIAMANTINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5218, 11, 'DENISE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5217, 11, 'CURVELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5216, 11, 'CUIABA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5215, 11, 'COTRIGUACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5214, 11, 'CONQUISTA D''OESTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5213, 11, 'CONFRESA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5212, 11, 'COMODORO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5211, 11, 'COLNIZA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5210, 11, 'COLIDER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5209, 11, 'COCALINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5208, 11, 'CLAUDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5207, 11, 'CHAPADA DOS GUIMARAES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5206, 11, 'CASTANHEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5205, 11, 'CARLINDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5204, 11, 'CANARANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5203, 11, 'CANABRAVA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5202, 11, 'CAMPOS DE JULIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5201, 11, 'CAMPO VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5200, 11, 'CAMPO NOVO DO PARECIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5199, 11, 'CAMPINAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5198, 11, 'CACERES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5197, 11, 'BRASNORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5196, 11, 'BOM JESUS DO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5195, 11, 'BARRA DO GARCAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5194, 11, 'BARRA DO BUGRES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5193, 11, 'BARAO DE MELGACO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5192, 11, 'ARIPUANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5191, 11, 'ARENAPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5190, 11, 'ARAPUTANGA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5189, 11, 'ARAGUAINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5188, 11, 'ARAGUAIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5187, 11, 'APIACAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5186, 11, 'ALTO TAQUARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5185, 11, 'ALTO PARAGUAI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5184, 11, 'ALTO GARCAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5183, 11, 'ALTO BOA VISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5182, 11, 'ALTO ARAGUAIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5181, 11, 'ALTA FLORESTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5180, 11, 'AGUA BOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (5179, 11, 'ACORIZAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (666, 10, 'ZE DOCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (665, 10, 'VITORINO FREIRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (664, 10, 'VITORIA DO MEARIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (663, 10, 'VILA NOVA DOS MARTIRIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (662, 10, 'VIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (661, 10, 'VARGEM GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (660, 10, 'URBANO SANTOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (659, 10, 'TUTOIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (658, 10, 'TURILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (657, 10, 'TURIACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (656, 10, 'TUNTUM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (655, 10, 'TUFILANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (654, 10, 'TRIZIDELA DO VALE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (653, 10, 'TIMON', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (652, 10, 'TIMBIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (651, 10, 'TASSO FRAGOSO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (650, 10, 'SUCUPIRA DO RIACHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (649, 10, 'SUCUPIRA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (648, 10, 'SITIO NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (647, 10, 'SERRANO DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (646, 10, 'SENADOR LA ROCQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (645, 10, 'SENADOR ALEXANDRE COSTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (644, 10, 'SATUBINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (643, 10, 'SAO VICENTE FERRER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (642, 10, 'SAO ROBERTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (641, 10, 'SAO RAIMUNDO DO DOCA BEZERRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (640, 10, 'SAO RAIMUNDO DAS MANGABEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (639, 10, 'SAO PEDRO DOS CRENTES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (638, 10, 'SAO PEDRO DA AGUA BRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (637, 10, 'SAO MATEUS DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (636, 10, 'SAO LUIS GONZAGA DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (635, 10, 'SAO LUIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (634, 10, 'SAO JOSE DOS BASILIOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (633, 10, 'SAO JOSE DE RIBAMAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (632, 10, 'SAO JOAO DOS PATOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (631, 10, 'SAO JOAO DO SOTER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (630, 10, 'SAO JOAO DO PARAISO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (629, 10, 'SAO JOAO DO CARU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (628, 10, 'SAO JOAO BATISTA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (627, 10, 'SAO FRANCISCO DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (626, 10, 'SAO FRANCISCO DO BREJAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (625, 10, 'SAO FELIX DE BALSAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (624, 10, 'SAO DOMINGOS DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (623, 10, 'SAO DOMINGOS DO AZEITAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (622, 10, 'SAO BERNARDO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (621, 10, 'SAO BENTO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (620, 10, 'SAO BENEDITO DO RIO PRETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (619, 10, 'SANTO ANTONIO DOS LOPES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (618, 10, 'SANTO AMARO DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (617, 10, 'SANTANA DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (616, 10, 'SANTA RITA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (615, 10, 'SANTA QUITERIA DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (614, 10, 'SANTA LUZIA DO PARUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (613, 10, 'SANTA LUZIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (612, 10, 'SANTA INES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (611, 10, 'SANTA HELENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (610, 10, 'SANTA FILOMENA DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (609, 10, 'SAMBAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (608, 10, 'ROSARIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (607, 10, 'RIBAMAR FIQUENE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (606, 10, 'RIACHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (605, 10, 'RAPOSA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (604, 10, 'PRIMEIRA CRUZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (603, 10, 'PRESIDENTE VARGAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (602, 10, 'PRESIDENTE SARNEY', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (601, 10, 'PRESIDENTE MEDICI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (600, 10, 'PRESIDENTE JUSCELINO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (599, 10, 'PRESIDENTE DUTRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (598, 10, 'PORTO RICO DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (597, 10, 'PORTO FRANCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (596, 10, 'POCAO DE PEDRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (595, 10, 'PIRAPEMAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (594, 10, 'PIO XII', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (593, 10, 'PINHEIRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (592, 10, 'PINDARE-MIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (591, 10, 'PERITORO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (590, 10, 'PERI MIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (589, 10, 'PENALVA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (588, 10, 'PEDRO DO ROSARIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (587, 10, 'PEDREIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (586, 10, 'PAULO RAMOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (585, 10, 'PAULINO NEVES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (584, 10, 'PASTOS BONS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (583, 10, 'PASSAGEM FRANCA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (582, 10, 'PARNARAMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (581, 10, 'PARAIBANO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (580, 10, 'PALMEIRANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (579, 10, 'PACO DO LUMIAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (578, 10, 'OLINDA NOVA DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (577, 10, 'OLHO D''AGUA DAS CUNHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (576, 10, 'NOVA OLINDA DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (575, 10, 'NOVA IORQUE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (574, 10, 'NOVA COLINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (573, 10, 'NINA RODRIGUES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (572, 10, 'MORROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (571, 10, 'MONTES ALTOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (570, 10, 'MONCAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (569, 10, 'MIRINZAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (568, 10, 'MIRANDA DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (567, 10, 'MIRADOR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (566, 10, 'MILAGRES DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (565, 10, 'MATOES DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (564, 10, 'MATOES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (563, 10, 'MATINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (562, 10, 'MATA ROMA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (561, 10, 'MARANHAOZINHO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (560, 10, 'MARAJA DO SENA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (559, 10, 'MARACACUME', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (558, 10, 'MAGALHAES DE ALMEIDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (557, 10, 'LUIS DOMINGUES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (556, 10, 'LORETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (555, 10, 'LIMA CAMPOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (554, 10, 'LAJEADO NOVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (553, 10, 'LAGOA GRANDE DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (552, 10, 'LAGO DOS RODRIGUES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (551, 10, 'LAGOA DO MATO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (550, 10, 'LAGO VERDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (549, 10, 'LAGO DO JUNCO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (548, 10, 'LAGO DA PEDRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (547, 10, 'JUNCO DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (546, 10, 'JOSELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (545, 10, 'JOAO LISBOA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (544, 10, 'JENIPAPO DOS VIEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (543, 10, 'JATOBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (542, 10, 'ITINGA DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (541, 10, 'ITAPECURU MIRIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (540, 10, 'ITAIPAVA DO GRAJAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (539, 10, 'IMPERATRIZ', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (538, 10, 'IGARAPE GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (537, 10, 'IGARAPE DO MEIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (536, 10, 'ICATU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (535, 10, 'HUMBERTO DE CAMPOS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (534, 10, 'GUIMARAES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (533, 10, 'GRAJAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (532, 10, 'GRACA ARANHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (531, 10, 'GOVERNADOR NUNES FREIRE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (530, 10, 'GOVERNADOR NEWTON BELLO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (529, 10, 'GOVERNADOR LUIZ ROCHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (528, 10, 'GOVERNADOR EUGENIO BARROS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (527, 10, 'GOVERNADOR EDISON LOBAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (526, 10, 'GOVERNADOR ARCHER', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (525, 10, 'GONCALVES DIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (524, 10, 'GODOFREDO VIANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (523, 10, 'FORTUNA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (522, 10, 'FORTALEZA DOS NOGUEIRAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (521, 10, 'FORMOSA DA SERRA NEGRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (520, 10, 'FERNANDO FALCAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (519, 10, 'FEIRA NOVA DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (518, 10, 'ESTREITO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (517, 10, 'ESPERANTINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (516, 10, 'DUQUE BACELAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (515, 10, 'DOM PEDRO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (514, 10, 'DAVINOPOLIS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (513, 10, 'CURURUPU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (512, 10, 'COROATA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (511, 10, 'CONCEICAO DO LAGO-ACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (510, 10, 'COLINAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (509, 10, 'COELHO NETO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (508, 10, 'CODO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (507, 10, 'CIDELANDIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (506, 10, 'CHAPADINHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (505, 10, 'CENTRO NOVO DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (504, 10, 'CENTRO DO GUILHERME', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (503, 10, 'CENTRAL DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (502, 10, 'CEDRAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (501, 10, 'CAXIAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (500, 10, 'CARUTAPERA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (499, 10, 'CAROLINA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (498, 10, 'CAPINZAL DO NORTE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (497, 10, 'CANTANHEDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (496, 10, 'CANDIDO MENDES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (495, 10, 'CAMPESTRE DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (494, 10, 'CAJARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (493, 10, 'CAJAPIO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (492, 10, 'CACHOEIRA GRANDE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (491, 10, 'BURITIRANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (490, 10, 'BURITICUPU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (489, 10, 'BURITI BRAVO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (488, 10, 'BURITI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (487, 10, 'BREJO DE AREIA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (486, 10, 'BREJO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (485, 10, 'BOM LUGAR', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (484, 10, 'BOM JESUS DAS SELVAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (483, 10, 'BOM JARDIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (482, 10, 'BOA VISTA DO GURUPI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (481, 10, 'BERNARDO DO MEARIM', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (480, 10, 'BEQUIMAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (479, 10, 'BENEDITO LEITE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (478, 10, 'BELA VISTA DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (477, 10, 'BELAGUA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (476, 10, 'BARREIRINHAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (475, 10, 'BARRA DO CORDA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (474, 10, 'BARAO DE GRAJAU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (473, 10, 'BALSAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (472, 10, 'BACURITUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (471, 10, 'BACURI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (470, 10, 'BACABEIRA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (469, 10, 'BACABAL', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (468, 10, 'AXIXA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (467, 10, 'ARARI', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (466, 10, 'ARAME', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (465, 10, 'ARAIOSES', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (464, 10, 'ARAGUANA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (463, 10, 'APICUM-ACU', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (462, 10, 'ANAPURUS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (461, 10, 'ANAJATUBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (460, 10, 'AMARANTE DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (459, 10, 'AMAPA DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (458, 10, 'ALTO PARNAIBA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (457, 10, 'ALTO ALEGRE DO PINDARE', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (456, 10, 'ALTO ALEGRE DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (455, 10, 'ALTAMIRA DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (454, 10, 'ALDEIAS ALTAS', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (453, 10, 'ALCANTARA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (452, 10, 'AGUA DOCE DO MARANHAO', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (451, 10, 'AFONSO CUNHA', true);
INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (450, 10, 'ACAILANDIA', true);


--
-- Data for Name: tb_pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (37, 1, 10, '2011-02-12', 119.95999999999999, true, NULL);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (42, 1, 26, '2011-02-13', 59.979999999999997, true, NULL);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (33, 1, 1, '2011-02-12', 329.88999999999999, true, NULL);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (31, 1, 1, '2011-02-12', 89.969999999999999, true, NULL);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (41, 5, 26, '2011-02-13', 29.989999999999998, true, NULL);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (28, 5, 1, '2011-02-11', 29.989999999999998, true, NULL);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (36, 5, 1, '2011-02-12', 389.87, true, NULL);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (39, 2, 1, '2011-02-13', 479.83999999999997, true, NULL);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (38, 5, 1, '2011-02-12', 3298.9000000000001, true, NULL);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (26, 2, 1, '2011-01-23', 149.94999999999999, true, NULL);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (32, 5, 1, '2011-02-12', 29.989999999999998, true, NULL);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (34, 2, 1, '2011-02-12', 29.989999999999998, true, NULL);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (29, 5, 1, '2011-02-12', 29.989999999999998, true, NULL);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (35, 2, 1, '2011-02-12', 119.95999999999999, true, NULL);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (40, 4, 26, '2011-02-13', 29.989999999999998, true, 'SS123456789BR');
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (27, 4, 9, '2011-01-23', 59.979999999999997, true, 'SS123456789BB');
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo, cd_rastreamento) VALUES (30, 4, 1, '2011-02-12', 29.989999999999998, true, 'SS123456780BR');


--
-- Data for Name: tb_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_perfil (sq_perfil, tx_perfil, st_ativo) VALUES (1, 'Cliente', true);
INSERT INTO tb_perfil (sq_perfil, tx_perfil, st_ativo) VALUES (2, 'Pagamento', true);
INSERT INTO tb_perfil (sq_perfil, tx_perfil, st_ativo) VALUES (3, 'Confeccao', true);
INSERT INTO tb_perfil (sq_perfil, tx_perfil, st_ativo) VALUES (5, 'Administrador', true);
INSERT INTO tb_perfil (sq_perfil, tx_perfil, st_ativo) VALUES (4, 'Despache', true);


--
-- Data for Name: tb_produto_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (5, 26, 25, true, 4);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (6, 26, 16, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (7, 27, 20, true, 2);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (8, 28, 21, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (9, 29, 21, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (10, 30, 22, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (11, 31, 26, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (12, 31, 23, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (13, 31, 21, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (14, 32, 25, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (15, 33, 27, true, 11);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (16, 34, 26, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (17, 35, 26, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (18, 35, 21, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (19, 35, 19, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (20, 35, 25, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (21, 36, 26, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (22, 36, 23, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (23, 36, 21, true, 7);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (24, 36, 25, true, 4);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (25, 37, 26, true, 4);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (26, 38, 14, true, 96);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (27, 38, 26, true, 5);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (28, 38, 7, true, 6);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (29, 38, 12, true, 3);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (30, 39, 28, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (31, 39, 26, true, 15);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (32, 40, 23, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (33, 41, 23, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (34, 42, 23, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (35, 42, 27, true, 1);


--
-- Data for Name: tb_produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (17, 29.989999999999998, '34a4c4', 'M', 'far Cry', 'FC', '4204f1986412e7b3af7574bac4c46839', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (18, 29.989999999999998, 'a3346b', 'M', 'CAll fo Duty 4', 'coD4', '9aae5a51de471c09ae25b6bdfee0a0a2', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (19, 29.989999999999998, 'a3346b', 'P', 'Ghost Recon 2', 'GREW2', '6cb9f57846187b062e226dc6644f6686', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (21, 29.989999999999998, '520b0b', 'P', 'Heroes MM', 'MofH', 'a533b8412f8d336f249838d2137d4298', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (13, 29.989999999999998, '344ca3', 'M', 'dgsd', 'fgsdfgsd', 'baf3604da7dfd98e5c1c34f00cf5039b', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (22, 29.989999999999998, '171c46', 'M', 'StalkER', 'STR', '37bc67da48af56663621145b37b8c1d2', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (23, 29.989999999999998, 'a3346b', 'G', 'Tomb Raider Legend', 'TB - Legend', 'aabe26a71ee18660ffe0d9f5c0a539c1', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (14, 29.989999999999998, 'f60000', 'M', 'guitar hero', 'descriiasd', '9a5ac40e2fb04c8bc0197735b922580f', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (20, 29.989999999999998, 'd83200', 'M', 'Shrek 2', 'SH2', '4675ae56fb11fc874dec2d037c9c4126', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (25, 29.989999999999998, '000000', 'P', 'Matrix', 'Camiseta Matrix - Rarissima!', 'a8b233d2007ddeb8957722e575b3294b', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (26, 29.989999999999998, 'ffffff', 'P', 'Lost', 'CAmiseta Lost "Caminho para CAsa" na cor branca', '2501ce75262efc192f342548dd716c96', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (27, 29.989999999999998, '34a4c4', 'M', 'BF', 'Camiseta BF', '25af3aa4f3f43043a4da21f287c0bb1f', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (28, 29.989999999999998, 'd83200', 'P', 'Fulana de Tal...', 'camiseta fulana de tal na cor vermelha', 'fe6fefdfc78a16432a7d13323588443e', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (29, 29.989999999999998, 'ffffff', 'M', 'Pinguin - AMODEU', 'Camiseta Pinguin', '466d344f29292522836a5bc971f4336d', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (30, 29.989999999999998, '000000', 'G', 'hitman', 'hitman', '53bf846f8bd59be60d2d49c1d842687b', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (32, 29.989999999999998, '520b0b', 'M', 'test', 'test', '8acc264c2c88cff2ee6800123373400d', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (35, 29.989999999999998, '000000', 'P', 'xx', 'xxx', '45190fbf8e5e6837a67a1d2df5dd7726', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (34, 29.989999999999998, '717171', 'P', 'tes', 'tes', '88d93e30ee39eea98f014622d1ba3bc4', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (33, 29.989999999999998, 'f6d600', 'G', 'ss', 'ss', 'ffd31be91eacf6082743560f57960878', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (39, 29.989999999999998, '171c46', 'P', 'sese', 'sese', '035146cbbf0170284f04d9e526b9735d', true, true, true);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (40, 29.989999999999998, 'a3346b', 'P', 'jkjk', 'hbjhj', '4bd4f7c1d0f3b4879db629994c669c44', true, true, true);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (41, 29.989999999999998, '000000', 'P', 'y', 'hg', '2d443ed2be1eea6a5ce19cb1edf892d6', true, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (42, 29.989999999999998, '000000', 'P', 'gfgy', 'gfdcdcf', '0e432270f7a091862d439d0cc9cc2d03', true, true, true);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (24, 29.989999999999998, '174621', 'P', 'Kane & Lynch', 'Dead Men - KL', '9bcf0d8f2f87db74e78b34e5be0964c5', false, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (43, 29.989999999999998, '1bbc81', 'G', 'Gabrota Ubuntu', 'Ubun', 'd0b43f5f52591cc834dd122069dfc9a6', true, true, true);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (7, 29.989999999999998, '717171', 'M', 'Cold Fear', 'Camiseta CF na cor cinza', '349706e6dc9513e5abfd649d6b182647', true, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (8, 29.989999999999998, 'a7bc1b', 'M', 'Half Life', 'Camiseta HL2', '923d4725237534945638c0069db3dcda', true, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (9, 29.989999999999998, 'a7bc1b', 'M', 'Half Life', 'Camiseta HL2', '923d4725237534945638c0069db3dcda', true, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (10, 29.989999999999998, '344ca3', 'P', 'sdfasdfasd', 'asdfa', 'e8feff4f75db583ab36b895bcf3ad5d7', true, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (11, 29.989999999999998, '344ca3', 'P', 'sdfasdfasd', 'asdfa', 'e8feff4f75db583ab36b895bcf3ad5d7', true, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (12, 29.989999999999998, '344ca3', 'M', 'dgsd', 'fgsdfgsd', 'baf3604da7dfd98e5c1c34f00cf5039b', true, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (15, 29.989999999999998, '174621', 'G', 'Warrions', 'CAmisetas WOII', '930463b79bf5ce641547c0388044c989', true, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (36, 29.989999999999998, 'f60000', 'G', 'verso', 'verso', '08fbae6cef367d3e77a6e800e4eb9201', true, true, true);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (16, 29.989999999999998, 'ffffff', 'G', 'max payner', 'MP', '40228a1a71ff06ccdcc3816948576588', false, true, true);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (2, 49.990000000000002, '000000', 'P', 'Resident Evil 5', 'Camiseta preta do RE5', 'ed23ffcb5ca3953b0ecd2aa03ad27034', true, true, true);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (1, 29.989999999999998, 'FFFFFF', 'M', 'Umbrella', 'Camiseta branca com estampa da Umbrella Corp.', 'ed23ffcb5ca3953b0ecd2aa03ad27036', true, true, true);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (4, 29.989999999999998, '344ca3', 'P', 'rtwertwer', 'wtwe', '893e83689a0db9f8b0b95235893b4e88', true, true, true);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (6, 29.989999999999998, '717171', 'M', 'Cold Fear', 'Camiseta CF na cor cinza', 'd5770202f008f442bf4d816484d7a7e7', true, true, true);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (5, 29.989999999999998, '717171', 'M', 'Cold Fear', 'Camiseta CF na cor cinza', '92043429c0456f2cb8f8b0147ef21476', true, true, true);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (3, 89.989999999999995, 'ffffff', 'G', 'Gears of War', 'Camiseta GoW na cor verde', 'ed23ffcb5ca3953b0ecd2aa03ad27035', true, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (31, 29.989999999999998, '171c46', 'P', 'test', 'test', '8b60fda6236af726e98a5fe9569e1315', true, true, true);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (37, 29.989999999999998, 'd83200', 'M', 'Fulana', 'Test', '71d8e6b3b53118474f78dad68acd0a6b', true, true, false);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (38, 29.989999999999998, 'a7bc1b', 'P', 'aaaa', 'aaaa', 'acb180de415baa7562ca5e9b76840e5c', true, true, true);
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, hs_produto, st_privado, st_ativo, fg_verso) VALUES (44, 29.989999999999998, '520b0b', 'G', 'Abstract', 'Abstract', '72d1d120152bffe4342b064381714469', true, true, false);


--
-- Data for Name: tb_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_status (sq_status, tx_status, st_ativo) VALUES (1, 'Aguardando Pagamento', true);
INSERT INTO tb_status (sq_status, tx_status, st_ativo) VALUES (2, 'Aguardando ConfecÃ§Ã£o', true);
INSERT INTO tb_status (sq_status, tx_status, st_ativo) VALUES (3, 'Aguandando Despachar', true);
INSERT INTO tb_status (sq_status, tx_status, st_ativo) VALUES (4, 'Enviado ao Cliente', true);
INSERT INTO tb_status (sq_status, tx_status, st_ativo) VALUES (5, 'Finalizar por Falta de Pagamento', true);


--
-- Data for Name: tb_telefones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_telefones (sq_telefone, sq_usuario, tp_telefone, nu_telefone, nu_ddd, st_ativo) VALUES (1, 8, 'Residencial', '12345484', '061', true);
INSERT INTO tb_telefones (sq_telefone, sq_usuario, tp_telefone, nu_telefone, nu_ddd, st_ativo) VALUES (2, 8, 'Celular', '41525241', '061', true);
INSERT INTO tb_telefones (sq_telefone, sq_usuario, tp_telefone, nu_telefone, nu_ddd, st_ativo) VALUES (5, 9, 'Residencial', '12344541', '061', true);
INSERT INTO tb_telefones (sq_telefone, sq_usuario, tp_telefone, nu_telefone, nu_ddd, st_ativo) VALUES (6, 9, 'Celular', '12545412', '115', true);
INSERT INTO tb_telefones (sq_telefone, sq_usuario, tp_telefone, nu_telefone, nu_ddd, st_ativo) VALUES (7, 10, 'Residencial', '91453232', '061', true);
INSERT INTO tb_telefones (sq_telefone, sq_usuario, tp_telefone, nu_telefone, nu_ddd, st_ativo) VALUES (8, 10, 'Celular', '33436584', '067', true);
INSERT INTO tb_telefones (sq_telefone, sq_usuario, tp_telefone, nu_telefone, nu_ddd, st_ativo) VALUES (10, 26, 'Celular', '54878554', '061', true);
INSERT INTO tb_telefones (sq_telefone, sq_usuario, tp_telefone, nu_telefone, nu_ddd, st_ativo) VALUES (9, 26, 'Residencial', '12454545', '061', true);
INSERT INTO tb_telefones (sq_telefone, sq_usuario, tp_telefone, nu_telefone, nu_ddd, st_ativo) VALUES (3, 1, 'Celular', '91455842', '061', true);
INSERT INTO tb_telefones (sq_telefone, sq_usuario, tp_telefone, nu_telefone, nu_ddd, st_ativo) VALUES (4, 1, 'Residencial', '34346814', '061', true);


--
-- Data for Name: tb_ufs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (4, 'Amazonas', 'AM', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (5, 'Bahia', 'BA', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (6, 'Ceara', 'CE', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (7, 'Distrito Federal', 'DF', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (8, 'Espirito-Santo', 'ES', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (9, 'Goias', 'GO', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (10, 'Maranhao', 'MA', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (11, 'Mato Grosso', 'MT', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (12, 'Mato Grosso do Sul', 'MS', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (13, 'Minas Gerais', 'MG', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (14, 'Para', 'PA', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (15, 'Paraiba', 'PB', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (16, 'Parana', 'PR', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (17, 'Pernambuco', 'PE', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (18, 'Piaui', 'PI', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (19, 'Rio de Janeiro', 'RJ', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (20, 'Rio Grande do Norte', 'RN', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (21, 'Rio Grande do Sul', 'RS', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (22, 'Rondonia', 'RO', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (23, 'Roraima', 'RR', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (24, 'Santa Catarina', 'SC', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (25, 'Sao Paulo', 'SP', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (3, 'Amapa', 'AP', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (2, 'Alagoas', 'AL', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (26, 'Sergipe', 'SE', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (27, 'Tocantins', 'TO', true);
INSERT INTO tb_ufs (sq_uf, nm_uf, sg_uf, st_ativo) VALUES (1, 'Acre', 'AC', true);


--
-- Data for Name: tb_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_usuarios (sq_usuario, sq_perfil, sq_municipio, nm_usuario, nu_cpf, tx_senha, tx_email, tx_endereco, nu_cep, st_ativo) VALUES (26, 4, 3111, 'Despache', '75282415550', 'VFdwQk1VMVVTWGRPWnowOQ==', 'despache@camisetas.com', '752.824.155-50', '78454855', true);
INSERT INTO tb_usuarios (sq_usuario, sq_perfil, sq_municipio, nm_usuario, nu_cpf, tx_senha, tx_email, tx_endereco, nu_cep, st_ativo) VALUES (10, 3, 47, 'Confeccao', '45166674600', 'VFdwQk1VMVVTWGRPWnowOQ==', 'confeccao@camisetas.com', 'Minha Casa - Distrito Federal', '72514555', true);
INSERT INTO tb_usuarios (sq_usuario, sq_perfil, sq_municipio, nm_usuario, nu_cpf, tx_senha, tx_email, tx_endereco, nu_cep, st_ativo) VALUES (9, 2, 898, 'Pagamento', '56829597528', 'VFdwQk1VMVVTWGRPWnowOQ==', 'pagamento@camisetas.com', '568.295.975-28', '12345555', true);
INSERT INTO tb_usuarios (sq_usuario, sq_perfil, sq_municipio, nm_usuario, nu_cpf, tx_senha, tx_email, tx_endereco, nu_cep, st_ativo) VALUES (8, 5, 1651, 'Administrador', '68843279602', 'VFdwQk1VMVVTWGRPWnowOQ==', 'administrador@camisetas.com', 'asdfasdf', '12345854', true);
INSERT INTO tb_usuarios (sq_usuario, sq_perfil, sq_municipio, nm_usuario, nu_cpf, tx_senha, tx_email, tx_endereco, nu_cep, st_ativo) VALUES (1, 1, 5580, 'Cliente', '73762385149', 'VFdwQk1VMVVTWGRPWnowOQ==', 'cliente@camisetas.com', 'Quadra 205 Conjunto 12 Casa 06', '72610512', true);


--
-- Name: pk_tb_atividades; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_atividades
    ADD CONSTRAINT pk_tb_atividades PRIMARY KEY (sq_atividade);


--
-- Name: pk_tb_favoritos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_favoritos
    ADD CONSTRAINT pk_tb_favoritos PRIMARY KEY (sq_favorito);


--
-- Name: pk_tb_historico_atividades; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_historico_atividades
    ADD CONSTRAINT pk_tb_historico_atividades PRIMARY KEY (sq_historico_atividade);


--
-- Name: pk_tb_municipios; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_municipios
    ADD CONSTRAINT pk_tb_municipios PRIMARY KEY (sq_municipio);


--
-- Name: pk_tb_pedidos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_pedidos
    ADD CONSTRAINT pk_tb_pedidos PRIMARY KEY (sq_pedido);


--
-- Name: pk_tb_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_perfil
    ADD CONSTRAINT pk_tb_perfil PRIMARY KEY (sq_perfil);


--
-- Name: pk_tb_produto_pedido; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_produto_pedido
    ADD CONSTRAINT pk_tb_produto_pedido PRIMARY KEY (sq_produto_pedido);


--
-- Name: pk_tb_produtos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_produtos
    ADD CONSTRAINT pk_tb_produtos PRIMARY KEY (sq_produto);


--
-- Name: pk_tb_status; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_status
    ADD CONSTRAINT pk_tb_status PRIMARY KEY (sq_status);


--
-- Name: pk_tb_telefones; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_telefones
    ADD CONSTRAINT pk_tb_telefones PRIMARY KEY (sq_telefone);


--
-- Name: pk_tb_ufs; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_ufs
    ADD CONSTRAINT pk_tb_ufs PRIMARY KEY (sq_uf);


--
-- Name: pk_tb_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_usuarios
    ADD CONSTRAINT pk_tb_usuarios PRIMARY KEY (sq_usuario);


--
-- Name: tb_pedidos_cd_rastreamento_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_pedidos
    ADD CONSTRAINT tb_pedidos_cd_rastreamento_key UNIQUE (cd_rastreamento);


--
-- Name: index_4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_4 ON tb_usuarios USING btree (nu_cpf);


--
-- Name: index_5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_5 ON tb_usuarios USING btree (tx_email);


--
-- Name: fk_tb_favor_produtos__tb_produ; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_favoritos
    ADD CONSTRAINT fk_tb_favor_produtos__tb_produ FOREIGN KEY (sq_produto) REFERENCES tb_produtos(sq_produto) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tb_favor_produtos__tb_usuar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_favoritos
    ADD CONSTRAINT fk_tb_favor_produtos__tb_usuar FOREIGN KEY (sq_usuario) REFERENCES tb_usuarios(sq_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tb_histo_reference_tb_pedid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_historico_atividades
    ADD CONSTRAINT fk_tb_histo_reference_tb_pedid FOREIGN KEY (sq_pedido) REFERENCES tb_pedidos(sq_pedido) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tb_histo_relations_tb_ativi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_historico_atividades
    ADD CONSTRAINT fk_tb_histo_relations_tb_ativi FOREIGN KEY (sq_atividade) REFERENCES tb_atividades(sq_atividade) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tb_histo_relations_tb_usuar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_historico_atividades
    ADD CONSTRAINT fk_tb_histo_relations_tb_usuar FOREIGN KEY (sq_usuario) REFERENCES tb_usuarios(sq_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tb_munic_uf_do_mun_tb_ufs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_municipios
    ADD CONSTRAINT fk_tb_munic_uf_do_mun_tb_ufs FOREIGN KEY (sq_uf) REFERENCES tb_ufs(sq_uf) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tb_pedid_relations_tb_statu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_pedidos
    ADD CONSTRAINT fk_tb_pedid_relations_tb_statu FOREIGN KEY (sq_status) REFERENCES tb_status(sq_status) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tb_pedid_relations_tb_usuar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_pedidos
    ADD CONSTRAINT fk_tb_pedid_relations_tb_usuar FOREIGN KEY (sq_usuario) REFERENCES tb_usuarios(sq_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tb_produ_produtos__tb_pedid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_produto_pedido
    ADD CONSTRAINT fk_tb_produ_produtos__tb_pedid FOREIGN KEY (sq_pedido) REFERENCES tb_pedidos(sq_pedido) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tb_produ_produtos__tb_produ; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_produto_pedido
    ADD CONSTRAINT fk_tb_produ_produtos__tb_produ FOREIGN KEY (sq_produto) REFERENCES tb_produtos(sq_produto) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tb_telef_relations_tb_usuar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_telefones
    ADD CONSTRAINT fk_tb_telef_relations_tb_usuar FOREIGN KEY (sq_usuario) REFERENCES tb_usuarios(sq_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tb_usuar_municipio_tb_munic; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_usuarios
    ADD CONSTRAINT fk_tb_usuar_municipio_tb_munic FOREIGN KEY (sq_municipio) REFERENCES tb_municipios(sq_municipio) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tb_usuar_perfil_do_tb_perfi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_usuarios
    ADD CONSTRAINT fk_tb_usuar_perfil_do_tb_perfi FOREIGN KEY (sq_perfil) REFERENCES tb_perfil(sq_perfil) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

