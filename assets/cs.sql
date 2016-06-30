--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: autoidcl; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE autoidcl
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autoidcl OWNER TO postgres;

--
-- Name: autoiddep; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE autoiddep
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autoiddep OWNER TO postgres;

--
-- Name: autoidins; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE autoidins
    START WITH 51100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autoidins OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: clinicians; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clinicians (
    idclinician integer DEFAULT nextval('autoidcl'::regclass) NOT NULL,
    name character varying(120),
    typeclinician character varying(20),
    institution_code integer
);


ALTER TABLE public.clinicians OWNER TO postgres;

--
-- Name: commune; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE commune (
    commune_code integer NOT NULL,
    departement_code integer,
    commune_nom character(80),
    commune_description character varying(120)
);


ALTER TABLE public.commune OWNER TO postgres;

--
-- Name: departement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE departement (
    departement_code integer DEFAULT nextval('autoiddep'::regclass) NOT NULL,
    departement_nom character(80),
    departement_descritption character varying(120)
);


ALTER TABLE public.departement OWNER TO postgres;

--
-- Name: institution; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE institution (
    institution_code integer DEFAULT nextval('autoidins'::regclass) NOT NULL,
    nom character varying(120),
    commune_code integer,
    nombre_phys integer,
    nombre_infirm integer,
    x_lat real DEFAULT 0.0,
    y_long real DEFAULT 0.0,
    institution_description character varying(120)
);


ALTER TABLE public.institution OWNER TO postgres;

--
-- Name: spa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spa (
    id_facility character varying(6) NOT NULL,
    moh_facility_code integer,
    name_of_facility character varying(45),
    facility_type character varying(21),
    manag_authority character varying(23),
    dept_name character varying(10),
    villecomm_name character varying(26),
    latitude numeric(8,5),
    longitude numeric(9,5),
    child_vacc integer,
    growth_mon integer,
    sick_child integer,
    fp integer,
    anc integer,
    pmtct integer,
    delivery integer,
    malaria integer,
    sti integer,
    tb integer,
    hiv_ct integer,
    art integer,
    hiv_css integer,
    noncom_diseases integer,
    minor_surgery integer,
    csections integer,
    laboratory integer,
    blood_type integer,
    blood_transf integer,
    general_meds integer,
    stock_contraceptives integer,
    stock_tb_meds integer,
    stock_arvs integer
);


ALTER TABLE public.spa OWNER TO postgres;

--
-- Name: autoidcl; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('autoidcl', 1, false);


--
-- Name: autoiddep; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('autoiddep', 10, true);


--
-- Name: autoidins; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('autoidins', 51118, true);


--
-- Data for Name: clinicians; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: commune; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO commune VALUES (11, 1, 'Anse Rouge                                                                      ', 'Description non definie');
INSERT INTO commune VALUES (12, 1, 'Desdunes                                                                        ', 'Description non definie');
INSERT INTO commune VALUES (13, 1, 'Dessalines                                                                      ', 'Description non definie');
INSERT INTO commune VALUES (14, 1, 'Ennery                                                                          ', 'Description non definie');
INSERT INTO commune VALUES (15, 1, 'Gonaives                                                                        ', 'Description non definie');
INSERT INTO commune VALUES (16, 1, 'Grande Saline                                                                   ', 'Description non definie');
INSERT INTO commune VALUES (17, 1, 'Gros Morne                                                                      ', 'Description non definie');
INSERT INTO commune VALUES (18, 1, 'L''Estere                                                                        ', 'Description non definie');
INSERT INTO commune VALUES (19, 1, 'La chapelle                                                                     ', 'Description non definie');
INSERT INTO commune VALUES (20, 1, 'Marmelade                                                                       ', 'Description non definie');
INSERT INTO commune VALUES (21, 1, 'Petite riviere de l''Artibonite                                                  ', 'Description non definie');
INSERT INTO commune VALUES (22, 1, 'Saint Marc                                                                      ', 'Description non definie');
INSERT INTO commune VALUES (23, 1, 'Saint michel de l''Attalaye                                                      ', 'Description non definie');
INSERT INTO commune VALUES (24, 1, 'Terre Neuve                                                                     ', 'Description non definie');
INSERT INTO commune VALUES (25, 1, 'Verrettes                                                                       ', 'Description non definie');
INSERT INTO commune VALUES (80, 8, 'Anse à Galets                                                                   ', 'Description non definie');
INSERT INTO commune VALUES (81, 8, 'Arcahaie                                                                        ', 'Description non definie');
INSERT INTO commune VALUES (82, 8, 'Cabaret                                                                         ', 'Description non definie');
INSERT INTO commune VALUES (83, 8, 'Carrefour                                                                       ', 'Description non definie');
INSERT INTO commune VALUES (84, 8, 'Cité Soleil                                                                     ', 'Description non definie');
INSERT INTO commune VALUES (85, 8, 'Cornillon                                                                       ', 'Description non definie');
INSERT INTO commune VALUES (86, 8, 'Croix des Bouquets                                                              ', 'Description non definie');
INSERT INTO commune VALUES (87, 8, 'Delmas                                                                          ', 'Description non definie');
INSERT INTO commune VALUES (88, 8, 'Fonds Verrettes                                                                 ', 'Description non definie');
INSERT INTO commune VALUES (89, 8, 'Ganthier                                                                        ', 'Description non definie');
INSERT INTO commune VALUES (90, 8, 'Grand Goave                                                                     ', 'Description non definie');
INSERT INTO commune VALUES (91, 8, 'Gressier                                                                        ', 'Description non definie');
INSERT INTO commune VALUES (92, 8, 'Kenscoff                                                                        ', 'Description non definie');
INSERT INTO commune VALUES (93, 8, 'Léogane                                                                         ', 'Description non definie');
INSERT INTO commune VALUES (94, 8, 'Petit Goave                                                                     ', 'Description non definie');
INSERT INTO commune VALUES (95, 8, 'Pointe à Raquette                                                               ', 'Description non definie');
INSERT INTO commune VALUES (96, 8, 'Port-au-Prince                                                                  ', 'Description non definie');
INSERT INTO commune VALUES (97, 8, 'Pétion ville                                                                    ', 'Description non definie');
INSERT INTO commune VALUES (98, 8, 'Tabarre                                                                         ', 'Description non definie');
INSERT INTO commune VALUES (99, 8, 'Thomazeau                                                                       ', 'Description non definie');


--
-- Data for Name: departement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO departement VALUES (1, 'Artibonite                                                                      ', 'Description non definie');
INSERT INTO departement VALUES (2, 'Centre                                                                          ', 'Description non definie');
INSERT INTO departement VALUES (3, 'Grand''Anse                                                                      ', 'Description non definie');
INSERT INTO departement VALUES (4, 'Nippes                                                                          ', 'Description non definie');
INSERT INTO departement VALUES (5, 'Nord                                                                            ', 'Description non definie');
INSERT INTO departement VALUES (6, 'Nord Est                                                                        ', 'Description non definie');
INSERT INTO departement VALUES (7, 'Nord Ouest                                                                      ', 'Description non definie');
INSERT INTO departement VALUES (8, 'Ouest                                                                           ', 'Description non definie');
INSERT INTO departement VALUES (9, 'Sud                                                                             ', 'Description non definie');
INSERT INTO departement VALUES (10, 'Sud Est                                                                         ', 'Description non definie');


--
-- Data for Name: institution; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO institution VALUES (51100, 'La Providence', 15, 12, 33, 19.4502106, -72.6854172, 'La description de cette institution sera definie plus tard');
INSERT INTO institution VALUES (51101, 'HSISBayonnais', 15, 3, 5, 19.4102097, -72.4783401, 'La description de cette institution sera definie plus tard');
INSERT INTO institution VALUES (51102, 'Labranle', 15, 39, 51, 19.6100197, -72.6158371, 'La description de cette institution sera definie plus tard');
INSERT INTO institution VALUES (51103, 'Cal Anse Rouge', 11, 9, 5, 19.6323605, -73.054657, 'La description de cette institution sera definie plus tard');
INSERT INTO institution VALUES (51104, 'Dispensaire Coridon', 11, 19, 5, 19.5537701, -72.9015732, 'La description de cette institution sera definie plus tard');
INSERT INTO institution VALUES (51105, 'Dispensaire Figuier', 11, 33, 50, 19.5898705, -72.8864975, 'La description de cette institution sera definie plus tard');
INSERT INTO institution VALUES (51106, 'HUEH', 96, 6, 2, 18.5397606, -72.34021, 'Ouest270');
INSERT INTO institution VALUES (51107, 'Sanatorium de Port-au-Prince', 96, 6, 3, 18.5268192, -72.3442078, 'Ouest271');
INSERT INTO institution VALUES (51108, 'Hôpital de Delmas 33', 96, 7, 3, 18.5564499, -72.2983627, 'Ouest134');
INSERT INTO institution VALUES (51109, 'CHOSCAL', 96, 5, 1, 18.5781002, -72.336853, 'Ouest82');
INSERT INTO institution VALUES (51110, 'Hôpital de carrefour', 96, 3, 3, 18.5378304, -72.407547, 'Ouest60');
INSERT INTO institution VALUES (51111, 'Hôpital Adventiste d''Haiti (HAH)', 96, 6, 3, 18.5314598, -72.3867493, 'Ouest59');
INSERT INTO institution VALUES (51112, 'Hôpital de la communauté haïtienne', 96, 7, 4, 18.5240498, -72.2723312, 'Ouest200');
INSERT INTO institution VALUES (51113, 'Hôpital Eliazar Germain', 96, 7, 1, 18.5170708, -72.288681, 'Ouest199');
INSERT INTO institution VALUES (51114, 'Sanatorium de Léogane', 96, 6, 3, 18.5127697, -72.6064987, 'Ouest177');
INSERT INTO institution VALUES (51115, 'Hôpital Notre Dame', 96, 5, 3, 18.4342804, -72.8648987, 'Ouest219');
INSERT INTO institution VALUES (51116, 'Centre de Santé Georges Gauvin', 96, 4, 3, 18.4272709, -72.7711868, 'Ouest158');
INSERT INTO institution VALUES (51117, 'Hôpital ital cubain', 96, 6, 2, 18.5702896, -72.2119064, 'Ouest108');
INSERT INTO institution VALUES (51118, 'Nicolas Armand', 96, 6, 4, 18.7715797, -72.5131378, 'Ouest20');


