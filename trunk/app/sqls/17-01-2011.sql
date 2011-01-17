--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.1
-- Dumped by pg_dump version 9.0.1
-- Started on 2011-01-17 03:11:07

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1917 (class 1262 OID 17953)
-- Name: camisetas; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE camisetas WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese, Brazil' LC_CTYPE = 'Portuguese, Brazil';


ALTER DATABASE camisetas OWNER TO postgres;

\connect camisetas

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 349 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1542 (class 1259 OID 17956)
-- Dependencies: 1843 5
-- Name: tb_atividades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_atividades (
    sq_atividade integer NOT NULL,
    tx_atividade text NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_atividades OWNER TO postgres;

--
-- TOC entry 1541 (class 1259 OID 17954)
-- Dependencies: 1542 5
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
-- TOC entry 1920 (class 0 OID 0)
-- Dependencies: 1541
-- Name: tb_atividades_sq_atividade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_atividades_sq_atividade_seq OWNED BY tb_atividades.sq_atividade;


--
-- TOC entry 1921 (class 0 OID 0)
-- Dependencies: 1541
-- Name: tb_atividades_sq_atividade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_atividades_sq_atividade_seq', 1, false);


--
-- TOC entry 1544 (class 1259 OID 17968)
-- Dependencies: 1845 5
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
-- TOC entry 1543 (class 1259 OID 17966)
-- Dependencies: 5 1544
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
-- TOC entry 1922 (class 0 OID 0)
-- Dependencies: 1543
-- Name: tb_favoritos_sq_favorito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_favoritos_sq_favorito_seq OWNED BY tb_favoritos.sq_favorito;


--
-- TOC entry 1923 (class 0 OID 0)
-- Dependencies: 1543
-- Name: tb_favoritos_sq_favorito_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_favoritos_sq_favorito_seq', 161, true);


--
-- TOC entry 1546 (class 1259 OID 17977)
-- Dependencies: 5
-- Name: tb_historico_atividades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_historico_atividades (
    sq_historico_atividade integer NOT NULL,
    sq_usuario integer NOT NULL,
    sq_atividade integer NOT NULL,
    dt_atividade timestamp without time zone NOT NULL
);


ALTER TABLE public.tb_historico_atividades OWNER TO postgres;

--
-- TOC entry 1545 (class 1259 OID 17975)
-- Dependencies: 5 1546
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
-- TOC entry 1924 (class 0 OID 0)
-- Dependencies: 1545
-- Name: tb_historico_atividades_sq_historico_atividade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_historico_atividades_sq_historico_atividade_seq OWNED BY tb_historico_atividades.sq_historico_atividade;


--
-- TOC entry 1925 (class 0 OID 0)
-- Dependencies: 1545
-- Name: tb_historico_atividades_sq_historico_atividade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_historico_atividades_sq_historico_atividade_seq', 1, false);


--
-- TOC entry 1548 (class 1259 OID 17985)
-- Dependencies: 1848 5
-- Name: tb_municipios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_municipios (
    sq_municipio integer NOT NULL,
    sq_uf integer NOT NULL,
    nm_municipio text NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_municipios OWNER TO postgres;

--
-- TOC entry 1547 (class 1259 OID 17983)
-- Dependencies: 5 1548
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
-- TOC entry 1926 (class 0 OID 0)
-- Dependencies: 1547
-- Name: tb_municipios_sq_municipio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_municipios_sq_municipio_seq OWNED BY tb_municipios.sq_municipio;


--
-- TOC entry 1927 (class 0 OID 0)
-- Dependencies: 1547
-- Name: tb_municipios_sq_municipio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_municipios_sq_municipio_seq', 1, true);


--
-- TOC entry 1550 (class 1259 OID 17997)
-- Dependencies: 1850 1851 5
-- Name: tb_pedidos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_pedidos (
    sq_pedido integer NOT NULL,
    sq_status integer NOT NULL,
    sq_usuario integer NOT NULL,
    dt_pedido date DEFAULT ('now'::text)::date NOT NULL,
    vl_pedido double precision NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_pedidos OWNER TO postgres;

--
-- TOC entry 1549 (class 1259 OID 17995)
-- Dependencies: 1550 5
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
-- TOC entry 1928 (class 0 OID 0)
-- Dependencies: 1549
-- Name: tb_pedidos_sq_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_pedidos_sq_pedido_seq OWNED BY tb_pedidos.sq_pedido;


--
-- TOC entry 1929 (class 0 OID 0)
-- Dependencies: 1549
-- Name: tb_pedidos_sq_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_pedidos_sq_pedido_seq', 15, true);


--
-- TOC entry 1552 (class 1259 OID 18006)
-- Dependencies: 1853 5
-- Name: tb_perfil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_perfil (
    sq_perfil integer NOT NULL,
    tx_perfil text NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_perfil OWNER TO postgres;

--
-- TOC entry 1551 (class 1259 OID 18004)
-- Dependencies: 1552 5
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
-- TOC entry 1930 (class 0 OID 0)
-- Dependencies: 1551
-- Name: tb_perfil_sq_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_perfil_sq_perfil_seq OWNED BY tb_perfil.sq_perfil;


--
-- TOC entry 1931 (class 0 OID 0)
-- Dependencies: 1551
-- Name: tb_perfil_sq_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_perfil_sq_perfil_seq', 5, true);


--
-- TOC entry 1554 (class 1259 OID 18018)
-- Dependencies: 1855 5
-- Name: tb_produto_pedido; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_produto_pedido (
    sq_produto_pedido integer NOT NULL,
    sq_pedido integer NOT NULL,
    sq_produto integer NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL,
    nu_quantidade integer NOT NULL
);


ALTER TABLE public.tb_produto_pedido OWNER TO postgres;

--
-- TOC entry 1553 (class 1259 OID 18016)
-- Dependencies: 1554 5
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
-- TOC entry 1932 (class 0 OID 0)
-- Dependencies: 1553
-- Name: tb_produto_pedido_sq_produto_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_produto_pedido_sq_produto_pedido_seq OWNED BY tb_produto_pedido.sq_produto_pedido;


--
-- TOC entry 1933 (class 0 OID 0)
-- Dependencies: 1553
-- Name: tb_produto_pedido_sq_produto_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_produto_pedido_sq_produto_pedido_seq', 30, true);


--
-- TOC entry 1556 (class 1259 OID 18027)
-- Dependencies: 1857 1858 5
-- Name: tb_produtos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_produtos (
    sq_produto integer NOT NULL,
    vl_produto double precision NOT NULL,
    co_produto text NOT NULL,
    tm_produto character(1) NOT NULL,
    nm_produto text NOT NULL,
    ds_produto text,
    st_privado boolean DEFAULT true NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL,
    hs_produto character varying(32) NOT NULL
);


ALTER TABLE public.tb_produtos OWNER TO postgres;

--
-- TOC entry 1555 (class 1259 OID 18025)
-- Dependencies: 1556 5
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
-- TOC entry 1934 (class 0 OID 0)
-- Dependencies: 1555
-- Name: tb_produtos_sq_produto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_produtos_sq_produto_seq OWNED BY tb_produtos.sq_produto;


--
-- TOC entry 1935 (class 0 OID 0)
-- Dependencies: 1555
-- Name: tb_produtos_sq_produto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_produtos_sq_produto_seq', 24, true);


--
-- TOC entry 1558 (class 1259 OID 18040)
-- Dependencies: 1860 5
-- Name: tb_status; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_status (
    sq_status integer NOT NULL,
    tx_status text NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_status OWNER TO postgres;

--
-- TOC entry 1557 (class 1259 OID 18038)
-- Dependencies: 5 1558
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
-- TOC entry 1936 (class 0 OID 0)
-- Dependencies: 1557
-- Name: tb_status_sq_status_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_status_sq_status_seq OWNED BY tb_status.sq_status;


--
-- TOC entry 1937 (class 0 OID 0)
-- Dependencies: 1557
-- Name: tb_status_sq_status_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_status_sq_status_seq', 5, true);


--
-- TOC entry 1560 (class 1259 OID 18052)
-- Dependencies: 1862 5
-- Name: tb_telefones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_telefones (
    sq_telefone integer NOT NULL,
    tp_telefone text NOT NULL,
    sq_usuario integer NOT NULL,
    nu_telefone text NOT NULL,
    nu_ddd text NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_telefones OWNER TO postgres;

--
-- TOC entry 1559 (class 1259 OID 18050)
-- Dependencies: 1560 5
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
-- TOC entry 1938 (class 0 OID 0)
-- Dependencies: 1559
-- Name: tb_telefones_sq_telefone_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_telefones_sq_telefone_seq OWNED BY tb_telefones.sq_telefone;


--
-- TOC entry 1939 (class 0 OID 0)
-- Dependencies: 1559
-- Name: tb_telefones_sq_telefone_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_telefones_sq_telefone_seq', 1, false);


--
-- TOC entry 1562 (class 1259 OID 18064)
-- Dependencies: 1864 5
-- Name: tb_ufs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_ufs (
    sq_uf integer NOT NULL,
    nm_uf text NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL,
    sg_uf character(255) NOT NULL
);


ALTER TABLE public.tb_ufs OWNER TO postgres;

--
-- TOC entry 1561 (class 1259 OID 18062)
-- Dependencies: 1562 5
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
-- TOC entry 1940 (class 0 OID 0)
-- Dependencies: 1561
-- Name: tb_ufs_sq_uf_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_ufs_sq_uf_seq OWNED BY tb_ufs.sq_uf;


--
-- TOC entry 1941 (class 0 OID 0)
-- Dependencies: 1561
-- Name: tb_ufs_sq_uf_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_ufs_sq_uf_seq', 1, true);


--
-- TOC entry 1564 (class 1259 OID 18076)
-- Dependencies: 1866 5
-- Name: tb_usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_usuarios (
    sq_usuario integer NOT NULL,
    sq_perfil integer NOT NULL,
    sq_municipio integer NOT NULL,
    nm_usuario text NOT NULL,
    nu_cpf text NOT NULL,
    tx_senha text NOT NULL,
    tx_email text NOT NULL,
    tx_endereco text NOT NULL,
    nu_cep text NOT NULL,
    st_ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tb_usuarios OWNER TO postgres;

--
-- TOC entry 1563 (class 1259 OID 18074)
-- Dependencies: 5 1564
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
-- TOC entry 1942 (class 0 OID 0)
-- Dependencies: 1563
-- Name: tb_usuarios_sq_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_usuarios_sq_usuario_seq OWNED BY tb_usuarios.sq_usuario;


--
-- TOC entry 1943 (class 0 OID 0)
-- Dependencies: 1563
-- Name: tb_usuarios_sq_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_usuarios_sq_usuario_seq', 1, true);


--
-- TOC entry 1842 (class 2604 OID 17959)
-- Dependencies: 1542 1541 1542
-- Name: sq_atividade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_atividades ALTER COLUMN sq_atividade SET DEFAULT nextval('tb_atividades_sq_atividade_seq'::regclass);


--
-- TOC entry 1844 (class 2604 OID 17971)
-- Dependencies: 1544 1543 1544
-- Name: sq_favorito; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_favoritos ALTER COLUMN sq_favorito SET DEFAULT nextval('tb_favoritos_sq_favorito_seq'::regclass);


--
-- TOC entry 1846 (class 2604 OID 17980)
-- Dependencies: 1545 1546 1546
-- Name: sq_historico_atividade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_historico_atividades ALTER COLUMN sq_historico_atividade SET DEFAULT nextval('tb_historico_atividades_sq_historico_atividade_seq'::regclass);


--
-- TOC entry 1847 (class 2604 OID 17988)
-- Dependencies: 1547 1548 1548
-- Name: sq_municipio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_municipios ALTER COLUMN sq_municipio SET DEFAULT nextval('tb_municipios_sq_municipio_seq'::regclass);


--
-- TOC entry 1849 (class 2604 OID 18000)
-- Dependencies: 1550 1549 1550
-- Name: sq_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_pedidos ALTER COLUMN sq_pedido SET DEFAULT nextval('tb_pedidos_sq_pedido_seq'::regclass);


--
-- TOC entry 1852 (class 2604 OID 18009)
-- Dependencies: 1552 1551 1552
-- Name: sq_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_perfil ALTER COLUMN sq_perfil SET DEFAULT nextval('tb_perfil_sq_perfil_seq'::regclass);


--
-- TOC entry 1854 (class 2604 OID 18021)
-- Dependencies: 1553 1554 1554
-- Name: sq_produto_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_produto_pedido ALTER COLUMN sq_produto_pedido SET DEFAULT nextval('tb_produto_pedido_sq_produto_pedido_seq'::regclass);


--
-- TOC entry 1856 (class 2604 OID 18030)
-- Dependencies: 1555 1556 1556
-- Name: sq_produto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_produtos ALTER COLUMN sq_produto SET DEFAULT nextval('tb_produtos_sq_produto_seq'::regclass);


--
-- TOC entry 1859 (class 2604 OID 18043)
-- Dependencies: 1558 1557 1558
-- Name: sq_status; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_status ALTER COLUMN sq_status SET DEFAULT nextval('tb_status_sq_status_seq'::regclass);


--
-- TOC entry 1861 (class 2604 OID 18055)
-- Dependencies: 1559 1560 1560
-- Name: sq_telefone; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_telefones ALTER COLUMN sq_telefone SET DEFAULT nextval('tb_telefones_sq_telefone_seq'::regclass);


--
-- TOC entry 1863 (class 2604 OID 18067)
-- Dependencies: 1562 1561 1562
-- Name: sq_uf; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_ufs ALTER COLUMN sq_uf SET DEFAULT nextval('tb_ufs_sq_uf_seq'::regclass);


--
-- TOC entry 1865 (class 2604 OID 18079)
-- Dependencies: 1563 1564 1564
-- Name: sq_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tb_usuarios ALTER COLUMN sq_usuario SET DEFAULT nextval('tb_usuarios_sq_usuario_seq'::regclass);


--
-- TOC entry 1903 (class 0 OID 17956)
-- Dependencies: 1542
-- Data for Name: tb_atividades; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1904 (class 0 OID 17968)
-- Dependencies: 1544
-- Data for Name: tb_favoritos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (160, 1, 19, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (153, 1, 20, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (159, 1, 22, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (161, 1, 23, true);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (157, 1, 10, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (154, 1, 18, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (156, 1, 11, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (158, 1, 13, false);
INSERT INTO tb_favoritos (sq_favorito, sq_usuario, sq_produto, st_ativo) VALUES (155, 1, 17, false);


--
-- TOC entry 1905 (class 0 OID 17977)
-- Dependencies: 1546
-- Data for Name: tb_historico_atividades; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1906 (class 0 OID 17985)
-- Dependencies: 1548
-- Data for Name: tb_municipios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_municipios (sq_municipio, sq_uf, nm_municipio, st_ativo) VALUES (1, 1, 'Recanto das Emas', true);


--
-- TOC entry 1907 (class 0 OID 17997)
-- Dependencies: 1550
-- Data for Name: tb_pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo) VALUES (5, 1, 1, '2011-01-17', 119.95999999999999, true);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo) VALUES (6, 1, 1, '2011-01-17', 179.94, true);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo) VALUES (7, 1, 1, '2011-01-17', 29.989999999999998, true);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo) VALUES (8, 1, 1, '2011-01-17', 29.989999999999998, true);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo) VALUES (9, 1, 1, '2011-01-17', 209.93000000000001, true);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo) VALUES (10, 1, 1, '2011-01-17', 179.94, true);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo) VALUES (11, 1, 1, '2011-01-17', 239.91999999999999, true);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo) VALUES (12, 1, 1, '2011-01-17', 3238.9200000000001, true);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo) VALUES (13, 1, 1, '2011-01-17', 119.95999999999999, true);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo) VALUES (14, 1, 1, '2011-01-17', 29.989999999999998, true);
INSERT INTO tb_pedidos (sq_pedido, sq_status, sq_usuario, dt_pedido, vl_pedido, st_ativo) VALUES (15, 1, 1, '2011-01-17', 29.989999999999998, true);


--
-- TOC entry 1908 (class 0 OID 18006)
-- Dependencies: 1552
-- Data for Name: tb_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_perfil (sq_perfil, tx_perfil, st_ativo) VALUES (1, 'Cliente', true);
INSERT INTO tb_perfil (sq_perfil, tx_perfil, st_ativo) VALUES (2, 'Pagamento', true);
INSERT INTO tb_perfil (sq_perfil, tx_perfil, st_ativo) VALUES (3, 'Confeccao', true);
INSERT INTO tb_perfil (sq_perfil, tx_perfil, st_ativo) VALUES (4, 'Despacho', true);
INSERT INTO tb_perfil (sq_perfil, tx_perfil, st_ativo) VALUES (5, 'Administrador', true);


--
-- TOC entry 1909 (class 0 OID 18018)
-- Dependencies: 1554
-- Data for Name: tb_produto_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (3, 5, 20, true, 3);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (4, 5, 17, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (5, 6, 22, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (6, 6, 10, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (7, 6, 17, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (8, 6, 12, true, 3);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (9, 7, 20, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (10, 8, 19, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (11, 9, 23, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (12, 9, 21, true, 5);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (13, 9, 17, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (14, 10, 17, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (15, 10, 8, true, 3);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (16, 10, 9, true, 2);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (17, 11, 17, true, 2);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (18, 11, 10, true, 3);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (19, 11, 18, true, 2);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (20, 11, 11, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (21, 12, 23, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (22, 12, 4, true, 6);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (23, 12, 10, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (24, 12, 11, true, 100);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (25, 13, 18, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (26, 13, 10, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (27, 13, 11, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (28, 13, 17, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (29, 14, 22, true, 1);
INSERT INTO tb_produto_pedido (sq_produto_pedido, sq_pedido, sq_produto, st_ativo, nu_quantidade) VALUES (30, 15, 21, true, 1);


--
-- TOC entry 1910 (class 0 OID 18027)
-- Dependencies: 1556
-- Data for Name: tb_produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (2, 49.990000000000002, '000000', 'P', 'Resident Evil 5', 'Camiseta preta do RE5', false, true, 'ed23ffcb5ca3953b0ecd2aa03ad27034');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (1, 29.989999999999998, 'FFFFFF', 'M', 'Umbrella', 'Camiseta branca com estampa da Umbrella Corp.', false, true, 'ed23ffcb5ca3953b0ecd2aa03ad27036');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (4, 29.989999999999998, '344ca3', 'P', 'rtwertwer', 'wtwe', false, true, '893e83689a0db9f8b0b95235893b4e88');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (5, 29.989999999999998, '717171', 'M', 'Cold Fear', 'Camiseta CF na cor cinza', false, true, '92043429c0456f2cb8f8b0147ef21476');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (6, 29.989999999999998, '717171', 'M', 'Cold Fear', 'Camiseta CF na cor cinza', false, true, 'd5770202f008f442bf4d816484d7a7e7');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (7, 29.989999999999998, '717171', 'M', 'Cold Fear', 'Camiseta CF na cor cinza', false, true, '349706e6dc9513e5abfd649d6b182647');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (3, 89.989999999999995, 'ffffff', 'G', 'Gears of War', 'Camiseta GoW na cor verde', false, true, 'ed23ffcb5ca3953b0ecd2aa03ad27035');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (8, 29.989999999999998, 'a7bc1b', 'M', 'Half Life', 'Camiseta HL2', false, true, '923d4725237534945638c0069db3dcda');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (9, 29.989999999999998, 'a7bc1b', 'M', 'Half Life', 'Camiseta HL2', false, true, '923d4725237534945638c0069db3dcda');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (10, 29.989999999999998, '344ca3', 'P', 'sdfasdfasd', 'asdfa', false, true, 'e8feff4f75db583ab36b895bcf3ad5d7');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (11, 29.989999999999998, '344ca3', 'P', 'sdfasdfasd', 'asdfa', false, true, 'e8feff4f75db583ab36b895bcf3ad5d7');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (12, 29.989999999999998, '344ca3', 'M', 'dgsd', 'fgsdfgsd', false, true, 'baf3604da7dfd98e5c1c34f00cf5039b');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (15, 29.989999999999998, '174621', 'G', 'Warrions', 'CAmisetas WOII', false, true, '930463b79bf5ce641547c0388044c989');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (16, 29.989999999999998, 'ffffff', 'G', 'max payner', 'MP', false, true, '40228a1a71ff06ccdcc3816948576588');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (17, 29.989999999999998, '34a4c4', 'M', 'far Cry', 'FC', false, true, '4204f1986412e7b3af7574bac4c46839');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (18, 29.989999999999998, 'a3346b', 'M', 'CAll fo Duty 4', 'coD4', false, true, '9aae5a51de471c09ae25b6bdfee0a0a2');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (19, 29.989999999999998, 'a3346b', 'P', 'Ghost Recon 2', 'GREW2', false, true, '6cb9f57846187b062e226dc6644f6686');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (21, 29.989999999999998, '520b0b', 'P', 'Heroes MM', 'MofH', false, true, 'a533b8412f8d336f249838d2137d4298');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (13, 29.989999999999998, '344ca3', 'M', 'dgsd', 'fgsdfgsd', false, true, 'baf3604da7dfd98e5c1c34f00cf5039b');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (22, 29.989999999999998, '171c46', 'M', 'StalkER', 'STR', false, true, '37bc67da48af56663621145b37b8c1d2');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (23, 29.989999999999998, 'a3346b', 'G', 'Tomb Raider Legend', 'TB - Legend', false, true, 'aabe26a71ee18660ffe0d9f5c0a539c1');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (14, 29.989999999999998, 'f60000', 'M', 'guitar hero', 'descriiasd', false, true, '9a5ac40e2fb04c8bc0197735b922580f');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (20, 29.989999999999998, 'd83200', 'M', 'Shrek 2', 'SH2', false, true, '4675ae56fb11fc874dec2d037c9c4126');
INSERT INTO tb_produtos (sq_produto, vl_produto, co_produto, tm_produto, nm_produto, ds_produto, st_privado, st_ativo, hs_produto) VALUES (24, 29.989999999999998, '174621', 'P', 'Kane & Lynch', 'Dead Men - KL', true, true, '9bcf0d8f2f87db74e78b34e5be0964c5');


--
-- TOC entry 1911 (class 0 OID 18040)
-- Dependencies: 1558
-- Data for Name: tb_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_status (sq_status, tx_status, st_ativo) VALUES (1, 'Aguardando Pagamento', true);
INSERT INTO tb_status (sq_status, tx_status, st_ativo) VALUES (2, 'Aguardando Confecção', true);
INSERT INTO tb_status (sq_status, tx_status, st_ativo) VALUES (3, 'Aguandando Despachar', true);
INSERT INTO tb_status (sq_status, tx_status, st_ativo) VALUES (4, 'Enviado ao Cliente', true);
INSERT INTO tb_status (sq_status, tx_status, st_ativo) VALUES (5, 'Finalizar por Falta de Pagamento', true);


--
-- TOC entry 1912 (class 0 OID 18052)
-- Dependencies: 1560
-- Data for Name: tb_telefones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1913 (class 0 OID 18064)
-- Dependencies: 1562
-- Data for Name: tb_ufs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_ufs (sq_uf, nm_uf, st_ativo, sg_uf) VALUES (1, 'Distrito Federal', true, 'DF                                                                                                                                                                                                                                                             ');


--
-- TOC entry 1914 (class 0 OID 18076)
-- Dependencies: 1564
-- Data for Name: tb_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tb_usuarios (sq_usuario, sq_perfil, sq_municipio, nm_usuario, nu_cpf, tx_senha, tx_email, tx_endereco, nu_cep, st_ativo) VALUES (1, 1, 1, 'Michael Fernandes Rodrigues', '73762385149', '123456', 'cerberosnash@gmail.com', 'Quadra 205 Conjunto 12 Casa 06', '72610512', true);


--
-- TOC entry 1868 (class 2606 OID 17965)
-- Dependencies: 1542 1542
-- Name: tb_atividades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_atividades
    ADD CONSTRAINT tb_atividades_pkey PRIMARY KEY (sq_atividade);


--
-- TOC entry 1870 (class 2606 OID 17974)
-- Dependencies: 1544 1544
-- Name: tb_favoritos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_favoritos
    ADD CONSTRAINT tb_favoritos_pkey PRIMARY KEY (sq_favorito);


--
-- TOC entry 1872 (class 2606 OID 17982)
-- Dependencies: 1546 1546
-- Name: tb_historico_atividades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_historico_atividades
    ADD CONSTRAINT tb_historico_atividades_pkey PRIMARY KEY (sq_historico_atividade);


--
-- TOC entry 1874 (class 2606 OID 17994)
-- Dependencies: 1548 1548
-- Name: tb_municipios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_municipios
    ADD CONSTRAINT tb_municipios_pkey PRIMARY KEY (sq_municipio);


--
-- TOC entry 1876 (class 2606 OID 18003)
-- Dependencies: 1550 1550
-- Name: tb_pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_pedidos
    ADD CONSTRAINT tb_pedidos_pkey PRIMARY KEY (sq_pedido);


--
-- TOC entry 1878 (class 2606 OID 18015)
-- Dependencies: 1552 1552
-- Name: tb_perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_perfil
    ADD CONSTRAINT tb_perfil_pkey PRIMARY KEY (sq_perfil);


--
-- TOC entry 1880 (class 2606 OID 18024)
-- Dependencies: 1554 1554
-- Name: tb_produto_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_produto_pedido
    ADD CONSTRAINT tb_produto_pedido_pkey PRIMARY KEY (sq_produto_pedido);


--
-- TOC entry 1882 (class 2606 OID 18037)
-- Dependencies: 1556 1556
-- Name: tb_produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_produtos
    ADD CONSTRAINT tb_produtos_pkey PRIMARY KEY (sq_produto);


--
-- TOC entry 1884 (class 2606 OID 18049)
-- Dependencies: 1558 1558
-- Name: tb_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_status
    ADD CONSTRAINT tb_status_pkey PRIMARY KEY (sq_status);


--
-- TOC entry 1886 (class 2606 OID 18061)
-- Dependencies: 1560 1560
-- Name: tb_telefones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_telefones
    ADD CONSTRAINT tb_telefones_pkey PRIMARY KEY (sq_telefone);


--
-- TOC entry 1888 (class 2606 OID 18073)
-- Dependencies: 1562 1562
-- Name: tb_ufs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_ufs
    ADD CONSTRAINT tb_ufs_pkey PRIMARY KEY (sq_uf);


--
-- TOC entry 1890 (class 2606 OID 18085)
-- Dependencies: 1564 1564
-- Name: tb_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_usuarios
    ADD CONSTRAINT tb_usuarios_pkey PRIMARY KEY (sq_usuario);


--
-- TOC entry 1892 (class 2606 OID 18091)
-- Dependencies: 1881 1556 1544
-- Name: tb_favoritos_sq_produto_tb_produtos_sq_produto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_favoritos
    ADD CONSTRAINT tb_favoritos_sq_produto_tb_produtos_sq_produto FOREIGN KEY (sq_produto) REFERENCES tb_produtos(sq_produto);


--
-- TOC entry 1891 (class 2606 OID 18086)
-- Dependencies: 1564 1544 1889
-- Name: tb_favoritos_sq_usuario_tb_usuarios_sq_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_favoritos
    ADD CONSTRAINT tb_favoritos_sq_usuario_tb_usuarios_sq_usuario FOREIGN KEY (sq_usuario) REFERENCES tb_usuarios(sq_usuario);


--
-- TOC entry 1894 (class 2606 OID 18101)
-- Dependencies: 1546 1867 1542
-- Name: tb_historico_atividades_sq_atividade_tb_atividades_sq_atividade; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_historico_atividades
    ADD CONSTRAINT tb_historico_atividades_sq_atividade_tb_atividades_sq_atividade FOREIGN KEY (sq_atividade) REFERENCES tb_atividades(sq_atividade);


--
-- TOC entry 1893 (class 2606 OID 18096)
-- Dependencies: 1546 1889 1564
-- Name: tb_historico_atividades_sq_usuario_tb_usuarios_sq_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_historico_atividades
    ADD CONSTRAINT tb_historico_atividades_sq_usuario_tb_usuarios_sq_usuario FOREIGN KEY (sq_usuario) REFERENCES tb_usuarios(sq_usuario);


--
-- TOC entry 1895 (class 2606 OID 18106)
-- Dependencies: 1548 1887 1562
-- Name: tb_municipios_sq_uf_tb_ufs_sq_uf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_municipios
    ADD CONSTRAINT tb_municipios_sq_uf_tb_ufs_sq_uf FOREIGN KEY (sq_uf) REFERENCES tb_ufs(sq_uf);


--
-- TOC entry 1897 (class 2606 OID 18116)
-- Dependencies: 1550 1558 1883
-- Name: tb_pedidos_sq_status_tb_status_sq_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_pedidos
    ADD CONSTRAINT tb_pedidos_sq_status_tb_status_sq_status FOREIGN KEY (sq_status) REFERENCES tb_status(sq_status);


--
-- TOC entry 1896 (class 2606 OID 18111)
-- Dependencies: 1889 1564 1550
-- Name: tb_pedidos_sq_usuario_tb_usuarios_sq_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_pedidos
    ADD CONSTRAINT tb_pedidos_sq_usuario_tb_usuarios_sq_usuario FOREIGN KEY (sq_usuario) REFERENCES tb_usuarios(sq_usuario);


--
-- TOC entry 1899 (class 2606 OID 18126)
-- Dependencies: 1550 1875 1554
-- Name: tb_produto_pedido_sq_pedido_tb_pedidos_sq_pedido; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_produto_pedido
    ADD CONSTRAINT tb_produto_pedido_sq_pedido_tb_pedidos_sq_pedido FOREIGN KEY (sq_pedido) REFERENCES tb_pedidos(sq_pedido);


--
-- TOC entry 1898 (class 2606 OID 18121)
-- Dependencies: 1556 1554 1881
-- Name: tb_produto_pedido_sq_produto_tb_produtos_sq_produto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_produto_pedido
    ADD CONSTRAINT tb_produto_pedido_sq_produto_tb_produtos_sq_produto FOREIGN KEY (sq_produto) REFERENCES tb_produtos(sq_produto);


--
-- TOC entry 1900 (class 2606 OID 18131)
-- Dependencies: 1564 1889 1560
-- Name: tb_telefones_sq_usuario_tb_usuarios_sq_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_telefones
    ADD CONSTRAINT tb_telefones_sq_usuario_tb_usuarios_sq_usuario FOREIGN KEY (sq_usuario) REFERENCES tb_usuarios(sq_usuario);


--
-- TOC entry 1902 (class 2606 OID 18141)
-- Dependencies: 1548 1873 1564
-- Name: tb_usuarios_sq_municipio_tb_municipios_sq_municipio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_usuarios
    ADD CONSTRAINT tb_usuarios_sq_municipio_tb_municipios_sq_municipio FOREIGN KEY (sq_municipio) REFERENCES tb_municipios(sq_municipio);


--
-- TOC entry 1901 (class 2606 OID 18136)
-- Dependencies: 1552 1564 1877
-- Name: tb_usuarios_sq_perfil_tb_perfil_sq_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_usuarios
    ADD CONSTRAINT tb_usuarios_sq_perfil_tb_perfil_sq_perfil FOREIGN KEY (sq_perfil) REFERENCES tb_perfil(sq_perfil);


--
-- TOC entry 1919 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2011-01-17 03:11:08

--
-- PostgreSQL database dump complete
--