--
-- Data for Name: spa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO spa VALUES ('CS-001', 52303, 'Dispensaireens. Figuier', 'Dispensaire', 'Publique', 'Artibonite', 'Anse-Rouge', 19.60203, -72.89018, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-002', 52308, 'Dispensaire. Atrel', 'Dispensaire', 'Publique', 'Artibonite', 'Anse-Rouge', 19.63797, -72.91513, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-003', 0, 'Centre de santé communautaire de Corridor', 'CSL', 'Publique', 'Artibonite', 'Anse-Rouge', 19.56004, -72.90109, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-004', 0, 'Centre de santé de Anse rouge', 'CSL', 'Publique', 'Artibonite', 'Anse-Rouge', 19.63465, -73.05607, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-005', 0, 'Centre de santé Illodep', 'CSL', 'Publique', 'Artibonite', 'Anse-Rouge', 19.60060, -72.95395, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-006', 0, 'Dispensaire Cant�', 'Dispensaire', 'Publique', 'Artibonite', 'Anse-Rouge', 19.71731, -72.94541, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-007', 52305, 'Dispensaire. Plaine de l�Arbre', 'Dispensaire', 'Publique', 'Artibonite', 'Anse-Rouge', 19.66683, -73.02200, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-008', 52306, 'Dispensaire. Sources Chaudes', 'Dispensaire', 'Publique', 'Artibonite', 'Anse-Rouge', 19.63633, -72.91643, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-009', 54401, 'CSL St Pierre', 'CAL', 'Publique', 'Artibonite', 'Desdunes', 19.28415, -72.63476, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-010', 54402, 'Dispensaire. Descahos', 'Dispensaire', 'Publique', 'Artibonite', 'Desdunes', 19.30107, -72.65040, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-011', 54403, 'Dispensaire. Aux Sources', 'Dispensaire', 'Publique', 'Artibonite', 'Desdunes', 19.33012, -72.67570, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-012', 54103, 'La Croix Missionaire', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.19361, -72.32925, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-013', 54104, 'Celio', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.16453, -72.36237, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-014', 54105, 'Niel', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.23449, -72.52742, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-015', 54106, 'Poste Pierrot', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.20401, -72.45701, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-016', 54107, 'Coupe � l�Inde', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.27893, -72.46634, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-017', 54108, 'Sanoix', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.22220, -72.58161, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-018', 54110, 'Grande Hatte', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.14277, -72.43297, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-019', 54113, 'Og�', 'Dispensaire', 'Publique', 'Artibonite', 'Dessalines', 19.19762, -72.49395, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-020', 54114, 'Hatte Chevreau', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.28820, -72.57913, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-021', 54116, 'Centre Medical Philom�ne Privénston', 'CAL', 'Privé a but lucratif', 'Artibonite', 'Dessalines', 19.20987, -72.48753, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 2, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-022', 0, 'CDS de Haute Feuille', 'CAL', 'Publique', 'Artibonite', 'Dessalines', 19.27029, -72.57496, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-023', 0, 'CDS de Basse Cobaille', 'CSL', 'Privé a but lucratif', 'Artibonite', 'Dessalines', 19.22152, -72.39438, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-024', 0, 'CDS de Grand Bois', 'CAL', 'Publique', 'Artibonite', 'Dessalines', 19.20564, -72.50000, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-025', 0, 'CDS de Bois Mary', 'CAL', 'Publique', 'Artibonite', 'Dessalines', 19.23567, -72.47328, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-026', 54101, 'Claire Heureuse', 'Hopital de reference', 'Mixte', 'Artibonite', 'Dessalines', 19.26321, -72.51625, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-027', 54112, 'Chenot', 'Dispensaire', 'Privé sans but lucratif', 'Artibonite', 'Dessalines', 19.15641, -72.32392, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-028', 54111, 'Sanie Claire d�Assise', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Dessalines', 19.25917, -72.51613, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1);
INSERT INTO spa VALUES ('CS-029', 54115, 'Glenn Ebenezer', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Dessalines', 19.25883, -72.51018, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-030', 54109, 'Deseaux', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.25654, -72.58216, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-031', 51201, 'Toussaint Louverture', 'Hopital de reference', 'Publique', 'Artibonite', 'Ennery', 19.48200, -72.48134, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-032', 51204, 'St Fran�ois d�Assise', 'CAL', 'Privé a but lucratif', 'Artibonite', 'Ennery', 19.48474, -72.48368, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-033', 51205, 'Dispensaire chemin neuf', 'Dispensaire', 'Mixte', 'Artibonite', 'Ennery', 19.53951, -72.50749, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-034', 51206, 'Dispensaire Rouf', 'Dispensaire', 'Publique', 'Artibonite', 'Ennery', 19.55803, -72.52124, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-035', 51202, 'Passe Reine', 'Dispensaire', 'Publique', 'Artibonite', 'Ennery', 19.51436, -72.54516, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-036', 51203, 'Savanne Carr�e', 'Dispensaire', 'Publique', 'Artibonite', 'Ennery', 19.44126, -72.43956, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-037', 51301, 'CAL L�Est�re', 'Hopital de reference', 'Publique', 'Artibonite', 'Est�re', 19.30483, -72.61005, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-038', 0, 'SOSAKA', 'CAL', 'Publique', 'Artibonite', 'Est�re', 19.32866, -72.64793, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-039', 51102, 'Bayonnais - CAL', 'CSL', 'Privé a but lucratif', 'Artibonite', 'Gona�ves', 19.42686, -72.51557, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-040', 51104, 'Labranle', 'Dispensaire', 'Mixte', 'Artibonite', 'Gona�ves', 19.60870, -72.61588, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-041', 51106, 'Eben-Ezer/Belle Anse', 'CAL', 'Mixte', 'Artibonite', 'Gona�ves', 19.43742, -72.63531, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-042', 51108, 'Raboteau', 'CAL', 'Publique', 'Artibonite', 'Gona�ves', 19.44301, -72.69497, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-043', 51110, 'Poteau', 'Dispensaire', 'Publique', 'Artibonite', 'Gona�ves', 19.52190, -72.61579, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-044', 0, 'Dispensaire de La Pierre', 'Dispensaire', 'Publique', 'Artibonite', 'Gona�ves', 19.46245, -72.76918, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-045', 0, 'Centre de santé de Poteau', 'CSL', 'Mixte', 'Artibonite', 'Gona�ves', 19.51463, -72.62217, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 2, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-046', 51101, 'La Providence', 'Hopital Departemental', 'Publique', 'Artibonite', 'Gona�ves', 19.47518, -72.66647, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-047', 51105, 'Ka-Soleil', 'CSL', 'Publique', 'Artibonite', 'Gona�ves', 19.45376, -72.68996, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-048', 51107, 'Bon Berger/Bassin', 'CSL', 'Privé a but lucratif', 'Artibonite', 'Gona�ves', 19.53825, -72.69564, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-049', 51103, 'Bayonnais', 'Dispensaire', 'Publique', 'Artibonite', 'Gona�ves', 19.42842, -72.54015, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-050', 51109, 'Trou Sable', 'Dispensaire', 'Privé sans but lucratif', 'Artibonite', 'Gona�ves', 19.43826, -72.68020, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-051', 51113, 'Dispensaire Terre Blanche', 'Dispensaire', 'Privé sans but lucratif', 'Artibonite', 'Gona�ves', 19.59364, -72.63961, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-052', 51114, 'Dispensaire Tarasse', 'Dispensaire', 'Privé sans but lucratif', 'Artibonite', 'Gona�ves', 19.45604, -72.63821, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-053', 51112, 'Dispensaire Brunette', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Gona�ves', 19.45252, -72.60744, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-054', 54301, 'Drouin', 'CAL', 'Publique', 'Artibonite', 'Grande-Saline', 19.25611, -72.68971, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-055', 54303, 'Poteneau', 'Dispensaire', 'Publique', 'Artibonite', 'Grande-Saline', 19.23705, -72.64158, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-056', 52103, 'Pendu 5e section', 'CAL', 'Publique', 'Artibonite', 'Gros-Morne', 19.78489, -72.73496, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-057', 52105, 'SOS France 4e section', 'CAL', 'Privé sans but lucratif', 'Artibonite', 'Gros-Morne', 19.66867, -72.68223, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-058', 52106, 'Treuil', 'Dispensaire', 'Publique', 'Artibonite', 'Gros-Morne', 19.75957, -72.65443, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-059', 52107, 'Moulin', 'CAL', 'Publique', 'Artibonite', 'Gros-Morne', 19.65088, -72.71586, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-060', 52108, 'P�rou', 'Dispensaire', 'Publique', 'Artibonite', 'Gros-Morne', 19.60997, -72.69025, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-061', 52109, 'Verneille', 'Dispensaire', 'Publique', 'Artibonite', 'Gros-Morne', 19.75954, -72.67509, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-062', 52111, 'Dispensaires Corail', 'Dispensaire', 'Mixte', 'Artibonite', 'Gros-Morne', 19.72783, -72.66870, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-063', 52112, 'Clinique Jolivert', 'CSL', 'Privé a but lucratif', 'Artibonite', 'Gros-Morne', 19.75979, -72.78444, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-064', 52113, 'Dispensaire D�caussi�re', 'Dispensaire', 'Publique', 'Artibonite', 'Gros-Morne', 19.70100, -72.70500, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-065', 52114, 'Clinique Anti-tuberculose', 'CSL', 'Privé sans but lucratif', 'Artibonite', 'Gros-Morne', 19.71563, -72.69883, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1);
INSERT INTO spa VALUES ('CS-066', 0, 'Dispensaire Notre Dame', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Gros-Morne', 19.70158, -72.63025, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-067', 0, 'Dispensaire communautaire de Dupuy', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Gros-Morne', 19.72528, -72.70264, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-068', 52101, 'Alma Mater', 'Hopital de reference', 'Mixte', 'Artibonite', 'Gros-Morne', 19.66936, -72.68080, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1);
INSERT INTO spa VALUES ('CS-069', 52102, 'David 6e section', 'Dispensaire', 'Publique', 'Artibonite', 'Gros-Morne', 19.71108, -72.73865, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-070', 52104, 'Riv Mancelle  2e section', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Gros-Morne', 19.72018, -72.61991, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-071', 51303, 'New Testament la Croix Perisse', 'CSL', 'Privé sans but lucratif', 'Artibonite', 'L�Est�re', 19.35274, -72.58287, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-072', 51302, 'Dispensaire Lagon', 'Dispensaire', 'Privé sans but lucratif', 'Artibonite', 'L�Est�re', 19.31711, -72.58991, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-073', 53301, 'La Chapelle', 'CAL', 'Mixte', 'Artibonite', 'La Chapelle', 18.91404, -72.31641, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-074', 55201, 'CSL Marmelade', 'CAL', 'Publique', 'Artibonite', 'Marmelade', 19.51683, -72.36024, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-260', 31108, 'CSL Madeline', 'CSL', 'Mixte', 'Nord', 'Cap-Ha�tien', 19.72518, -72.18171, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-485', 11332, 'Grace Medical Center', 'CSL', 'Mixte', 'Ouest', 'Carrefour', 18.54920, -72.40965, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-075', 54201, 'Charles Colimon', 'Hopital de reference', 'Privé a but lucratif', 'Artibonite', 'Petite-Rivi�re', 19.12145, -72.47514, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-076', 54204, '-', 'Dispensaire', 'Mixte', 'Artibonite', 'Petite-Rivi�re', 18.94788, -72.31425, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-077', 54206, 'Plassac', 'CSL', 'Privé sans but lucratif', 'Artibonite', 'Petite-Rivi�re', 19.06127, -72.40515, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-078', 54209, 'Jean Denis', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Petite-Rivi�re', 19.18477, -72.54282, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-079', 0, 'Centre m�dical Choeur Vickie', 'CSL', 'Privé a but lucratif', 'Artibonite', 'Petite-Rivi�re', 19.15744, -72.52936, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-080', 54203, 'Mauger (NF)', 'Dispensaire', 'Publique', 'Artibonite', 'Petite-Rivi�re', 19.16106, -72.56587, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-081', 54205, 'Perodin (NF)', 'Dispensaire', 'Privé sans but lucratif', 'Artibonite', 'Petite-Rivi�re', 19.10753, -72.30139, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-082', 54207, 'Savanne � Roche', 'Dispensaire', 'Mixte', 'Artibonite', 'Petite-Rivi�re', 19.01179, -72.36694, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-083', 53102, 'Chardene', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Saint-Marc', 19.04905, -72.71478, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-084', 53105, 'Gresseau', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 18.98285, -72.64610, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-085', 53106, 'Jeanton', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Saint-Marc', 19.07533, -72.70880, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-086', 53110, 'Bocozelle', 'CAL', 'Mixte', 'Artibonite', 'Saint-Marc', 19.20686, -72.64051, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-087', 53111, 'Gervais', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 19.23780, -72.71885, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-088', 53112, 'RSCH/ Gilbert', 'CAL', 'Publique', 'Artibonite', 'Saint-Marc', 19.06750, -72.61525, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-089', 53113, 'Terre Blanche', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 19.07065, -72.68101, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-090', 53115, 'SSPE', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Saint-Marc', 19.10656, -72.70268, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-091', 53116, 'RSCH/ Bertrant', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 19.16512, -72.63600, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-092', 53102, 'Chardene', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Saint-Marc', 19.04905, -72.71478, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-093', 53105, 'Gresseau', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 18.98285, -72.64610, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-094', 53106, 'Jeanton', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Saint-Marc', 19.07533, -72.70880, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-095', 53110, 'Bocozelle', 'CAL', 'Mixte', 'Artibonite', 'Saint-Marc', 19.20686, -72.64051, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-096', 53111, 'Gervais', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 19.23780, -72.71885, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-097', 53112, 'RSCH/ Gilbert', 'CAL', 'Publique', 'Artibonite', 'Saint-Marc', 19.06750, -72.61525, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-098', 53113, 'Terre Blanche', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 19.07065, -72.68101, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-099', 53115, 'SSPE', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Saint-Marc', 19.10656, -72.70268, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-100', 53116, 'RSCH/ Bertrant', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 19.16512, -72.63600, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-101', 53101, 'Saint Nicolas', 'Hopital de reference', 'Publique', 'Artibonite', 'Saint-Marc', 19.11343, -72.69902, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-102', 53108, 'Pierre Payen', 'CAL', 'Privé a but lucratif', 'Artibonite', 'Saint-Marc', 18.99722, -72.73793, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-103', 53109, 'Pont Sond�', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 19.14884, -72.61700, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-104', 53103, 'Charrettes', 'Dispensaire', 'Mixte', 'Artibonite', 'Saint-Marc', 19.08020, -72.67497, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-105', 53114, 'St Laurent/Barbe', 'Dispensaire', 'Mixte', 'Artibonite', 'Saint-Marc', 19.09404, -72.65513, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-106', 55101, 'Saint Michel de l�Attalaye', 'CAL', 'Publique', 'Artibonite', 'Saint-Michel-de-l''Attalaye', 19.37622, -72.33669, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-107', 55103, 'Marmont/Nan Paul', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Michel-de-l''Attalaye', 19.30707, -72.42919, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-108', 55104, 'Gade Baptiste', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Michel-de-l''Attalaye', 19.28778, -72.36296, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-109', 55105, 'Bas de Sault', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Michel-de-l''Attalaye', 19.43236, -72.33250, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-110', 55106, 'L�Ermite', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Michel-de-l''Attalaye', 19.25196, -72.29013, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-111', 0, 'Dispensaire New Mission', 'Dispensaire', 'Privé sans but lucratif', 'Artibonite', 'Saint-Michel-de-l''Attalaye', 19.33437, -72.47304, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-112', 55107, 'Camathe', 'CSL', 'Privé sans but lucratif', 'Artibonite', 'Saint-Michel-de-l''Attalaye', 19.41368, -72.37384, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-113', 55102, 'Lalomas', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Michel-de-l''Attalaye', 19.39704, -72.28958, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-114', 52201, 'Centre de santé de Terre-Neuve', 'CAL', 'Publique', 'Artibonite', 'Terre-Neuve', 19.59995, -72.78127, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-115', 52202, 'Dispensaire Lagon', 'Dispensaire', 'Publique', 'Artibonite', 'Terre-Neuve', 19.67669, -72.82393, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-116', 53203, 'Bastien', 'CSL', 'Privé a but lucratif', 'Artibonite', 'Verrettes', 19.04585, -72.52415, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-117', 53206, 'Dumarsais Estim�', 'Hopital', 'Publique', 'Artibonite', 'Verrettes', 19.05064, -72.46715, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-118', 53208, 'Liancourt', 'CSL', 'Privé sans but lucratif', 'Artibonite', 'Verrettes', 19.12719, -72.53512, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-119', 53209, 'Dispensaire Marin', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Verrettes', 19.02695, -72.42130, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-120', 53201, 'Albert Schweitzer', 'Hopital', 'Privé sans but lucratif', 'Artibonite', 'Verrettes', 19.07448, -72.49139, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-121', 53204, 'Desarmes', 'CSL', 'Mixte', 'Artibonite', 'Verrettes', 18.99278, -72.38916, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-122', 53205, 'Deschapelles', 'Dispensaire', 'Privé sans but lucratif', 'Artibonite', 'Verrettes', 19.08180, -72.49523, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-123', 53207, 'Gabriel', 'Dispensaire', 'Privé sans but lucratif', 'Artibonite', 'Verrettes', 19.01589, -72.45949, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-124', 53203, 'Bastien', 'CSL', 'Privé a but lucratif', 'Artibonite', 'Verrettes', 19.04585, -72.52415, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-125', 53206, 'Dumarsais Estim�', 'Hopital', 'Publique', 'Artibonite', 'Verrettes', 19.05064, -72.46715, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-126', 53208, 'Liancourt', 'CSL', 'Privé sans but lucratif', 'Artibonite', 'Verrettes', 19.12719, -72.53512, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-127', 53209, 'Dispensaire Marin', 'Dispensaire', 'Privé a but lucratif', 'Artibonite', 'Verrettes', 19.02695, -72.42130, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-128', 63202, 'Dispensaire de Croix de fer (NF)', 'Dispensaire', 'Privé a but lucratif', 'Centre', 'Bellad�re', 18.85414, -71.81529, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-129', 63204, 'Centre de santé de Baptiste', 'CAL', 'Publique', 'Centre', 'Bellad�re', 18.79814, -71.78324, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-130', 63201, 'Hopital Notre Dame de la Nativit�', 'Hopital de reference', 'Publique', 'Centre', 'Bellad�re', 18.86752, -71.76179, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-131', 63203, 'Dispensaire de Roy Sec', 'Dispensaire', 'Publique', 'Centre', 'Bellad�re', 18.89276, -71.83862, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-132', 62301, 'Centre de santé St Michel de Boucan Carr�', 'CAL', 'Mixte', 'Centre', 'Boucan-Carr�', 18.91920, -72.14030, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-133', 62302, 'Centre de santé Sans Lits Saint EsPrivét', 'CAL', 'Mixte', 'Centre', 'Boucan-Carr�', 18.91547, -72.08448, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-134', 61401, 'Centre de santé de Cerca Cavajal', 'CAL', 'Publique', 'Centre', 'Cerca-Cavajal', 19.27077, -71.94244, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-135', 0, 'Dispensaire Ste famille', 'Dispensaire', 'Privé a but lucratif', 'Centre', 'Cerca-Cavajal', 19.27070, -71.94081, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-136', 64101, 'Centre de santé de Cerca La Source', 'CAL', 'Mixte', 'Centre', 'Cerca-la-Source', 19.16312, -71.78990, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-137', 64102, 'Dispensaire de Saltad�re (NF)', 'Dispensaire', 'Privé sans but lucratif', 'Centre', 'Cerca-la-Source', 19.13385, -71.73240, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-138', 64105, 'Centre de santé de Tilory', 'CAL', 'Publique', 'Centre', 'Cerca-la-Source', 19.23182, -71.68213, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-139', 61101, 'Centre de santé de Marmont', 'CSL', 'Publique', 'Centre', 'Hinche', 19.06304, -71.98393, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-140', 61104, 'Dispensaire des Abricots', 'Dispensaire', 'Privé a but lucratif', 'Centre', 'Hinche', 19.06268, -72.08307, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-141', 61105, 'Dispensaire de Los Palis', 'Dispensaire', 'Mixte', 'Centre', 'Hinche', 19.14170, -71.94004, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-142', 61106, 'Clinique de l�incarnation de Pandiasou', 'CAL', 'Privé sans but lucratif', 'Centre', 'Hinche', 19.12700, -72.05719, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-143', 61107, 'Dispensaire Withney Clinic', 'CSL', 'Publique', 'Centre', 'Hinche', 19.14257, -72.01571, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-144', 0, 'Centre de santé Abricot', 'Dispensaire', 'Privé a but lucratif', 'Centre', 'Hinche', 19.08327, -72.12851, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-145', 61100, 'Hopital Sainte Th�r�se', 'Hopital Departemental', 'Publique', 'Centre', 'Hinche', 19.13806, -72.01399, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-146', 61102, 'Dispensaire la Belle Onde', 'Dispensaire', 'Publique', 'Centre', 'Hinche', 19.17133, -72.05783, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-147', 61108, 'Dispensaire de Basin Zim', 'Dispensaire', 'Publique', 'Centre', 'Hinche', 19.21315, -71.97984, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-148', 63104, 'Dispensaire Caste (NF)', 'CSL', 'Publique', 'Centre', 'Lascahobas', 18.93535, -71.90725, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-149', 0, 'Centre santé Fanm', 'CAL', 'Mixte', 'Centre', 'Lascahobas', 18.83092, -71.93568, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-150', 0, 'Centre de santé mount Gold', 'CSL', 'Privé a but lucratif', 'Centre', 'Lascahobas', 18.85203, -71.91228, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-151', 63101, 'Hopital ital  de Lascaobas', 'Hopital de reference', 'Mixte', 'Centre', 'Lascaobas', 18.81012, -71.94911, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-152', 61201, 'Centre de santé sans Lit de Ma�ssade', 'CAL', 'Publique', 'Centre', 'Ma�ssade', 19.17663, -72.13751, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-153', 61204, 'Dispensaire de Selp�tre', 'CSL', 'Publique', 'Centre', 'Ma�ssade', 19.15108, -72.16618, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-154', 61202, 'Dispensaire de Bois Rouge', 'Dispensaire', 'Publique', 'Centre', 'Ma�ssade', 19.10584, -72.20007, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-155', 61203, 'Dispensaire Ossenande', 'Dispensaire', 'Publique', 'Centre', 'Ma�ssade', 19.23711, -72.17224, 1, 1, 1, 1, 1, 0, 0, 1, 1, 2, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-156', 61205, 'Dispensaire Cinqui�me', 'Dispensaire', 'Publique', 'Centre', 'Ma�ssade', 19.20842, -72.22638, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-157', 61206, 'Dispensaire Madame Joie', 'Dispensaire', 'Publique', 'Centre', 'Ma�ssade', 19.16703, -72.22233, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-158', 0, 'Centre de santé ODECOM', 'CSL', 'Mixte', 'Centre', 'Mirebalais', 18.82753, -72.10664, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-159', 62102, 'Hopital Eye Care de Mirbalais', 'Hopital de reference', 'Publique', 'Centre', 'Mirebalais', 18.83702, -72.11341, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-160', 62103, 'Clinique Mennonite(NF)', 'CSL', 'Publique', 'Centre', 'Mirebalais', 18.83439, -72.09959, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-161', 62104, 'Dispensaire March� Canard (NF)', 'Dispensaire', 'Publique', 'Centre', 'Mirebalais', 18.77555, -72.03218, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-162', 62106, 'Dispensaire D�caussi�re', 'Dispensaire', 'Publique', 'Centre', 'Mirebalais', 18.70385, -72.15300, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-163', 0, 'Hopital Universitaire de Mirebalais', 'Hopital universitaire', 'Publique', 'Centre', 'Mirebalais', 18.83597, -72.11669, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-164', 0, 'Centre de Santé Caritas', 'CSL', 'Mixte', 'Centre', 'Mirebalais', 18.75921, -72.13784, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-165', 62101, 'Dispensaire de Sarazin', 'Dispensaire', 'Publique', 'Centre', 'Mirebalais', 18.79798, -72.00098, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-166', 62201, 'Centre de Santé sans Lit de Saut d�Eau', 'CSL', 'Publique', 'Centre', 'Saut-d�Eau', 18.81638, -72.19740, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-167', 0, 'Centre de Santé Coup[e madigras', 'CSL', 'Mixte', 'Centre', 'Saut-d�Eau', 18.80716, -72.26831, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-168', 63301, 'Centre de Santé de Savanette', 'CSL', 'Mixte', 'Centre', 'Savanette', 18.74496, -71.82180, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-169', 63302, 'Dispensaire de Colombier', 'Dispensaire', 'Mixte', 'Centre', 'Savanette', 18.74500, -71.82100, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-170', 64202, 'Clinique St Joseph de Thomassique', 'CAL', 'Privé sans but lucratif', 'Centre', 'Thomassique', 19.08651, -71.82861, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-171', 64201, 'Dispensaire de Boc Banic', 'Dispensaire', 'Publique', 'Centre', 'Thomassique', 19.05107, -71.75060, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-172', 61301, 'Centre de Santé de Thomonde', 'CAL', 'Mixte', 'Centre', 'Thomonde', 19.02617, -71.96961, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-173', 81202, 'Centre de Santé Lion Coicou', 'CSL', 'Mixte', 'Grand Anse', 'Abricots', 18.64764, -74.27798, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-174', 81203, 'SSPE St Joseph', 'CSL', 'Publique', 'Grand Anse', 'Abricots', 18.64855, -74.30701, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-175', 82105, 'Centre de Santé Iceus Picard', 'Dispensaire', 'Mixte', 'Grand Anse', 'Anse-d''Hainault', 18.48882, -74.37396, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-176', 82106, 'CDI', 'Hopital Departemental', 'Publique', 'Grand Anse', 'Anse-d''Hainault', 18.48989, -74.45417, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-177', 82102, 'SSPE de Mandou', 'Dispensaire', 'Publique', 'Grand Anse', 'Anse-d''Hainault', 18.44134, -74.44920, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-178', 82104, 'Dispensaire de Sainte Hel�ne', 'Dispensaire', 'Privé a but lucratif', 'Grand Anse', 'Anse-d''Hainault', 18.48426, -74.45130, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-179', 83301, 'CAL Sainte Agn�s Citimed de Beaumont', 'CAL', 'Mixte', 'Grand Anse', 'Beaumont', 18.47157, -73.94288, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-180', 83303, 'Dispensaire la Providence', 'Dispensaire', 'Publique', 'Grand Anse', 'Beaumont', 18.47833, -73.95889, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-181', 81301, 'Chemen La vi de Bonbon', 'Dispensaire', 'Publique', 'Grand Anse', 'Bonbon', 18.66510, -74.24478, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-182', 81502, 'SSPE de Bourdon', 'Dispensaire', 'Publique', 'Grand Anse', 'Chambellan', 18.48986, -74.35039, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-183', 81501, 'Centre de Santé de Chambellan', 'CSL', 'Publique', 'Grand Anse', 'Chambellan', 18.55076, -74.31316, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-184', 0, 'Dispensaire de Boucan', 'Dispensaire', 'Publique', 'Grand Anse', 'Chambellan', 18.51902, -74.35903, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-185', 0, 'Dispensaire Berluce', 'Dispensaire', 'Publique', 'Grand Anse', 'Chambellan', 18.52421, -74.33189, 0, 0, 1, 1, 1, 0, 0, 1, 2, 2, 0, 0, 0, 1, 1, 0, 2, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-186', 83105, 'H�pital ital de Corail', 'Hopital de reference', 'Publique', 'Grand Anse', 'Corail', 18.56759, -73.89263, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-187', 82203, 'Sainte Anne de Bariadelle', 'Dispensaire', 'Publique', 'Grand Anse', 'Dame-Marie', 18.51679, -74.44123, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-188', 82205, 'Saint Michel de D�sormeaux', 'Dispensaire', 'Publique', 'Grand Anse', 'Dame-Marie', 18.54532, -74.36555, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-189', 82201, 'H�pital ital de la Communaut� Dame-Marienne', 'Hopital de reference', 'Mixte', 'Grand Anse', 'Dame-Marie', 18.56016, -74.42121, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-190', 81100, 'H�pital Saint Antoine', 'Hopital de reference', 'Publique', 'Grand Anse', 'Jérémie', 18.64595, -74.11749, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-191', 81101, 'Haitian Health Foundation', 'CSL', 'Privé sans but lucratif', 'Grand Anse', 'Jérémie', 18.64082, -74.12246, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES ('CS-192', 81105, 'Silo� de Lion', 'Dispensaire', 'Publique', 'Grand Anse', 'Jérémie', 18.54573, -74.11150, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-193', 81106, 'SSPE de Mackandal', 'Dispensaire', 'Publique', 'Grand Anse', 'Jérémie', 18.64744, -74.11556, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-194', 81107, 'SSPE de Marfranc', 'Dispensaire', 'Publique', 'Grand Anse', 'Jérémie', 18.58721, -74.20901, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-195', 81102, 'Centre m�dico social de Gebeau', 'CSL', 'Mixte', 'Grand Anse', 'Jérémie', 18.62249, -74.11193, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-196', 81103, 'Sainte Th�r�se de l�Enfant J�sus', 'Dispensaire', 'Mixte', 'Grand Anse', 'Jérémie', 18.63572, -74.18617, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-197', 81104, 'Notre Dame du Perp�tuel Secours de Latiboli�r', 'Dispensaire', 'Mixte', 'Grand Anse', 'Jérémie', 18.59535, -74.13793, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-198', 81108, 'Notre Dame de l�Assomption de Num�ro deux', 'Dispensaire', 'Mixte', 'Grand Anse', 'Jérémie', 18.66334, -74.15837, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-199', 81109, 'Bon Pasteur de Pr�vil�', 'CAL', 'Mixte', 'Grand Anse', 'Jérémie', 18.53653, -74.15766, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-200', 81110, 'Centre Immacul� Conception de Ste H�l�ne', 'CSL', 'Mixte', 'Grand Anse', 'Jérémie', 18.63749, -74.11212, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-201', 82301, 'Sant sante espwa AFSC/Irois', 'CAL', 'Publique', 'Grand Anse', 'Les Irois', 18.40626, -74.44985, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-202', 82302, 'Dispensaire Carcasse', 'Dispensaire', 'Mixte', 'Grand Anse', 'Les Irois', 18.37252, -74.44750, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-203', 81401, 'Centre de Santé de Moron', 'CSL', 'Publique', 'Grand Anse', 'Moron', 18.55974, -74.25906, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-204', 81403, 'Notre Dame de Lourdes de Moron', 'Dispensaire', 'Privé a but lucratif', 'Grand Anse', 'Moron', 18.55964, -74.25614, 2, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-205', 83401, 'Centre de Santé de Pestel', 'CAL', 'Publique', 'Grand Anse', 'Pestel', 18.54120, -73.79931, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-206', 83403, 'SSPE de Duchity', 'Dispensaire', 'Publique', 'Grand Anse', 'Pestel', 18.43507, -73.90110, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-207', 83406, 'Centre de Santé de Tozia', 'Dispensaire', 'Publique', 'Grand Anse', 'Pestel', 18.45842, -73.87502, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-208', 83404, 'SSPE Espwa de Pointe Sable', 'Dispensaire', 'Mixte', 'Grand Anse', 'Pestel', 18.60687, -73.79512, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-209', 0, 'Dispensaire Jean Bellune', 'Dispensaire', 'Privé a but lucratif', 'Grand Anse', 'Pestel', 18.47847, -73.78251, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-210', 0, 'Dispensaire de D�tail', 'Dispensaire', 'Publique', 'Grand Anse', 'Pestel', 18.47864, -73.85751, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-211', 83201, 'Bon Samaritain des Roseaux', 'Dispensaire', 'Mixte', 'Grand Anse', 'Roseaux', 18.59915, -74.01580, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-212', 83202, 'SSPE de Carrefour Charles', 'CSL', 'Mixte', 'Grand Anse', 'Roseaux', 18.53634, -73.99961, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-213', 83203, 'Saint Antoine de Padoue de Lopino', 'Dispensaire', 'Mixte', 'Grand Anse', 'Roseaux', 18.50923, -74.06231, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-214', 102101, 'CAL Jules Fleury', 'Hopital de reference', 'Publique', 'Nippes', 'Anse-�-Veau', 18.50379, -73.34205, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-215', 102102, 'SSPE de Saint Yves de Sault du Baril', 'Dispensaire', 'Mixte', 'Nippes', 'Anse-�-Veau', 18.43611, -73.27837, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-216', 102103, 'SSPE de Javel', 'Dispensaire', 'Mixte', 'Nippes', 'Anse-�-Veau', 18.42232, -73.26927, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-217', 102401, 'SSPE d''Arnaud', 'CSL', 'Publique', 'Nippes', 'Arnaud', 18.44682, -73.38851, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-218', 75401, 'Barad�res', 'CAL', 'Publique', 'Nippes', 'Barad�res', 18.47225, -73.65751, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-219', 0, 'Dispensaire Ste Elisabeth de Fond Tortue', 'Dispensaire', 'Mixte', 'Nippes', 'Barad�res', 18.46423, -73.70026, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-220', 101303, 'SSPE Ste Catherine de Bouzy', 'Dispensaire', 'Mixte', 'Nippes', 'Fonds-des-N�gres', 18.37267, -73.29253, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-221', 101302, 'CAL de B�thel de L''Arm�e Du Salut', 'CAL', 'Privé a but lucratif', 'Nippes', 'Fonds-des-N�gres', 18.36090, -73.23108, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-778', 71109, 'Laborde', 'Dispensaire', 'Mixte', 'Sud', 'Cayes', 18.28221, -73.80329, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-222', 103201, 'SSPE de Grand Boucan', 'Dispensaire', 'Publique', 'Nippes', 'Grand-Boucan', 18.55408, -73.59059, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-223', 102302, 'SSPE de Morisseaux', 'Dispensaire', 'Publique', 'Nippes', 'L''Asile', 18.38982, -73.35727, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-224', 102301, 'CAL de L''Asile', 'Hopital de reference', 'Publique', 'Nippes', 'L''Asile', 18.37971, -73.41818, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-225', 102304, 'SSPE de Changieux', 'Dispensaire', 'Publique', 'Nippes', 'L�Asile', 18.37274, -73.52960, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-226', 101100, 'H�pital Sainte Th�r�se', 'Hopital Departemental', 'Publique', 'Nippes', 'Mirago�ne', 18.44247, -73.09493, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-227', 101102, 'SSPE de Chalon', 'Dispensaire', 'Mixte', 'Nippes', 'Mirago�ne', 18.40970, -73.09303, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-228', 101103, 'SSPE de Lhomond', 'Dispensaire', 'Mixte', 'Nippes', 'Mirago�ne', 18.35427, -73.09050, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-229', 101104, 'SSPE de Belle Rivi�re', 'Dispensaire', 'Mixte', 'Nippes', 'Mirago�ne', 18.32273, -73.06328, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-230', 101101, 'SSPE de Beraca', 'CSL', 'Mixte', 'Nippes', 'Mirago�ne', 18.43349, -73.07122, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-231', 101105, 'SSPE de Labrousse', 'CAL', 'Mixte', 'Nippes', 'Mirago�ne', 18.32125, -73.01094, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-232', 101106, 'SSPE de St Michel du Sud', 'Dispensaire', 'Privé a but lucratif', 'Nippes', 'Mirago�ne', 18.37359, -73.11436, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-233', 0, 'Centre Materno infantil de Miragoane', 'CSL', 'Privé a but lucratif', 'Nippes', 'Mirago�ne', 18.43950, -73.08051, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-234', 101402, 'SSPE de Mussotte', 'Dispensaire', 'Publique', 'Nippes', 'Paillant', 18.42207, -73.19819, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-235', 101401, 'CAL de Paillant', 'CAL', 'Publique', 'Nippes', 'Paillant', 18.41901, -73.14485, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-236', 101403, 'SSPE de Jeannette', 'Dispensaire', 'Mixte', 'Nippes', 'Paillant', 18.39852, -73.14790, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-237', 102201, 'CAL de Petit Trou', 'CAL', 'Publique', 'Nippes', 'Petit-Go�ve', 18.52734, -73.50971, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-238', 101201, 'CAL de Madian', 'CAL', 'Mixte', 'Nippes', 'Petite-Rivi�re', 18.48279, -73.20675, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-239', 101202, 'Clinic de la Visitation', 'CSL', 'Mixte', 'Nippes', 'Petite-Rivi�re', 18.47569, -73.22266, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-240', 101203, 'SSPE de Petite Rivi�re', 'Dispensaire', 'Publique', 'Nippes', 'Petite-Rivi�re', 18.47693, -73.24321, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-241', 102501, 'CAL de Plaisance', 'CAL', 'Mixte', 'Nippes', 'Plaisance', 18.43189, -73.59058, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-242', 102502, 'SSPE de Gauthier Civil (F)', 'Dispensaire', 'Publique', 'Nippes', 'Plaisance', 18.44863, -73.54218, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-243', 32101, 'Nativit�', 'CSL', 'Mixte', 'Nord', 'Acul-du-Nord', 19.68327, -72.31919, 1, 1, 1, 1, 1, 2, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-244', 32105, 'Dispensaire de Camp Louise', 'Dispensaire', 'Publique', 'Nord', 'Acul-du-Nord', 19.74756, -72.34786, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-245', 32102, 'Tovar', 'CSL', 'Publique', 'Nord', 'Acul-du-Nord', 19.62522, -72.28806, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-246', 32104, 'Dispensaire de Pilatre', 'Dispensaire', 'Mixte', 'Nord', 'Acul-du-Nord', 19.70555, -72.32639, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-247', 32108, 'Dispensaire de la Bruy�re', 'CSL', 'Mixte', 'Nord', 'Acul-du-Nord', 19.63909, -72.30780, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-248', 32109, 'Centre Medical de Secours Chretien', 'CSL', 'Publique', 'Nord', 'Acul-du-Nord', 19.66492, -72.31637, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-249', 0, 'C/S Divine Mis�ricorde', 'CAL', 'Privé a but lucratif', 'Nord', 'Acul-du-Nord', 19.63617, -72.31113, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-250', 0, 'Dispensaire Carrefour La Chaude', 'CSL', 'Publique', 'Nord', 'Acul-du-Nord', 19.61685, -72.28625, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-251', 0, 'Dispensaire C. de Duty', 'Dispensaire', 'Publique', 'Nord', 'Acul-du-Nord', 19.64867, -72.28452, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-252', 33201, 'Dispensaire de Bahon', 'CSL', 'Publique', 'Nord', 'Bahon', 19.46951, -72.11420, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-253', 33202, 'Dispensaire. St Joseph', 'Dispensaire', 'Privé a but lucratif', 'Nord', 'Bahon', 19.47038, -72.11599, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-254', 36201, 'Dispensaire de Bas Limb�', 'Dispensaire', 'Publique', 'Nord', 'Bas-Limb�', 19.78021, -72.37974, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-255', 36202, 'Centre Materno Infantile de Mont Carmel', 'CSL', 'Privé a but lucratif', 'Nord', 'Bas-Limb�', 19.76785, -72.38338, 0, 0, 1, 0, 1, 0, 0, 1, 1, 2, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-256', 35104, 'Alliance Santé Borgne', 'CAL', 'Mixte', 'Nord', 'Borgne', 19.83896, -72.51506, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-257', 35102, 'Dispensaire de Petit Bourg Borgne', 'Dispensaire', 'Publique', 'Nord', 'Borgne', 19.80793, -72.57254, 1, 1, 1, 1, 1, 2, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-258', 31100, 'H�pital Justinien', 'Hopital universitaire', 'Publique', 'Nord', 'Cap-Ha�tien', 19.76279, -72.20621, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-259', 31101, 'CDS La Fossette', 'CSL', 'Mixte', 'Nord', 'Cap-Ha�tien', 19.75355, -72.20569, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-261', 31106, 'Dispensaire Solano SA, Labadie', 'Dispensaire', 'Privé a but lucratif', 'Nord', 'Cap-Ha�tien', 19.78609, -72.24354, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-262', 31107, 'Dispensaire Notre Dame Ste Philom�ne', 'Dispensaire', 'Privé a but lucratif', 'Nord', 'Cap-Ha�tien', 19.74523, -72.21046, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-263', 31102, 'Fort St Michel', 'Hopital de reference', 'Mixte', 'Nord', 'Cap-Ha�tien', 19.74107, -72.19413, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-264', 31103, 'Dispensaire Notre Dame de Lourdes de Car�nage', 'CSL', 'Mixte', 'Nord', 'Cap-Ha�tien', 19.76490, -72.19734, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-265', 31104, 'Dispensaire de Labadie', 'CSL', 'Publique', 'Nord', 'Cap-Ha�tien', 19.74900, -72.21900, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-266', 31105, 'Dispensaire Sacre Coeur, Rue 2K', 'Dispensaire', 'Privé a but lucratif', 'Nord', 'Cap-Ha�tien', 19.75489, -72.20517, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-267', 31109, 'CEMAD Petite Anse', 'CAL', 'Privé a but lucratif', 'Nord', 'Cap-Ha�tien', 19.73304, -72.18339, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-268', 31110, 'FOSREF, rue 16', 'CSL', 'Privé a but lucratif', 'Nord', 'Cap-Ha�tien', 19.75951, -72.20018, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-269', 31111, 'Clinique Medico-Dentaire Saint Joseph', 'CSL', 'Publique', 'Nord', 'Cap-Ha�tien', 19.75155, -72.20294, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-270', 31112, 'Dispensaire St Jean Bosco', 'Dispensaire', 'Mixte', 'Nord', 'Cap-Ha�tien', 19.73808, -72.22042, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-271', 0, 'DASH', 'Hopital', 'Privé a but lucratif', 'Nord', 'Cap-Ha�tien', 19.76155, -72.20238, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-272', 0, 'Centre de Santé Passion du Christ', 'Dispensaire', 'Privé a but lucratif', 'Nord', 'Cap-Ha�tien', 19.73010, -72.21983, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-273', 0, 'Centre de Santé communautaire Nutrit.', 'CSL', 'Privé a but lucratif', 'Nord', 'Cap-Ha�tien', 19.72712, -72.18467, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-274', 0, 'FOSREF Lakay', 'CSL', 'Publique', 'Nord', 'Cap-Ha�tien', 19.75873, -72.20029, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-275', 0, 'Dispensaire Caritas', 'CSL', 'Privé a but lucratif', 'Nord', 'Cap-Ha�tien', 19.75506, -72.20502, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-276', 0, 'Centre de Santé St Jude de Cap Ha�tien', 'CSL', 'Privé a but lucratif', 'Nord', 'Cap-Ha�tien', 19.73828, -72.21339, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-277', 0, 'Clinique M�dicale de Cit�e du Peuple', 'CSL', 'Privé a but lucratif', 'Nord', 'Cap-Ha�tien', 19.74021, -72.21223, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-278', 0, 'Unit� de Lutte pour la Santé', 'CSL', 'Privé sans but lucratif', 'Nord', 'Cap-Ha�tien', 19.77377, -72.21114, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-279', 0, 'Centre de Santé m�dical Shela', 'Dispensaire', 'Privé a but lucratif', 'Nord', 'Cap-Ha�tien', 19.73833, -72.21316, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-280', 34202, 'St Joseph', 'Dispensaire', 'Privé a but lucratif', 'Nord', 'Dondon', 19.52614, -72.24172, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-281', 34201, 'CSL de Dondon', 'CAL', 'Publique', 'Nord', 'Dondon', 19.52671, -72.24458, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 2, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-282', 0, 'Dispensaire communautaire de Dondon', 'Dispensaire', 'Privé a but lucratif', 'Nord', 'Dondon', 19.53303, -72.24039, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-283', 33101, 'CAL Grande Rivi�re du Nord', 'Hopital de reference', 'Publique', 'Nord', 'Grande-Rivi�re-du-Nord', 19.57904, -72.16997, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-284', 34501, 'CSL La Victoire', 'CAL', 'Publique', 'Nord', 'La Victoire', 19.33792, -72.02396, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-285', 36101, 'St Jean de Limbe', 'Hopital de reference', 'Mixte', 'Nord', 'Limb�', 19.70738, -72.40183, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1);
INSERT INTO spa VALUES ('CS-286', 36102, 'H�pital Bon Samaritain', 'Hopital', 'Privé a but lucratif', 'Nord', 'Limb�', 19.69963, -72.40257, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-287', 36103, 'Dispensaire de Camp Coq', 'CSL', 'Publique', 'Nord', 'Limb�', 19.63352, -72.42586, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-288', 36104, 'Dispensaire Haut Limbe', 'CAL', 'Mixte', 'Nord', 'Limb�', 19.69876, -72.35651, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-289', 0, 'Centre Galil� de Haut Limb�', 'CSL', 'Privé sans but lucratif', 'Nord', 'Limb�', 19.70317, -72.37497, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-290', 31301, 'Dispensaire de Limonade', 'CSL', 'Publique', 'Nord', 'Limonade', 19.66947, -72.12608, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-291', 31302, 'Dispensaire Bord de mer Limonade', 'Dispensaire', 'Mixte', 'Nord', 'Limonade', 19.72751, -72.11913, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-292', 31304, 'CSL Porte Ouverte de Bois de Lance', 'CSL', 'Mixte', 'Nord', 'Limonade', 19.63364, -72.14612, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-293', 31305, 'Centre de Santé St Charles', 'CSL', 'Privé sans but lucratif', 'Nord', 'Limonade', 19.67127, -72.12202, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-294', 0, 'Centre de Santé Sooking', 'CSL', 'Mixte', 'Nord', 'Limonade', 19.65164, -72.08320, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-295', 32301, 'CAL Sacre Coeur', 'Hopital', 'Privé a but lucratif', 'Nord', 'Milot', 19.61010, -72.20954, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1);
INSERT INTO spa VALUES ('CS-296', 32305, 'La Providence de Lory', 'CSL', 'Privé sans but lucratif', 'Nord', 'Milot', 19.69761, -72.22615, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-484', 11331, 'ASAD', 'CAL', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.54254, -72.39340, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-297', 32302, 'Dispensaire Carrefour des P�res', 'Dispensaire', 'Publique', 'Nord', 'Milot', 19.68479, -72.20547, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-298', 32303, 'Dispensaire de Thibault', 'Dispensaire', 'Mixte', 'Nord', 'Milot', 19.63320, -72.22721, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-299', 34401, 'H�pital Bienfaisance de Pignon', 'Hopital de reference', 'Publique', 'Nord', 'Pignon', 19.33974, -72.11900, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-300', 34402, 'St Joseph', 'Dispensaire', 'Privé sans but lucratif', 'Nord', 'Pignon', 19.33618, -72.11417, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-301', 37202, 'H�pital Esperance de Pilate', 'Hopital Departemental', 'Privé sans but lucratif', 'Nord', 'Pilate', 19.66872, -72.55049, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-302', 32207, 'Clin. Fran�ois DUGUE', 'CSL', 'Privé sans but lucratif', 'Nord', 'Plaine-du-Nord', 19.70714, -72.27809, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-303', 32209, 'Centre Medico social de la Plaine du Nord', 'CSL', 'Mixte', 'Nord', 'Plaine-du-Nord', 19.67691, -72.27032, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-304', 32203, 'Dispensaire de Morne Rouge', 'Dispensaire', 'Publique', 'Nord', 'Plaine-du-Nord', 19.71050, -72.26602, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-305', 32204, 'Dispensaire De Robillard', 'Dispensaire', 'Publique', 'Nord', 'Plaine-du-Nord', 19.61189, -72.26002, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-306', 32202, 'Dispensaire de Balan', 'Dispensaire', 'Mixte', 'Nord', 'Plaine-du-Nord', 19.72703, -72.29752, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-307', 32205, 'CSL B�thesda de Vaudreuil', 'CSL', 'Mixte', 'Nord', 'Plaine-du-Nord', 19.72018, -72.25214, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-308', 32206, 'St Fr.de Sales', 'Hopital de reference', 'Mixte', 'Nord', 'Plaine-du-Nord', 19.71829, -72.25224, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-309', 32208, 'CSL Jehova Jireh', 'CSL', 'Mixte', 'Nord', 'Plaine-du-Nord', 19.67742, -72.27088, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-310', 0, 'Centre de Santé Rose Merci Robillard', 'CSL', 'Privé sans but lucratif', 'Nord', 'Plaine-du-Nord', 19.61382, -72.25895, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-311', 37101, 'CMP Progressio', 'Hopital de reference', 'Privé a but lucratif', 'Nord', 'Plaisance', 19.59744, -72.46930, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1);
INSERT INTO spa VALUES ('CS-312', 37102, 'Dispensaire de Gobert', 'Dispensaire', 'Privé a but lucratif', 'Nord', 'Plaisance', 19.62971, -72.50612, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-313', 37103, 'Dispensaire La Trouble', 'Dispensaire', 'Privé sans but lucratif', 'Nord', 'Plaisance', 19.56692, -72.44271, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-314', 37104, 'Dispensaire St Henry de Puilboreau', 'Dispensaire', 'Mixte', 'Nord', 'Plaisance', 19.53903, -72.47298, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-315', 35205, 'Dispensaire Wesleyen de Fauch�', 'CAL', 'Privé sans but lucratif', 'Nord', 'Port-Margot', 19.73704, -72.43028, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-316', 35201, 'CSL de Port Margot', 'CSL', 'Privé a but lucratif', 'Nord', 'Port-Margot', 19.75106, -72.42945, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-317', 35202, 'Dispensaire Petit Bourg de Port-Margot', 'CSL', 'Publique', 'Nord', 'Port-Margot', 19.72171, -72.44877, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-318', 35203, 'Dispensaire de Bayeux', 'CSL', 'Mixte', 'Nord', 'Port-Margot', 19.80840, -72.43360, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-319', 35204, 'Dispensaire Malachy', 'CSL', 'Mixte', 'Nord', 'Port-Margot', 19.75065, -72.42816, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-320', 0, 'Clinique M�dicale Dr Dorsainvil', 'CSL', 'Privé a but lucratif', 'Nord', 'Port-Margot', 19.73786, -72.42720, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-321', 31202, 'Dispensaire de Cadush', 'Dispensaire', 'Publique', 'Nord', 'Quartier-Morin', 19.64201, -72.18116, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-322', 31204, 'Dispensaire St Louis', 'Dispensaire', 'Mixte', 'Nord', 'Quartier-Morin', 19.69720, -72.15669, 2, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-323', 31201, 'Dispensaire de Quartier Morin', 'CAL', 'Publique', 'Nord', 'Quartier-Morin', 19.69748, -72.15776, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-324', 31206, 'Grand Pr�', 'Dispensaire', 'Publique', 'Nord', 'Quartier-Morin', 19.62256, -72.18527, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-325', 31207, 'CMB de Carrefour la Mort (Mission Baptiste)', 'Hopital de reference', 'Privé sans but lucratif', 'Nord', 'Quartier-Morin', 19.69895, -72.17751, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-326', 34301, 'CSL de Ranquitte', 'CAL', 'Publique', 'Nord', 'Ranquitte', 19.41056, -72.08284, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-327', 34302, 'Dispensaire Brenda West', 'CSL', 'Publique', 'Nord', 'Ranquitte', 19.42033, -72.08705, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-328', 34303, 'Dispensaire St Joseph ( Catholique)', 'Dispensaire', 'Publique', 'Nord', 'Ranquitte', 19.41298, -72.07846, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-329', 34102, 'St Joseph', 'Dispensaire', 'Privé sans but lucratif', 'Nord', 'Saint-Rapha�l', 19.43643, -72.20038, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-330', 34101, 'CSL de St Rapha�l', 'CAL', 'Publique', 'Nord', 'Saint-Rapha�l', 19.43769, -72.20059, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-331', 42201, 'Dispensaire de Capotille', 'CAL', 'Publique', 'Nord-Est', 'Capotille', 19.44752, -71.69820, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-332', 42202, 'Dispensaire Lamine', 'Dispensaire', 'Publique', 'Nord-Est', 'Capotille', 19.41448, -71.72902, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-333', 43401, 'Dispensaire de Jacquezyl', 'CSL', 'Mixte', 'Nord-Est', 'Caracol', 19.68484, -71.99224, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-334', 43402, 'Dispensaire de Caracol', 'CSL', 'Mixte', 'Nord-Est', 'Caracol', 19.69243, -72.01808, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-335', 43403, 'Centre de Santé Sainte elizabeth', 'CSL', 'Mixte', 'Nord-Est', 'Caracol', 19.69114, -72.01797, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-336', 44201, 'Dispensaire de Carice', 'CAL', 'Publique', 'Nord-Est', 'Carice', 19.37766, -71.83650, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-337', 44202, 'Dispensaire Sainte H�l�ne de Carice', 'CSL', 'Privé sans but lucratif', 'Nord-Est', 'Carice', 19.37847, -71.82997, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-338', 41201, 'Dispensaire de Ferrier', 'Dispensaire', 'Publique', 'Nord-Est', 'Ferrier', 19.61610, -71.77992, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-339', 0, 'Dispensaire de Meillac', 'Dispensaire', 'Publique', 'Nord-Est', 'Ferrier', 19.66988, -71.75603, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-340', 41100, 'H�pital de Fort Libert�', 'Hopital Departemental', 'Publique', 'Nord-Est', 'Fort-Libert�', 19.66546, -71.84096, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-341', 41101, 'Derac', 'Dispensaire', 'Publique', 'Nord-Est', 'Fort-Libert�', 19.66114, -71.81317, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-342', 41102, 'Acul Samedi', 'Dispensaire', 'Publique', 'Nord-Est', 'Fort-Libert�', 19.52038, -71.88155, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-343', 44301, 'Dispensaire de Bois de Laurence', 'CAL', 'Publique', 'Nord-Est', 'Mombin-Crochu', 19.33073, -71.86060, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-344', 44302, 'CAL de Mombin Crochu', 'CAL', 'Publique', 'Nord-Est', 'Mombin-Crochu', 19.36856, -71.98517, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-345', 42301, 'CAL de Mont Organise', 'CAL', 'Publique', 'Nord-Est', 'Mont-Organis�', 19.41043, -71.78475, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-346', 42101, 'CAL de Ouanaminthe', 'CAL', 'Publique', 'Nord-Est', 'Ouanaminthe', 19.54896, -71.72031, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-347', 0, 'Dispensaire de Delaire', 'CSL', 'Publique', 'Nord-Est', 'Ouanaminthe', 19.56141, -71.78108, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-348', 42104, 'Univers Centre Medical', 'CAL', 'Privé a but lucratif', 'Nord-Est', 'Ouanaminthe', 19.55129, -71.72512, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-349', 42102, 'Dispensaire d�Acul des Pins', 'Dispensaire', 'Publique', 'Nord-Est', 'Ouanaminthe', 19.49733, -71.81072, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-350', 42105, 'Dispensaire Savane au Lait', 'Dispensaire', 'Publique', 'Nord-Est', 'Ouanaminthe', 19.50208, -71.77363, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-351', 42106, 'Dispensaire Savanne Longue', 'Dispensaire', 'Publique', 'Nord-Est', 'Ouanaminthe', 19.47755, -71.74866, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-352', 41301, 'Dispensaire de Perches', 'Dispensaire', 'Publique', 'Nord-Est', 'Perches', 19.52164, -71.92211, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-353', 43201, 'Dispensaire de Sainte Suzanne', 'Dispensaire', 'Publique', 'Nord-Est', 'Sainte-Suzanne', 19.58420, -72.08833, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-354', 43202, 'Dispensaire de Dupity', 'Dispensaire', 'Mixte', 'Nord-Est', 'Sainte-Suzanne', 19.47434, -72.04810, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-355', 43305, 'Clinique Esperance et Vie', 'CSL', 'Privé a but lucratif', 'Nord-Est', 'Terrier-Rouge', 19.64163, -71.95523, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-356', 43301, 'CSL de Terrier Rouge', 'CSL', 'Mixte', 'Nord-Est', 'Terrier-Rouge', 19.63695, -71.95341, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 2, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-357', 43306, 'Notre Dame de Lourde de Grand Bassin', 'CSL', 'Mixte', 'Nord-Est', 'Terrier-Rouge', 19.57444, -71.93706, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-358', 43303, 'Dispensaire de Pha�ton', 'Dispensaire', 'Publique', 'Nord-Est', 'Terrier-Rouge', 19.67646, -71.89529, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-359', 43304, 'Dispensaire de Danda', 'Dispensaire', 'Privé a but lucratif', 'Nord-Est', 'Terrier-Rouge', 19.55959, -71.88558, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-360', 43302, 'CSL Bethesda', 'CAL', 'Privé a but lucratif', 'Nord-Est', 'Terrier-Rouge', 19.57798, -71.94101, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-361', 43101, 'CDI de Trou du Nord', 'Hopital', 'Publique', 'Nord-Est', 'Trou-du-Nord', 19.61273, -72.02686, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-362', 43102, 'Dispensaire de Roche Plate', 'Dispensaire', 'Publique', 'Nord-Est', 'Trou-du-Nord', 19.55606, -71.97565, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-363', 43103, 'Dispensaire de Pilette', 'Dispensaire', 'Mixte', 'Nord-Est', 'Trou-du-Nord', 19.56572, -72.00915, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-364', 44101, 'Dispensaire de Valli�res', 'Dispensaire', 'Publique', 'Nord-Est', 'Valli�res', 19.43514, -71.92067, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-365', 44102, 'Dispensaire de Grosse Roche', 'Dispensaire', 'Publique', 'Nord-Est', 'Valli�res', 19.47525, -71.99829, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-366', 92202, 'Dity', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Anse-�-Foleur', 19.84550, -72.60903, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-367', 92203, 'C�tes de Fer - Mixte', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Anse-�-Foleur', 19.88315, -72.57926, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-368', 92201, 'Anse � Foleur', 'CAL', 'Publique', 'Nord-Ouest', 'Anse-�-Foleur', 19.89204, -72.61744, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-369', 92204, 'Dupont', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Anse-�-Foleur', 19.83775, -72.64099, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-370', 93201, 'Baie de Henne', 'CAL', 'Mixte', 'Nord-Ouest', 'Baie-de-Henne', 19.66428, -73.21074, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-371', 93202, 'La Source', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Baie-de-Henne', 19.72708, -73.15906, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1);
INSERT INTO spa VALUES ('CS-372', 93205, 'Cit�ne R�my', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Baie-de-Henne', 19.69300, -73.20000, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-373', 0, 'Centre de Santé de Bassin Hardy', 'CSL', 'Publique', 'Nord-Ouest', 'Baie-de-Henne', 19.70103, -73.14125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES ('CS-374', 93203, 'Pte Riv. Baie de Henne', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Baie-de-Henne', 19.72050, -73.17142, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-375', 93204, 'Dupr�', 'Dispensaire', 'Privé sans but lucratif', 'Nord-Ouest', 'Baie-de-Henne', 19.74918, -73.20883, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-376', 91301, 'Bon Samaritain 1', 'Hopital', 'Publique', 'Nord-Ouest', 'Bassin-Bleu', 19.78257, -72.79706, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-377', 91302, 'La Plate', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Bassin-Bleu', 19.81623, -72.76053, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES ('CS-378', 91303, 'Haut Moustique', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Bassin-Bleu', 19.74288, -72.87572, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-379', 93301, 'Bombardopolis', 'CAL', 'Publique', 'Nord-Ouest', 'Bombardopolis', 19.69281, -73.33598, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-380', 93302, 'Rochefort', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Bombardopolis', 19.70270, -73.37993, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 2, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-381', 93303, 'Mont des Oliviers', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Bombardopolis', 19.69476, -73.36817, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-382', 93306, 'Cr�ve', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Bombardopolis', 19.70608, -73.39393, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-383', 91401, 'Chansolme', 'CSL', 'Publique', 'Nord-Ouest', 'Chansolme', 19.87499, -72.83444, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-384', 93404, 'La Coma', 'Dispensaire', 'Privé a but lucratif', 'Nord-Ouest', 'Jean-Rabel', 19.88017, -73.07621, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-385', 93405, 'Guinaud�e', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.83061, -73.13338, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-386', 93407, 'Gombo', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.80086, -73.07792, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-387', 93411, 'K-Philippe', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'Jean-Rabel', 19.80324, -73.10826, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-388', 93412, 'Boucan Patriot', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.76476, -73.09442, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-389', 93413, 'Port � l�Ecu', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.90561, -73.04114, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-390', 93414, 'Caf� Paul', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.86006, -73.09784, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-391', 93415, 'La Bell�e', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.75480, -73.14942, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-392', 93416, 'Grann Lison', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'Jean-Rabel', 19.83772, -73.20543, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-393', 0, 'Dispensaire Cad�m�', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'Jean-Rabel', 19.83105, -73.18715, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-394', 0, 'Dispensaire Communautaire Grand Source', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.81668, -73.23826, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-395', 93401, 'N.D la Paix', 'Hopital de reference', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.85592, -73.19006, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-396', 93402, 'Bord de Mer', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.90580, -73.19544, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-397', 93410, 'Cabaret', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.87550, -73.01326, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-398', 93406, 'La R�serve', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'Jean-Rabel', 19.78979, -73.14919, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-399', 91201, 'Palmistes', 'Hopital de reference', 'Mixte', 'Nord-Ouest', 'La Tortue', 20.01943, -72.72596, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-400', 91203, 'La Vall�e', 'Dispensaire', 'Publique', 'Nord-Ouest', 'La Tortue', 20.03353, -72.86808, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-401', 91204, 'Mare Rouge 1', 'Dispensaire', 'Privé sans but lucratif', 'Nord-Ouest', 'La Tortue', 20.03243, -72.78558, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-402', 91206, 'Marie Curie', 'CAL', 'Mixte', 'Nord-Ouest', 'La Tortue', 20.04501, -72.84009, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-403', 0, 'Centre de Santé Harry Bordes', 'CSL', 'Privé a but lucratif', 'Nord-Ouest', 'La Tortue', 20.02508, -72.75292, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-404', 91202, 'Haut Plaine', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'La Tortue', 20.00576, -72.66437, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-405', 91205, 'Montry', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'La Tortue', 20.03976, -72.82970, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-406', 93103, 'Sentrain', 'Dispensaire', 'Publique', 'Nord-Ouest', 'M�le St Nicolas', 19.81372, -73.26794, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-407', 93106, 'Dame Marie', 'Dispensaire', 'Publique', 'Nord-Ouest', 'M�le St Nicolas', 19.82485, -73.29106, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-408', 93101, 'M�le Saint Nicolas', 'CSL', 'Publique', 'Nord-Ouest', 'M�le St Nicolas', 19.80370, -73.37490, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-409', 91101, 'Trois Rivi�res', 'CSL', 'Privé a but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.93629, -72.84225, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-410', 91106, 'Beauchamp', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.80760, -72.98233, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-411', 91108, 'Caluc', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.75222, -72.93096, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-412', 91110, 'Pilette', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.77217, -72.95738, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-413', 91112, 'Fatima Chalet', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.94529, -72.82095, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-414', 91113, 'La Croix St Joseph', 'CAL', 'Mixte', 'Nord-Ouest', 'Port-de-Paix', 19.90543, -72.79300, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-415', 91116, 'Ant�ne Santé', 'CSL', 'Mixte', 'Nord-Ouest', 'Port-de-Paix', 19.93780, -72.83436, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-416', 91117, 'Dolcin�', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.92445, -72.77424, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-417', 91120, 'Fosref Lakay', 'CSL', 'Privé sans but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.93423, -72.84577, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-418', 0, 'Centre M�dical de Passe Catabois', 'Hopital', 'Privé a but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.83129, -72.94053, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-419', 0, 'Dispensaire D�cide', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.91995, -72.85216, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-420', 0, 'Dispensaire de Desmarreaux', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.89471, -72.85016, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-421', 91100, 'Immacul�e Conception', 'Hopital Departemental', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.93565, -72.83195, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-422', 91114, 'Beraca', 'Hopital', 'Privé sans but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.94432, -72.77466, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-423', 91119, 'Fosref Jeune', 'CSL', 'Privé sans but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.94494, -72.82548, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-424', 91103, 'Poste M�tier', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.88581, -72.92207, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-425', 91104, 'Baie des Moustiques', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.90327, -72.96221, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-426', 91105, 'Passe Catabois', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.82222, -72.93935, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-427', 91115, 'Dispensaire Monfort', 'Dispensaire', 'Privé sans but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.94029, -72.83853, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-428', 91109, 'Soleil', 'Dispensaire', 'Privé a but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.94615, -72.82352, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-429', 91111, 'Fatima la Coupe', 'Dispensaire', 'Privé a but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.92877, -72.82347, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-430', 92102, 'St Louis du Nord', 'Hopital de reference', 'Publique', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.93447, -72.73036, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-431', 92105, 'Chamoise', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.82846, -72.68710, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-432', 92106, 'Glacis', 'Dispensaire', 'Privé sans but lucratif', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.84947, -72.71323, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-433', 92108, 'Jean Clair', 'Dispensaire', 'Privé sans but lucratif', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.84748, -72.68823, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-434', 92112, 'Zabricot', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.91187, -72.69759, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-435', 0, 'Centre de Santé Medi care', 'CAL', 'Privé a but lucratif', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.93479, -72.72503, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-436', 92101, 'Bonneau', 'CAL', 'Mixte', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.90597, -72.65535, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-437', 92103, 'NWCM', 'CSL', 'Privé a but lucratif', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.93153, -72.72046, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-438', 92104, 'Desgranges', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.92484, -72.70784, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-439', 92109, 'Gaspard', 'Dispensaire', 'Privé sans but lucratif', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.87079, -72.68340, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-440', 92110, 'Chaineau', 'Dispensaire', 'Privé sans but lucratif', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.88481, -72.67364, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-441', 92113, 'Guichard', 'Dispensaire', 'Privé sans but lucratif', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.91855, -72.74767, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-442', 92107, 'La Perri�re', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.87219, -72.73672, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-443', 15104, 'Dispensaire Marsucrin', 'Dispensaire', 'Privé a but lucratif', 'Ouest', 'Anse � Galets', 18.78775, -72.94595, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-444', 15102, 'Dispensaire Bill-Rice', 'CAL', 'Mixte', 'Ouest', 'Anse-�-Galets', 18.78885, -72.84650, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-445', 15103, 'H�pital Wesleyen', 'Hopital de reference', 'Mixte', 'Ouest', 'Anse-�-Galets', 18.83388, -72.86237, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-446', 15105, 'Dispensaire Grande Source', 'CSL', 'Mixte', 'Ouest', 'Anse-�-Galets', 18.82170, -72.95690, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-447', 15106, 'Clinico Pharma amis des Enfants', 'CSL', 'Mixte', 'Ouest', 'Anse-�-Galets', 18.83505, -72.87515, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-448', 15107, 'Dispensaire Trou Louis Jeune', 'Dispensaire', 'Mixte', 'Ouest', 'Anse-�-Galets', 18.89877, -73.03951, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-449', 15108, 'Clinque Bon Samaritain', 'CSL', 'Publique', 'Ouest', 'Anse-�-Galets', 18.78135, -72.96380, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-450', 0, 'Maison M�dicale JESHUA', 'CAL', 'Privé a but lucratif', 'Ouest', 'Anse-�-Galets', 18.83316, -72.86387, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-451', 0, 'Clinique Fils Brillant', 'Dispensaire', 'Privé sans but lucratif', 'Ouest', 'Anse-�-Galets', 18.83474, -72.87734, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-452', 0, 'Dispensaire Stronght Health Clinic', 'Dispensaire', 'Publique', 'Ouest', 'Anse-�-Galets', 18.80807, -72.98143, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-453', 14103, 'SADA Fonds Baptiste', 'CSL', 'Mixte', 'Ouest', 'Arcahaie', 18.92443, -72.58689, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-454', 14105, 'Dispensaire Notre Dame du Perp�tuel Secours', 'Dispensaire', 'Publique', 'Ouest', 'Arcahaie', 18.81974, -72.56668, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-455', 14110, 'H�pital Reforme de Saintard', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Arcahaie', 18.82992, -72.54969, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-456', 14113, 'Carrefour Poy', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Arcahaie', 18.79614, -72.50946, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-457', 0, 'Centre de Santé Communautaire Williamson', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Arcahaie', 18.84453, -72.57597, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-458', 14109, 'Centre de Santé Bon Samaritain', 'Dispensaire', 'Privé a but lucratif', 'Ouest', 'Arcahaie', 18.83624, -72.57194, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-459', 14114, 'Clinique Laguerre', 'Dispensaire', 'Privé a but lucratif', 'Ouest', 'Arcahaie', 18.83418, -72.57029, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-460', 0, 'Mission Matana', 'CSL', 'Publique', 'Ouest', 'Arcahaie', 18.81345, -72.50158, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-461', 14113, 'Centre de Santé Carrefour Pois', 'CSL', 'Privé a but lucratif', 'Ouest', 'Arcahaie', 18.79559, -72.50749, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-462', 14101, 'Nicolas Armand', 'Hopital de reference', 'Publique', 'Ouest', 'Arcahaie', 18.77158, -72.51314, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-463', 14104, 'SADA   Matheux', 'CAL', 'Privé sans but lucratif', 'Ouest', 'Arcahaie', 18.82085, -72.53924, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-464', 14111, 'Centre de Santé de Rousseau', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Arcahaie', 18.94213, -72.70010, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-465', 14112, 'SADA-AME/Delices', 'Dispensaire', 'Privé sans but lucratif', 'Ouest', 'Arcahaie', 18.90646, -72.46419, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-466', 14201, 'CSL de source matelas (SADA)', 'CSL', 'Privé a but lucratif', 'Ouest', 'Cabaret', 18.72131, -72.37375, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-467', 14205, 'Centre de Santé St Antoine de Titanyen', 'CSL', 'Privé a but lucratif', 'Ouest', 'Cabaret', 18.71186, -72.34477, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-468', 14207, 'C/S St Gerard', 'CAL', 'Mixte', 'Ouest', 'Cabaret', 18.71370, -72.37737, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-469', 14209, 'Centre de Santé Mission de l''espoir', 'CSL', 'Mixte', 'Ouest', 'Cabaret', 18.71465, -72.35581, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-470', 0, 'Centre Hospitalier Veramed', 'CSL', 'Privé a but lucratif', 'Ouest', 'Cabaret', 18.73370, -72.40379, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-471', 14211, 'Centre de Santé du Bon samaritain', 'CSL', 'Privé a but lucratif', 'Ouest', 'Cabaret', 18.79677, -72.38630, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-472', 14210, 'Centre hospitalier de l''universite Academiqu', 'CAL', 'Privé sans but lucratif', 'Ouest', 'Cabaret', 18.70095, -72.34061, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-473', 14202, 'CSL de Cabaret', 'CSL', 'Publique', 'Ouest', 'Cabaret', 18.73618, -72.41901, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-474', 14204, 'CSL de B�langer (SADA)', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Cabaret', 18.73234, -72.44175, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-475', 11138, 'Centre de Santé Bethesda', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Carrefour', 18.52386, -72.36945, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-476', 0, 'Clinique pr� et post natale', 'CSL', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.53305, -72.41243, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-477', 11304, 'Centre m�dico social de rivi�re froide', 'CSL', 'Mixte', 'Ouest', 'Carrefour', 18.51828, -72.41267, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-478', 11305, 'C/S B�thel Mahoti�re 81', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Carrefour', 18.53637, -72.40508, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-479', 11308, 'Dispensaire la Main Tendue de Bertin', 'CSL', 'Mixte', 'Ouest', 'Carrefour', 18.52863, -72.41222, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-480', 11315, 'Dispensaire ASCOSADEC', 'CSL', 'Mixte', 'Ouest', 'Carrefour', 18.52511, -72.40586, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-481', 11317, 'C/S OMES', 'CSL', 'Mixte', 'Ouest', 'Carrefour', 18.53240, -72.38871, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-482', 11318, 'C/S M�re T�r�sa', 'CAL', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.53794, -72.40318, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-483', 11320, 'Centre de la communaut� des Fr�res Unis (NF)', 'CAL', 'Mixte', 'Ouest', 'Carrefour', 18.54188, -72.40615, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-486', 11327, 'Clinique Mennomite', 'CSL', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.54184, -72.39832, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-487', 0, 'Centre de Santé Tikajou', 'CSL', 'Publique', 'Ouest', 'Carrefour', 18.52583, -72.39899, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 2, 1, 0, 1, 2, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-488', 0, 'Centre de Santé de Malanga', 'CSL', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.41456, -72.40655, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-489', 0, 'Centre de Santé Laval', 'Dispensaire', 'Publique', 'Ouest', 'Carrefour', 18.44122, -72.41455, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-490', 0, 'Centre Hospitalier de Carrefour', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.53324, -72.38543, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-491', 0, 'Centre de Santé Shekinah', 'CSL', 'Publique', 'Ouest', 'Carrefour', 18.52658, -72.40120, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-492', 0, 'Centre de Santé Midha', 'CSL', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.53188, -72.41507, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-493', 0, 'Centre de Santé M�dical', 'CSL', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.55061, -72.40534, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-494', 0, 'Centre de Santé Procy Chauffard', 'CSL', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.47748, -72.38964, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-495', 0, 'Centre de Santé Bethesda', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Carrefour', 18.52903, -72.41161, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-496', 0, 'Centre de Santé de Chauffard', 'Dispensaire', 'Privé sans but lucratif', 'Ouest', 'Carrefour', 18.53213, -72.38887, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-497', 0, 'Centre FOSREF', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Carrefour', 18.44578, -72.38038, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-498', 0, 'Hop a live clinic', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Carrefour', 18.54033, -72.45354, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-499', 0, 'Centre de Santé Moula', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Carrefour', 18.53481, -72.42601, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-500', 0, 'Centre m�dical de Paloma', 'CAL', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.54065, -72.42166, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-501', 11306, 'H�pital Adventiste d''Haiti (HAH)', 'Hopital universitaire', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.53146, -72.38675, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-502', 11303, 'H�pital de carrefour', 'Hopital de reference', 'Publique', 'Ouest', 'Carrefour', 18.53783, -72.40755, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-503', 11301, 'C/S Fondeph Bizoton 61', 'CAL', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.53266, -72.38508, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-504', 11313, 'Centre de Santé B�thel (Christophe Channel)', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Carrefour', 18.54795, -72.41958, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-505', 11319, 'Centre de Santé Hands of Love', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Carrefour', 18.53166, -72.37529, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-506', 11309, 'CSL OBCG', 'CSL', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.53765, -72.40946, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-507', 11326, 'Centre Medical de  Bertin', 'CSL', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.53030, -72.41409, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-508', 11334, 'C/S Haiti  Saint Rock Foundation', 'CSL', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.51238, -72.39722, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-509', 11330, 'Centre de Santé Berekia', 'CSL', 'Privé a but lucratif', 'Ouest', 'Carrefour', 18.53077, -72.39962, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-510', 11314, 'Centre de Santé Multi fonctionnel  sous-rail', 'CSL', 'Mixte', 'Ouest', 'Carrefour', 18.54789, -72.40011, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-511', 11311, 'Dispensaire de Taillefer', 'Dispensaire', 'Publique', 'Ouest', 'Carrefour', 18.48136, -72.41361, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-512', 11321, 'Dispensaire Marie Louise de J�sus', 'Dispensaire', 'Privé sans but lucratif', 'Ouest', 'Carrefour', 18.53740, -72.42022, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-513', 11217, 'H�pital Isa�e Jeanty', 'Hopital universitaire', 'Publique', 'Ouest', 'Cit�-Soleil', 18.56426, -72.33540, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-514', 11230, 'CHAPI', 'CSL', 'Publique', 'Ouest', 'Cit�-Soleil', 18.57397, -72.32857, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-515', 11231, 'C/S Fontaine', 'CAL', 'Privé sans but lucratif', 'Ouest', 'Cit�-Soleil', 18.59636, -72.32747, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-516', 11232, 'Centre m�dical & de nutrition Rosalie Rendu', 'CAL', 'Privé sans but lucratif', 'Ouest', 'Cit�-Soleil', 18.57776, -72.33781, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-517', 0, 'Clinique centrale de l''�glise', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Cit�-Soleil', 18.58038, -72.32894, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-518', 0, 'Centre de Santé Familial', 'CSL', 'Privé a but lucratif', 'Ouest', 'Cit�-Soleil', 18.59560, -72.31479, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-519', 0, 'MSF Drouillard', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Cit�-Soleil', 18.59068, -72.31917, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-520', 0, 'Centre de Santé Fondation st Luc', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Cit�-Soleil', 18.56646, -72.34947, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-521', 0, 'H�pital ste Marie', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Cit�-Soleil', 18.58331, -72.33833, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-522', 0, 'Centre de Santé Lumi�re', 'CAL', 'Privé a but lucratif', 'Ouest', 'Cit�-Soleil', 18.58588, -72.31183, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-523', 0, 'CEMEPIO', 'CAL', 'Privé sans but lucratif', 'Ouest', 'Cit�-Soleil', 18.59496, -72.31188, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-524', 11229, 'CHOSCAL', 'Hopital', 'Publique', 'Ouest', 'Cit�-Soleil', 18.57810, -72.33685, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-525', 13401, 'Dispensaire de conillon', 'CSL', 'Publique', 'Ouest', 'Cornillon', 18.67546, -71.95142, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-526', 13403, 'Centre de Santé St Vincent de Paul', 'CAL', 'Privé sans but lucratif', 'Ouest', 'Cornillon', 18.65412, -71.87071, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-527', 13402, 'Dispensaire de Saint Pierre', 'Dispensaire', 'Publique', 'Ouest', 'Cornillon', 18.66335, -71.86005, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-528', 13105, 'Help Incorporate de Vaudreuil', 'CSL', 'Privé a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.58782, -72.17622, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-529', 13101, 'Dispensaire de Bas Bo�n', 'Dispensaire', 'Publique', 'Ouest', 'Croix-des-Bouquets', 18.56679, -72.15134, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-530', 13104, 'Centre de Santé de Double Harvest', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.54266, -72.19247, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-531', 13109, 'Centre de Santé Foyer Ste Camille', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.61527, -72.28800, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1);
INSERT INTO spa VALUES ('CS-532', 13119, 'Fwaye Ti zanmi Jezi', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.61518, -72.24630, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 2, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-533', 13120, 'Dispensaire Marie Louise de J�sus - Mixte', 'Dispensaire', 'Privé sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.59827, -72.23966, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-534', 13122, 'Ebenezer Jumecaut', 'CAL', 'Privé a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.56559, -72.18326, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-535', 13123, 'Les Palmes', 'CSL', 'Mixte', 'Ouest', 'Croix-des-Bouquets', 18.60390, -72.26851, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-536', 13125, 'COSECO', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.58268, -72.23314, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1);
INSERT INTO spa VALUES ('CS-537', 13127, 'Shalom Clinique Medicale', 'CAL', 'Privé a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.58177, -72.22136, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-538', 13128, 'Sodeth Clinique Hospitaliere', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.59266, -72.23909, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-539', 13130, 'Mission Gospel d''Haiti', 'CSL', 'Mixte', 'Ouest', 'Croix-des-Bouquets', 18.62283, -72.21135, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-540', 13107, 'Centre de Santé de Turbe', 'CAL', 'Mixte', 'Ouest', 'Croix-des-Bouquets', 18.53600, -72.16661, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-541', 0, 'Centre de Santé Bon secours', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.63460, -72.26206, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-542', 0, 'Centre Hospitalier de Santo', 'CAL', 'Privé a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.58821, -72.24675, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-543', 13108, 'Centre de Santé Ste Th�r�se de Santo', 'CSL', 'Publique', 'Ouest', 'Croix-des-Bouquets', 18.59735, -72.25633, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-544', 0, 'Centre de Santé Bonk�', 'CSL', 'Publique', 'Ouest', 'Croix-des-Bouquets', 18.61198, -72.24088, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-545', 0, 'Centre Hospitalier communautaire Lilavois', 'CAL', 'Privé a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.63340, -72.25396, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-546', 0, 'Clinique Pofamil', 'CSL', 'Mixte', 'Ouest', 'Croix-des-Bouquets', 18.58151, -72.22539, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-547', 0, 'Centre d''attention Primaire', 'Dispensaire', 'Privé a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.55539, -72.18370, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-548', 0, 'Clinique J�sus le vrai chemin', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.65406, -72.28250, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-549', 0, 'Centre Hospitalier de Canaan', 'CAL', 'Privé a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.65042, -72.27113, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-550', 13131, 'H�pital ital cubain', 'Hopital', 'Publique', 'Ouest', 'Croix-des-Bouquets', 18.57029, -72.21191, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-551', 13102, 'H�pital D�fil� de Beudet', 'Hopital', 'Publique', 'Ouest', 'Croix-des-Bouquets', 18.61174, -72.21275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-552', 13103, 'Centre  de Santé de la Croix-des-Bouquets', 'CAL', 'Publique', 'Ouest', 'Croix-des-Bouquets', 18.57569, -72.22692, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-553', 13111, 'Centre de Santé Life Line', 'CAL', 'Privé a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.58251, -72.22219, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-554', 13129, 'Piscine de Bethesda', 'CAL', 'Privé a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.61445, -72.21321, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-555', 13106, 'Centre de Santé Lucelia Bontemps', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.61250, -72.31007, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-775', 71106, 'Quatre Chemins', 'CSL', 'Publique', 'Sud', 'Cayes', 18.20088, -73.75373, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-556', 13110, 'C/S Kampech Dumay', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.51668, -72.20282, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-557', 13115, 'FBSA/CMS (Fondation Bon samaritain en Action', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.62108, -72.27889, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-558', 13117, 'Clinique mennonite', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.58068, -72.22981, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-559', 13118, 'Clinique St EsPrivét', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.60949, -72.24034, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-560', 13126, 'CEPRENULET', 'CSL', 'Mixte', 'Ouest', 'Croix-des-Bouquets', 18.57223, -72.22107, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-561', 11202, 'C/S Bas Fd Philom�ne Delmas 32', 'CAL', 'Privé a but lucratif', 'Ouest', 'Delmas', 18.54707, -72.31259, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-562', 11205, 'Citymed de Delmas', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Delmas', 18.55690, -72.30665, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-563', 11208, 'H�pital Grace Children', 'Hopital', 'Mixte', 'Ouest', 'Delmas', 18.55987, -72.30203, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-564', 11223, 'H�pital de l''OFATMA', 'Hopital', 'Publique', 'Ouest', 'Delmas', 18.56671, -72.32513, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-565', 11224, 'Centre de Santé de Petite Place Cazeau', 'CSL', 'Publique', 'Ouest', 'Delmas', 18.56466, -72.28236, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-566', 11227, 'Centre de Santé St Paul', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Delmas', 18.54383, -72.30578, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-567', 11228, 'Bernard Mews', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Delmas', 18.56195, -72.31901, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-568', 11225, 'Centre de Santé St Martin 1', 'CSL', 'Publique', 'Ouest', 'Delmas', 18.55793, -72.32331, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-569', 11238, 'Clinique Communautaire Barthelmie', 'CSL', 'Privé a but lucratif', 'Ouest', 'Delmas', 18.55281, -72.32904, 1, 1, 1, 1, 1, 0, 2, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-570', 0, 'Maison la Santé Delmas', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Delmas', 18.54286, -72.30843, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-571', 0, 'Clinique Santé pour tous', 'CSL', 'Privé a but lucratif', 'Ouest', 'Delmas', 18.52408, -72.28443, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-572', 11244, 'Peace Hospital', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Delmas', 18.55362, -72.27596, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-573', 0, 'Clinique St Jude', 'CSL', 'Privé a but lucratif', 'Ouest', 'Delmas', 18.56674, -72.29472, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-574', 0, 'Rapha clinique m�dicale', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Delmas', 18.56215, -72.32201, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-575', 0, 'MSF Hollande', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Delmas', 18.55533, -72.29989, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-576', 11206, 'H�pital de Delmas 33', 'Hopital universitaire', 'Publique', 'Ouest', 'Delmas', 18.55645, -72.29836, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-577', 11212, 'H�pital Jude Anne (DASH)', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Delmas', 18.55659, -72.32526, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-578', 11243, 'H�pital Medicaire', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Delmas', 18.56700, -72.29389, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-579', 11211, 'H�pital Dash Delmas 48', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Delmas', 18.53947, -72.29573, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-580', 11209, 'H�pital Espoir', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Delmas', 18.54151, -72.27851, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-581', 11216, 'Fondeph', 'CAL', 'Privé sans but lucratif', 'Ouest', 'Delmas', 18.54602, -72.28937, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-582', 11239, 'Centre de Sante Dieu qui donne', 'CAL', 'Privé a but lucratif', 'Ouest', 'Delmas', 18.56703, -72.29501, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-583', 11214, 'CPFO', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Delmas', 18.57547, -72.30878, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-584', 11218, 'Haiti Med (Siclair)', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Delmas', 18.56399, -72.30797, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-585', 11246, 'Food for the poor', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Delmas', 18.56584, -72.30549, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-586', 11247, 'FOSREF', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Delmas', 18.54861, -72.30616, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-587', 13501, 'C/S de Fonds Verrettes', 'CAL', 'Publique', 'Ouest', 'Fonds-Verrettes', 18.39394, -71.85402, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-588', 13503, 'Dispensaire d�Orianie', 'Dispensaire', 'Privé a but lucratif', 'Ouest', 'Fonds-Verrettes', 18.30606, -71.83239, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-589', 13504, 'Clinique Confiance en Dieu', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Fonds-Verrettes', 18.30772, -71.83222, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 2, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-590', 0, 'Dispensaire Ste Croix', 'Dispensaire', 'Privé sans but lucratif', 'Ouest', 'Fonds-Verrettes', 18.39399, -71.85692, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-591', 13302, 'Centre de Santé de Ganthier', 'CSL', 'Publique', 'Ouest', 'Ganthier', 18.53210, -72.06202, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-592', 13306, 'Eau de vie', 'CSL', 'Privé a but lucratif', 'Ouest', 'Ganthier', 18.49209, -71.95186, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-593', 13307, 'Centre de Santé de Thoman 1', 'CSL', 'Publique', 'Ouest', 'Ganthier', 18.45141, -71.94179, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-594', 13313, 'Centre Hospitalier Christ pour tous', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Ganthier', 18.49981, -71.96147, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-595', 0, 'Centre de Santé Kay Hypocrate', 'CAL', 'Privé sans but lucratif', 'Ouest', 'Ganthier', 18.56659, -72.06616, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-596', 13305, 'Love  a child', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Ganthier', 18.52094, -71.98214, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-597', 13308, 'centre de Santé  de Thoman 2', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Ganthier', 18.44549, -71.92901, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-598', 13303, 'Dispensaire de Savane cabri', 'Dispensaire', 'Privé sans but lucratif', 'Ouest', 'Ganthier', 18.58640, -72.07810, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-599', 13310, 'Dispensaire aux bons soins', 'Dispensaire', 'Privé a but lucratif', 'Ouest', 'Ganthier', 18.58669, -72.07822, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-600', 12301, 'Centre de Santé Georges Gauvin', 'Hopital de reference', 'Publique', 'Ouest', 'Grand-Go�ve', 18.42727, -72.77119, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-601', 12305, 'Dispensaire Baudin', 'Dispensaire', 'Publique', 'Ouest', 'Grand-Go�ve', 18.31337, -72.70823, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-602', 12302, 'Centre de Santé de Meyer', 'CAL', 'Publique', 'Ouest', 'Grand-Go�ve', 18.34102, -72.70818, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-603', 12303, 'Dispensaire de Dufour', 'Dispensaire', 'Publique', 'Ouest', 'Grand-Go�ve', 18.32132, -72.80486, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-604', 12304, 'Dispensaire de Bonhomme', 'Dispensaire', 'Publique', 'Ouest', 'Grand-Go�ve', 18.38280, -72.74585, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-605', 11602, 'Centre de Santé de Christianville', 'CSL', 'Privé a but lucratif', 'Ouest', 'Gressier', 18.52424, -72.55425, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-606', 11603, 'Centre de Santé FOSADEC', 'CAL', 'Privé a but lucratif', 'Ouest', 'Gressier', 18.53935, -72.49892, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-607', 11607, 'Centre de Santé de Gressier', 'CAL', 'Publique', 'Ouest', 'Gressier', 18.54203, -72.52954, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-608', 0, 'Dispensaire de Jasmin', 'Dispensaire', 'Privé sans but lucratif', 'Ouest', 'Gressier', 18.51275, -72.51075, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-609', 0, 'Dispensaire Solo Christus', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Gressier', 18.49611, -72.53518, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-610', 11614, 'Haiti Health Ministries', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Gressier', 18.52062, -72.55010, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-611', 11610, 'Centre de Santé Haute Sanite (NF)', 'CSL', 'Privé a but lucratif', 'Ouest', 'Gressier', 18.53238, -72.46776, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-612', 11601, 'Dispensaire Bon Berger', 'Dispensaire', 'Privé a but lucratif', 'Ouest', 'Gressier', 18.54288, -72.52442, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-613', 11501, 'Centre de Santé de Kenscoff', 'CSL', 'Publique', 'Ouest', 'Kenscoff', 18.44869, -72.28505, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-614', 11505, 'Dispensaire de Robin (mission baptiste)', 'Dispensaire', 'Mixte', 'Ouest', 'Kenscoff', 18.43373, -72.26151, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-615', 11509, 'Dispensaire Godey (Af� n�g kombit)', 'Dispensaire', 'Publique', 'Ouest', 'Kenscoff', 18.44756, -72.30594, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-616', 11503, 'H�pital de Fermathe (mission baptiste)', 'Hopital', 'Mixte', 'Ouest', 'Kenscoff', 18.46289, -72.28891, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-617', 11507, 'Dispensaire. Notre Dame Perp�tuel Secours (F', 'Dispensaire', 'Privé sans but lucratif', 'Ouest', 'Kenscoff', 18.41810, -72.30489, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-618', 11502, 'Dispensaire de Bolosse (mission baptiste)', 'Dispensaire', 'Privé a but lucratif', 'Ouest', 'Kenscoff', 18.44134, -72.34620, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-619', 12106, 'Sanatorium de L�ogane', 'Hopital', 'Publique', 'Ouest', 'L�og�ne', 18.51277, -72.60650, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-620', 12115, 'Help Hospital', 'Hopital', 'Privé a but lucratif', 'Ouest', 'L�og�ne', 18.50621, -72.62129, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-621', 12111, 'Dispensaire de Trouin', 'CAL', 'Publique', 'Ouest', 'L�og�ne', 18.36525, -72.65339, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-622', 12120, 'Centre hospitalier Hosana', 'CAL', 'Privé a but lucratif', 'Ouest', 'L�og�ne', 18.51643, -72.63278, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-623', 12105, 'Centre materno-infantile', 'CSL', 'Publique', 'Ouest', 'L�og�ne', 18.50615, -72.62929, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-624', 12110, 'Dispensaire de Fonds d''oie', 'Dispensaire', 'Privé a but lucratif', 'Ouest', 'L�og�ne', 18.38871, -72.58448, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-625', 12101, 'Dispensaire de Beaus�jour', 'Dispensaire', 'Mixte', 'Ouest', 'L�og�ne', 18.42116, -72.50642, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-626', 12102, 'Centre de Santé Darbonne', 'CAL', 'Privé sans but lucratif', 'Ouest', 'L�og�ne', 18.49248, -72.58982, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-627', 12103, 'C/S Farn�se Louis Charles de Palmiste a vin', 'CSL', 'Privé a but lucratif', 'Ouest', 'L�og�ne', 18.42670, -72.64300, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-628', 12104, 'H�pital Cardinal L�ger', 'Hopital de reference', 'Privé a but lucratif', 'Ouest', 'L�og�ne', 18.51350, -72.60971, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-629', 12107, 'Asile de Sigueneau', 'Hopital universitaire', 'Publique', 'Ouest', 'L�og�ne', 18.51371, -72.60809, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-630', 12108, 'H�pital Sainte-Croix', 'Hopital de reference', 'Publique', 'Ouest', 'L�og�ne', 18.50743, -72.63128, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-631', 12109, 'Bir� (new mission)', 'CSL', 'Privé sans but lucratif', 'Ouest', 'L�og�ne', 18.54223, -72.57917, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-632', 12112, 'Centre petit Harpon', 'CSL', 'Privé a but lucratif', 'Ouest', 'L�og�ne', 18.37169, -72.62380, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-633', 12113, 'Centre de Santé Marie Jean', 'CSL', 'Mixte', 'Ouest', 'L�og�ne', 18.51700, -72.63773, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-634', 12117, 'HCMC', 'CSL', 'Privé a but lucratif', 'Ouest', 'L�og�ne', 18.46210, -72.63912, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-635', 12119, 'CS de St Etienne', 'CSL', 'Mixte', 'Ouest', 'L�og�ne', 18.39757, -72.63473, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-636', 12121, 'C/S Mathieu', 'CSL', 'Mixte', 'Ouest', 'L�og�ne', 18.50387, -72.58441, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 2, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-637', 0, 'MSF Suisse', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'L�og�ne', 18.50875, -72.62406, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-638', 0, 'Dispensaire Tombe Gateau', 'Dispensaire', 'Privé a but lucratif', 'Ouest', 'L�og�ne', 18.37549, -72.58781, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-639', 0, 'Centre Santé Lassale.', 'CSL', 'Mixte', 'Ouest', 'L�og�ne', 18.54824, -72.57624, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-640', 0, 'Centre de Santé Fondation Racine', 'CSL', 'Privé sans but lucratif', 'Ouest', 'L�og�ne', 18.54019, -72.61938, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-641', 11405, 'H�pital Eliazar Germain', 'Hopital de reference', 'Publique', 'Ouest', 'P�tion-Ville', 18.51707, -72.28868, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-642', 11404, 'H�pital de la communaut� ha�tienne', 'Hopital de reference', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.52405, -72.27233, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-643', 11428, 'DASH(H�pital ital St Landry)', 'Hopital', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.51573, -72.29165, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-644', 11415, 'C/S de Pernier', 'CSL', 'Publique', 'Ouest', 'P�tion-Ville', 18.52354, -72.22662, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-645', 11417, 'Centre Medico social de Thomassin 25', 'CSL', 'Publique', 'Ouest', 'P�tion-Ville', 18.48591, -72.31290, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-646', 11401, 'Centre de Santé calebasse', 'CSL', 'Mixte', 'Ouest', 'P�tion-Ville', 18.46317, -72.26330, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-647', 11423, 'Dispensairede Diegue', 'Dispensaire', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.50791, -72.26691, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-648', 11402, 'Citymed de P�tion ville', 'Hopital', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.51351, -72.28588, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-649', 11403, 'Centre de Santé Monsanto Petit', 'CSL', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.49839, -72.31930, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-650', 11407, 'H�pital CensH�pital', 'Hopital', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.51861, -72.23702, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-651', 11422, 'Centre de Santé philantropique de dupont', 'CSL', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.51019, -72.27264, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-652', 11427, 'Mon Santo Petit Jalousie', 'CSL', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.50946, -72.29165, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-653', 0, 'GREFAJUR', 'CSL', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.51126, -72.27306, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-654', 0, 'Clinique m�dicale de soins communautaires', 'CSL', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.50882, -72.29053, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-655', 11414, 'Centre de Santé Notre dame du cap', 'CSL', 'Mixte', 'Ouest', 'P�tion-Ville', 18.51103, -72.28485, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-656', 0, 'Clinimed', 'CSL', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.51483, -72.26736, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-657', 0, 'Clinique Santé pour tous', 'CSL', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.51658, -72.28734, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-658', 11428, 'DASH P�tion Ville (H�pital St Landry)', 'Hopital', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.51183, -72.28534, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-659', 0, 'Centre de Santé Repheka Pernier', 'CSL', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.51888, -72.23596, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-660', 11511, 'Dispensaire aux cadets (Af� n�g kombit)', 'Dispensaire', 'Privé a but lucratif', 'Ouest', 'P�tion-Ville', 18.45179, -72.20232, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-661', 12201, 'H�pital Notre Dame', 'Hopital de reference', 'Publique', 'Ouest', 'Petit-Go�ve', 18.43428, -72.86490, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-662', 12208, 'Centre de Santé Henry G�rard Desgranges', 'CAL', 'Privé a but lucratif', 'Ouest', 'Petit-Go�ve', 18.41782, -72.88120, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-663', 12202, 'Dispensaire de Vialet', 'CSL', 'Publique', 'Ouest', 'Petit-Go�ve', 18.42101, -72.93085, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-664', 12205, 'Centre de Santé Les Palmes (Besace)', 'CSL', 'Privé a but lucratif', 'Ouest', 'Petit-Go�ve', 18.31218, -72.86790, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-665', 12207, 'Clinique mobile Olivier', 'CSL', 'Privé a but lucratif', 'Ouest', 'Petit-Go�ve', 18.42189, -73.03749, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-666', 12212, 'Clinique Silo�', 'CSL', 'Privé a but lucratif', 'Ouest', 'Petit-Go�ve', 18.43227, -72.86902, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-667', 12203, 'Dispensaire de Madeleine', 'Dispensaire', 'Publique', 'Ouest', 'Petit-Go�ve', 18.42101, -73.00174, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-668', 12209, 'Dispensaire APV de Vallue (NF)', 'Dispensaire', 'Privé sans but lucratif', 'Ouest', 'Petit-Go�ve', 18.39218, -72.82203, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-669', 12204, 'Dispensaire de Arnoux', 'CSL', 'Publique', 'Ouest', 'Petit-Go�ve', 18.39377, -73.02033, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-670', 12206, 'Centre de Santé de Delattre', 'CSL', 'Mixte', 'Ouest', 'Petit-Go�ve', 18.30721, -72.94668, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-671', 15202, 'Dispensaire de tamarin', 'Dispensaire', 'Privé sans but lucratif', 'Ouest', 'Pointe-�-Raquet', 18.90705, -73.20189, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-672', 15205, 'Dispensaire Saint-Louis', 'CAL', 'Mixte', 'Ouest', 'Pointe-�-Raquet', 18.78553, -73.06343, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-673', 0, 'Dispensaire de Source � Philippe', 'Dispensaire', 'Mixte', 'Ouest', 'Pointe-�-Raquet', 18.81935, -73.12273, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-674', 15204, 'Centre World Vision  ti palmiste', 'CAL', 'Privé sans but lucratif', 'Ouest', 'Pointe-�-Raquette', 18.83838, -73.05195, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-675', 11107, 'Centre de Santé Snelak', 'Dispensaire', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.52382, -72.34883, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-676', 11116, 'Centre de psychiatrie Mars & Kline', 'Hopital de reference', 'Publique', 'Ouest', 'Port-au-Prince', 18.53757, -72.34108, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-677', 11118, 'H�pital St. Fran�ois de Salle', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.53844, -72.34366, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-678', 11119, 'CSL SODEC', 'CAL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.53390, -72.32434, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-679', 11120, 'PROFAMIL 2', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53496, -72.32405, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-680', 11131, 'CMS/FHSM (Centre m�dico-social/FHSM)', 'CSL', 'Publique', 'Ouest', 'Port-au-Prince', 18.52926, -72.35565, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-681', 11132, 'Centre de Santé Martissant', 'CAL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.53360, -72.35338, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-682', 11133, 'Centre de Santé Caravelle', 'CSL', 'Mixte', 'Ouest', 'Port-au-Prince', 18.54667, -72.32307, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-683', 11142, 'H�pital Sapiens', 'CAL', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53574, -72.33351, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-684', 11150, 'CEMEAH', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.52550, -72.33495, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-685', 11151, 'C/S de St Jude', 'CSL', 'Mixte', 'Ouest', 'Port-au-Prince', 18.50683, -72.36136, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-686', 11152, 'Centre de Sante Communautaire cite de l''etern', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.53666, -72.35447, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-687', 0, 'Centre de Santé St Michel', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.53053, -72.36700, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-688', 0, 'Centre de Santé Communautaire', 'CSL', 'Mixte', 'Ouest', 'Port-au-Prince', 18.52431, -72.34403, 1, 0, 1, 0, 1, 2, 2, 1, 1, 1, 1, 0, 2, 1, 1, 0, 1, 1, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-689', 0, 'Missionaires de la Charit� Coeur Immacul� de', 'CAL', 'Mixte', 'Ouest', 'Port-au-Prince', 18.55058, -72.32729, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-690', 0, 'Centre de Santé Evang�lique de Siloe', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.52563, -72.33228, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-691', 0, 'Centre de Santé des Pr�s', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.52573, -72.33146, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-692', 0, 'Centre M�dico Social de P-au-P', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.54467, -72.32435, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-693', 0, 'Centre de Santé communautaire', 'Dispensaire', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.52170, -72.34448, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-694', 0, 'Centre de Santé Christ Roi', 'CSL', 'Publique', 'Ouest', 'Port-au-Prince', 18.54028, -72.31278, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-695', 0, 'CEJPEPH', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.55286, -72.33891, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-696', 0, 'Centre de Santé Bienfaisance', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.56168, -72.34256, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-697', 0, 'Centre de Santé Jehova', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.52643, -72.35643, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-698', 0, 'DASH Martissant 4', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53089, -72.36226, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-699', 11132, 'Centre de Santé de Martissant', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.53606, -72.35705, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-700', 0, 'Clinique Familiale', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.53726, -72.32145, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-701', 0, 'Centre de Santé Communautaire', 'CSL', 'Publique', 'Ouest', 'Port-au-Prince', 18.52173, -72.34435, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-702', 0, 'Dispensaire Missionnaire', 'Dispensaire', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.55504, -72.34251, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-703', 0, 'Centre M�dico social', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53689, -72.31815, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-704', 0, 'Centre de Santé Delouis', 'CSL', 'Mixte', 'Ouest', 'Port-au-Prince', 18.52382, -72.36604, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-705', 0, 'H�pital Sans Fronti�re', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53109, -72.36273, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-706', 0, 'Centre de Santé P�dodontique', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.53493, -72.35011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-707', 0, 'Plurim�dic', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.53323, -72.32910, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-708', 0, 'Centre de Santé communautaire', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.52597, -72.34765, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-709', 0, 'Centre de Santé communautaire de Tunnel', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.52270, -72.33917, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-710', 0, 'Clinique Repheka', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.52299, -72.34084, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-711', 11204, 'Centre M�dico social de la Saline', 'CSL', 'Mixte', 'Ouest', 'Port-au-Prince', 18.56040, -72.34050, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 2, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-712', 11100, 'HUEH', 'Hopital universitaire', 'Publique', 'Ouest', 'Port-au-Prince', 18.53976, -72.34021, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-713', 11121, 'Sanatorium de Port-au-Prince', 'Hopital', 'Publique', 'Ouest', 'Port-au-Prince', 18.52682, -72.34421, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1);
INSERT INTO spa VALUES ('CS-714', 11122, 'H�pital Saint-Joseph', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53527, -72.32839, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-715', 11159, 'H�pital ital St Louis', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53557, -72.32518, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-716', 11103, 'H�pital du Canap� Vert', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.53351, -72.31684, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-717', 11113, 'H�pital Fran�ais', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.53726, -72.34516, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-718', 11141, 'H�pital Saint-esPrivét', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.53085, -72.33741, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-719', 11143, 'Maternit� UMO', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.54147, -72.33338, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-720', 11146, 'Maternit� de Christ-roi', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.53761, -72.31860, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-721', 11156, 'H�pital ital Medimax', 'Hopital', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.53042, -72.33686, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-722', 11105, 'Centre de Santé du Portail L�ogane', 'CSL', 'Publique', 'Ouest', 'Port-au-Prince', 18.53578, -72.34674, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-723', 11127, 'Renaissance', 'CSL', 'Publique', 'Ouest', 'Port-au-Prince', 18.54892, -72.33953, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-724', 11102, 'Centre de Santé aurore du Bel Air', 'CSL', 'Publique', 'Ouest', 'Port-au-Prince', 18.55061, -72.33681, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-725', 11104, 'Dispensaire Carifont de Fontamara', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.52958, -72.36859, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-726', 11111, 'Centre de Santé Richard Allen', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.54221, -72.34307, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1);
INSERT INTO spa VALUES ('CS-727', 11128, 'APROSIFA', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.52862, -72.34716, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-728', 11130, 'Centre de Santé kay ti moun', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53114, -72.33720, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-729', 11134, 'Gheskio', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53748, -72.34921, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-730', 11129, 'Centre de Santé Sainte elizabeth', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.52452, -72.33976, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-731', 11145, 'FOSREF', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.54483, -72.33498, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-732', 11106, 'Centre de Santé St Antoine', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.54501, -72.33172, 1, 1, 1, 1, 1, 0, 2, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-733', 11135, 'Centre de Santé B�thanie', 'CSL', 'Privé a but lucratif', 'Ouest', 'Port-au-Prince', 18.52740, -72.35232, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-734', 11108, 'Centre de Santé de Solino', 'CSL', 'Mixte', 'Ouest', 'Port-au-Prince', 18.54869, -72.32407, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-735', 11147, 'Centre de Santé cite Canada (Haut Turgeau)', 'CSL', 'Mixte', 'Ouest', 'Port-au-Prince', 18.52505, -72.31867, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-736', 11155, 'Institut FAMEPEREO', 'CSL', 'Mixte', 'Ouest', 'Port-au-Prince', 18.54373, -72.32168, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-737', 11207, 'C/S communaut� chr�tienne Fleuriot de Tabarre', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Tabarre', 18.57496, -72.26299, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-738', 11234, 'Nos petits fr�res et soeurs (H�pital St damie', 'Hopital', 'Publique', 'Ouest', 'Tabarre', 18.57037, -72.25368, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-739', 11242, 'Haiti Med', 'CAL', 'Privé a but lucratif', 'Ouest', 'Tabarre', 18.58039, -72.26752, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-740', 0, 'Hopital St Luc', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Tabarre', 18.57114, -72.25094, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-741', 0, 'H�pital Dash Tabarre', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Tabarre', 18.55700, -72.24536, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-742', 0, 'Centre de Santé de Lyro', 'CSL', 'Privé a but lucratif', 'Ouest', 'Tabarre', 18.55966, -72.24693, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-743', 0, 'MSF Belgique', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Tabarre', 18.56966, -72.26568, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-744', 0, 'Family M�morial M�dical center', 'CSL', 'Privé a but lucratif', 'Ouest', 'Tabarre', 18.59754, -72.28455, 2, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-745', 0, 'Centre de Santé of Live', 'CAL', 'Privé a but lucratif', 'Ouest', 'Tabarre', 18.58251, -72.30486, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-746', 11240, 'Geskio/ Imis', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Tabarre', 18.57035, -72.25116, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-747', 11248, 'King''s hospital', 'Hopital', 'Privé sans but lucratif', 'Ouest', 'Tabarre', 18.56290, -72.27319, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-748', 11219, 'Centre de Santé croix des missions', 'CSL', 'Publique', 'Ouest', 'Tabarre', 18.59565, -72.28610, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-749', 13201, 'C/S de Thomazeau', 'CAL', 'Publique', 'Ouest', 'Thomazeau', 18.65339, -72.09383, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-750', 13202, 'Centre de Santé Vision de N�h�mi', 'CSL', 'Privé sans but lucratif', 'Ouest', 'Thomazeau', 18.63237, -72.19181, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-751', 73101, 'CS Aquin', 'CSL', 'Mixte', 'Sud', 'Aquin', 18.31118, -73.19286, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-752', 73111, 'H�pital ital Saint Boniface', 'Hopital', 'Privé sans but lucratif', 'Sud', 'Aquin', 18.27732, -73.12987, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-753', 73112, 'HCR d''Aquin', 'Hopital de reference', 'Publique', 'Sud', 'Aquin', 18.28103, -73.39755, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-754', 73104, 'Charles Pasqua', 'CAL', 'Privé sans but lucratif', 'Sud', 'Aquin', 18.29408, -73.34419, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-755', 73102, 'CS La Colline', 'CAL', 'Mixte', 'Sud', 'Aquin', 18.30811, -73.24628, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-756', 73106, 'Ste H�l�ne', 'Dispensaire', 'Privé a but lucratif', 'Sud', 'Aquin', 18.31722, -73.37786, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-757', 73105, 'Vx Bourg', 'Dispensaire', 'Mixte', 'Sud', 'Aquin', 18.29894, -73.34353, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-758', 71401, 'CS Camp-Perrin', 'Hopital de reference', 'Publique', 'Sud', 'Camp-Perrin', 18.31267, -73.86584, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-759', 71404, 'Mersan', 'Dispensaire', 'Publique', 'Sud', 'Camp-Perrin', 18.28105, -73.84389, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-760', 71402, 'Mazenod', 'Dispensaire', 'Mixte', 'Sud', 'Camp-Perrin', 18.32937, -73.85319, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-761', 71403, 'Guichard', 'Dispensaire', 'Mixte', 'Sud', 'Camp-Perrin', 18.29545, -73.82892, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-762', 73301, 'H�pital Bonne Fin', 'Hopital', 'Privé a but lucratif', 'Sud', 'Cavaillon', 18.39365, -73.61257, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1);
INSERT INTO spa VALUES ('CS-763', 73303, 'Cavaillon NDPS', 'CSL', 'Privé a but lucratif', 'Sud', 'Cavaillon', 18.29943, -73.65364, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-764', 73307, 'Dispensaire St Joseph et St Charles', 'Dispensaire', 'Privé a but lucratif', 'Sud', 'Cavaillon', 18.24577, -73.65325, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-765', 73308, 'PPS Sante Communautaire Marc Lacet', 'Dispensaire', 'Mixte', 'Sud', 'Cavaillon', 18.41467, -73.65718, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-766', 0, 'Centre Materno Infantil', 'CSL', 'Privé a but lucratif', 'Sud', 'Cavaillon', 18.29028, -73.63299, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 2, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-767', 0, 'Dispensaire Notre Dame du Bon Secours', 'Dispensaire', 'Mixte', 'Sud', 'Cavaillon', 18.30187, -73.65524, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-768', 0, 'PPS La Biche', 'Dispensaire', 'Privé sans but lucratif', 'Sud', 'Cavaillon', 18.35896, -73.63333, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-769', 73302, 'CS Cavaillon', 'CSL', 'Publique', 'Sud', 'Cavaillon', 18.29460, -73.64613, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-770', 73305, 'Com. Bonne Fin', 'CSL', 'Privé sans but lucratif', 'Sud', 'Cavaillon', 18.39356, -73.61374, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-771', 71104, 'Cite Lumiere', 'Hopital universitaire', 'Mixte', 'Sud', 'Cayes', 18.22852, -73.76136, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-772', 71100, 'HIC', 'Hopital de reference', 'Publique', 'Sud', 'Cayes', 18.19346, -73.75095, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-773', 71103, 'Citymed', 'Hopital', 'Privé a but lucratif', 'Sud', 'Cayes', 18.19222, -73.75244, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-774', 71101, 'I. O. Brenda', 'Hopital', 'Mixte', 'Sud', 'Cayes', 18.19546, -73.75776, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-776', 71110, 'Colette', 'Dispensaire', 'Publique', 'Sud', 'Cayes', 18.19309, -73.77776, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-777', 71111, 'Laurent', 'Dispensaire', 'Publique', 'Sud', 'Cayes', 18.26232, -73.73537, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-779', 71301, 'Chantal', 'CSL', 'Publique', 'Sud', 'Chantal', 18.20300, -73.88899, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-780', 75101, 'Ste Anne', 'Dispensaire', 'Privé sans but lucratif', 'Sud', 'Chardonni�res', 18.27358, -74.16625, 1, 1, 1, 1, 1, 2, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-781', 75102, 'Rendel', 'Dispensaire', 'Mixte', 'Sud', 'Chardonni�res', 18.31769, -74.09336, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-782', 74101, 'Coteaux', 'CSL', 'Publique', 'Sud', 'C�teaux', 18.20600, -74.04046, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-783', 74102, 'Damassin', 'Dispensaire', 'Publique', 'Sud', 'C�teaux', 18.22936, -74.06366, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-784', 71601, 'Ile � Vache', 'CSL', 'Publique', 'Sud', '�le-�-Vache', 18.08318, -73.65397, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-785', 0, 'Dispensaire Kak�k', 'Dispensaire', 'Privé sans but lucratif', 'Sud', '�le-�-Vache', 18.10811, -73.70061, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-786', 75201, 'Les Anglais', 'CAL', 'Publique', 'Sud', 'Les Anglais', 18.30764, -74.21908, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-787', 71102, 'Sanatorium', 'Hopital', 'Publique', 'Sud', 'Les Cayes', 18.22230, -73.74539, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0);
INSERT INTO spa VALUES ('CS-788', 71105, 'Klinik Lafanmy', 'CAL', 'Privé a but lucratif', 'Sud', 'Les Cayes', 18.19453, -73.74921, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-789', 71112, 'Fonfred', 'Dispensaire', 'Mixte', 'Sud', 'Les Cayes', 18.23401, -73.80275, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-790', 71113, 'World Vision', 'CSL', 'Mixte', 'Sud', 'Les Cayes', 18.26879, -73.77594, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-791', 71115, 'FORSREF', 'CSL', 'Mixte', 'Sud', 'Les Cayes', 18.19922, -73.75873, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-792', 71116, 'Kay Timoun Bondye', 'Dispensaire', 'Privé a but lucratif', 'Sud', 'Les Cayes', 18.19448, -73.74355, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-793', 71117, 'Sacr� Coeur', 'CSL', 'Privé sans but lucratif', 'Sud', 'Les Cayes', 18.21378, -73.75113, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1);
INSERT INTO spa VALUES ('CS-794', 0, 'FOSREF Lakay', 'Dispensaire', 'Privé sans but lucratif', 'Sud', 'Les Cayes', 18.20107, -73.76049, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-795', 71501, 'Maniche', 'CSL', 'Mixte', 'Sud', 'Maniche', 18.34515, -73.77788, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-796', 71502, 'Dory', 'Dispensaire', 'Publique', 'Sud', 'Maniche', 18.35588, -73.72299, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-797', 71503, 'Melon', 'Dispensaire', 'Publique', 'Sud', 'Maniche', 18.35335, -73.77325, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-798', 74201, 'Port � Piment', 'CAL', 'Publique', 'Sud', 'Port-�-Piment', 18.25376, -74.10002, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-799', 72104, 'HCR de Port Salut', 'Hopital de reference', 'Publique', 'Sud', 'Port-Salut', 18.08199, -73.91998, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-800', 72102, 'Dumont', 'Dispensaire', 'Publique', 'Sud', 'Port-Salut', 18.06013, -73.88500, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-801', 72103, 'Carpentier', 'Dispensaire', 'Publique', 'Sud', 'Port-Salut', 18.13206, -73.94707, 1, 0, 1, 1, 1, 2, 2, 1, 1, 2, 2, 2, 2, 1, 1, 2, 2, 2, 2, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-802', 72101, 'Port Salut', 'Hopital', 'Privé sans but lucratif', 'Sud', 'Port-Salut', 18.10988, -73.93922, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-803', 0, 'Dispensaire Marcabel', 'Dispensaire', 'Privé a but lucratif', 'Sud', 'Port-Salut', 18.07388, -73.88394, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-804', 74301, 'Roche � Bateau', 'Dispensaire', 'Mixte', 'Sud', 'Roche-�-Bateau', 18.17980, -74.00349, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-805', 72201, 'St Jean', 'CSL', 'Publique', 'Sud', 'Saint-Jean-du-Sud', 18.07627, -73.81247, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-806', 72202, 'Carrefour Joute', 'Dispensaire', 'Publique', 'Sud', 'Saint-Jean-du-Sud', 18.11502, -73.85211, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-807', 73203, 'Sucrerie Henry', 'Dispensaire', 'Mixte', 'Sud', 'Saint-Jean-du-Sud', 18.29090, -73.57026, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-808', 73201, 'Saint Louis', 'CAL', 'Publique', 'Sud', 'Saint-Jean-du-Sud', 18.26303, -73.54661, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-809', 73202, 'Saint Patrick', 'Dispensaire', 'Privé a but lucratif', 'Sud', 'Saint-Jean-du-Sud', 18.26425, -73.54254, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-810', 0, 'Centre Communautaire de Baie Dumesle', 'CSL', 'Publique', 'Sud', 'Saint-Jean-du-Sud', 18.22800, -73.61500, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-811', 75301, 'Dispensaire Roger Paradis', 'Dispensaire', 'Mixte', 'Sud', 'Tiburon', 18.32536, -74.39614, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-812', 71205, 'B�raud', 'CSL', 'Publique', 'Sud', 'Torbeck', 18.20535, -73.85980, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-813', 71207, 'Centre de Santé de Torbeck', 'CSL', 'Publique', 'Sud', 'Torbeck', 18.16175, -73.82089, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-814', 71201, 'Maison de Naissance', 'CAL', 'Privé a but lucratif', 'Sud', 'Torbeck', 18.19720, -73.82662, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-815', 71206, 'Ferme Leblanc', 'Dispensaire', 'Publique', 'Sud', 'Torbeck', 18.28793, -73.88375, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-816', 71204, 'Maillard', 'Dispensaire', 'Privé a but lucratif', 'Sud', 'Torbeck', 18.17268, -73.83233, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-817', 71203, 'Ducis', 'Dispensaire', 'Mixte', 'Sud', 'Torbeck', 18.23458, -73.88766, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-818', 23401, 'Centre sans lit des Anse-a-Pitres', 'CSL', 'Publique', 'Sud-Est', 'Anse-�-Pitres', 18.04303, -71.75573, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-819', 23402, 'Dispensairede Banane', 'Dispensaire', 'Publique', 'Sud-Est', 'Anse-�-Pitres', 18.14408, -71.76070, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-820', 0, 'Dispensaire Bony', 'Dispensaire', 'Privé sans but lucratif', 'Sud-Est', 'Anse-�-Pitres', 18.20262, -71.81106, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-821', 0, 'Dispensaire Ka Toussaint', 'Dispensaire', 'Privé sans but lucratif', 'Sud-Est', 'Anse-�-Pitres', 18.16332, -71.78617, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-822', 22105, 'Dispensaire Br�silienne', 'Dispensaire', 'Mixte', 'Sud-Est', 'Bainet', 18.19009, -72.67404, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-823', 22101, 'Centre a Lits de Bainet', 'CAL', 'Publique', 'Sud-Est', 'Bainet', 18.18314, -72.75501, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-824', 22102, 'Dispensaire Saurel', 'Dispensaire', 'Publique', 'Sud-Est', 'Bainet', 18.19684, -72.86514, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-825', 22103, 'Dispensaire Bahot', 'Dispensaire', 'Publique', 'Sud-Est', 'Bainet', 18.23124, -72.73484, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-826', 22104, 'Dispensaire Chaumeille', 'Dispensaire', 'Publique', 'Sud-Est', 'Bainet', 18.17803, -72.80058, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-827', 22106, 'Dispensaire Orangers', 'Dispensaire', 'Publique', 'Sud-Est', 'Bainet', 18.23595, -72.82644, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-828', 22107, 'Dispensaire Bras gauche', 'Dispensaire', 'Publique', 'Sud-Est', 'Bainet', 18.25731, -72.86056, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-829', 23101, 'Centre de Santé sans�lit de Belle Anse (F)', 'CSL', 'Publique', 'Sud-Est', 'Belle-Anse', 18.23783, -72.06372, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-830', 23102, 'Dispensaire de Mapou', 'Dispensaire', 'Publique', 'Sud-Est', 'Belle-Anse', 18.26469, -71.97244, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-831', 0, 'PPS Bel Air (ACDI VOCA)', 'Dispensaire', 'Privé sans but lucratif', 'Sud-Est', 'Belle-Anse', 18.27216, -72.05222, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-832', 0, 'CS Corail Lamothe', 'Dispensaire', 'Publique', 'Sud-Est', 'Belle-Anse', 18.28119, -72.10464, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-833', 0, 'Point fixe Calumet (ACDI VOCA)', 'Dispensaire', 'Privé a but lucratif', 'Sud-Est', 'Belle-Anse', 18.25350, -72.12222, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-834', 0, 'Point fixe Baie d''Oranges (ACDIVOCA)', 'Dispensaire', 'Privé sans but lucratif', 'Sud-Est', 'Belle-Anse', 18.28263, -72.20460, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-835', 0, 'Point fixe Marebriole (ACDIVOCA)', 'Dispensaire', 'Privé sans but lucratif', 'Sud-Est', 'Belle-Anse', 18.29203, -72.16432, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-836', 0, 'Point Fixe Pichon (ACDI VOCA)', 'Dispensaire', 'Privé sans but lucratif', 'Sud-Est', 'Belle-Anse', 18.26305, -72.00190, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-837', 21302, 'Centre de sante Emmanuel Baptiste (F)', 'CAL', 'Privé sans but lucratif', 'Sud-Est', 'Cayes-Jacmel', 18.24222, -72.39839, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1);
INSERT INTO spa VALUES ('CS-838', 21303, 'Dispensaire Cap Rouge', 'Dispensaire', 'Publique', 'Sud-Est', 'Cayes-Jacmel', 18.26989, -72.42506, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-839', 21301, 'Centre de Santé Cayes Jacmel', 'Hopital de reference', 'Publique', 'Sud-Est', 'Cayes-Jacmel', 18.23092, -72.39783, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-840', 22202, 'Dispensaire Saint Joseph', 'CSL', 'Publique', 'Sud-Est', 'C�tes-de-Fer', 18.19031, -73.00335, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-841', 22201, 'Centre a lits de Gris Gris', 'CSL', 'Mixte', 'Sud-Est', 'C�tes-de-Fer', 18.23217, -72.94109, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-842', 22203, 'Dispensaire Boucan B�lier', 'Dispensaire', 'Mixte', 'Sud-Est', 'C�tes-de-Fer', 18.26344, -72.95444, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-843', 22204, 'Dispensaire Ricot (F)', 'Dispensaire', 'Mixte', 'Sud-Est', 'C�tes-de-Fer', 18.26024, -72.99071, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-844', 22205, 'Foie et Vie', 'CAL', 'Privé sans but lucratif', 'Sud-Est', 'C�tes-de-Fer', 18.23853, -72.98385, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-845', 0, 'Dispensaire Mayette', 'Dispensaire', 'Privé a but lucratif', 'Sud-Est', 'C�tes-de-Fer', 18.16222, -72.91446, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-846', 0, 'Dispensaire La Biche', 'Dispensaire', 'Privé a but lucratif', 'Sud-Est', 'C�tes-de-Fer', 18.20826, -72.90118, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-847', 0, 'Dispensaire Dariole MEBSH', 'Dispensaire', 'Privé sans but lucratif', 'Sud-Est', 'C�tes-de-Fer', 18.16237, -72.91403, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-848', 0, 'Dispensaire Amazone', 'Dispensaire', 'Privé sans but lucratif', 'Sud-Est', 'C�tes-de-Fer', 18.27734, -72.91573, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-849', 23202, 'Dispensaire de Bodarie', 'Dispensaire', 'Publique', 'Sud-Est', 'Grand-Gosier', 18.25915, -71.89480, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-850', 0, 'Point fixe de Damas (ACDI VOCA)', 'Dispensaire', 'Privé sans but lucratif', 'Sud-Est', 'Grand-Gosier', 18.26235, -71.91557, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-851', 0, 'Point fixe de Boulaille (ACDI VOCA)', 'Dispensaire', 'Privé sans but lucratif', 'Sud-Est', 'Grand-Gosier', 18.27894, -71.87707, 2, 1, 0, 1, 1, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES ('CS-852', 0, 'Centre de Santé St Benoit de Bodarie.', 'CSL', 'Privé sans but lucratif', 'Sud-Est', 'Grand-Gosier', 18.26013, -71.89443, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-853', 21109, 'Dispensaire Bellevue la Montagne', 'Dispensaire', 'Publique', 'Sud-Est', 'Jacmel', 18.19450, -72.57141, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-854', 21112, 'Centre a lits Christian Martinez (F)', 'Hopital', 'Privé a but lucratif', 'Sud-Est', 'Jacmel', 18.23392, -72.53605, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-855', 0, 'Dispensaire et Centre Nutritionnel Bienheureu', 'Dispensaire', 'Privé sans but lucratif', 'Sud-Est', 'Jacmel', 18.26871, -72.57042, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-856', 0, 'Dispensaire La Saline', 'Dispensaire', 'Privé sans but lucratif', 'Sud-Est', 'Jacmel', 18.22901, -72.52885, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-857', 21100, 'H�pital ital St Michel', 'Hopital Departemental', 'Publique', 'Sud-Est', 'Jacmel', 18.23814, -72.54208, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-858', 21101, 'CSLdes Orangers', 'CSL', 'Publique', 'Sud-Est', 'Jacmel', 18.26012, -72.50866, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-859', 21102, 'CSL PROFAMIL (F)', 'CSL', 'Privé sans but lucratif', 'Sud-Est', 'Jacmel', 18.23332, -72.53717, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-860', 21111, 'Centre de Fosref (F)', 'CSL', 'Privé sans but lucratif', 'Sud-Est', 'Jacmel', 18.23321, -72.52715, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-861', 21103, 'Dispensaire Cyvadier', 'Dispensaire', 'Publique', 'Sud-Est', 'Jacmel', 18.22717, -72.46642, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-862', 21104, 'Dispensaire La Montagne', 'Dispensaire', 'Publique', 'Sud-Est', 'Jacmel', 18.21608, -72.62314, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-863', 21105, 'Dispensaire Marbial', 'Dispensaire', 'Publique', 'Sud-Est', 'Jacmel', 18.33357, -72.47214, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-864', 21106, 'Dispensaire La Montagne la Vo�te', 'Dispensaire', 'Publique', 'Sud-Est', 'Jacmel', 18.32880, -72.51088, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-865', 21107, 'Dispensaire La Vanneau', 'Dispensaire', 'Publique', 'Sud-Est', 'Jacmel', 18.25847, -72.60780, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('CS-866', 21110, 'Dispensaire Lafond', 'Dispensaire', 'Publique', 'Sud-Est', 'Jacmel', 18.28099, -72.51803, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-867', 21401, 'Centre a lits Joseph', 'Hopital', 'Publique', 'Sud-Est', 'La Vall�e', 18.26791, -72.66615, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-868', 21201, 'Centre de Santé de Marigot', 'CSL', 'Publique', 'Sud-Est', 'Marigot', 18.23139, -72.32670, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1);
INSERT INTO spa VALUES ('CS-869', 21202, 'Dispensaire Peredo', 'Dispensaire', 'Publique', 'Sud-Est', 'Marigot', 18.25022, -72.30580, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-870', 21203, 'Dispensaire Seguin', 'Dispensaire', 'Publique', 'Sud-Est', 'Marigot', 18.31647, -72.23876, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-871', 23302, 'Dispensaire Bleck', 'CAL', 'Mixte', 'Sud-Est', 'Thiotte', 18.21718, -71.84220, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0);
INSERT INTO spa VALUES ('CS-874', 23301, 'Centre sans lit de Thiotte', 'CSL', 'Publique', 'Sud-Est', 'Thiotte', 18.23749, -71.85061, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1);
INSERT INTO spa VALUES ('CS-875', 23303, 'Dispensaire Savane Zombi', 'Dispensaire', 'Publique', 'Sud-Est', 'Thiotte', 18.27643, -71.81092, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0);
INSERT INTO spa VALUES ('0', NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES ('CS-872', 23305, 'CSL Sacre- Coeur', 'CAL', 'Prive sans but lucratif', 'Sud-Est', 'Thiotte', 18.24512, -71.84263, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES ('CS-873', 0, 'Dispensaire de Platon Fedre', 'Dispensaire', 'Mixte', 'Sud-Est', 'Thiotte', 18.21480, -71.86350, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0);


--
-- Name: clinicians_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clinicians
    ADD CONSTRAINT clinicians_pkey PRIMARY KEY (idclinician);


--
-- Name: commune_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY commune
    ADD CONSTRAINT commune_pkey PRIMARY KEY (commune_code);


--
-- Name: departement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY departement
    ADD CONSTRAINT departement_pkey PRIMARY KEY (departement_code);


--
-- Name: institution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY institution
    ADD CONSTRAINT institution_pkey PRIMARY KEY (institution_code);


--
-- Name: spa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spa
    ADD CONSTRAINT spa_pkey PRIMARY KEY (id_facility);


--
-- Name: clinicians_institution_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clinicians
    ADD CONSTRAINT clinicians_institution_code_fkey FOREIGN KEY (institution_code) REFERENCES institution(institution_code);


--
-- Name: commune_departement_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY commune
    ADD CONSTRAINT commune_departement_code_fkey FOREIGN KEY (departement_code) REFERENCES departement(departement_code);


--
-- Name: institution_commune_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY institution
    ADD CONSTRAINT institution_commune_code_fkey FOREIGN KEY (commune_code) REFERENCES commune(commune_code);


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

