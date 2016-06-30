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
-- Name: cs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cs_id_seq OWNER TO postgres;

--
-- Name: datapopulation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE datapopulation (
    id integer DEFAULT nextval('cs_id_seq'::regclass) NOT NULL,
    id_dept integer,
    dept_name character varying(10),
    communes character varying(100),
    population_generale integer,
    enf_nouveaux_nes integer,
    enf_0_a_11_mois integer,
    enf_1_a_4_ans integer,
    enf_5_a_14_ans integer,
    ados_15_a_19_ans integer,
    f_15_49_ans integer,
    f_enceintes integer,
    h_15_49_ans integer,
    pers_50_ans_et_plus integer,
    annee integer DEFAULT 2014
);


ALTER TABLE public.datapopulation OWNER TO postgres;

--
-- Name: departement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE departement (
    departement_code integer NOT NULL,
    departement_nom character(80),
    departement_descritption character varying(120)
);


ALTER TABLE public.departement OWNER TO postgres;

--
-- Name: institution; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE institution (
    institution_code integer NOT NULL,
    commune_code integer,
    nombre_phys integer,
    nombre_infirm integer,
    x_lat real,
    y_long real,
    institution_description character varying(120)
);


ALTER TABLE public.institution OWNER TO postgres;

--
-- Name: spa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spa (
    id integer NOT NULL,
    moh_facility_code integer,
    nameoffacility character varying(46),
    facilitytype character varying(34),
    managauthority character varying(23),
    deptname character varying(10),
    commune_name character varying(26),
    latitude numeric(8,5),
    longitude numeric(9,5),
    childvacc integer,
    growthmon integer,
    sickchild integer,
    fp integer,
    anc integer,
    pmtct integer,
    delivery integer,
    malaria integer,
    sti integer,
    tb integer,
    hivct integer,
    art integer,
    hivcss integer,
    noncomdiseases integer,
    minorsurgery integer,
    csections integer,
    laboratory integer,
    bloodtype integer,
    bloodtransf integer,
    generalmeds integer,
    stockcontraceptives integer,
    stocktbmeds integer,
    stockarvs integer,
    hopitalisatioselmen integer,
    nombredelithospi1nuit integer,
    ambulancedispo integer,
    servicedisp024h integer,
    nobrlitmaternite integer,
    nombrelitaccouchment integer,
    nombremedgeneralist integer,
    nombremedspecialist integer,
    nombrparamedical integer,
    nombranesthesit integer,
    nombrinfirmierprofess integer,
    nombrauxilair integer,
    nombrsagefemeprof integer,
    nombresagefemmediplome integer,
    nimbrpharmacien integer,
    nombrpharmtechnologist integer,
    nombrassistanpharmacie integer,
    nombrlabscientist integer,
    nombrlabtechnologis integer,
    nombrlabtechnicien integer
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



--
-- Name: cs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_id_seq', 150, true);


--
-- Data for Name: datapopulation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO datapopulation VALUES (1, 1, 'Artibonite', 'Toutes', 1783137, 49928, 45292, 181345, 422960, 192935, 466112, 53650, 442575, 224854, 2014);
INSERT INTO datapopulation VALUES (2, 1, 'Artibonite', 'Gonaives', 367794, 10298, 9342, 37405, 87241, 39795, 96141, 11066, 91287, 46379, 2014);
INSERT INTO datapopulation VALUES (3, 1, 'Artibonite', 'Saint Marc', 275226, 7706, 6991, 27990, 65284, 29779, 71944, 8281, 68311, 34706, 2014);
INSERT INTO datapopulation VALUES (4, 1, 'Artibonite', 'Dessalines', 187760, 5257, 4769, 19095, 44537, 20316, 49080, 5649, 46602, 23676, 2014);
INSERT INTO datapopulation VALUES (6, 1, 'Artibonite', 'Gros Morne', 160704, 4500, 4082, 16344, 38119, 17388, 42008, 4835, 39887, 20265, 2014);
INSERT INTO datapopulation VALUES (7, 1, 'Artibonite', 'Saint-Michel de l''Attalaye', 155354, 4350, 3946, 15799, 36850, 16809, 40609, 4674, 38559, 19590, 2014);
INSERT INTO datapopulation VALUES (8, 1, 'Artibonite', 'Verrettes', 149475, 4185, 3797, 15202, 35455, 16173, 39073, 4497, 37100, 18849, 2014);
INSERT INTO datapopulation VALUES (9, 1, 'Artibonite', 'Ennery', 52870, 1480, 1343, 5377, 12541, 5721, 13820, 1591, 13122, 6667, 2014);
INSERT INTO datapopulation VALUES (10, 1, 'Artibonite', 'L''Estere', 46613, 1305, 1184, 4741, 11057, 5043, 12185, 1402, 11569, 5878, 2014);
INSERT INTO datapopulation VALUES (11, 1, 'Artibonite', 'L''Anse Rouge', 44792, 1254, 1138, 4555, 10625, 4847, 11709, 1348, 11117, 5648, 2014);
INSERT INTO datapopulation VALUES (12, 1, 'Artibonite', 'Marmelade', 39282, 1100, 998, 3995, 9318, 4250, 10268, 1182, 9750, 4953, 2014);
INSERT INTO datapopulation VALUES (13, 1, 'Artibonite', 'Desdunes', 38218, 1070, 971, 3887, 9065, 4135, 9990, 1150, 9486, 4819, 2014);
INSERT INTO datapopulation VALUES (14, 1, 'Artibonite', 'La Chapelle', 32569, 912, 827, 3312, 7725, 3524, 8514, 980, 8084, 4107, 2014);
INSERT INTO datapopulation VALUES (15, 1, 'Artibonite', 'Terre-Neuve', 32259, 903, 819, 3281, 7652, 3490, 8432, 971, 8007, 4068, 2014);
INSERT INTO datapopulation VALUES (16, 1, 'Artibonite', 'Grande Saline', 23985, 672, 609, 2439, 5689, 2595, 6270, 722, 5953, 3025, 2014);
INSERT INTO datapopulation VALUES (5, 1, 'Artibonite', 'Petite Rivière de l''Artibonite', 176237, 4935, 4476, 17923, 41803, 19069, 46068, 5303, 43742, 22223, 2014);
INSERT INTO datapopulation VALUES (17, 2, 'Centre', 'Toutes', 755085, 25673, 24314, 97179, 191565, 77396, 173217, 31254, 177068, 91818, 2004);
INSERT INTO datapopulation VALUES (18, 2, 'Centre', 'Hinche', 122300, 4158, 3938, 15740, 31027, 12536, 28056, 5062, 28679, 14872, 2004);
INSERT INTO datapopulation VALUES (19, 2, 'Centre', 'Mirebalais', 98915, 3363, 3185, 12730, 25095, 10139, 22691, 4094, 23195, 12028, 2004);
INSERT INTO datapopulation VALUES (20, 2, 'Centre', 'Bellad�re', 87639, 2980, 2822, 11279, 22234, 8983, 20104, 3628, 20551, 10657, 2004);
INSERT INTO datapopulation VALUES (21, 2, 'Centre', 'Thomassique', 63973, 2175, 2060, 8233, 16230, 6557, 14675, 2648, 15002, 7779, 2004);
INSERT INTO datapopulation VALUES (22, 2, 'Centre', 'Thomonde', 62614, 2129, 2016, 8058, 15885, 6418, 14364, 2592, 14683, 7614, 2004);
INSERT INTO datapopulation VALUES (23, 2, 'Centre', 'Ma�ssade', 59641, 2028, 1920, 7676, 15131, 6113, 13682, 2469, 13986, 7252, 2004);
INSERT INTO datapopulation VALUES (24, 2, 'Centre', 'Cerca La Source', 57203, 1945, 1842, 7362, 14512, 5863, 13122, 2368, 13414, 6956, 2004);
INSERT INTO datapopulation VALUES (25, 2, 'Centre', 'Boucan Carr�', 56693, 1928, 1826, 7296, 14383, 5811, 13005, 2347, 13294, 6894, 2004);
INSERT INTO datapopulation VALUES (26, 2, 'Centre', 'Lascahobas', 46416, 1578, 1495, 5974, 11776, 4758, 10648, 1921, 10885, 5644, 2004);
INSERT INTO datapopulation VALUES (27, 2, 'Centre', 'Saut d''eau', 39532, 1344, 1273, 5088, 10029, 4052, 9069, 1636, 9270, 4807, 2004);
INSERT INTO datapopulation VALUES (28, 2, 'Centre', 'Savanette', 36630, 1245, 1179, 4714, 9293, 3755, 8403, 1516, 8590, 4454, 2004);
INSERT INTO datapopulation VALUES (29, 2, 'Centre', 'Cerca Carvajal', 23530, 800, 758, 3028, 5970, 2412, 5398, 974, 5518, 2861, 2004);
INSERT INTO datapopulation VALUES (30, 3, 'Grand-Anse', 'Toutes', 453638, 12248, 12384, 49447, 111595, 47995, 97759, 12863, 106378, 76075, 2014);
INSERT INTO datapopulation VALUES (31, 3, 'Grand-Anse', 'J�r�mie', 130111, 3513, 3552, 14182, 32007, 13766, 28039, 3689, 30511, 21820, 2014);
INSERT INTO datapopulation VALUES (32, 3, 'Grand-Anse', 'Pestel', 43260, 1168, 1181, 4715, 10642, 4577, 9322, 1227, 10144, 7255, 2014);
INSERT INTO datapopulation VALUES (33, 3, 'Grand-Anse', 'Dame Marie', 37534, 1013, 1025, 4091, 9233, 3971, 8089, 1064, 8802, 6294, 2014);
INSERT INTO datapopulation VALUES (34, 3, 'Grand-Anse', 'Abricots', 36495, 985, 996, 3978, 8978, 3861, 7865, 1035, 8558, 6120, 2014);
INSERT INTO datapopulation VALUES (35, 3, 'Grand-Anse', 'Anse D''Hainault', 35261, 952, 963, 3843, 8674, 3731, 7599, 1000, 8269, 5913, 2014);
INSERT INTO datapopulation VALUES (36, 3, 'Grand-Anse', 'Roseaux', 34636, 935, 946, 3775, 8520, 3664, 7464, 982, 8122, 5808, 2014);
INSERT INTO datapopulation VALUES (37, 3, 'Grand-Anse', 'Beaumont', 30591, 826, 835, 3334, 7525, 3237, 6592, 867, 7174, 5130, 2014);
INSERT INTO datapopulation VALUES (38, 3, 'Grand-Anse', 'Moron', 30182, 815, 824, 3290, 7425, 3193, 6504, 856, 7078, 5061, 2014);
INSERT INTO datapopulation VALUES (39, 3, 'Grand-Anse', 'Chambellan', 25630, 692, 700, 2794, 6305, 2712, 5523, 727, 6010, 4298, 2014);
INSERT INTO datapopulation VALUES (40, 3, 'Grand-Anse', 'Les Irois', 22643, 611, 618, 2468, 5570, 2396, 4880, 642, 5310, 3797, 2014);
INSERT INTO datapopulation VALUES (41, 3, 'Grand-Anse', 'Corail', 18952, 512, 517, 2066, 4662, 2005, 4084, 537, 4444, 3178, 2014);
INSERT INTO datapopulation VALUES (42, 3, 'Grand-Anse', 'Bonbon', 8343, 225, 228, 909, 2052, 883, 1798, 237, 1956, 1399, 2014);
INSERT INTO datapopulation VALUES (43, 4, 'Nippes', 'Toutes', 291845, 7880, 7763, 31111, 68700, 29039, 61696, 8276, 69722, 52853, 2014);
INSERT INTO datapopulation VALUES (44, 4, 'Nippes', 'Miragoane', 60570, 1635, 1611, 6457, 14258, 6027, 12804, 1718, 14470, 10969, 2014);
INSERT INTO datapopulation VALUES (45, 4, 'Nippes', 'L''Asile', 39786, 1074, 1058, 4241, 9366, 3959, 8411, 1128, 9505, 7205, 2014);
INSERT INTO datapopulation VALUES (46, 4, 'Nippes', 'L''Anse � Veau', 33529, 905, 892, 3574, 7893, 3336, 7088, 951, 8010, 6072, 2014);
INSERT INTO datapopulation VALUES (47, 4, 'Nippes', 'Fonds des N�gres', 32367, 874, 861, 3450, 7619, 3221, 6842, 918, 7732, 5862, 2014);
INSERT INTO datapopulation VALUES (48, 4, 'Nippes', 'Petit Trou de Nippes', 29051, 784, 773, 3097, 6839, 2891, 6141, 824, 6940, 5261, 2014);
INSERT INTO datapopulation VALUES (49, 4, 'Nippes', 'Petite Rivi�re de Nippes', 27659, 747, 736, 2948, 6511, 2752, 5847, 784, 6608, 5009, 2014);
INSERT INTO datapopulation VALUES (50, 4, 'Nippes', 'Plaisance du Sud', 26392, 713, 702, 2813, 6213, 2626, 5579, 748, 6305, 4780, 2014);
INSERT INTO datapopulation VALUES (51, 4, 'Nippes', 'Arnaud', 20070, 542, 534, 2139, 4724, 1997, 4243, 569, 4795, 3635, 2014);
INSERT INTO datapopulation VALUES (52, 4, 'Nippes', 'Paillant', 16789, 453, 447, 1790, 3952, 1671, 3549, 476, 4011, 3041, 2014);
INSERT INTO datapopulation VALUES (53, 4, 'Nippes', 'Grand Boucan', 5632, 152, 150, 600, 1326, 560, 1191, 160, 1346, 1020, 2014);
INSERT INTO datapopulation VALUES (54, 5, 'Nord', 'Toutes', 1059958, 30739, 27453, 109918, 255132, 116171, 272621, 32422, 256086, 138748, 2014);
INSERT INTO datapopulation VALUES (55, 5, 'Nord', 'Cap-Ha�tien', 272548, 7904, 7059, 28263, 65602, 29871, 70099, 8337, 65848, 35676, 2014);
INSERT INTO datapopulation VALUES (56, 5, 'Nord', 'Limb�', 84725, 2457, 2194, 8786, 20393, 9286, 21791, 2592, 20470, 11090, 2014);
INSERT INTO datapopulation VALUES (57, 5, 'Nord', 'Plaisance', 69112, 2004, 1790, 7167, 16635, 7575, 17776, 2114, 16698, 9047, 2014);
INSERT INTO datapopulation VALUES (58, 5, 'Nord', 'Borgne', 66469, 1928, 1722, 6893, 15999, 7285, 17096, 2033, 16059, 8701, 2014);
INSERT INTO datapopulation VALUES (59, 5, 'Nord', 'L''Acul du Nord', 55530, 1610, 1438, 5758, 13366, 6086, 14282, 1699, 13416, 7269, 2014);
INSERT INTO datapopulation VALUES (60, 5, 'Nord', 'Limonade', 54772, 1588, 1419, 5680, 13184, 6003, 14087, 1675, 13233, 7170, 2014);
INSERT INTO datapopulation VALUES (61, 5, 'Nord', 'Pilate', 53684, 1557, 1390, 5567, 12922, 5884, 13807, 1642, 12970, 7027, 2014);
INSERT INTO datapopulation VALUES (62, 5, 'Nord', 'Saint Rapha�l', 53391, 1548, 1383, 5537, 12851, 5852, 13732, 1633, 12899, 6989, 2014);
INSERT INTO datapopulation VALUES (63, 5, 'Nord', 'Port Margot', 49541, 1437, 1283, 5137, 11925, 5430, 12742, 1515, 11969, 6485, 2014);
INSERT INTO datapopulation VALUES (64, 5, 'Nord', 'Pignon', 42971, 1246, 1113, 4456, 10343, 4710, 11052, 1314, 10382, 5625, 2014);
INSERT INTO datapopulation VALUES (65, 5, 'Nord', 'Grande Rivi�re du Nord', 41083, 1191, 1064, 4260, 9889, 4503, 10566, 1257, 9926, 5378, 2014);
INSERT INTO datapopulation VALUES (66, 5, 'Nord', 'Plaine du Nord', 40976, 1188, 1061, 4249, 9863, 4491, 10539, 1253, 9900, 5364, 2014);
INSERT INTO datapopulation VALUES (67, 5, 'Nord', 'Dondon', 34370, 997, 890, 3564, 8273, 3767, 8840, 1051, 8304, 4499, 2014);
INSERT INTO datapopulation VALUES (68, 5, 'Nord', 'Milot', 31775, 921, 823, 3295, 7648, 3483, 8173, 972, 7677, 4159, 2014);
INSERT INTO datapopulation VALUES (69, 5, 'Nord', 'Ranquite', 27516, 798, 713, 2853, 6623, 3016, 7077, 842, 6648, 3602, 2014);
INSERT INTO datapopulation VALUES (70, 5, 'Nord', 'Quartier Morin', 27173, 788, 704, 2818, 6541, 2978, 6989, 831, 6565, 3557, 2014);
INSERT INTO datapopulation VALUES (71, 5, 'Nord', 'Bahon', 23094, 670, 598, 2395, 5559, 2531, 5940, 706, 5580, 3023, 2014);
INSERT INTO datapopulation VALUES (72, 5, 'Nord', 'Bas Limb�', 20758, 602, 538, 2153, 4996, 2275, 5339, 635, 5015, 2717, 2014);
INSERT INTO datapopulation VALUES (73, 5, 'Nord', 'La Victoire', 10469, 304, 271, 1086, 2520, 1147, 2693, 320, 2529, 1370, 2014);
INSERT INTO datapopulation VALUES (74, 6, 'Nord-Est', 'Toutes', 397861, 14323, 12533, 50170, 99784, 41059, 93060, 14632, 91349, 50966, 2014);
INSERT INTO datapopulation VALUES (75, 6, 'Nord-Est', 'Ouanaminthe', 107176, 3858, 3376, 13515, 26880, 11061, 25069, 3942, 24608, 13729, 2014);
INSERT INTO datapopulation VALUES (76, 6, 'Nord-Est', 'Trou du Nord', 49412, 1779, 1556, 6231, 12393, 5099, 11557, 1817, 11345, 6330, 2014);
INSERT INTO datapopulation VALUES (77, 6, 'Nord-Est', 'Mombin Crochu', 35043, 1262, 1104, 4419, 8789, 3616, 8196, 1289, 8046, 4489, 2014);
INSERT INTO datapopulation VALUES (78, 6, 'Nord-Est', 'Fort-Libert�', 34774, 1252, 1095, 4385, 8721, 3589, 8134, 1279, 7984, 4455, 2014);
INSERT INTO datapopulation VALUES (79, 6, 'Nord-Est', 'Terrier Rouge', 30624, 1102, 965, 3862, 7680, 3160, 7163, 1126, 7031, 3923, 2014);
INSERT INTO datapopulation VALUES (80, 6, 'Nord-Est', 'Sainte Suzanne', 28307, 1019, 892, 3570, 7100, 2921, 6621, 1041, 6499, 3626, 2014);
INSERT INTO datapopulation VALUES (81, 6, 'Nord-Est', 'Valli�res', 23769, 856, 749, 2997, 5961, 2453, 5559, 874, 5457, 3045, 2014);
INSERT INTO datapopulation VALUES (82, 6, 'Nord-Est', 'Mont-Organis�', 21181, 763, 667, 2671, 5312, 2186, 4954, 779, 4863, 2713, 2014);
INSERT INTO datapopulation VALUES (83, 6, 'Nord-Est', 'Capotille', 19573, 705, 617, 2468, 4909, 2020, 4578, 720, 4494, 2507, 2014);
INSERT INTO datapopulation VALUES (84, 6, 'Nord-Est', 'Ferrier', 14787, 532, 466, 1865, 3709, 1526, 3459, 544, 3395, 1894, 2014);
INSERT INTO datapopulation VALUES (85, 6, 'Nord-Est', 'Carice', 13750, 495, 433, 1734, 3448, 1419, 3216, 506, 3157, 1761, 2014);
INSERT INTO datapopulation VALUES (86, 6, 'Nord-Est', 'Perches', 11671, 420, 368, 1472, 2927, 1204, 2730, 429, 2680, 1495, 2014);
INSERT INTO datapopulation VALUES (87, 6, 'Nord-Est', 'Caracol', 7795, 281, 246, 983, 1955, 804, 1823, 287, 1790, 999, 2014);
INSERT INTO datapopulation VALUES (88, 7, 'Nord-Ouest', 'Toutes', 754175, 23379, 21871, 87560, 189826, 82733, 185074, 24103, 176628, 93216, 2014);
INSERT INTO datapopulation VALUES (89, 7, 'Nord-Ouest', 'Port-de-Paix', 211074, 6543, 6121, 24506, 53127, 23155, 51798, 6746, 49434, 26089, 2014);
INSERT INTO datapopulation VALUES (90, 7, 'Nord-Ouest', 'Jean Rabel', 153582, 4761, 4454, 17831, 38656, 16848, 37689, 4908, 35969, 18983, 2014);
INSERT INTO datapopulation VALUES (91, 7, 'Nord-Ouest', 'Saint Louis du Nord', 120399, 3732, 3492, 13978, 30305, 13208, 29546, 3848, 28198, 14881, 2014);
INSERT INTO datapopulation VALUES (92, 7, 'Nord-Ouest', 'Bassin Bleu', 65654, 2035, 1904, 7622, 16525, 7202, 16112, 2098, 15376, 8115, 2014);
INSERT INTO datapopulation VALUES (93, 7, 'Nord-Ouest', 'La Tortue', 40221, 1247, 1166, 4670, 10124, 4412, 9870, 1285, 9420, 4971, 2014);
INSERT INTO datapopulation VALUES (94, 7, 'Nord-Ouest', 'Bombardopolis', 37282, 1156, 1081, 4328, 9384, 4090, 9149, 1192, 8731, 4608, 2014);
INSERT INTO datapopulation VALUES (95, 7, 'Nord-Ouest', 'M�le Saint Nicolas', 35041, 1086, 1016, 4068, 8820, 3844, 8599, 1120, 8207, 4331, 2014);
INSERT INTO datapopulation VALUES (96, 7, 'Nord-Ouest', 'Chansolme', 31418, 974, 911, 3648, 7908, 3447, 7710, 1004, 7358, 3883, 2014);
INSERT INTO datapopulation VALUES (97, 7, 'Nord-Ouest', 'Anse-�-Foleur', 31269, 969, 907, 3630, 7870, 3430, 7673, 999, 7323, 3865, 2014);
INSERT INTO datapopulation VALUES (98, 7, 'Nord-Ouest', 'Baie de Henne', 28235, 875, 819, 3278, 7107, 3097, 6929, 902, 6613, 3490, 2014);
INSERT INTO datapopulation VALUES (99, 8, 'Ouest', 'Toutes', 1377301, 35810, 29061, 115969, 296120, 152880, 408783, 37873, 1188915, 142000, 2014);
INSERT INTO datapopulation VALUES (100, 8, 'Ouest', 'Croix des Bouquets', 263223, 6844, 5554, 22163, 56593, 29218, 78125, 7238, 73650, 27138, 2014);
INSERT INTO datapopulation VALUES (101, 8, 'Ouest', 'L�ogane', 210694, 5478, 4446, 17740, 45299, 23387, 62534, 5794, 58952, 21723, 2014);
INSERT INTO datapopulation VALUES (102, 8, 'Ouest', 'Petit-Go�ve', 182385, 4742, 3848, 15357, 39213, 20245, 54132, 5015, 51031, 18804, 2014);
INSERT INTO datapopulation VALUES (103, 8, 'Ouest', 'Grand-Go�ve', 143935, 3742, 3037, 12119, 30946, 15977, 42720, 3958, 40273, 14840, 2014);
INSERT INTO datapopulation VALUES (104, 8, 'Ouest', 'L''Arcahaie', 137403, 3572, 2899, 11569, 29542, 15252, 40781, 3778, 38445, 14166, 2014);
INSERT INTO datapopulation VALUES (105, 8, 'Ouest', 'Cabaret', 71961, 1871, 1518, 6059, 15472, 7988, 21358, 1979, 20135, 7419, 2014);
INSERT INTO datapopulation VALUES (106, 8, 'Ouest', 'Anse � Galets', 65966, 1715, 1392, 5554, 14183, 7322, 19579, 1814, 18457, 6801, 2014);
INSERT INTO datapopulation VALUES (107, 8, 'Ouest', 'Ganthier', 65940, 1714, 1391, 5552, 14177, 7319, 19571, 1813, 18450, 6798, 2014);
INSERT INTO datapopulation VALUES (108, 8, 'Ouest', 'Cornillon', 62910, 1636, 1327, 5297, 13526, 6983, 18672, 1730, 17602, 6486, 2014);
INSERT INTO datapopulation VALUES (109, 8, 'Ouest', 'Thomazeau', 55845, 1452, 1178, 4702, 12007, 6199, 16575, 1536, 15625, 5758, 2014);
INSERT INTO datapopulation VALUES (110, 8, 'Ouest', 'Fonds-Verrettes', 52748, 1371, 1113, 4441, 11341, 5855, 15656, 1450, 14759, 5438, 2014);
INSERT INTO datapopulation VALUES (111, 8, 'Ouest', 'Gressier', 38439, 999, 811, 3237, 8264, 4267, 11409, 1057, 10755, 3963, 2014);
INSERT INTO datapopulation VALUES (112, 8, 'Ouest', 'Pointe � Raquette', 25852, 672, 545, 2177, 5558, 2870, 7673, 711, 7234, 2665, 2014);
INSERT INTO datapopulation VALUES (113, 8, 'Ouest', 'Port-au-Prince', 1041078, 27068, 21967, 87659, 223832, 115560, 308992, 28628, 291294, 107335, 2014);
INSERT INTO datapopulation VALUES (114, 8, 'Ouest', 'Carrefour', 539193, 14019, 11377, 45400, 115926, 59850, 160032, 14827, 150866, 55591, 2014);
INSERT INTO datapopulation VALUES (115, 8, 'Ouest', 'Delmas', 416786, 10836, 8794, 35093, 89609, 46263, 123702, 11461, 116617, 42971, 2014);
INSERT INTO datapopulation VALUES (116, 8, 'Ouest', 'P�tion-Ville', 397357, 10331, 8384, 33457, 85432, 44107, 117935, 10926, 111180, 40967, 2014);
INSERT INTO datapopulation VALUES (117, 8, 'Ouest', 'Cit� soleil', 279508, 7267, 5898, 23535, 60094, 31025, 82958, 7686, 78206, 28817, 2014);
INSERT INTO datapopulation VALUES (118, 8, 'Ouest', 'Tabarre', 137377, 3572, 2899, 11567, 29536, 15249, 40774, 3778, 38438, 14164, 2014);
INSERT INTO datapopulation VALUES (119, 8, 'Ouest', 'Kenscoff', 60562, 1575, 1278, 5099, 13021, 6722, 17975, 1665, 16945, 6244, 2014);
INSERT INTO datapopulation VALUES (120, 9, 'Sud', 'Toutes', 788447, 20500, 20421, 81683, 190095, 84206, 175745, 21671, 189306, 131198, 2014);
INSERT INTO datapopulation VALUES (121, 9, 'Sud', 'Les Cayes', 146535, 3810, 3795, 15181, 35329, 15650, 32663, 4028, 35183, 24383, 2014);
INSERT INTO datapopulation VALUES (122, 9, 'Sud', 'Aquin', 100669, 2617, 2607, 10429, 24271, 10751, 22439, 2767, 24171, 16751, 2014);
INSERT INTO datapopulation VALUES (123, 9, 'Sud', 'Torbeck', 73494, 1911, 1903, 7614, 17719, 7849, 16382, 2020, 17646, 12229, 2014);
INSERT INTO datapopulation VALUES (124, 9, 'Sud', 'Saint Louis du Sud', 62715, 1631, 1624, 6497, 15121, 6698, 13979, 1724, 15058, 10436, 2014);
INSERT INTO datapopulation VALUES (125, 9, 'Sud', 'Cavaillon', 47030, 1223, 1218, 4872, 11339, 5023, 10483, 1293, 11292, 7826, 2014);
INSERT INTO datapopulation VALUES (126, 9, 'Sud', 'Camp-Perrin', 43510, 1131, 1127, 4508, 10490, 4647, 9698, 1196, 10447, 7240, 2014);
INSERT INTO datapopulation VALUES (127, 9, 'Sud', 'Barad�res', 39842, 1036, 1032, 4128, 9606, 4255, 8881, 1095, 9566, 6630, 2014);
INSERT INTO datapopulation VALUES (128, 9, 'Sud', 'Chantal', 32960, 857, 854, 3415, 7947, 3520, 7347, 906, 7914, 5484, 2014);
INSERT INTO datapopulation VALUES (129, 9, 'Sud', 'les Anglais', 28873, 751, 748, 2991, 6961, 3084, 6436, 794, 6932, 4804, 2014);
INSERT INTO datapopulation VALUES (130, 9, 'Sud', 'Arniquet', 28188, 733, 730, 2920, 6796, 3010, 6283, 775, 6768, 4690, 2014);
INSERT INTO datapopulation VALUES (131, 9, 'Sud', 'Saint Jean du Sud', 24697, 642, 640, 2559, 5954, 2638, 5505, 679, 5930, 4110, 2014);
INSERT INTO datapopulation VALUES (132, 9, 'Sud', 'Chardonni�res', 24381, 634, 631, 2526, 5878, 2604, 5435, 670, 5854, 4057, 2014);
INSERT INTO datapopulation VALUES (133, 9, 'Sud', 'Maniche', 23120, 601, 599, 2395, 5574, 2469, 5153, 635, 5551, 3847, 2014);
INSERT INTO datapopulation VALUES (134, 9, 'Sud', 'Tiburon', 22487, 585, 582, 2330, 5422, 2402, 5012, 618, 5399, 3742, 2014);
INSERT INTO datapopulation VALUES (135, 9, 'Sud', 'C�teaux', 20578, 535, 533, 2132, 4961, 2198, 4587, 566, 4941, 3424, 2014);
INSERT INTO datapopulation VALUES (136, 9, 'Sud', 'Port-Salut', 18448, 480, 478, 1911, 4448, 1970, 4112, 507, 4429, 3070, 2014);
INSERT INTO datapopulation VALUES (137, 9, 'Sud', 'Port-�-Piment', 18277, 475, 473, 1894, 4407, 1952, 4074, 502, 4388, 3041, 2014);
INSERT INTO datapopulation VALUES (138, 9, 'Sud', 'Roche � Bateau', 17767, 462, 460, 1841, 4284, 1898, 3960, 488, 4266, 2957, 2014);
INSERT INTO datapopulation VALUES (139, 9, 'Sud', 'L''Ile � Vache', 14876, 387, 385, 1541, 3586, 1589, 3316, 409, 3572, 2475, 2014);
INSERT INTO datapopulation VALUES (140, 10, 'Sud-Est', 'Toutes', 706092, 19771, 19418, 77670, 177935, 75199, 161342, 20939, 153010, 116646, 2014);
INSERT INTO datapopulation VALUES (141, 10, 'Sud-Est', 'Jacmel', 209006, 5852, 5748, 22991, 52670, 22259, 47758, 6198, 45292, 34528, 2014);
INSERT INTO datapopulation VALUES (142, 10, 'Sud-Est', 'Bainet', 96833, 2711, 2663, 10652, 24402, 10313, 22126, 2872, 20984, 15997, 2014);
INSERT INTO datapopulation VALUES (143, 10, 'Sud-Est', 'Belle Anse', 84774, 2374, 2331, 9325, 21363, 9028, 19371, 2514, 18370, 14005, 2014);
INSERT INTO datapopulation VALUES (144, 10, 'Sud-Est', 'Marigot', 83379, 2335, 2293, 9172, 21011, 8880, 19052, 2473, 18068, 13774, 2014);
INSERT INTO datapopulation VALUES (145, 10, 'Sud-Est', 'C�tes de Fer', 54734, 1533, 1505, 6021, 13793, 5829, 12507, 1623, 11861, 9042, 2014);
INSERT INTO datapopulation VALUES (146, 10, 'Sud-Est', 'Cayes Jacmel', 45036, 1261, 1238, 4954, 11349, 4796, 10291, 1336, 9759, 7440, 2014);
INSERT INTO datapopulation VALUES (147, 10, 'Sud-Est', 'La Vall�e', 40659, 1138, 1118, 4473, 10246, 4330, 9291, 1206, 8811, 6717, 2014);
INSERT INTO datapopulation VALUES (148, 10, 'Sud-Est', 'Thiotte', 38983, 1092, 1072, 4288, 9824, 4152, 8908, 1156, 8448, 6440, 2014);
INSERT INTO datapopulation VALUES (149, 10, 'Sud-Est', 'L''Anse � Pitre', 33648, 942, 925, 3701, 8479, 3583, 7688, 998, 7291, 5559, 2014);
INSERT INTO datapopulation VALUES (150, 10, 'Sud-Est', 'Grand Gosier', 19040, 533, 524, 2094, 4798, 2028, 4351, 565, 4126, 3145, 2014);


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



--
-- Data for Name: spa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO spa VALUES (1, 51101, 'La Providence', 'Hopital departemental', 'Publique', 'Artibonite', 'Gonaives', 19.47518, -72.66647, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 2, 86, 1, 1, 4, 13, 3, 0, 7, 12, 0, 4, 0, 0, 0, 34, 34, 0, 1, 2);
INSERT INTO spa VALUES (2, 51102, 'Bayonnais - CAL', 'Centre de sante sans lit', 'Prive a but lucratif', 'Artibonite', 'Gonaives', 19.42686, -72.51557, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0);
INSERT INTO spa VALUES (3, 51103, 'Bayonnais', 'Dispensaire', 'Publique', 'Artibonite', 'Gonaives', 19.42842, -72.54015, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 0, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (4, 51104, 'Labranle', 'Dispensaire', 'Mixte', 'Artibonite', 'Gonaives', 19.60870, -72.61588, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (5, 51105, 'Ka-Soleil', 'Centre de sante sans lit', 'Publique', 'Artibonite', 'Gonaives', 19.45376, -72.68996, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 3, 0, 0, 0, 0, 0, 4, 8, 0, 0, 1);
INSERT INTO spa VALUES (6, 51106, 'Eben-Ezer/Belle Anse', 'Centre de sante a lit', 'Mixte', 'Artibonite', 'Gonaives', 19.43742, -72.63531, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 20, 3, 1, 1, 1, 2, 0, 0, 1, 0, 0, 0, 0, 0, 1, 4, 0, 1, 0);
INSERT INTO spa VALUES (7, 51107, 'Bon Berger/Bassin', 'Centre de sante sans lit', 'Prive a but lucratif', 'Artibonite', 'Gonaives', 19.53825, -72.69564, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 5, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (8, 51108, 'Raboteau', 'Centre de sante a lit', 'Publique', 'Artibonite', 'Gonaives', 19.44301, -72.69497, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 2, 14, 3, 1, 7, 2, 3, 1, 12, 8, 3, 1, 1, 0, 0, 6, 30, 0, 1, 2);
INSERT INTO spa VALUES (9, 51109, 'Trou Sable', 'Dispensaire', 'Prive sans but lucratif', 'Artibonite', 'Gonaives', 19.43826, -72.68020, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 3, 3, NULL, NULL, NULL, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 4, 0, 0, 1);
INSERT INTO spa VALUES (10, 51110, 'Poteau', 'Dispensaire', 'Publique', 'Artibonite', 'Gonaives', 19.52190, -72.61579, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 0, 0, 1);
INSERT INTO spa VALUES (11, 51112, 'Dispensaire Brunette', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Gonaives', 19.45252, -72.60744, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (12, 51113, 'Dispensaire Terre Blanche', 'Dispensaire', 'Prive sans but lucratif', 'Artibonite', 'Gonaives', 19.59364, -72.63961, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 6, 3, 1, 6, 6, 1, 0, 0, 2, 0, 0, 0, 0, 0, 1, 2, 0, 1, 1);
INSERT INTO spa VALUES (13, 51114, 'Dispensaire Tarasse', 'Dispensaire', 'Prive sans but lucratif', 'Artibonite', 'Gonaives', 19.45604, -72.63821, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (14, 51201, 'Toussaint Louverture', 'Hopital communautaire de reference', 'Publique', 'Artibonite', 'Ennery', 19.48200, -72.48134, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 20, 1, 1, 3, 3, 1, 0, 1, 4, 0, 1, 0, 0, 0, 2, 12, 1, 0, 3);
INSERT INTO spa VALUES (15, 51202, 'Passe Reine', 'Dispensaire', 'Publique', 'Artibonite', 'Ennery', 19.51436, -72.54516, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (16, 51203, 'Savanne Carree', 'Dispensaire', 'Publique', 'Artibonite', 'Ennery', 19.44126, -72.43956, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (17, 51204, 'St Francois d?Assise', 'Centre de sante a lit', 'Prive a but lucratif', 'Artibonite', 'Ennery', 19.48474, -72.48368, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 2, 12, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 3, 0, 2, 0);
INSERT INTO spa VALUES (18, 51205, 'Dispensaire chemin neuf', 'Dispensaire', 'Mixte', 'Artibonite', 'Ennery', 19.53951, -72.50749, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (19, 51206, 'Dispensaire Rouf', 'Dispensaire', 'Publique', 'Artibonite', 'Ennery', 19.55803, -72.52124, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (20, 51301, 'CAL L?Estere', 'Hopital communautaire de reference', 'Publique', 'Artibonite', 'L-Estere', 19.30483, -72.61005, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 2, 7, 1, 1, 9, 9, 6, 0, 4, 3, 0, 0, 1, 0, 0, 14, 7, 0, 2, 0);
INSERT INTO spa VALUES (21, 51302, 'Dispensaire Lagon', 'Dispensaire', 'Prive sans but lucratif', 'Artibonite', 'L-Estere', 19.31711, -72.58991, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (22, 51303, 'New Testament la Croix Perisse', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Artibonite', 'L-Estere', 19.35274, -72.58287, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 6, 3, 1, 1, 6, 3, 0, 0, 2, 0, 0, 0, 0, 0, 6, 6, 0, 0, 2);
INSERT INTO spa VALUES (23, 52101, 'Alma Mater', 'Hopital communautaire de reference', 'Mixte', 'Artibonite', 'Gros-Morne', 19.66936, -72.68080, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 2, 47, 1, 1, 7, 2, 6, 1, 3, 5, 0, 1, 0, 1, 0, 19, 9, 1, 1, 1);
INSERT INTO spa VALUES (24, 52102, 'David 6e section', 'Dispensaire', 'Publique', 'Artibonite', 'Gros-Morne', 19.71108, -72.73865, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (25, 52103, 'Pendu 5e section', 'Centre de sante a lit', 'Publique', 'Artibonite', 'Gros-Morne', 19.78489, -72.73496, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 2, 3, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (26, 52104, 'Riv Mancelle  2e section', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Gros-Morne', 19.72018, -72.61991, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 3, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (27, 52105, 'SOS France 4e section', 'Centre de sante a lit', 'Prive sans but lucratif', 'Artibonite', 'Gros-Morne', 19.66867, -72.68223, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 5, 3, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (28, 52106, 'Treuil', 'Dispensaire', 'Publique', 'Artibonite', 'Gros-Morne', 19.75957, -72.65443, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (29, 52107, 'Moulin', 'Centre de sante a lit', 'Publique', 'Artibonite', 'Gros-Morne', 19.65088, -72.71586, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 3, 3, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (30, 52108, 'Perou', 'Dispensaire', 'Publique', 'Artibonite', 'Gros-Morne', 19.60997, -72.69025, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (31, 52109, 'Verneille', 'Dispensaire', 'Publique', 'Artibonite', 'Gros-Morne', 19.75954, -72.67509, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (32, 52111, 'Dispensaires Corail', 'Dispensaire', 'Mixte', 'Artibonite', 'Gros-Morne', 19.72783, -72.66870, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (33, 52112, 'Clinique Jolivert', 'Centre de sante sans lit', 'Prive a but lucratif', 'Artibonite', 'Gros-Morne', 19.75979, -72.78444, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 1, 1, 2, 0, 0, 4, 0, 0, 0, 0, 0, 3, 1, 0, 0, 1);
INSERT INTO spa VALUES (34, 52113, 'Dispensaire Decaussiere', 'Dispensaire', 'Publique', 'Artibonite', 'Gros-Morne', 19.70100, -72.70500, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (35, 52114, 'Clinique Anti-tuberculose', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Artibonite', 'Gros-Morne', 19.71563, -72.69883, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (36, 52201, 'Centre de Sante de Terre-Neuve', 'Centre de sante a lit', 'Publique', 'Artibonite', 'Terre-Neuve', 19.59995, -72.78127, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 5, 0, 0, 0);
INSERT INTO spa VALUES (37, 52202, 'Dispensaire Lagon', 'Dispensaire', 'Publique', 'Artibonite', 'Terre-Neuve', 19.67669, -72.82393, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 2, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (38, 52303, 'Dispensaire Figuier', 'Dispensaire', 'Publique', 'Artibonite', 'Anse-Rouge', 19.60203, -72.89018, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (39, 52305, 'Dispensaire  Plaine de l?Arbre', 'Dispensaire', 'Publique', 'Artibonite', 'Anse-Rouge', 19.66683, -73.02200, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (40, 52306, 'Dispensaire  Sources Chaudes', 'Dispensaire', 'Publique', 'Artibonite', 'Anse-Rouge', 19.63633, -72.91643, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (41, 52308, 'Dispensaire Atrel', 'Dispensaire', 'Publique', 'Artibonite', 'Anse-Rouge', 19.63797, -72.91513, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 2, 3, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1);
INSERT INTO spa VALUES (42, 53101, 'Saint Nicolas', 'Hopital communautaire de reference', 'Publique', 'Artibonite', 'Saint-Marc', 19.11343, -72.69902, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 104, 1, 1, 36, 5, 32, 6, 21, 10, 3, 2, 0, 0, 0, 48, 61, 4, 1, 8);
INSERT INTO spa VALUES (43, 53102, 'Chardene', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Saint-Marc', 19.04905, -72.71478, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (44, 53102, 'Chardene', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Saint-Marc', 19.04905, -72.71478, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (45, 53103, 'Charrettes', 'Dispensaire', 'Mixte', 'Artibonite', 'Saint-Marc', 19.08020, -72.67497, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (46, 53105, 'Gresseau', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 18.98285, -72.64610, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (47, 53105, 'Gresseau', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 18.98285, -72.64610, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (48, 53106, 'Jeanton', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Saint-Marc', 19.07533, -72.70880, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (49, 53106, 'Jeanton', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Saint-Marc', 19.07533, -72.70880, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (50, 53108, 'Pierre Payen', 'Centre de sante a lit', 'Prive a but lucratif', 'Artibonite', 'Saint-Marc', 18.99722, -72.73793, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 28, 3, 1, 3, 2, 3, 2, 2, 3, 1, 1, 0, 0, 0, 12, 13, 1, 1, 2);
INSERT INTO spa VALUES (51, 53109, 'Pont Sonde', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 19.14884, -72.61700, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (52, 53110, 'Bocozelle', 'Centre de sante a lit', 'Mixte', 'Artibonite', 'Saint-Marc', 19.20686, -72.64051, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 3, 3, 1, 3, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 6, 0, 0, 1);
INSERT INTO spa VALUES (53, 53110, 'Bocozelle', 'Centre de sante a lit', 'Mixte', 'Artibonite', 'Saint-Marc', 19.20686, -72.64051, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 3, 3, 1, 3, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 6, 0, 0, 1);
INSERT INTO spa VALUES (54, 53111, 'Gervais', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 19.23780, -72.71885, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES (55, 53111, 'Gervais', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 19.23780, -72.71885, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES (56, 53112, 'RSCH/ Gilbert', 'Centre de sante a lit', 'Publique', 'Artibonite', 'Saint-Marc', 19.06750, -72.61525, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 4, 1, 1, 3, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (57, 53112, 'RSCH/ Gilbert', 'Centre de sante a lit', 'Publique', 'Artibonite', 'Saint-Marc', 19.06750, -72.61525, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 4, 1, 1, 3, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (58, 53113, 'Terre Blanche', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 19.07065, -72.68101, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (59, 53113, 'Terre Blanche', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 19.07065, -72.68101, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (60, 53114, 'St Laurent/Barbe', 'Dispensaire', 'Mixte', 'Artibonite', 'Saint-Marc', 19.09404, -72.65513, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (61, 53115, 'SSPE', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Saint-Marc', 19.10656, -72.70268, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 2, 3, NULL, NULL, NULL, 2, 0, 0, 5, 0, 2, 0, 0, 0, 4, 6, 0, 1, 5);
INSERT INTO spa VALUES (62, 53115, 'SSPE', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Saint-Marc', 19.10656, -72.70268, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 2, 3, NULL, NULL, NULL, 2, 0, 0, 5, 0, 2, 0, 0, 0, 4, 6, 0, 1, 5);
INSERT INTO spa VALUES (63, 53116, 'RSCH/ Bertrant', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 19.16512, -72.63600, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (64, 53116, 'RSCH/ Bertrant', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Marc', 19.16512, -72.63600, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (65, 53201, 'Albert Schweitzer', 'Hopital', 'Prive sans but lucratif', 'Artibonite', 'Verrettes', 19.07448, -72.49139, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2, 131, 3, 1, 15, 2, 5, 2, 6, 7, 0, 2, 0, 1, 0, 50, 25, 1, 1, 3);
INSERT INTO spa VALUES (66, 53203, 'Bastien', 'Centre de sante sans lit', 'Prive a but lucratif', 'Artibonite', 'Verrettes', 19.04585, -72.52415, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 0, 1, 0);
INSERT INTO spa VALUES (67, 53203, 'Bastien', 'Centre de sante sans lit', 'Prive a but lucratif', 'Artibonite', 'Verrettes', 19.04585, -72.52415, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 0, 1, 0);
INSERT INTO spa VALUES (68, 53204, 'Desarmes', 'Centre de sante sans lit', 'Mixte', 'Artibonite', 'Verrettes', 18.99278, -72.38916, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 3, 0, 1, 0);
INSERT INTO spa VALUES (69, 53205, 'Deschapelles', 'Dispensaire', 'Prive sans but lucratif', 'Artibonite', 'Verrettes', 19.08180, -72.49523, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 6, 0, 0, 1);
INSERT INTO spa VALUES (70, 53206, 'Dumarsais Estime', 'Hopital', 'Publique', 'Artibonite', 'Verrettes', 19.05064, -72.46715, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 2, 35, 1, 1, 8, 2, 7, 0, 0, 1, 4, 3, 1, 0, 0, 5, 15, 0, 1, 5);
INSERT INTO spa VALUES (71, 53206, 'Dumarsais Estime', 'Hopital', 'Publique', 'Artibonite', 'Verrettes', 19.05064, -72.46715, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 2, 35, 1, 1, 8, 2, 7, 0, 0, 1, 4, 3, 1, 0, 0, 5, 15, 0, 1, 5);
INSERT INTO spa VALUES (72, 53207, 'Gabriel', 'Dispensaire', 'Prive sans but lucratif', 'Artibonite', 'Verrettes', 19.01589, -72.45949, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 8, 0, 0, 2);
INSERT INTO spa VALUES (73, 53208, 'Liancourt', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Artibonite', 'Verrettes', 19.12719, -72.53512, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4, 0, 0, 1);
INSERT INTO spa VALUES (74, 53208, 'Liancourt', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Artibonite', 'Verrettes', 19.12719, -72.53512, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4, 0, 0, 1);
INSERT INTO spa VALUES (75, 53209, 'Dispensaire Marin', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Verrettes', 19.02695, -72.42130, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (76, 53209, 'Dispensaire Marin', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Verrettes', 19.02695, -72.42130, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (77, 53301, 'La Chapelle', 'Centre de sante a lit', 'Mixte', 'Artibonite', 'La Chapelle', 18.91404, -72.31641, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 3, 3, 1, 3, 2, 1, 0, 0, 1, 1, 0, 0, 0, 0, 4, 5, 0, 0, 2);
INSERT INTO spa VALUES (78, 54101, 'Claire Heureuse', 'Hopital communautaire de reference', 'Mixte', 'Artibonite', 'Dessalines', 19.26321, -72.51625, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 33, 1, 1, 13, 2, 6, 0, 4, 6, 0, 1, 1, 0, 0, 15, 24, 1, 2, 6);
INSERT INTO spa VALUES (79, 54103, 'La Croix Missionaire', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.19361, -72.32925, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (80, 54104, 'Celio', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.16453, -72.36237, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (81, 54105, 'Niel', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.23449, -72.52742, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 998, 998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (82, 54106, 'Poste Pierrot', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.20401, -72.45701, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (83, 54107, 'Coupe a l?Inde', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.27893, -72.46634, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (84, 54108, 'Sanoix', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.22220, -72.58161, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (85, 54109, 'Deseaux', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.25654, -72.58216, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (86, 54110, 'Grande Hatte', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.14277, -72.43297, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES (87, 54111, 'Sanie Claire d?Assise', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Dessalines', 19.25917, -72.51613, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 2, NULL, 1, NULL, NULL, NULL, 1, 0, 0, 5, 0, 0, 0, 0, 0, 5, 5, 0, 0, 1);
INSERT INTO spa VALUES (88, 54112, 'Chenot', 'Dispensaire', 'Prive sans but lucratif', 'Artibonite', 'Dessalines', 19.15641, -72.32392, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 8, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (89, 54113, 'Oge', 'Dispensaire', 'Publique', 'Artibonite', 'Dessalines', 19.19762, -72.49395, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (90, 54114, 'Hatte Chevreau', 'Dispensaire', 'Mixte', 'Artibonite', 'Dessalines', 19.28820, -72.57913, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (91, 54115, 'Glenn Ebenezer', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Dessalines', 19.25883, -72.51018, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1);
INSERT INTO spa VALUES (92, 54116, 'Centre Medical Philomene Privenston', 'Centre de sante a lit', 'Prive a but lucratif', 'Artibonite', 'Dessalines', 19.20987, -72.48753, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 2, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 6, 3, 1, 2, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (93, 54201, 'Charles Colimon', 'Hopital communautaire de reference', 'Prive a but lucratif', 'Artibonite', 'Petite-Riviere', 19.12145, -72.47514, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 56, 1, 1, 22, 4, 3, 0, 1, 6, 0, 1, 0, 0, 0, 12, 30, 2, 1, 5);
INSERT INTO spa VALUES (94, 54203, 'Mauger (NF)', 'Dispensaire', 'Publique', 'Artibonite', 'Petite-Riviere', 19.16106, -72.56587, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES (95, 54204, '-', 'Dispensaire', 'Mixte', 'Artibonite', 'Petite-Riviere', 18.94788, -72.31425, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1);
INSERT INTO spa VALUES (96, 54205, 'Perodin (NF)', 'Dispensaire', 'Prive sans but lucratif', 'Artibonite', 'Petite-Riviere', 19.10753, -72.30139, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 0, 0, 1);
INSERT INTO spa VALUES (97, 54206, 'Plassac', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Artibonite', 'Petite-Riviere', 19.06127, -72.40515, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 2, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (98, 54207, 'Savanne a Roche', 'Dispensaire', 'Mixte', 'Artibonite', 'Petite-Riviere', 19.01179, -72.36694, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 3, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (99, 54209, 'Jean Denis', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Petite-Riviere', 19.18477, -72.54282, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 6, 2, 1, 6, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 7, 2, 0, 1);
INSERT INTO spa VALUES (100, 54301, 'Drouin', 'Centre de sante a lit', 'Publique', 'Artibonite', 'Grande-Saline', 19.25611, -72.68971, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 6, 3, 1, 2, 2, 2, 0, 1, 1, 0, 0, 0, 0, 0, 3, 4, 1, 0, 1);
INSERT INTO spa VALUES (101, 54303, 'Poteneau', 'Dispensaire', 'Publique', 'Artibonite', 'Grande-Saline', 19.23705, -72.64158, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1);
INSERT INTO spa VALUES (102, 54401, 'CSL St Pierre', 'Centre de sante a lit', 'Publique', 'Artibonite', 'Desdunes', 19.28415, -72.63476, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 3, 3, 1, 7, 2, 3, 0, 0, 1, 0, 0, 0, 0, 0, 2, 4, 0, 0, 0);
INSERT INTO spa VALUES (103, 54402, 'Dispensaire Descahos', 'Dispensaire', 'Publique', 'Artibonite', 'Desdunes', 19.30107, -72.65040, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (104, 54403, 'Dispensaire Aux Sources', 'Dispensaire', 'Publique', 'Artibonite', 'Desdunes', 19.33012, -72.67570, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (105, 55101, 'Saint Michel de l?Attalaye', 'Centre de sante a lit', 'Publique', 'Artibonite', 'Saint-Michel-de-l-Attalaye', 19.37622, -72.33669, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 12, 1, 1, 4, 4, 1, 0, 0, 2, 2, 0, 0, 0, 0, 12, 6, 0, 0, 3);
INSERT INTO spa VALUES (106, 55102, 'Lalomas', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Michel-de-l-Attalaye', 19.39704, -72.28958, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (107, 55103, 'Marmont/Nan Paul', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Michel-de-l-Attalaye', 19.30707, -72.42919, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (108, 55104, 'Gade Baptiste', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Michel-de-l-Attalaye', 19.28778, -72.36296, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (109, 55105, 'Bas de Sault', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Michel-de-l-Attalaye', 19.43236, -72.33250, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 3, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (110, 55106, 'L?Ermite', 'Dispensaire', 'Publique', 'Artibonite', 'Saint-Michel-de-l-Attalaye', 19.25196, -72.29013, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (111, 55107, 'Camathe', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Artibonite', 'Saint-Michel-de-l-Attalaye', 19.41368, -72.37384, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 4, 3, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (112, 55201, 'CSL Marmelade', 'Centre de sante a lit', 'Publique', 'Artibonite', 'Marmelade', 19.51683, -72.36024, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 12, 3, 1, 3, 12, 4, 0, 0, 4, 0, 0, 0, 0, 0, 8, 10, 0, 0, 2);
INSERT INTO spa VALUES (113, 0, 'Dispensaire de La Pierre', 'Dispensaire', 'Publique', 'Artibonite', 'Gonaives', 19.46245, -72.76918, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (114, 0, 'Centre de Sante communautaire de Corridor', 'Centre de sante sans lit', 'Publique', 'Artibonite', 'Anse-Rouge', 19.56004, -72.90109, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (115, 0, 'SOSAKA', 'Centre de sante a lit', 'Publique', 'Artibonite', 'L-Estere', 19.32866, -72.64793, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (116, 0, 'Dispensaire Notre Dame', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Gros-Morne', 19.70158, -72.63025, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (117, 0, 'Centre de Sante de Poteau', 'Centre de sante sans lit', 'Mixte', 'Artibonite', 'Gonaives', 19.51463, -72.62217, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 2, 1, 1, 1, 0, 2, NULL, 3, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (118, 0, 'Centre de Sante de Anse rouge', 'Centre de sante a lit', 'Publique', 'Artibonite', 'Anse-Rouge', 19.63465, -73.05607, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 8, 1, 1, 4, 2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 3, 2, 0, 0, 0);
INSERT INTO spa VALUES (119, 0, 'Centre de Sante Illodep', 'Centre de sante sans lit', 'Publique', 'Artibonite', 'Anse-Rouge', 19.60060, -72.95395, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0);
INSERT INTO spa VALUES (120, 0, 'Dispensaire Cante', 'Dispensaire', 'Publique', 'Artibonite', 'Anse-Rouge', 19.71731, -72.94541, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, NULL, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES (121, 0, 'Dispensaire communautaire de Dupuy', 'Dispensaire', 'Prive a but lucratif', 'Artibonite', 'Gros-Morne', 19.72528, -72.70264, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (122, 0, 'CDS de Haute Feuille', 'Centre de sante a lit', 'Publique', 'Artibonite', 'Dessalines', 19.27029, -72.57496, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 5, 3, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 0, 1, 0);
INSERT INTO spa VALUES (123, 0, 'CDS de Basse Cobaille', 'Centre de sante sans lit', 'Prive a but lucratif', 'Artibonite', 'Dessalines', 19.22152, -72.39438, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (124, 0, 'Dispensaire New Mission', 'Dispensaire', 'Prive sans but lucratif', 'Artibonite', 'Saint-Michel-de-l-Attalaye', 19.33437, -72.47304, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (125, 0, 'Centre medical Choeur Vickie', 'Centre de sante sans lit', 'Prive a but lucratif', 'Artibonite', 'Petite-Riviere', 19.15744, -72.52936, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES (126, 0, 'CDS de Grand Bois', 'Centre de sante a lit', 'Publique', 'Artibonite', 'Dessalines', 19.20564, -72.50000, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (127, 0, 'CDS de Bois Mary', 'Centre de sante a lit', 'Publique', 'Artibonite', 'Dessalines', 19.23567, -72.47328, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 6, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 4, 0, 0, 0);
INSERT INTO spa VALUES (128, 61100, 'Hopital Sainte Therese', 'Hopital departemental', 'Publique', 'Centre', 'Hinche', 19.13806, -72.01399, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 200, 1, 1, 30, 5, 14, 1, 7, 12, 3, 2, 0, 0, 1, 10, 80, 4, 2, 11);
INSERT INTO spa VALUES (129, 61101, 'Centre de Sante de Marmont', 'Centre de sante sans lit', 'Publique', 'Centre', 'Hinche', 19.06304, -71.98393, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 10, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 3, 3, 1, 1, 2);
INSERT INTO spa VALUES (130, 61102, 'Dispensaire la Belle Onde', 'Dispensaire', 'Publique', 'Centre', 'Hinche', 19.17133, -72.05783, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (131, 61104, 'Dispensaire des Abricots', 'Dispensaire', 'Prive a but lucratif', 'Centre', 'Hinche', 19.06268, -72.08307, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (132, 61105, 'Dispensaire de Los Palis', 'Dispensaire', 'Mixte', 'Centre', 'Hinche', 19.14170, -71.94004, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 1, 3, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES (133, 61106, 'Clinique de l?incarnation de Pandiasou', 'Centre de sante a lit', 'Prive sans but lucratif', 'Centre', 'Hinche', 19.12700, -72.05719, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 2, 15, 3, 1, 15, 2, 3, 0, 0, 2, 0, 0, 0, 0, 0, 2, 4, 0, 0, 0);
INSERT INTO spa VALUES (134, 61107, 'Dispensaire Withney Clinic', 'Centre de sante sans lit', 'Publique', 'Centre', 'Hinche', 19.14257, -72.01571, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0, 1);
INSERT INTO spa VALUES (135, 61108, 'Dispensaire de Basin Zim', 'Dispensaire', 'Publique', 'Centre', 'Hinche', 19.21315, -71.97984, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (136, 61201, 'Centre de Sante sans Lit de Maissade', 'Centre de sante a lit', 'Publique', 'Centre', 'Maissade', 19.17663, -72.13751, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 10, 1, 2, 6, 6, 6, 0, 0, 2, 0, 0, 0, 0, 0, 4, 9, 0, 0, 0);
INSERT INTO spa VALUES (137, 61202, 'Dispensaire de Bois Rouge', 'Dispensaire', 'Publique', 'Centre', 'Maissade', 19.10584, -72.20007, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (138, 61203, 'Dispensaire Ossenande', 'Dispensaire', 'Publique', 'Centre', 'Maissade', 19.23711, -72.17224, 1, 1, 1, 1, 1, 0, 0, 1, 1, 2, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0);
INSERT INTO spa VALUES (139, 61204, 'Dispensaire de Selpetre', 'Centre de sante sans lit', 'Publique', 'Centre', 'Maissade', 19.15108, -72.16618, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0);
INSERT INTO spa VALUES (140, 61205, 'Dispensaire Cinquieme', 'Dispensaire', 'Publique', 'Centre', 'Maissade', 19.20842, -72.22638, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (141, 61206, 'Dispensaire Madame Joie', 'Dispensaire', 'Publique', 'Centre', 'Maissade', 19.16703, -72.22233, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (142, 61301, 'Centre de Sante de Thomonde', 'Centre de sante a lit', 'Mixte', 'Centre', 'Thomonde', 19.02617, -71.96961, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 2, 4, 3, 1, 6, 1, 5, 0, 0, 3, 2, 2, 0, 0, 0, 6, 12, 1, 2, 1);
INSERT INTO spa VALUES (143, 61401, 'Centre de Sante de Cerca Cavajal', 'Centre de sante a lit', 'Publique', 'Centre', 'Cerca-Cavajal', 19.27077, -71.94244, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, 14, 3, 1, 3, 7, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 1);
INSERT INTO spa VALUES (144, 62101, 'Dispensaire de Sarazin', 'Dispensaire', 'Publique', 'Centre', 'Mirebalais', 18.79798, -72.00098, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (145, 62102, 'Hopital Eye Care de Mirbalais', 'Hopital communautaire de reference', 'Publique', 'Centre', 'Mirebalais', 18.83702, -72.11341, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 2, 17, 1, 1, 7, 2, 5, 5, 9, 9, 0, 2, 0, 0, 0, 8, 7, 0, 2, 0);
INSERT INTO spa VALUES (146, 62103, 'Clinique Mennonite(NF)', 'Centre de sante sans lit', 'Publique', 'Centre', 'Mirebalais', 18.83439, -72.09959, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 2, 0, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (147, 62104, 'Dispensaire Marche Canard (NF)', 'Dispensaire', 'Publique', 'Centre', 'Mirebalais', 18.77555, -72.03218, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (148, 62106, 'Dispensaire Decaussiere', 'Dispensaire', 'Publique', 'Centre', 'Mirebalais', 18.70385, -72.15300, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (149, 62201, 'Centre de Sante sans Lit de Saut d?Eau', 'Centre de sante sans lit', 'Publique', 'Centre', 'Saut-d-Eau', 18.81638, -72.19740, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 1, 3, 2, 4, 2, 2, 0, 0, 1, 0, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (150, 62301, 'Centre de Sante St Michel de Boucan Carre', 'Centre de sante a lit', 'Mixte', 'Centre', 'Boucan-Carre', 18.91920, -72.14030, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 8, 1, 1, 6, 2, 2, 0, 0, 3, 1, 2, 0, 0, 0, 5, 11, 0, 1, 4);
INSERT INTO spa VALUES (151, 62302, 'Centre de Sante Sans Lits Saint EsPrivet', 'Centre de sante a lit', 'Mixte', 'Centre', 'Boucan-Carre', 18.91547, -72.08448, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, 9, 3, 1, 3, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (152, 63101, 'Hopital ital  de Lascaobas', 'Hopital communautaire de reference', 'Mixte', 'Centre', 'Lascaobas', 18.81012, -71.94911, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 2, 52, 1, NULL, NULL, NULL, 4, 0, 1, 3, 6, 2, 0, 0, 1, 8, 0, 0, 1, 0);
INSERT INTO spa VALUES (153, 63104, 'Dispensaire Caste (NF)', 'Centre de sante sans lit', 'Publique', 'Centre', 'Lascahobas', 18.93535, -71.90725, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 6, 1, 2, 6, 6, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0);
INSERT INTO spa VALUES (154, 63201, 'Hopital Notre Dame de la Nativite', 'Hopital communautaire de reference', 'Publique', 'Centre', 'Belladere', 18.86752, -71.76179, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 26, 3, 1, 12, 2, 9, 0, 1, 2, 3, 3, 0, 1, 0, 4, 17, 1, 1, 4);
INSERT INTO spa VALUES (155, 63202, 'Dispensaire de Croix de fer (NF)', 'Dispensaire', 'Prive a but lucratif', 'Centre', 'Belladere', 18.85414, -71.81529, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (156, 63203, 'Dispensaire de Roy Sec', 'Dispensaire', 'Publique', 'Centre', 'Belladere', 18.89276, -71.83862, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, 3, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (157, 63204, 'Centre de Sante de Baptiste', 'Centre de sante a lit', 'Publique', 'Centre', 'Belladere', 18.79814, -71.78324, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 4, 3, 1, 3, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (158, 63301, 'Centre de Sante de Savanette', 'Centre de sante sans lit', 'Mixte', 'Centre', 'Savanette', 18.74496, -71.82180, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 3, 3, 1, 3, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0);
INSERT INTO spa VALUES (159, 63302, 'Dispensaire de Colombier', 'Dispensaire', 'Mixte', 'Centre', 'Savanette', 18.74500, -71.82100, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (160, 64101, 'Centre de Sante de Cerca La Source', 'Centre de sante a lit', 'Mixte', 'Centre', 'Cerca-la-Source', 19.16312, -71.78990, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 20, 1, 1, 3, 3, 4, 0, 0, 3, 2, 2, 1, 0, 0, 4, 14, 1, 1, 4);
INSERT INTO spa VALUES (161, 64102, 'Dispensaire de Saltadere (NF)', 'Dispensaire', 'Prive sans but lucratif', 'Centre', 'Cerca-la-Source', 19.13385, -71.73240, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 2, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 2, 0, 1);
INSERT INTO spa VALUES (162, 64105, 'Centre de Sante de Tilory', 'Centre de sante a lit', 'Publique', 'Centre', 'Cerca-la-Source', 19.23182, -71.68213, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 7, 1, 1, 0, 0, 2, 0, 0, 1, 0, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (163, 64201, 'Dispensaire de Boc Banic', 'Dispensaire', 'Publique', 'Centre', 'Thomassique', 19.05107, -71.75060, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES (191, 82102, 'SSPE de Mandou', 'Dispensaire', 'Publique', 'Grand Anse', 'Anse-d-Hainault', 18.44134, -74.44920, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (164, 64202, 'Clinique St Joseph de Thomassique', 'Centre de sante a lit', 'Prive sans but lucratif', 'Centre', 'Thomassique', 19.08651, -71.82861, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 2, 15, 3, 1, 3, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 4, 1, 3, 1, 1);
INSERT INTO spa VALUES (165, 0, 'Centre de Sante ODECOM', 'Centre de sante sans lit', 'Mixte', 'Centre', 'Mirebalais', 18.82753, -72.10664, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 3, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1);
INSERT INTO spa VALUES (166, 0, 'Hopital Universitaire de Mirebalais', 'Hopital universitaire', 'Publique', 'Centre', 'Mirebalais', 18.83597, -72.11669, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 66, 1, 1, 11, 12, 12, 0, 13, 14, 0, 5, 5, 0, 0, 50, 54, 10, 2, 5);
INSERT INTO spa VALUES (167, 0, 'Centre de Sante Caritas', 'Centre de sante sans lit', 'Mixte', 'Centre', 'Mirebalais', 18.75921, -72.13784, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 2, 1, 0, 1);
INSERT INTO spa VALUES (168, 0, 'Dispensaire Ste famille', 'Dispensaire', 'Prive a but lucratif', 'Centre', 'Cerca-Cavajal', 19.27070, -71.94081, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 1, 2, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0);
INSERT INTO spa VALUES (169, 0, 'Centre de Sante Abricot', 'Dispensaire', 'Prive a but lucratif', 'Centre', 'Hinche', 19.08327, -72.12851, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (170, 0, 'Centre de Sante Coup[e madigras', 'Centre de sante sans lit', 'Mixte', 'Centre', 'Saut-d-Eau', 18.80716, -72.26831, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES (171, 0, 'Centre Sante Fanm', 'Centre de sante a lit', 'Mixte', 'Centre', 'Lascahobas', 18.83092, -71.93568, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 2, 998, 3, 1, 20, 14, 0, 0, 1, 4, 4, 0, 0, 0, 0, 3, 4, 1, 1, 2);
INSERT INTO spa VALUES (172, 0, 'Centre de Sante mount Gold', 'Centre de sante sans lit', 'Prive a but lucratif', 'Centre', 'Lascahobas', 18.85203, -71.91228, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0);
INSERT INTO spa VALUES (173, 81100, 'Hopital Saint Antoine', 'Hopital communautaire de reference', 'Publique', 'Grand Anse', 'Jeremie', 18.64595, -74.11749, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 75, 3, 1, 27, 4, 15, 3, 3, 13, 0, 1, 1, 0, 0, 47, 21, 3, 2, 0);
INSERT INTO spa VALUES (174, 81101, 'Haitian Health Foundation', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Grand Anse', 'Jeremie', 18.64082, -74.12246, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 2, NULL, 1, NULL, NULL, NULL, 3, 0, 1, 3, 0, 2, 0, 1, 0, 16, 11, 0, 2, 0);
INSERT INTO spa VALUES (175, 81102, 'Centre medico social de Gebeau', 'Centre de sante sans lit', 'Mixte', 'Grand Anse', 'Jeremie', 18.62249, -74.11193, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 7, 1, NULL, NULL, NULL, 2, 0, 1, 2, 0, 1, 0, 0, 1, 4, 2, 0, 1, 0);
INSERT INTO spa VALUES (176, 81103, 'Sainte Therese de l?Enfant Jesus', 'Dispensaire', 'Mixte', 'Grand Anse', 'Jeremie', 18.63572, -74.18617, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 2);
INSERT INTO spa VALUES (177, 81104, 'Notre Dame du Perpetuel Secours de Latiboliere', 'Dispensaire', 'Mixte', 'Grand Anse', 'Jeremie', 18.59535, -74.13793, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (178, 81105, 'Siloe de Leon', 'Dispensaire', 'Publique', 'Grand Anse', 'Jeremie', 18.54573, -74.11150, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 2, NULL, 3, 2, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1, 0);
INSERT INTO spa VALUES (179, 81106, 'SSPE de Mackandal', 'Dispensaire', 'Publique', 'Grand Anse', 'Jeremie', 18.64744, -74.11556, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1);
INSERT INTO spa VALUES (180, 81107, 'SSPE de Marfranc', 'Dispensaire', 'Publique', 'Grand Anse', 'Jeremie', 18.58721, -74.20901, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0);
INSERT INTO spa VALUES (181, 81108, 'Notre Dame de l?Assomption de Numero deux', 'Dispensaire', 'Mixte', 'Grand Anse', 'Jeremie', 18.66334, -74.15837, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (182, 81109, 'Bon Pasteur de Previle', 'Centre de sante a lit', 'Mixte', 'Grand Anse', 'Jeremie', 18.53653, -74.15766, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 5, 3, 1, 1, 3, 0, 0, 0, 1, 2, 0, 0, 0, 0, 3, 2, 0, 0, 1);
INSERT INTO spa VALUES (183, 81110, 'Centre Immacule Conception de Ste Helene', 'Centre de sante sans lit', 'Mixte', 'Grand Anse', 'Jeremie', 18.63749, -74.11212, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 2, 0, 0, 0, 0, 0, 4, 5, 0, 0, 1);
INSERT INTO spa VALUES (184, 81202, 'Centre de Sante Leon Coicou', 'Centre de sante sans lit', 'Mixte', 'Grand Anse', 'Abricots', 18.64764, -74.27798, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 1, 2, 1, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 3, 1, 0, 0, 2);
INSERT INTO spa VALUES (185, 81203, 'SSPE St Joseph', 'Centre de sante sans lit', 'Publique', 'Grand Anse', 'Abricots', 18.64855, -74.30701, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 2, 2, 3, 1, 2, 2, 2, 0, 0, 1, 0, 0, 0, 0, 0, 2, 7, 1, 0, 1);
INSERT INTO spa VALUES (186, 81301, 'Chemen La vi de Bonbon', 'Dispensaire', 'Publique', 'Grand Anse', 'Bonbon', 18.66510, -74.24478, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 0, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (187, 81401, 'Centre de Sante de Moron', 'Centre de sante sans lit', 'Publique', 'Grand Anse', 'Moron', 18.55974, -74.25906, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 5, 3, 1, 5, 2, 1, 0, 0, 1, 0, 0, 0, 0, 0, 5, 2, 0, 0, 1);
INSERT INTO spa VALUES (188, 81403, 'Notre Dame de Lourdes de Moron', 'Dispensaire', 'Prive a but lucratif', 'Grand Anse', 'Moron', 18.55964, -74.25614, 2, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (189, 81501, 'Centre de Sante de Chambellan', 'Centre de sante sans lit', 'Publique', 'Grand Anse', 'Chambellan', 18.55076, -74.31316, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 4, 0, 0, 0);
INSERT INTO spa VALUES (190, 81502, 'SSPE de Bourdon', 'Dispensaire', 'Publique', 'Grand Anse', 'Chambellan', 18.48986, -74.35039, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (192, 82104, 'Dispensaire de Sainte Helene', 'Dispensaire', 'Prive a but lucratif', 'Grand Anse', 'Anse-d-Hainault', 18.48426, -74.45130, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (193, 82105, 'Centre de Sante Iceus Picard', 'Dispensaire', 'Mixte', 'Grand Anse', 'Anse-d-Hainault', 18.48882, -74.37396, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (194, 82106, 'CDI', 'Hopital departemental', 'Publique', 'Grand Anse', 'Anse-d-Hainault', 18.48989, -74.45417, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 2, 998, 3, 1, 5, 998, 4, 1, 7, 4, 0, 0, 0, 0, 0, 10, 3, 0, 0, 2);
INSERT INTO spa VALUES (195, 82201, 'Hopital ital de la Communaute Dame-Marienne', 'Hopital communautaire de reference', 'Mixte', 'Grand Anse', 'Dame-Marie', 18.56016, -74.42121, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 2, 13, 3, 1, 2, 2, 3, 0, 3, 4, 0, 0, 0, 0, 0, 11, 11, 0, 0, 2);
INSERT INTO spa VALUES (196, 82203, 'Sainte Anne de Bariadelle', 'Dispensaire', 'Publique', 'Grand Anse', 'Dame-Marie', 18.51679, -74.44123, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 1);
INSERT INTO spa VALUES (197, 82205, 'Saint Michel de Desormeaux', 'Dispensaire', 'Publique', 'Grand Anse', 'Dame-Marie', 18.54532, -74.36555, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (198, 82301, 'Sant sante espwa AFSC/Irois', 'Centre de sante a lit', 'Publique', 'Grand Anse', 'Les Irois', 18.40626, -74.44985, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 5, 3, 2, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 1, 0, 0, 1);
INSERT INTO spa VALUES (199, 82302, 'Dispensaire Carcasse', 'Dispensaire', 'Mixte', 'Grand Anse', 'Les Irois', 18.37252, -74.44750, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (200, 83105, 'Hopital ital de Corail', 'Hopital communautaire de reference', 'Publique', 'Grand Anse', 'Corail', 18.56759, -73.89263, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 27, 3, 1, 3, 3, 3, 1, 1, 2, 0, 1, 0, 0, 0, 3, 3, 1, 0, 1);
INSERT INTO spa VALUES (201, 83201, 'Bon Samaritain des Roseaux', 'Dispensaire', 'Mixte', 'Grand Anse', 'Roseaux', 18.59915, -74.01580, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (202, 83202, 'SSPE de Carrefour Charles', 'Centre de sante sans lit', 'Mixte', 'Grand Anse', 'Roseaux', 18.53634, -73.99961, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 3, 3, 1, 4, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (203, 83203, 'Saint Antoine de Padoue de Lopino', 'Dispensaire', 'Mixte', 'Grand Anse', 'Roseaux', 18.50923, -74.06231, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 3, 3, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0);
INSERT INTO spa VALUES (204, 83301, 'CAL Sainte Agnes Citimed de Beaumont', 'Centre de sante a lit', 'Mixte', 'Grand Anse', 'Beaumont', 18.47157, -73.94288, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 10, 2, 1, 10, 2, 1, 0, 1, 1, 0, 0, 0, 0, 0, 5, 7, 0, 0, 1);
INSERT INTO spa VALUES (205, 83303, 'Dispensaire la Providence', 'Dispensaire', 'Publique', 'Grand Anse', 'Beaumont', 18.47833, -73.95889, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1);
INSERT INTO spa VALUES (206, 83401, 'Centre de Sante de Pestel', 'Centre de sante a lit', 'Publique', 'Grand Anse', 'Pestel', 18.54120, -73.79931, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 2, 6, 3, 1, 1, 2, 2, 0, 0, 2, 0, 0, 0, 0, 0, 5, 3, 0, 2, 0);
INSERT INTO spa VALUES (207, 83403, 'SSPE de Duchity', 'Dispensaire', 'Publique', 'Grand Anse', 'Pestel', 18.43507, -73.90110, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (208, 83404, 'SSPE Espwa de Pointe Sable', 'Dispensaire', 'Mixte', 'Grand Anse', 'Pestel', 18.60687, -73.79512, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (209, 83406, 'Centre de Sante de Tozia', 'Dispensaire', 'Publique', 'Grand Anse', 'Pestel', 18.45842, -73.87502, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (210, 0, 'Dispensaire de Boucan', 'Dispensaire', 'Publique', 'Grand Anse', 'Chambellan', 18.51902, -74.35903, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (211, 0, 'Dispensaire de Detail', 'Dispensaire', 'Publique', 'Grand Anse', 'Pestel', 18.47864, -73.85751, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (212, 0, 'Dispensaire Jean Bellune', 'Dispensaire', 'Prive a but lucratif', 'Grand Anse', 'Pestel', 18.47847, -73.78251, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (213, 0, 'Dispensaire Berluce', 'Dispensaire', 'Publique', 'Grand Anse', 'Chambellan', 18.52421, -74.33189, 0, 0, 1, 1, 1, 0, 0, 1, 2, 2, 0, 0, 0, 1, 1, 0, 2, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (214, 75401, 'Baraderes', 'Centre de sante a lit', 'Publique', 'Nippes', 'Baraderes', 18.47225, -73.65751, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 6, 3, 1, 2, 6, 1, 0, 0, 2, 0, 0, 0, 0, 0, 6, 4, 0, 0, 0);
INSERT INTO spa VALUES (215, 101100, 'Hopital Sainte Therese', 'Hopital departemental', 'Publique', 'Nippes', 'Miragoane', 18.44247, -73.09493, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 40, 1, 1, 19, 3, 11, 0, 7, 8, 0, 3, 0, 3, 0, 26, 23, 2, 2, 0);
INSERT INTO spa VALUES (216, 101101, 'SSPE de Beraca', 'Centre de sante sans lit', 'Mixte', 'Nippes', 'Miragoane', 18.43349, -73.07122, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (217, 101102, 'SSPE de Chalon', 'Dispensaire', 'Mixte', 'Nippes', 'Miragoane', 18.40970, -73.09303, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (218, 101103, 'SSPE de Lhomond', 'Dispensaire', 'Mixte', 'Nippes', 'Miragoane', 18.35427, -73.09050, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (219, 101104, 'SSPE de Belle Riviere', 'Dispensaire', 'Mixte', 'Nippes', 'Miragoane', 18.32273, -73.06328, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (220, 101105, 'SSPE de Labrousse', 'Centre de sante a lit', 'Mixte', 'Nippes', 'Miragoane', 18.32125, -73.01094, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 10, 3, 1, 3, 3, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0);
INSERT INTO spa VALUES (221, 101106, 'SSPE de St Michel du Sud', 'Dispensaire', 'Prive a but lucratif', 'Nippes', 'Miragoane', 18.37359, -73.11436, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (222, 101201, 'CAL de Madian', 'Centre de sante a lit', 'Mixte', 'Nippes', 'Petite-Riviere', 18.48279, -73.20675, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (223, 101202, 'Clinic de la Visitation', 'Centre de sante sans lit', 'Mixte', 'Nippes', 'Petite-Riviere', 18.47569, -73.22266, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 1, 3, 1, 1, 1, 0, 0, 1, 2, 0, 0, 0, 0, 0, 3, 2, 0, 1, 1);
INSERT INTO spa VALUES (224, 101203, 'SSPE de Petite Riviere', 'Dispensaire', 'Publique', 'Nippes', 'Petite-Riviere', 18.47693, -73.24321, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (225, 101302, 'CAL de Bethel de L-Armee Du Salut', 'Centre de sante a lit', 'Prive a but lucratif', 'Nippes', 'Fonds-des-Negres', 18.36090, -73.23108, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 2, 28, 1, 2, 4, 2, 3, 0, 2, 0, 0, 0, 0, 0, 0, 10, 15, 0, 1, 0);
INSERT INTO spa VALUES (226, 101303, 'SSPE Ste Catherine de Bouzy', 'Dispensaire', 'Mixte', 'Nippes', 'Fonds-des-Negres', 18.37267, -73.29253, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1);
INSERT INTO spa VALUES (227, 101401, 'CAL de Paillant', 'Centre de sante a lit', 'Publique', 'Nippes', 'Paillant', 18.41901, -73.14485, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 11, 3, 1, 2, 3, 3, 0, 0, 3, 0, 0, 0, 0, 0, 4, 4, 1, 0, 0);
INSERT INTO spa VALUES (228, 101402, 'SSPE de Mussotte', 'Dispensaire', 'Publique', 'Nippes', 'Paillant', 18.42207, -73.19819, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (229, 101403, 'SSPE de Jeannette', 'Dispensaire', 'Mixte', 'Nippes', 'Paillant', 18.39852, -73.14790, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (230, 102101, 'CAL Jules Fleury', 'Hopital communautaire de reference', 'Publique', 'Nippes', 'Anse-a-Veau', 18.50379, -73.34205, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 4, 1, 1, 4, 2, 3, 0, 2, 3, 0, 0, 0, 0, 0, 8, 3, 0, 1, 2);
INSERT INTO spa VALUES (231, 102102, 'SSPE de Saint Yves de Sault du Baril', 'Dispensaire', 'Mixte', 'Nippes', 'Anse-a-Veau', 18.43611, -73.27837, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (232, 102103, 'SSPE de Javel', 'Dispensaire', 'Mixte', 'Nippes', 'Anse-a-Veau', 18.42232, -73.26927, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (233, 102201, 'CAL de Petit Trou', 'Centre de sante a lit', 'Publique', 'Nippes', 'Petit-Goave', 18.52734, -73.50971, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 6, 3, 1, 2, 3, 2, 0, 0, 2, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0);
INSERT INTO spa VALUES (234, 102301, 'CAL de L-Asile', 'Hopital communautaire de reference', 'Publique', 'Nippes', 'L-Asile', 18.37971, -73.41818, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 30, 3, 1, 8, 2, 3, 1, 3, 3, 0, 1, 0, 0, 0, 8, 4, 0, 0, 0);
INSERT INTO spa VALUES (235, 102302, 'SSPE de Morisseaux', 'Dispensaire', 'Publique', 'Nippes', 'L-Asile', 18.38982, -73.35727, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (236, 102304, 'SSPE de Changieux', 'Dispensaire', 'Publique', 'Nippes', 'L-Asile', 18.37274, -73.52960, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (237, 102401, 'SSPE d-Arnaud', 'Centre de sante sans lit', 'Publique', 'Nippes', 'Arnaud', 18.44682, -73.38851, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 2, 2, 3, 1, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (238, 102501, 'CAL de Plaisance', 'Centre de sante a lit', 'Mixte', 'Nippes', 'Plaisance', 18.43189, -73.59058, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 2, 10, 3, 1, 10, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 5, 0, 0, 1);
INSERT INTO spa VALUES (239, 102502, 'SSPE de Gauthier Civil (F)', 'Dispensaire', 'Publique', 'Nippes', 'Plaisance', 18.44863, -73.54218, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (240, 103201, 'SSPE de Grand Boucan', 'Dispensaire', 'Publique', 'Nippes', 'Grand-Boucan', 18.55408, -73.59059, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 2, 3, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (241, 0, 'Dispensaire Ste Elisabeth de Fond Tortue', 'Dispensaire', 'Mixte', 'Nippes', 'Baraderes', 18.46423, -73.70026, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 5, 3, 1, 2, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (242, 0, 'Centre Materno infantil de Miragoane', 'Centre de sante sans lit', 'Prive a but lucratif', 'Nippes', 'Miragoane', 18.43950, -73.08051, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO spa VALUES (243, 31100, 'Hopital Justinien', 'Hopital universitaire', 'Publique', 'Nord', 'Cap-Haitien', 19.76279, -72.20621, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 200, 3, 1, 48, 4, 10, 4, 24, 21, 0, 4, 0, 0, 0, 102, 14, 4, 2, 12);
INSERT INTO spa VALUES (244, 31101, 'CDS La Fossette', 'Centre de sante sans lit', 'Mixte', 'Nord', 'Cap-Haitien', 19.75355, -72.20569, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 2, NULL, NULL, NULL, 2, 0, 1, 6, 0, 0, 0, 0, 0, 12, 6, 0, 0, 1);
INSERT INTO spa VALUES (245, 31102, 'Fort St Michel', 'Hopital communautaire de reference', 'Mixte', 'Nord', 'Cap-Haitien', 19.74107, -72.19413, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 6, 3, 1, 11, 2, 6, 1, 1, 8, 0, 1, 0, 0, 0, 16, 8, 3, 0, 1);
INSERT INTO spa VALUES (246, 31103, 'Dispensaire Notre Dame de Lourdes de Carenage', 'Centre de sante sans lit', 'Mixte', 'Nord', 'Cap-Haitien', 19.76490, -72.19734, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 1, NULL, NULL, NULL, 2, 0, 0, 7, 0, 0, 0, 0, 0, 3, 2, 0, 0, 1);
INSERT INTO spa VALUES (247, 31104, 'Dispensaire de Labadie', 'Centre de sante sans lit', 'Publique', 'Nord', 'Cap-Haitien', 19.74900, -72.21900, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 2, 3, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (248, 31105, 'Dispensaire Sacre Coeur, Rue 2K', 'Dispensaire', 'Prive a but lucratif', 'Nord', 'Cap-Haitien', 19.75489, -72.20517, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 2, 0, 0, 0, 1, 0, 2, 2, 0, 0, 2);
INSERT INTO spa VALUES (249, 31106, 'Dispensaire Solano SA, Labadie', 'Dispensaire', 'Prive a but lucratif', 'Nord', 'Cap-Haitien', 19.78609, -72.24354, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (250, 31107, 'Dispensaire Notre Dame Ste Philomene', 'Dispensaire', 'Prive a but lucratif', 'Nord', 'Cap-Haitien', 19.74523, -72.21046, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (251, 31108, 'CSL Madeline', 'Centre de sante sans lit', 'Mixte', 'Nord', 'Cap-Haitien', 19.72518, -72.18171, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0);
INSERT INTO spa VALUES (252, 31109, 'CEMAD Petite Anse', 'Centre de sante a lit', 'Prive a but lucratif', 'Nord', 'Cap-Haitien', 19.73304, -72.18339, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0);
INSERT INTO spa VALUES (253, 31110, 'FOSREF, rue 16', 'Centre de sante sans lit', 'Prive a but lucratif', 'Nord', 'Cap-Haitien', 19.75951, -72.20018, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (254, 31111, 'Clinique Medico-Dentaire Saint Joseph', 'Centre de sante sans lit', 'Publique', 'Nord', 'Cap-Haitien', 19.75155, -72.20294, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (255, 31112, 'Dispensaire St Jean Bosco', 'Dispensaire', 'Mixte', 'Nord', 'Cap-Haitien', 19.73808, -72.22042, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 1, 2, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (256, 31201, 'Dispensaire de Quartier Morin', 'Centre de sante a lit', 'Publique', 'Nord', 'Quartier-Morin', 19.69748, -72.15776, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 7, 2, 1, 1, 2, 1, 0, 0, 1, 1, 1, 0, 0, 0, 8, 5, 1, 0, 1);
INSERT INTO spa VALUES (257, 31202, 'Dispensaire de Cadush', 'Dispensaire', 'Publique', 'Nord', 'Quartier-Morin', 19.64201, -72.18116, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (258, 31204, 'Dispensaire St Louis', 'Dispensaire', 'Mixte', 'Nord', 'Quartier-Morin', 19.69720, -72.15669, 2, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 2, 2, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (259, 31206, 'Grand Pre', 'Dispensaire', 'Publique', 'Nord', 'Quartier-Morin', 19.62256, -72.18527, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (260, 31207, 'CMB de Carrefour la Mort (Mission Baptiste)', 'Hopital communautaire de reference', 'Prive sans but lucratif', 'Nord', 'Quartier-Morin', 19.69895, -72.17751, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 2, 20, 1, 1, 21, 3, 5, 0, 7, 4, 2, 0, 0, 0, 0, 28, 7, 0, 0, 2);
INSERT INTO spa VALUES (261, 31301, 'Dispensaire de Limonade', 'Centre de sante sans lit', 'Publique', 'Nord', 'Limonade', 19.66947, -72.12608, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 3, 2, 1, 1, 2, 0, 0, 2, 0, 0, 0, 0, 0, 2, 2, 1, 0, 1);
INSERT INTO spa VALUES (262, 31302, 'Dispensaire Bord de mer Limonade', 'Dispensaire', 'Mixte', 'Nord', 'Limonade', 19.72751, -72.11913, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 1, 3, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0);
INSERT INTO spa VALUES (263, 31304, 'CSL Porte Ouverte de Bois de Lance', 'Centre de sante sans lit', 'Mixte', 'Nord', 'Limonade', 19.63364, -72.14612, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 2, 1, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 1, 1);
INSERT INTO spa VALUES (264, 31305, 'Centre de Sante St Charles', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Nord', 'Limonade', 19.67127, -72.12202, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 1, NULL, NULL, NULL, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (265, 32101, 'Nativite', 'Centre de sante sans lit', 'Mixte', 'Nord', 'Acul-du-Nord', 19.68327, -72.31919, 1, 1, 1, 1, 1, 2, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 3, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (266, 32102, 'Tovar', 'Centre de sante sans lit', 'Publique', 'Nord', 'Acul-du-Nord', 19.62522, -72.28806, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1);
INSERT INTO spa VALUES (267, 32104, 'Dispensaire de Pilatre', 'Dispensaire', 'Mixte', 'Nord', 'Acul-du-Nord', 19.70555, -72.32639, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (268, 32105, 'Dispensaire de Camp Louise', 'Dispensaire', 'Publique', 'Nord', 'Acul-du-Nord', 19.74756, -72.34786, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, NULL, 3, 2, 3, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (269, 32108, 'Dispensaire de la Bruyere', 'Centre de sante sans lit', 'Mixte', 'Nord', 'Acul-du-Nord', 19.63909, -72.30780, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 2, 0, 0, 1);
INSERT INTO spa VALUES (270, 32109, 'Centre Medical de Secours Chretien', 'Centre de sante sans lit', 'Publique', 'Nord', 'Acul-du-Nord', 19.66492, -72.31637, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 5, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0);
INSERT INTO spa VALUES (271, 32202, 'Dispensaire de Balan', 'Dispensaire', 'Mixte', 'Nord', 'Plaine-du-Nord', 19.72703, -72.29752, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES (272, 32203, 'Dispensaire de Morne Rouge', 'Dispensaire', 'Publique', 'Nord', 'Plaine-du-Nord', 19.71050, -72.26602, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (273, 32204, 'Dispensaire De Robillard', 'Dispensaire', 'Publique', 'Nord', 'Plaine-du-Nord', 19.61189, -72.26002, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (274, 32205, 'CSL Bethesda de Vaudreuil', 'Centre de sante sans lit', 'Mixte', 'Nord', 'Plaine-du-Nord', 19.72018, -72.25214, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 3, NULL, NULL, NULL, 3, 0, 0, 5, 0, 1, 0, 0, 0, 7, 2, 0, 2, 0);
INSERT INTO spa VALUES (275, 32206, 'St Fr.de Sales', 'Hopital communautaire de reference', 'Mixte', 'Nord', 'Plaine-du-Nord', 19.71829, -72.25224, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 2, 14, 1, 1, 5, 3, 7, 0, 1, 6, 0, 0, 0, 0, 0, 0, 10, 0, 0, 5);
INSERT INTO spa VALUES (276, 32207, 'Clin. Francois DUGUE', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Nord', 'Plaine-du-Nord', 19.70714, -72.27809, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 2, 0, 0, 0, 0, 0, 6, 4, 0, 0, 0);
INSERT INTO spa VALUES (277, 32208, 'CSL Jehova Jireh', 'Centre de sante sans lit', 'Mixte', 'Nord', 'Plaine-du-Nord', 19.67742, -72.27088, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 6, 3, NULL, NULL, NULL, 0, 0, 1, 2, 0, 0, 0, 0, 0, 2, 3, 0, 0, 2);
INSERT INTO spa VALUES (278, 32209, 'Centre Medico social de la Plaine du Nord', 'Centre de sante sans lit', 'Mixte', 'Nord', 'Plaine-du-Nord', 19.67691, -72.27032, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 3, 3, NULL, NULL, NULL, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 2);
INSERT INTO spa VALUES (279, 32301, 'CAL Sacre Coeur', 'Hopital', 'Prive a but lucratif', 'Nord', 'Milot', 19.61010, -72.20954, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 2, 120, 1, 1, 17, 5, 7, 3, 15, 16, 0, 2, 1, 0, 0, 100, 20, 4, 4, 8);
INSERT INTO spa VALUES (280, 32302, 'Dispensaire Carrefour des Peres', 'Dispensaire', 'Publique', 'Nord', 'Milot', 19.68479, -72.20547, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (281, 32303, 'Dispensaire de Thibault', 'Dispensaire', 'Mixte', 'Nord', 'Milot', 19.63320, -72.22721, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 4, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0);
INSERT INTO spa VALUES (282, 32305, 'La Providence de Lory', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Nord', 'Milot', 19.69761, -72.22615, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2);
INSERT INTO spa VALUES (283, 33101, 'CAL Grande Riviere du Nord', 'Hopital communautaire de reference', 'Publique', 'Nord', 'Grande-Riviere-du-Nord', 19.57904, -72.16997, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 24, 1, 1, 2, 2, 2, 0, 0, 5, 0, 1, 0, 0, 0, 10, 11, 1, 1, 0);
INSERT INTO spa VALUES (284, 33201, 'Dispensaire de Bahon', 'Centre de sante sans lit', 'Publique', 'Nord', 'Bahon', 19.46951, -72.11420, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 4, 3, 1, 4, 1, 0, 0, 0, 2, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0);
INSERT INTO spa VALUES (285, 33202, 'Dispensaire St Joseph', 'Dispensaire', 'Prive a but lucratif', 'Nord', 'Bahon', 19.47038, -72.11599, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 1, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (286, 34101, 'CSL de St Raphael', 'Centre de sante a lit', 'Publique', 'Nord', 'Saint-Raphael', 19.43769, -72.20059, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 15, 3, 1, 6, 3, 3, 0, 0, 2, 0, 0, 0, 0, 0, 12, 1, 0, 2, 0);
INSERT INTO spa VALUES (287, 34102, 'St Joseph', 'Dispensaire', 'Prive sans but lucratif', 'Nord', 'Saint-Raphael', 19.43643, -72.20038, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 4, 0, 0, 1);
INSERT INTO spa VALUES (288, 34201, 'CSL de Dondon', 'Centre de sante a lit', 'Publique', 'Nord', 'Dondon', 19.52671, -72.24458, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 2, 1, 1, 0, 1, 1, 1, 0, 2, 2, 3, 1, 2, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 2, 2, 0, 0, 2);
INSERT INTO spa VALUES (289, 34202, 'St Joseph', 'Dispensaire', 'Prive a but lucratif', 'Nord', 'Dondon', 19.52614, -72.24172, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 4, 0, 0, 1);
INSERT INTO spa VALUES (290, 34301, 'CSL de Ranquitte', 'Centre de sante a lit', 'Publique', 'Nord', 'Ranquitte', 19.41056, -72.08284, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 5, 3, 2, 3, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 3, 0, 0, 1);
INSERT INTO spa VALUES (291, 34302, 'Dispensaire Brenda West', 'Centre de sante sans lit', 'Publique', 'Nord', 'Ranquitte', 19.42033, -72.08705, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 1);
INSERT INTO spa VALUES (292, 34303, 'Dispensaire St Joseph ( Catholique)', 'Dispensaire', 'Publique', 'Nord', 'Ranquitte', 19.41298, -72.07846, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (293, 34401, 'Hopital Bienfaisance de Pignon', 'Hopital communautaire de reference', 'Publique', 'Nord', 'Pignon', 19.33974, -72.11900, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 100, 3, 1, 2, 6, 6, 0, 6, 6, 0, 3, 0, 2, 2, 11, 42, 1, 0, 3);
INSERT INTO spa VALUES (294, 34402, 'St Joseph', 'Dispensaire', 'Prive sans but lucratif', 'Nord', 'Pignon', 19.33618, -72.11417, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 2, 0, 0, 0, 0, 1, 1, 3, 0, 0, 2);
INSERT INTO spa VALUES (295, 34501, 'CSL La Victoire', 'Centre de sante a lit', 'Publique', 'Nord', 'La Victoire', 19.33792, -72.02396, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, 6, 3, 1, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0);
INSERT INTO spa VALUES (296, 35102, 'Dispensaire de Petit Bourg Borgne', 'Dispensaire', 'Publique', 'Nord', 'Borgne', 19.80793, -72.57254, 1, 1, 1, 1, 1, 2, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 1, 0);
INSERT INTO spa VALUES (297, 35104, 'Alliance Sante Borgne', 'Centre de sante a lit', 'Mixte', 'Nord', 'Borgne', 19.83896, -72.51506, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 16, 3, 1, 7, 3, 6, 0, 0, 6, 0, 0, 0, 0, 0, 16, 5, 0, 2, 0);
INSERT INTO spa VALUES (298, 35201, 'CSL de Port Margot', 'Centre de sante sans lit', 'Prive a but lucratif', 'Nord', 'Port-Margot', 19.75106, -72.42945, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 2, 2, 0, 0, 0, 0, 0, 4, 3, 0, 0, 2);
INSERT INTO spa VALUES (299, 35202, 'Dispensaire Petit Bourg de Port-Margot', 'Centre de sante sans lit', 'Publique', 'Nord', 'Port-Margot', 19.72171, -72.44877, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (300, 35203, 'Dispensaire de Bayeux', 'Centre de sante sans lit', 'Mixte', 'Nord', 'Port-Margot', 19.80840, -72.43360, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, NULL, 3, 2, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 2, 0, 0, 1);
INSERT INTO spa VALUES (301, 35204, 'Dispensaire Malachy', 'Centre de sante sans lit', 'Mixte', 'Nord', 'Port-Margot', 19.75065, -72.42816, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 2, 5, 0, 0, 0, 0);
INSERT INTO spa VALUES (302, 35205, 'Dispensaire Wesleyen de Fauche', 'Centre de sante a lit', 'Prive sans but lucratif', 'Nord', 'Port-Margot', 19.73704, -72.43028, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 10, 3, 1, 2, 2, 1, 0, 1, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (303, 36101, 'St Jean de Limbe', 'Hopital communautaire de reference', 'Mixte', 'Nord', 'Limbe', 19.70738, -72.40183, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 2, 0, 3, 1, 3, 2, 5, 0, 1, 6, 0, 1, 0, 0, 0, 14, 13, 1, 1, 0);
INSERT INTO spa VALUES (304, 36102, 'Hopital Bon Samaritain', 'Hopital', 'Prive a but lucratif', 'Nord', 'Limbe', 19.69963, -72.40257, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 49, 1, 1, 14, 4, 2, 0, 1, 6, 2, 1, 0, 0, 0, 6, 14, 0, 1, 5);
INSERT INTO spa VALUES (305, 36103, 'Dispensaire de Camp Coq', 'Centre de sante sans lit', 'Publique', 'Nord', 'Limbe', 19.63352, -72.42586, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (306, 36104, 'Dispensaire Haut Limbe', 'Centre de sante a lit', 'Mixte', 'Nord', 'Limbe', 19.69876, -72.35651, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 0, 3, 2, 6, 5, 2, 0, 0, 4, 0, 0, 0, 0, 0, 2, 1, 0, 1, 0);
INSERT INTO spa VALUES (307, 36201, 'Dispensaire de Bas Limbe', 'Dispensaire', 'Publique', 'Nord', 'Bas-Limbe', 19.78021, -72.37974, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, NULL, 3, 2, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES (308, 36202, 'Centre Materno Infantile de Mont Carmel', 'Centre de sante sans lit', 'Prive a but lucratif', 'Nord', 'Bas-Limbe', 19.76785, -72.38338, 0, 0, 1, 0, 1, 0, 0, 1, 1, 2, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, 3, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1);
INSERT INTO spa VALUES (309, 37101, 'CMP Progressio', 'Hopital communautaire de reference', 'Prive a but lucratif', 'Nord', 'Plaisance', 19.59744, -72.46930, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 2, 34, 3, 1, 6, 2, 1, 0, 0, 3, 0, 0, 0, 0, 0, 1, 13, 0, 0, 1);
INSERT INTO spa VALUES (310, 37102, 'Dispensaire de Gobert', 'Dispensaire', 'Prive a but lucratif', 'Nord', 'Plaisance', 19.62971, -72.50612, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO spa VALUES (311, 37103, 'Dispensaire La Trouble', 'Dispensaire', 'Prive sans but lucratif', 'Nord', 'Plaisance', 19.56692, -72.44271, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, NULL, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES (312, 37104, 'Dispensaire St Henry de Puilboreau', 'Dispensaire', 'Mixte', 'Nord', 'Plaisance', 19.53903, -72.47298, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 5, 3, 2, 5, 5, 1, 0, 0, 2, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0);
INSERT INTO spa VALUES (313, 37202, 'Hopital Esperance de Pilate', 'Hopital departemental', 'Prive sans but lucratif', 'Nord', 'Pilate', 19.66872, -72.55049, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 2, 20, 1, 1, 8, 8, 7, 0, 1, 3, 5, 1, 0, 0, 0, 13, 20, 1, 2, 7);
INSERT INTO spa VALUES (314, 0, 'Centre de Sante medical Shela', 'Dispensaire', 'Prive a but lucratif', 'Nord', 'Cap-Haitien', 19.73833, -72.21316, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (315, 0, 'DASH', 'Hopital', 'Prive a but lucratif', 'Nord', 'Cap-Haitien', 19.76155, -72.20238, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 2, 13, 1, 1, 0, 0, 4, 1, 2, 4, 0, 2, 0, 0, 0, 12, 1, 0, 0, 0);
INSERT INTO spa VALUES (316, 0, 'Centre de Sante Sooking', 'Centre de sante sans lit', 'Mixte', 'Nord', 'Limonade', 19.65164, -72.08320, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES (317, 0, 'Dispensaire communautaire de Dondon', 'Dispensaire', 'Prive a but lucratif', 'Nord', 'Dondon', 19.53303, -72.24039, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0);
INSERT INTO spa VALUES (318, 0, 'C/S Divine Misericorde', 'Centre de sante a lit', 'Prive a but lucratif', 'Nord', 'Acul-du-Nord', 19.63617, -72.31113, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, 3, 3, 1, 2, 2, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 1, 1, 0);
INSERT INTO spa VALUES (319, 0, 'Dispensaire C. de Duty', 'Dispensaire', 'Publique', 'Nord', 'Acul-du-Nord', 19.64867, -72.28452, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (320, 0, 'Centre de Sante Passion du Christ', 'Dispensaire', 'Prive a but lucratif', 'Nord', 'Cap-Haitien', 19.73010, -72.21983, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (321, 0, 'Centre de Sante communautaire Nutrit.', 'Centre de sante sans lit', 'Prive a but lucratif', 'Nord', 'Cap-Haitien', 19.72712, -72.18467, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 1, 0, 0, 1);
INSERT INTO spa VALUES (322, 0, 'Dispensaire Carrefour La Chaude', 'Centre de sante sans lit', 'Publique', 'Nord', 'Acul-du-Nord', 19.61685, -72.28625, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 3, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1);
INSERT INTO spa VALUES (323, 0, 'FOSREF Lakay', 'Centre de sante sans lit', 'Publique', 'Nord', 'Cap-Haitien', 19.75873, -72.20029, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (324, 0, 'Dispensaire Caritas', 'Centre de sante sans lit', 'Prive a but lucratif', 'Nord', 'Cap-Haitien', 19.75506, -72.20502, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1);
INSERT INTO spa VALUES (325, 0, 'Clinique medicale Dr Dorsainvil', 'Centre de sante sans lit', 'Prive a but lucratif', 'Nord', 'Port-Margot', 19.73786, -72.42720, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 6, 3, 1, 0, 1, 1, 0, 0, 2, 0, 0, 0, 0, 0, 2, 1, 0, 0, 1);
INSERT INTO spa VALUES (407, 92202, 'Dity', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Anse-a-Foleur', 19.84550, -72.60903, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (326, 0, 'Unit� de Lutte pour la Sante', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Nord', 'Cap-Haitien', 19.77377, -72.21114, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 3, 0, 0, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 1);
INSERT INTO spa VALUES (327, 0, 'Centre de Sante St Jude de Cap Ha�tien', 'Centre de sante sans lit', 'Prive a but lucratif', 'Nord', 'Cap-Haitien', 19.73828, -72.21339, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (328, 0, 'Clinique medicale de Citee du Peuple', 'Centre de sante sans lit', 'Prive a but lucratif', 'Nord', 'Cap-Haitien', 19.74021, -72.21223, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1);
INSERT INTO spa VALUES (329, 0, 'Centre Galile de Haut Limbe', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Nord', 'Limbe', 19.70317, -72.37497, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES (330, 0, 'Centre de Sante Rose Merci Robillard', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Nord', 'Plaine-du-Nord', 19.61382, -72.25895, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 2, 3, 1, 2, 2, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (331, 41100, 'Hopital de Fort Liberte', 'Hopital departemental', 'Publique', 'Nord-Est', 'Fort-Liberte', 19.66546, -71.84096, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 32, 3, 1, 9, 4, 3, 0, 4, 7, 0, 1, 1, 1, 1, 19, 19, 1, 1, 1);
INSERT INTO spa VALUES (332, 41101, 'Derac', 'Dispensaire', 'Publique', 'Nord-Est', 'Fort-Liberte', 19.66114, -71.81317, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (333, 41102, 'Acul Samedi', 'Dispensaire', 'Publique', 'Nord-Est', 'Fort-Liberte', 19.52038, -71.88155, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, NULL, 3, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0);
INSERT INTO spa VALUES (334, 41201, 'Dispensaire de Ferrier', 'Dispensaire', 'Publique', 'Nord-Est', 'Ferrier', 19.61610, -71.77992, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, NULL, 3, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 6, 7, 0, 0, 0);
INSERT INTO spa VALUES (335, 41301, 'Dispensaire de Perches', 'Dispensaire', 'Publique', 'Nord-Est', 'Perches', 19.52164, -71.92211, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, 2, 2, 2, 1, 0, 0, 1, 0, 0, 0, 0, 0, 3, 4, 0, 0, 0);
INSERT INTO spa VALUES (336, 42101, 'CAL de Ouanaminthe', 'Centre de sante a lit', 'Publique', 'Nord-Est', 'Ouanaminthe', 19.54896, -71.72031, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 12, 3, 1, 9, 3, 10, 0, 8, 7, 0, 1, 0, 0, 0, 23, 13, 2, 1, 3);
INSERT INTO spa VALUES (337, 42102, 'Dispensaire d?Acul des Pins', 'Dispensaire', 'Publique', 'Nord-Est', 'Ouanaminthe', 19.49733, -71.81072, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 0, 0, 2, 0, 0, 1, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0);
INSERT INTO spa VALUES (338, 42104, 'Univers Centre Medical', 'Centre de sante a lit', 'Prive a but lucratif', 'Nord-Est', 'Ouanaminthe', 19.55129, -71.72512, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 2, 12, 1, 1, 3, 2, 2, 1, 0, 5, 0, 0, 2, 1, 0, 10, 3, 0, 1, 2);
INSERT INTO spa VALUES (339, 42105, 'Dispensaire Savane au Lait', 'Dispensaire', 'Publique', 'Nord-Est', 'Ouanaminthe', 19.50208, -71.77363, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (340, 42106, 'Dispensaire Savanne Longue', 'Dispensaire', 'Publique', 'Nord-Est', 'Ouanaminthe', 19.47755, -71.74866, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (341, 42201, 'Dispensaire de Capotille', 'Centre de sante a lit', 'Publique', 'Nord-Est', 'Capotille', 19.44752, -71.69820, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 10, 3, 1, 2, 2, 2, 0, 1, 1, 0, 0, 0, 0, 0, 5, 13, 0, 0, 1);
INSERT INTO spa VALUES (342, 42202, 'Dispensaire Lamine', 'Dispensaire', 'Publique', 'Nord-Est', 'Capotille', 19.41448, -71.72902, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (343, 42301, 'CAL de Mont Organise', 'Centre de sante a lit', 'Publique', 'Nord-Est', 'Mont-Organise', 19.41043, -71.78475, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 8, 2, 1, 3, 2, 3, 0, 0, 4, 0, 0, 0, 0, 0, 11, 7, 0, 0, 0);
INSERT INTO spa VALUES (344, 43101, 'CDI de Trou du Nord', 'Hopital', 'Publique', 'Nord-Est', 'Trou-du-Nord', 19.61273, -72.02686, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 2, 8, 1, 1, 4, 2, 7, 1, 4, 5, 2, 1, 0, 0, 0, 13, 8, 1, 1, 1);
INSERT INTO spa VALUES (345, 43102, 'Dispensaire de Roche Plate', 'Dispensaire', 'Publique', 'Nord-Est', 'Trou-du-Nord', 19.55606, -71.97565, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (346, 43103, 'Dispensaire de Pilette', 'Dispensaire', 'Mixte', 'Nord-Est', 'Trou-du-Nord', 19.56572, -72.00915, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (347, 43201, 'Dispensaire de Sainte Suzanne', 'Dispensaire', 'Publique', 'Nord-Est', 'Sainte-Suzanne', 19.58420, -72.08833, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 2, 3, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 5, 4, 0, 0, 1);
INSERT INTO spa VALUES (348, 43202, 'Dispensaire de Dupity', 'Dispensaire', 'Mixte', 'Nord-Est', 'Sainte-Suzanne', 19.47434, -72.04810, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 2, 3, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 4, 0, 0, 0);
INSERT INTO spa VALUES (349, 43301, 'CSL de Terrier Rouge', 'Centre de sante sans lit', 'Mixte', 'Nord-Est', 'Terrier-Rouge', 19.63695, -71.95341, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 2, 1, 1, 1, 1, 2, NULL, 3, 1, 4, 4, 3, 0, 0, 3, 0, 0, 0, 0, 0, 8, 5, 0, 0, 1);
INSERT INTO spa VALUES (350, 43302, 'CSL Bethesda', 'Centre de sante a lit', 'Prive a but lucratif', 'Nord-Est', 'Terrier-Rouge', 19.57798, -71.94101, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 7, 3, 1, 7, 7, 1, 0, 0, 2, 0, 0, 0, 0, 0, 2, 1, 0, 0, 2);
INSERT INTO spa VALUES (351, 43303, 'Dispensaire de Phaeton', 'Dispensaire', 'Publique', 'Nord-Est', 'Terrier-Rouge', 19.67646, -71.89529, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (531, 11415, 'C/S de Pernier', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Petion-Ville', 18.52354, -72.22662, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1);
INSERT INTO spa VALUES (352, 43304, 'Dispensaire de Danda', 'Dispensaire', 'Prive a but lucratif', 'Nord-Est', 'Terrier-Rouge', 19.55959, -71.88558, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (353, 43305, 'Clinique Esperance et Vie', 'Centre de sante sans lit', 'Prive a but lucratif', 'Nord-Est', 'Terrier-Rouge', 19.64163, -71.95523, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 2, NULL, NULL, NULL, 3, 2, 0, 2, 0, 0, 0, 0, 0, 2, 2, 0, 1, 0);
INSERT INTO spa VALUES (354, 43306, 'Notre Dame de Lourde de Grand Bassin', 'Centre de sante sans lit', 'Mixte', 'Nord-Est', 'Terrier-Rouge', 19.57444, -71.93706, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 3, 3, 1, 2, 3, 1, 0, 0, 2, 1, 0, 0, 0, 1, 3, 2, 0, 0, 1);
INSERT INTO spa VALUES (355, 43401, 'Dispensaire de Jacquezyl', 'Centre de sante sans lit', 'Mixte', 'Nord-Est', 'Caracol', 19.68484, -71.99224, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 2, 3, 2, 0, 2, 2, 0, 0, 1, 0, 0, 0, 0, 0, 4, 2, 0, 0, 1);
INSERT INTO spa VALUES (356, 43402, 'Dispensaire de Caracol', 'Centre de sante sans lit', 'Mixte', 'Nord-Est', 'Caracol', 19.69243, -72.01808, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 6, 0, 0, 0);
INSERT INTO spa VALUES (357, 43403, 'Centre de Sante Sainte elizabeth', 'Centre de sante sans lit', 'Mixte', 'Nord-Est', 'Caracol', 19.69114, -72.01797, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 4, 1, 1, 4, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (358, 44101, 'Dispensaire de Vallieres', 'Dispensaire', 'Publique', 'Nord-Est', 'Vallieres', 19.43514, -71.92067, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 3, 2, 0, 0, 1);
INSERT INTO spa VALUES (359, 44102, 'Dispensaire de Grosse Roche', 'Dispensaire', 'Publique', 'Nord-Est', 'Vallieres', 19.47525, -71.99829, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1);
INSERT INTO spa VALUES (360, 44201, 'Dispensaire de Carice', 'Centre de sante a lit', 'Publique', 'Nord-Est', 'Carice', 19.37766, -71.83650, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 5, 3, 1, 3, 2, 4, 0, 0, 1, 0, 0, 0, 0, 0, 7, 6, 0, 0, 0);
INSERT INTO spa VALUES (361, 44202, 'Dispensaire Sainte Helene de Carice', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Nord-Est', 'Carice', 19.37847, -71.82997, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 3, 3, NULL, NULL, NULL, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 4, 0, 0, 1);
INSERT INTO spa VALUES (362, 44301, 'Dispensaire de Bois de Laurence', 'Centre de sante a lit', 'Publique', 'Nord-Est', 'Mombin-Crochu', 19.33073, -71.86060, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 6, 1, 1, 2, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 5, 2, 0, 0, 1);
INSERT INTO spa VALUES (363, 44302, 'CAL de Mombin Crochu', 'Centre de sante a lit', 'Publique', 'Nord-Est', 'Mombin-Crochu', 19.36856, -71.98517, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 4, 1, 1, 4, 2, 2, 0, 0, 4, 0, 0, 0, 0, 0, 9, 7, 0, 2, 0);
INSERT INTO spa VALUES (364, 0, 'Dispensaire de Delaire', 'Centre de sante sans lit', 'Publique', 'Nord-Est', 'Ouanaminthe', 19.56141, -71.78108, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, 2, 3, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (365, 0, 'Dispensaire de Meillac', 'Dispensaire', 'Publique', 'Nord-Est', 'Ferrier', 19.66988, -71.75603, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (366, 91100, 'Immaculee Conception', 'Hopital departemental', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.93565, -72.83195, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 90, 2, 1, 24, 3, 6, 1, 1, 12, 0, 5, 3, 0, 0, 28, 23, 3, 1, 5);
INSERT INTO spa VALUES (367, 91101, 'Trois Rivieres', 'Centre de sante sans lit', 'Prive a but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.93629, -72.84225, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (368, 91103, 'Poste Metier', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.88581, -72.92207, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (369, 91104, 'Baie des Moustiques', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.90327, -72.96221, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (370, 91105, 'Passe Catabois', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.82222, -72.93935, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (371, 91106, 'Beauchamp', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.80760, -72.98233, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, 2, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (372, 91108, 'Caluc', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.75222, -72.93096, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (373, 91109, 'Soleil', 'Dispensaire', 'Prive a but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.94615, -72.82352, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 4, 0, 0, 1);
INSERT INTO spa VALUES (374, 91110, 'Pilette', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.77217, -72.95738, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (375, 91111, 'Fatima la Coupe', 'Dispensaire', 'Prive a but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.92877, -72.82347, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (376, 91112, 'Fatima Chalet', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.94529, -72.82095, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 1);
INSERT INTO spa VALUES (377, 91113, 'La Croix St Joseph', 'Centre de sante a lit', 'Mixte', 'Nord-Ouest', 'Port-de-Paix', 19.90543, -72.79300, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 2, 3, 3, 1, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 4, 0, 0, 1);
INSERT INTO spa VALUES (378, 91114, 'Beraca', 'Hopital', 'Prive sans but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.94432, -72.77466, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 68, 3, 1, 10, 4, 5, 1, 2, 10, 1, 1, 0, 0, 1, 21, 25, 0, 1, 8);
INSERT INTO spa VALUES (379, 91115, 'Dispensaire Monfort', 'Dispensaire', 'Prive sans but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.94029, -72.83853, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (380, 91116, 'Antene Sante', 'Centre de sante sans lit', 'Mixte', 'Nord-Ouest', 'Port-de-Paix', 19.93780, -72.83436, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (381, 91117, 'Dolcine', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.92445, -72.77424, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (382, 91119, 'Fosref Jeune', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.94494, -72.82548, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (383, 91120, 'Fosref Lakay', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.93423, -72.84577, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (384, 91201, 'Palmistes', 'Hopital communautaire de reference', 'Mixte', 'Nord-Ouest', 'La Tortue', 20.01943, -72.72596, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 20, 3, 1, 8, 3, 3, 0, 0, 3, 0, 0, 0, 0, 0, 3, 14, 1, 1, 3);
INSERT INTO spa VALUES (385, 91202, 'Haut Plaine', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'La Tortue', 20.00576, -72.66437, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (386, 91203, 'La Vallee', 'Dispensaire', 'Publique', 'Nord-Ouest', 'La Tortue', 20.03353, -72.86808, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (387, 91204, 'Mare Rouge 1', 'Dispensaire', 'Prive sans but lucratif', 'Nord-Ouest', 'La Tortue', 20.03243, -72.78558, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (388, 91205, 'Montry', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'La Tortue', 20.03976, -72.82970, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (389, 91206, 'Marie Curie', 'Centre de sante a lit', 'Mixte', 'Nord-Ouest', 'La Tortue', 20.04501, -72.84009, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 2, 3, 2, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (390, 91301, 'Bon Samaritain 1', 'Hopital', 'Publique', 'Nord-Ouest', 'Bassin-Bleu', 19.78257, -72.79706, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 2, 13, 3, 1, 2, 6, 3, 0, 1, 7, 1, 1, 0, 0, 0, 7, 14, 0, 2, 2);
INSERT INTO spa VALUES (391, 91302, 'La Plate', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Bassin-Bleu', 19.81623, -72.76053, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (392, 91303, 'Haut Moustique', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Bassin-Bleu', 19.74288, -72.87572, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (393, 91401, 'Chansolme', 'Centre de sante sans lit', 'Publique', 'Nord-Ouest', 'Chansolme', 19.87499, -72.83444, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 1, 3, 1, 0, 1, 2, 0, 0, 2, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0);
INSERT INTO spa VALUES (394, 92101, 'Bonneau', 'Centre de sante a lit', 'Mixte', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.90597, -72.65535, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 2, 10, 3, 1, 3, 1, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 4, 0, 0, 1);
INSERT INTO spa VALUES (395, 92102, 'St Louis du Nord', 'Hopital communautaire de reference', 'Publique', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.93447, -72.73036, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 2, 25, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 9, 3, 0, 0, 2);
INSERT INTO spa VALUES (396, 92103, 'NWCM', 'Centre de sante sans lit', 'Prive a but lucratif', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.93153, -72.72046, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 2, 11, 3, 1, 11, 2, 0, 0, 1, 3, 0, 0, 1, 0, 0, 5, 9, 0, 0, 3);
INSERT INTO spa VALUES (397, 92104, 'Desgranges', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.92484, -72.70784, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1);
INSERT INTO spa VALUES (398, 92105, 'Chamoise', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.82846, -72.68710, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (399, 92106, 'Glacis', 'Dispensaire', 'Prive sans but lucratif', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.84947, -72.71323, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (400, 92107, 'La Perriere', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.87219, -72.73672, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (401, 92108, 'Jean Clair', 'Dispensaire', 'Prive sans but lucratif', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.84748, -72.68823, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (402, 92109, 'Gaspard', 'Dispensaire', 'Prive sans but lucratif', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.87079, -72.68340, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 0, 3, 2, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 1);
INSERT INTO spa VALUES (403, 92110, 'Chaineau', 'Dispensaire', 'Prive sans but lucratif', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.88481, -72.67364, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (404, 92112, 'Zabricot', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.91187, -72.69759, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (405, 92113, 'Guichard', 'Dispensaire', 'Prive sans but lucratif', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.91855, -72.74767, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (406, 92201, 'Anse a Foleur', 'Centre de sante a lit', 'Publique', 'Nord-Ouest', 'Anse-a-Foleur', 19.89204, -72.61744, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 3, 3, 1, 3, 3, 1, 0, 0, 2, 0, 0, 0, 0, 0, 4, 5, 0, 0, 0);
INSERT INTO spa VALUES (408, 92203, 'Cotes de Fer - Mixte', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Anse-a-Foleur', 19.88315, -72.57926, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 1, 3, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (409, 92204, 'Dupont', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Anse-a-Foleur', 19.83775, -72.64099, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (410, 93101, 'Mole Saint Nicolas', 'Centre de sante sans lit', 'Publique', 'Nord-Ouest', 'Mole St Nicolas', 19.80370, -73.37490, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 6, 3, 1, 0, 1, 2, 0, 0, 2, 0, 0, 0, 0, 0, 2, 4, 0, 0, 0);
INSERT INTO spa VALUES (411, 93103, 'Sentrain', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Mole St Nicolas', 19.81372, -73.26794, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 3, 3, 1, 3, 3, 1, 0, 0, 2, 0, 0, 0, 0, 0, 2, 5, 1, 0, 1);
INSERT INTO spa VALUES (412, 93106, 'Dame Marie', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Mole St Nicolas', 19.82485, -73.29106, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 50, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (413, 93201, 'Baie de Henne', 'Centre de sante a lit', 'Mixte', 'Nord-Ouest', 'Baie-de-Henne', 19.66428, -73.21074, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 3, 3, 1, 3, 3, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (414, 93202, 'La Source', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Baie-de-Henne', 19.72708, -73.15906, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 2, NULL, 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 2, 0, 0, 3);
INSERT INTO spa VALUES (415, 93203, 'Pte Riv. Baie de Henne', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Baie-de-Henne', 19.72050, -73.17142, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1);
INSERT INTO spa VALUES (416, 93204, 'Dupre', 'Dispensaire', 'Prive sans but lucratif', 'Nord-Ouest', 'Baie-de-Henne', 19.74918, -73.20883, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0);
INSERT INTO spa VALUES (417, 93205, 'Citene Remy', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Baie-de-Henne', 19.69300, -73.20000, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 2, 3, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (418, 93301, 'Bombardopolis', 'Centre de sante a lit', 'Publique', 'Nord-Ouest', 'Bombardopolis', 19.69281, -73.33598, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 12, 1, 1, 4, 2, 2, 0, 0, 4, 1, 4, 0, 0, 0, 8, 3, 1, 1, 3);
INSERT INTO spa VALUES (419, 93302, 'Rochefort', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Bombardopolis', 19.70270, -73.37993, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 2, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (420, 93303, 'Mont des Oliviers', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Bombardopolis', 19.69476, -73.36817, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (421, 93306, 'Creve', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Bombardopolis', 19.70608, -73.39393, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 2, 3, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (422, 93401, 'N.D la Paix', 'Hopital communautaire de reference', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.85592, -73.19006, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 35, 1, 1, 9, 9, 6, 1, 1, 5, 0, 1, 0, 0, 1, 5, 9, 0, 0, 3);
INSERT INTO spa VALUES (423, 93402, 'Bord de Mer', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.90580, -73.19544, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 3, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (424, 93404, 'La Coma', 'Dispensaire', 'Prive a but lucratif', 'Nord-Ouest', 'Jean-Rabel', 19.88017, -73.07621, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES (425, 93405, 'Guinaudee', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.83061, -73.13338, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (426, 93406, 'La Reserve', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'Jean-Rabel', 19.78979, -73.14919, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (427, 93407, 'Gombo', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.80086, -73.07792, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (428, 93410, 'Cabaret', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.87550, -73.01326, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (429, 93411, 'K-Philippe', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'Jean-Rabel', 19.80324, -73.10826, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 3, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (430, 93412, 'Boucan Patriot', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.76476, -73.09442, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 0, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (431, 93413, 'Port a l?Ecu', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.90561, -73.04114, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (432, 93414, 'Cafe Paul', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.86006, -73.09784, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (433, 93415, 'La Bellee', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.75480, -73.14942, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (434, 93416, 'Grann Lison', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'Jean-Rabel', 19.83772, -73.20543, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (435, 0, 'Centre de Sante Harry Bordes', 'Centre de sante sans lit', 'Prive a but lucratif', 'Nord-Ouest', 'La Tortue', 20.02508, -72.75292, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES (436, 0, 'Centre de Sante Medi care', 'Centre de sante a lit', 'Prive a but lucratif', 'Nord-Ouest', 'Saint-Louis-du-Nord', 19.93479, -72.72503, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, 7, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES (437, 0, 'Dispensaire Cademe', 'Dispensaire', 'Mixte', 'Nord-Ouest', 'Jean-Rabel', 19.83105, -73.18715, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (438, 0, 'Dispensaire Communautaire Grand Source', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Jean-Rabel', 19.81668, -73.23826, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 3, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (439, 0, 'Centre de Sante de Bassin Hardy', 'Centre de sante sans lit', 'Publique', 'Nord-Ouest', 'Baie-de-Henne', 19.70103, -73.14125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (440, 0, 'Centre medical de Passe Catabois', 'Hopital', 'Prive a but lucratif', 'Nord-Ouest', 'Port-de-Paix', 19.83129, -72.94053, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 40, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 2, 0, 0, 4, 2, 0, 1, 0);
INSERT INTO spa VALUES (441, 0, 'Dispensaire Decide', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.91995, -72.85216, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (442, 0, 'Dispensaire de Desmarreaux', 'Dispensaire', 'Publique', 'Nord-Ouest', 'Port-de-Paix', 19.89471, -72.85016, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (443, 11100, 'HUEH', 'Hopital universitaire', 'Publique', 'Ouest', 'Port-au-Prince', 18.53976, -72.34021, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 358, 1, 1, 42, 9, 7, 13, 81, 23, 0, 14, 0, 0, 0, 156, 68, 8, 6, 0);
INSERT INTO spa VALUES (692, 11102, 'Centre de Sante aurore du Bel Air', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Port-au-Prince', 18.55061, -72.33681, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (444, 11103, 'Hopital du Canape Vert', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.53351, -72.31684, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 50, 3, NULL, NULL, NULL, 6, 0, 1, 1, 0, 4, 0, 0, 0, 17, 10, 0, 2, 1);
INSERT INTO spa VALUES (445, 11104, 'Dispensaire Carifont de Fontamara', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.52958, -72.36859, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 1, 1, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (446, 11105, 'Centre de Sante du Portail Leogane', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Port-au-Prince', 18.53578, -72.34674, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 3, NULL, NULL, NULL, 4, 0, 8, 6, 0, 0, 0, 0, 1, 6, 22, 0, 0, 2);
INSERT INTO spa VALUES (691, 11106, 'Centre de Sante St Antoine', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.54501, -72.33172, 1, 1, 1, 1, 1, 0, 2, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (447, 11107, 'Centre de Sante Snelak', 'Dispensaire', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.52382, -72.34883, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 1, 0, 1, 0);
INSERT INTO spa VALUES (448, 11108, 'Centre de Sante de Solino', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Port-au-Prince', 18.54869, -72.32407, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 5, 0, 0, 1);
INSERT INTO spa VALUES (449, 11111, 'Centre de Sante Richard Allen', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.54221, -72.34307, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (450, 11113, 'Hopital Francais', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.53726, -72.34516, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 2, 40, 1, 1, 998, 998, 0, 4, 50, 20, 0, 6, 0, 0, 0, 36, 8, 1, 2, 6);
INSERT INTO spa VALUES (451, 11116, 'Centre de psychiatrie Mars & Kline', 'Hopital communautaire de reference', 'Publique', 'Ouest', 'Port-au-Prince', 18.53757, -72.34108, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 53, 3, NULL, NULL, NULL, 1, 0, 6, 2, 0, 0, 0, 0, 0, 10, 9, 0, 0, 0);
INSERT INTO spa VALUES (452, 11118, 'Hopital St. Francois de Salle', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.53844, -72.34366, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 2, NULL, 1, NULL, NULL, NULL, 1, 0, 6, 5, 0, 3, 0, 0, 0, 4, 3, 1, 0, 2);
INSERT INTO spa VALUES (453, 11119, 'CSL SODEC', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.53390, -72.32434, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 4, 3, 1, 1, 4, 0, 0, 0, 3, 2, 0, 1, 0, 0, 3, 3, 1, 0, 0);
INSERT INTO spa VALUES (454, 11120, 'PROFAMIL 2', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53496, -72.32405, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, NULL, 3, NULL, NULL, NULL, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 3, 1, 0, 0);
INSERT INTO spa VALUES (455, 11121, 'Sanatorium de Port-au-Prince', 'Hopital', 'Publique', 'Ouest', 'Port-au-Prince', 18.52682, -72.34421, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 2, NULL, 3, NULL, NULL, NULL, 2, 2, 10, 6, 0, 2, 0, 0, 0, 29, 21, 0, 5, 0);
INSERT INTO spa VALUES (456, 11122, 'Hopital Saint-Joseph', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53527, -72.32839, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 23, 1, 1, 998, 1, 1, 1, 2, 2, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0);
INSERT INTO spa VALUES (457, 11127, 'Renaissance', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Port-au-Prince', 18.54892, -72.33953, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 4, 4, 1, 3, 0, 1, 0, 0, 0, 9, 0, 0, 1, 0);
INSERT INTO spa VALUES (458, 11128, 'APROSIFA', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.52862, -72.34716, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 1, 4, 0, 0, 0, 0, 0, 4, 10, 1, 0, 2);
INSERT INTO spa VALUES (459, 11129, 'Centre de Sante Sainte elizabeth', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.52452, -72.33976, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 5, 1, 0, 0, 1);
INSERT INTO spa VALUES (460, 11130, 'Centre de Sante kay ti moun', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53114, -72.33720, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 2, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (461, 11131, 'CMS/FHSM (Centre medico-social/FHSM)', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Port-au-Prince', 18.52926, -72.35565, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (462, 11132, 'Centre de Sante Martissant', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.53360, -72.35338, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 6, 3, 1, 5, 1, 4, 0, 0, 2, 0, 0, 0, 0, 0, 9, 4, 0, 0, 1);
INSERT INTO spa VALUES (684, 11132, 'Centre de Sante de Martissant', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.53606, -72.35705, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (463, 11133, 'Centre de Sante Caravelle', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Port-au-Prince', 18.54667, -72.32307, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 2, 0, 0, 0, 1, 0, 2, 1, 0, 1, 0);
INSERT INTO spa VALUES (464, 11134, 'Gheskio', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53748, -72.34921, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 2, 40, 3, NULL, NULL, NULL, 44, 1, 31, 70, 0, 3, 0, 0, 0, 58, 0, 2, 9, 3);
INSERT INTO spa VALUES (718, 11135, 'Centre de Sante Bethanie', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.52740, -72.35232, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (465, 11138, 'Centre de Sante Bethesda', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Carrefour', 18.52386, -72.36945, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1);
INSERT INTO spa VALUES (466, 11141, 'Hopital Saint-esPrivet', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.53085, -72.33741, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 22, 3, 1, 0, 2, 2, 2, 0, 1, 0, 1, 1, 0, 0, 15, 10, 0, 1, 1);
INSERT INTO spa VALUES (467, 11142, 'Hopital Sapiens', 'Centre de sante a lit', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53574, -72.33351, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 14, 3, 1, 14, 1, 1, 2, 7, 2, 0, 0, 0, 0, 0, 1, 5, 0, 0, 2);
INSERT INTO spa VALUES (468, 11143, 'Maternite UMO', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.54147, -72.33338, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 13, 3, 1, 13, 13, 0, 0, 4, 2, 0, 0, 0, 0, 0, 6, 0, 0, 1, 0);
INSERT INTO spa VALUES (469, 11145, 'FOSREF', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.54483, -72.33498, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (470, 11146, 'Maternite de Christ-roi', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.53761, -72.31860, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 12, 3, 2, 7, 7, 2, 1, 3, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 1);
INSERT INTO spa VALUES (471, 11147, 'Centre de Sante cite Canada (Haut Turgeau)', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Port-au-Prince', 18.52505, -72.31867, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (472, 11150, 'CEMEAH', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.52550, -72.33495, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (473, 11151, 'C/S de St Jude', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Port-au-Prince', 18.50683, -72.36136, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2, 3, 3, 2, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (474, 11152, 'Centre de Sante Communautaire cite de l-etern', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.53666, -72.35447, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 2, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0);
INSERT INTO spa VALUES (475, 11155, 'Institut FAMEPEREO', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Port-au-Prince', 18.54373, -72.32168, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 6, 6, 0, 0, 0, 0, 0, 8, 0, 1, 1, 4);
INSERT INTO spa VALUES (476, 11156, 'Hopital ital Medimax', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.53042, -72.33686, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 9, 2, 1, 0, 0, 4, 0, 0, 7, 0, 0, 0, 0, 0, 17, 0, 0, 1, 1);
INSERT INTO spa VALUES (477, 11159, 'Hopital ital St Louis', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53557, -72.32518, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 24, 3, 1, 24, 22, 0, 0, 1, 4, 0, 0, 0, 0, 0, 8, 1, 0, 1, 0);
INSERT INTO spa VALUES (478, 11202, 'C/S Bas Fd Philomene Delmas 32', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Delmas', 18.54707, -72.31259, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 8, 3, NULL, NULL, NULL, 2, 0, 0, 2, 0, 0, 0, 0, 1, 3, 2, 0, 0, 1);
INSERT INTO spa VALUES (699, 11204, 'Centre Medico social de la Saline', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Port-au-Prince', 18.56040, -72.34050, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 2, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (479, 11205, 'Citymed de Delmas', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Delmas', 18.55690, -72.30665, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2, 11, 3, 1, 0, 1, 1, 1, 5, 2, 0, 0, 0, 0, 0, 5, 4, 0, 0, 1);
INSERT INTO spa VALUES (480, 11206, 'Hopital de Delmas 33', 'Hopital universitaire', 'Publique', 'Ouest', 'Delmas', 18.55645, -72.29836, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 2, 102, 1, 1, 25, 6, 15, 12, 46, 18, 0, 2, 5, 0, 0, 7, 54, 9, 2, 6);
INSERT INTO spa VALUES (481, 11207, 'C/S communaute chretienne Fleuriot de Tabarre', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Tabarre', 18.57496, -72.26299, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1);
INSERT INTO spa VALUES (482, 11208, 'Hopital Grace Children', 'Hopital', 'Mixte', 'Ouest', 'Delmas', 18.55987, -72.30203, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 17, 3, NULL, NULL, NULL, 4, 0, 9, 15, 0, 2, 0, 0, 0, 17, 18, 0, 4, 4);
INSERT INTO spa VALUES (483, 11209, 'Hopital Espoir', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Delmas', 18.54151, -72.27851, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2, 37, 1, 1, 2, 2, 4, 0, 21, 7, 0, 2, 0, 0, 0, 23, 2, 0, 1, 2);
INSERT INTO spa VALUES (662, 11211, 'Hopital Dash Delmas 48', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Delmas', 18.53947, -72.29573, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (484, 11212, 'Hopital Jude Anne (DASH)', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Delmas', 18.55659, -72.32526, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 2, 13, 1, 1, 13, 13, 2, 2, 9, 5, 0, 1, 0, 0, 1, 9, 0, 0, 2, 0);
INSERT INTO spa VALUES (485, 11214, 'CPFO', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Delmas', 18.57547, -72.30878, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 2, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (486, 11216, 'Fondeph', 'Centre de sante a lit', 'Prive sans but lucratif', 'Ouest', 'Delmas', 18.54602, -72.28937, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 2, 6, 3, 1, 2, 3, 2, 0, 1, 2, 0, 0, 0, 0, 0, 4, 9, 1, 1, 0);
INSERT INTO spa VALUES (487, 11217, 'Hopital Isaie Jeanty', 'Hopital universitaire', 'Publique', 'Ouest', 'Cite-Soleil', 18.56426, -72.33540, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 2, 78, 3, 1, 2, 14, 1, 1, 36, 15, 0, 0, 1, 0, 0, 36, 36, 5, 1, 6);
INSERT INTO spa VALUES (488, 11218, 'Haiti Med (Siclair)', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Delmas', 18.56399, -72.30797, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 2, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1);
INSERT INTO spa VALUES (489, 11219, 'Centre de Sante croix des missions', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Tabarre', 18.59565, -72.28610, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 3, NULL, NULL, NULL, 7, 0, 6, 6, 0, 0, 0, 0, 0, 4, 8, 0, 1, 3);
INSERT INTO spa VALUES (490, 11223, 'Hopital de l-OFATMA', 'Hopital', 'Publique', 'Ouest', 'Delmas', 18.56671, -72.32513, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 2, 44, 1, 1, 28, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES (491, 11224, 'Centre de Sante de Petite Place Cazeau', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Delmas', 18.56466, -72.28236, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 3, 1, 4, 0, 12, 0, 1, 4, 0, 0, 0, 0, 0, 14, 9, 5, 0, 1);
INSERT INTO spa VALUES (690, 11225, 'Centre de Sante St Martin 1', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Delmas', 18.55793, -72.32331, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (492, 11227, 'Centre de Sante St Paul', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Delmas', 18.54383, -72.30578, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 1, 0, 0, 0, 4, 0, 3, 2, 0, 0, 1);
INSERT INTO spa VALUES (493, 11228, 'Bernard Mews', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Delmas', 18.56195, -72.31901, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 45, 1, 2, 1, 1, 4, 5, 17, 8, 0, 4, 0, 0, 0, 45, 3, 0, 6, 1);
INSERT INTO spa VALUES (494, 11229, 'CHOSCAL', 'Hopital', 'Publique', 'Ouest', 'Cite-Soleil', 18.57810, -72.33685, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 2, 74, 3, 1, 27, 4, 6, 4, 10, 8, 0, 1, 0, 0, 0, 27, 50, 6, 1, 3);
INSERT INTO spa VALUES (495, 11230, 'CHAPI', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Cite-Soleil', 18.57397, -72.32857, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 1, NULL, NULL, NULL, 4, 0, 2, 2, 0, 0, 0, 0, 0, 7, 4, 0, 0, 3);
INSERT INTO spa VALUES (496, 11231, 'C/S Fontaine', 'Centre de sante a lit', 'Prive sans but lucratif', 'Ouest', 'Cite-Soleil', 18.59636, -72.32747, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 4, 3, NULL, NULL, NULL, 0, 0, 1, 2, 0, 0, 0, 0, 0, 4, 1, 0, 0, 1);
INSERT INTO spa VALUES (497, 11232, 'Centre medical & de nutrition Rosalie Rendu', 'Centre de sante a lit', 'Prive sans but lucratif', 'Ouest', 'Cite-Soleil', 18.57776, -72.33781, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 20, 3, NULL, NULL, NULL, 3, 0, 2, 3, 0, 0, 0, 0, 0, 3, 7, 0, 0, 1);
INSERT INTO spa VALUES (498, 11234, 'Nos petits freres et soeurs (Hopital St damie)', 'Hopital', 'Publique', 'Ouest', 'Tabarre', 18.57037, -72.25368, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 162, 1, 1, 37, 4, 0, 0, 39, 10, 2, 3, 2, 0, 0, 95, 54, 17, 4, 28);
INSERT INTO spa VALUES (693, 11238, 'Clinique Communautaire Barthelmie', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Delmas', 18.55281, -72.32904, 1, 1, 1, 1, 1, 0, 2, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (499, 11239, 'Centre de Sante Dieu qui donne', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Delmas', 18.56703, -72.29501, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 2, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 2);
INSERT INTO spa VALUES (500, 11240, 'Geskio/ Imis', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Tabarre', 18.57035, -72.25116, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 2, 40, 3, NULL, NULL, NULL, 8, 0, 4, 39, 0, 1, 0, 0, 0, 7, 4, 1, 2, 2);
INSERT INTO spa VALUES (501, 11242, 'Haiti Med', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Tabarre', 18.58039, -72.26752, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 4, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0);
INSERT INTO spa VALUES (502, 11243, 'Hopital Medicaire', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Delmas', 18.56700, -72.29389, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 2, 17, 3, NULL, NULL, NULL, 3, 0, 1, 2, 0, 1, 0, 1, 1, 7, 0, 0, 2, 0);
INSERT INTO spa VALUES (731, 11244, 'Peace Hospital', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Delmas', 18.55362, -72.27596, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (503, 11246, 'Food for the poor', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Delmas', 18.56584, -72.30549, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 4, 0, 0, 0, 0, 0, 1, 2, 0, 0, 1, 0);
INSERT INTO spa VALUES (504, 11247, 'FOSREF', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Delmas', 18.54861, -72.30616, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1);
INSERT INTO spa VALUES (505, 11248, 'King-s hospital', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Tabarre', 18.56290, -72.27319, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 2, 26, 3, 1, 6, 4, 1, 2, 6, 5, 0, 1, 0, 0, 0, 15, 15, 0, 1, 2);
INSERT INTO spa VALUES (506, 11301, 'C/S Fondeph Bizoton 61', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.53266, -72.38508, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 2, 3, 1, 2, 2, 1, 0, 0, 1, 0, 0, 0, 0, 0, 4, 2, 1, 1, 1);
INSERT INTO spa VALUES (507, 11303, 'Hopital de carrefour', 'Hopital communautaire de reference', 'Publique', 'Ouest', 'Carrefour', 18.53783, -72.40755, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 2, 40, 3, 1, 40, 34, 2, 4, 5, 9, 0, 0, 0, 0, 2, 14, 20, 8, 1, 0);
INSERT INTO spa VALUES (683, 13102, 'Hopital Defile de Beudet', 'Hopital', 'Publique', 'Ouest', 'Croix-des-Bouquets', 18.61174, -72.21275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (508, 11304, 'Centre medico social de Riviere froide', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Carrefour', 18.51828, -72.41267, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 2, 2, 3, 1, 2, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 1, 1, 0, 2);
INSERT INTO spa VALUES (509, 11305, 'C/S Bethel Mahotiere 81', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Carrefour', 18.53637, -72.40508, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (510, 11306, 'Hopital Adventiste d-Haiti (HAH)', 'Hopital universitaire', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.53146, -72.38675, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 2, 70, 1, 1, 6, 2, 1, 1, 10, 11, 0, 7, 2, 0, 0, 20, 24, 3, 2, 4);
INSERT INTO spa VALUES (511, 11308, 'Dispensaire la Main Tendue de Bertin', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Carrefour', 18.52863, -72.41222, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 2, 0, 0, 0);
INSERT INTO spa VALUES (512, 11309, 'CSL OBCG', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.53765, -72.40946, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 3, 0, 0, 0, 0, 0, 4, 3, 0, 0, 1);
INSERT INTO spa VALUES (513, 11311, 'Dispensaire de Taillefer', 'Dispensaire', 'Publique', 'Ouest', 'Carrefour', 18.48136, -72.41361, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 3, 3, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (514, 11313, 'Centre de Sante Bethel (Christophe Channel)', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Carrefour', 18.54795, -72.41958, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2, 3, 3, NULL, NULL, NULL, 1, 1, 1, 1, 2, 0, 0, 0, 0, 2, 0, 0, 1, 0);
INSERT INTO spa VALUES (515, 11314, 'Centre de Sante Multi fonctionnel  sous-rail', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Carrefour', 18.54789, -72.40011, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 3, 0, 1, 0, 0, 0, 0, 0, 0, 2, 2, 0, 1, 0);
INSERT INTO spa VALUES (516, 11315, 'Dispensaire ASCOSADEC', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Carrefour', 18.52511, -72.40586, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (517, 11317, 'C/S OMES', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Carrefour', 18.53240, -72.38871, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 3, 3, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0);
INSERT INTO spa VALUES (518, 11318, 'C/S Mere Teresa', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.53794, -72.40318, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 3, 3, NULL, NULL, NULL, 1, 0, 0, 2, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0);
INSERT INTO spa VALUES (644, 11319, 'Centre de Sante Hands of Love', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Carrefour', 18.53166, -72.37529, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (519, 11320, 'Centre de la communaute des Freres Unis (NF)', 'Centre de sante a lit', 'Mixte', 'Ouest', 'Carrefour', 18.54188, -72.40615, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 4, 3, 2, 0, 1, 2, 0, 0, 1, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0);
INSERT INTO spa VALUES (520, 11321, 'Dispensaire Marie Louise de Jesus', 'Dispensaire', 'Prive sans but lucratif', 'Ouest', 'Carrefour', 18.53740, -72.42022, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (521, 11326, 'Centre Medical de  Bertin', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.53030, -72.41409, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (645, 11327, 'Clinique Mennomite', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.54184, -72.39832, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (668, 11330, 'Centre de Sante Berekia', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.53077, -72.39962, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (522, 11331, 'ASAD', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.54254, -72.39340, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 4, 3, NULL, NULL, NULL, 3, 0, 0, 1, 0, 0, 0, 0, 0, 2, 2, 0, 1, 0);
INSERT INTO spa VALUES (523, 11332, 'Grace Medical Center', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Carrefour', 18.54920, -72.40965, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 2, 0, 0, 0, 0, 0, 4, 2, 0, 2, 0);
INSERT INTO spa VALUES (524, 11334, 'C/S Haiti  Saint Rock Foundation', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.51238, -72.39722, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 2);
INSERT INTO spa VALUES (525, 11401, 'Centre de Sante calebasse', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Petion-Ville', 18.46317, -72.26330, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1);
INSERT INTO spa VALUES (526, 11402, 'Citymed de Petion ville', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.51351, -72.28588, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2, 9, 3, 1, 9, 2, 1, 0, 1, 1, 1, 0, 2, 0, 0, 4, 0, 0, 3, 0);
INSERT INTO spa VALUES (527, 11403, 'Centre de Sante Monsanto Petit', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.49839, -72.31930, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0);
INSERT INTO spa VALUES (528, 11404, 'Hopital de la communaute haitienne', 'Hopital communautaire de reference', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.52405, -72.27233, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 1, 1, 8, 2, 2, 6, 24, 9, 0, 3, 6, 0, 0, 24, 8, 1, 1, 0);
INSERT INTO spa VALUES (529, 11405, 'Hopital Eliazar Germain', 'Hopital communautaire de reference', 'Publique', 'Ouest', 'Petion-Ville', 18.51707, -72.28868, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 2, 42, 3, NULL, NULL, NULL, 16, 4, 23, 13, 0, 2, 0, 0, 0, 1, 11, 2, 1, 0);
INSERT INTO spa VALUES (530, 11407, 'Hopital CensHopital', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.51861, -72.23702, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 2, 38, 1, 1, 6, 3, 7, 0, 6, 2, 0, 0, 0, 0, 0, 5, 0, 0, 2, 0);
INSERT INTO spa VALUES (728, 11414, 'Centre de Sante Notre dame du cap', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Petion-Ville', 18.51103, -72.28485, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (532, 11417, 'Centre Medico social de Thomassin 25', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Petion-Ville', 18.48591, -72.31290, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 2, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1);
INSERT INTO spa VALUES (533, 11422, 'Centre de Sante philantropique de dupont', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.51019, -72.27264, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (534, 11423, 'Dispensairede Diegue', 'Dispensaire', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.50791, -72.26691, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, 4, 2, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (535, 11427, 'Mon Santo Petit Jalousie', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.50946, -72.29165, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 2, NULL, 3, NULL, NULL, NULL, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (536, 11428, 'DASH(Hopital ital St Landry)', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.51573, -72.29165, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 2, 12, 3, 1, 0, 0, 2, 0, 2, 3, 2, 1, 1, 0, 0, 10, 10, 0, 1, 1);
INSERT INTO spa VALUES (744, 11428, 'DASH Petion Ville (Hopital St Landry)', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.51183, -72.28534, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 2, 1, 3, NULL, NULL, NULL, 2, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (537, 11501, 'Centre de Sante de Kenscoff', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Kenscoff', 18.44869, -72.28505, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 1, 3, NULL, NULL, NULL, 5, 0, 0, 2, 0, 0, 0, 0, 0, 0, 6, 0, 0, 1);
INSERT INTO spa VALUES (538, 11502, 'Dispensaire de Bolosse (mission baptiste)', 'Dispensaire', 'Prive a but lucratif', 'Ouest', 'Kenscoff', 18.44134, -72.34620, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (539, 11503, 'Hopital de Fermathe (mission baptiste)', 'Hopital', 'Mixte', 'Ouest', 'Kenscoff', 18.46289, -72.28891, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 2, 80, 1, 1, 6, 1, 11, 1, 2, 5, 0, 2, 1, 0, 1, 3, 13, 1, 1, 1);
INSERT INTO spa VALUES (540, 11505, 'Dispensaire de Robin (mission baptiste)', 'Dispensaire', 'Mixte', 'Ouest', 'Kenscoff', 18.43373, -72.26151, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (541, 11507, 'Dispensaire Notre Dame Perp�tuel Secours (F', 'Dispensaire', 'Prive sans but lucratif', 'Ouest', 'Kenscoff', 18.41810, -72.30489, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (542, 11509, 'Dispensaire Godey (Afe neg kombit)', 'Dispensaire', 'Publique', 'Ouest', 'Kenscoff', 18.44756, -72.30594, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (543, 11511, 'Dispensaire aux cadets (Af� n�g kombit)', 'Dispensaire', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.45179, -72.20232, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (544, 11601, 'Dispensaire Bon Berger', 'Dispensaire', 'Prive a but lucratif', 'Ouest', 'Gressier', 18.54288, -72.52442, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 1, 0);
INSERT INTO spa VALUES (545, 11602, 'Centre de Sante de Christianville', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Gressier', 18.52424, -72.55425, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1);
INSERT INTO spa VALUES (546, 11603, 'Centre de Sante FOSADEC', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Gressier', 18.53935, -72.49892, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 1, 3, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0);
INSERT INTO spa VALUES (547, 11607, 'Centre de Sante de Gressier', 'Centre de sante a lit', 'Publique', 'Ouest', 'Gressier', 18.54203, -72.52954, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 20, 1, NULL, NULL, NULL, 3, 0, 0, 2, 0, 0, 0, 0, 0, 7, 4, 0, 1, 1);
INSERT INTO spa VALUES (548, 11610, 'Centre de Sante Haute Sanite (NF)', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Gressier', 18.53238, -72.46776, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (549, 11614, 'Haiti Health Ministries', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Gressier', 18.52062, -72.55010, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 1, NULL, NULL, NULL, 3, 0, 0, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (550, 12101, 'Dispensaire de Beausejour', 'Dispensaire', 'Mixte', 'Ouest', 'Leogane', 18.42116, -72.50642, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (551, 12102, 'Centre de Sante Darbonne', 'Centre de sante a lit', 'Prive sans but lucratif', 'Ouest', 'Leogane', 18.49248, -72.58982, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 2, 3, 1, 1, 6, 2, 2, 0, 0, 1, 1, 0, 0, 0, 0, 8, 4, 0, 1, 1);
INSERT INTO spa VALUES (552, 12103, 'C/S Farnese Louis Charles de Palmiste a vin', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Leogane', 18.42670, -72.64300, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 1, 0);
INSERT INTO spa VALUES (553, 12104, 'Hopital Cardinal Leger', 'Hopital communautaire de reference', 'Prive a but lucratif', 'Ouest', 'Leogane', 18.51350, -72.60971, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 42, 3, NULL, NULL, NULL, 0, 1, 4, 4, 0, 0, 0, 0, 0, 7, 3, 0, 1, 0);
INSERT INTO spa VALUES (554, 12105, 'Centre materno-infantile', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Leogane', 18.50615, -72.62929, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0);
INSERT INTO spa VALUES (555, 12106, 'Sanatorium de Leogane', 'Hopital', 'Publique', 'Ouest', 'Leogane', 18.51277, -72.60650, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 59, 3, NULL, NULL, NULL, 2, 0, 3, 3, 2, 1, 0, 0, 0, 4, 8, 0, 0, 0);
INSERT INTO spa VALUES (556, 12107, 'Asile de Sigueneau', 'Hopital universitaire', 'Publique', 'Ouest', 'Leogane', 18.51371, -72.60809, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 120, 1, NULL, NULL, NULL, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (557, 12108, 'Hopital Sainte-Croix', 'Hopital communautaire de reference', 'Publique', 'Ouest', 'Leogane', 18.50743, -72.63128, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 2, 46, 1, 1, 10, 4, 4, 2, 6, 6, 0, 2, 0, 0, 0, 8, 1, 0, 1, 0);
INSERT INTO spa VALUES (558, 12109, 'Bire (new mission)', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Leogane', 18.54223, -72.57917, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (559, 12110, 'Dispensaire de Fonds d-oie', 'Dispensaire', 'Prive a but lucratif', 'Ouest', 'Leogane', 18.38871, -72.58448, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 2, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (560, 12111, 'Dispensaire de Trouin', 'Centre de sante a lit', 'Publique', 'Ouest', 'Leogane', 18.36525, -72.65339, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 2, 3, 1, 2, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0);
INSERT INTO spa VALUES (561, 12112, 'Centre petit Harpon', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Leogane', 18.37169, -72.62380, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (562, 12113, 'Centre de Sante Marie Jean', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Leogane', 18.51700, -72.63773, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, NULL, 1, NULL, NULL, NULL, 3, 0, 0, 2, 1, 0, 0, 0, 0, 2, 1, 0, 1, 2);
INSERT INTO spa VALUES (563, 12115, 'Help Hospital', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Leogane', 18.50621, -72.62129, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 2, 16, 1, 1, 1, 0, 1, 0, 3, 2, 2, 0, 0, 0, 0, 8, 4, 0, 0, 3);
INSERT INTO spa VALUES (564, 12117, 'HCMC', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Leogane', 18.46210, -72.63912, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (565, 12119, 'C/S de St Etienne', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Leogane', 18.39757, -72.63473, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (566, 12120, 'Centre hospitalier Hosana', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Leogane', 18.51643, -72.63278, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 12, 1, NULL, NULL, NULL, 2, 1, 1, 2, 0, 0, 0, 1, 0, 3, 1, 0, 1, 0);
INSERT INTO spa VALUES (567, 12121, 'C/S Mathieu', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Leogane', 18.50387, -72.58441, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 2, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (568, 12201, 'Hopital Notre Dame', 'Hopital communautaire de reference', 'Publique', 'Ouest', 'Petit-Goave', 18.43428, -72.86490, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 55, 1, 1, 17, 5, 6, 3, 16, 9, 0, 3, 1, 5, 0, 8, 14, 4, 2, 4);
INSERT INTO spa VALUES (569, 12202, 'Dispensaire de Vialet', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Petit-Goave', 18.42101, -72.93085, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (570, 12203, 'Dispensaire de Madeleine', 'Dispensaire', 'Publique', 'Ouest', 'Petit-Goave', 18.42101, -73.00174, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (571, 12204, 'Dispensaire de Arnoux', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Petit-Goave', 18.39377, -73.02033, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (572, 12205, 'Centre de Sante Les Palmes (Besace)', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Petit-Goave', 18.31218, -72.86790, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 4, 3, 2, 1, 2, 1, 0, 0, 0, 1, 0, 0, 0, 1, 2, 1, 0, 0, 2);
INSERT INTO spa VALUES (573, 12206, 'Centre de Sante de Delattre', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Petit-Goave', 18.30721, -72.94668, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 2, 3, 2, 3, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 3, 0, 0, 0, 1);
INSERT INTO spa VALUES (574, 12207, 'Clinique mobile Olivier', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Petit-Goave', 18.42189, -73.03749, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 3, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (575, 12208, 'Centre de Sante Henry Gerard Desgranges', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Petit-Goave', 18.41782, -72.88120, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 6, 1, NULL, NULL, NULL, 1, 0, 1, 2, 0, 0, 0, 0, 0, 4, 1, 1, 1, 0);
INSERT INTO spa VALUES (576, 12209, 'Dispensaire APV de Vallue (NF)', 'Dispensaire', 'Prive sans but lucratif', 'Ouest', 'Petit-Goave', 18.39218, -72.82203, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES (577, 12212, 'Clinique Siloe', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Petit-Goave', 18.43227, -72.86902, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1);
INSERT INTO spa VALUES (578, 12301, 'Centre de Sante Georges Gauvin', 'Hopital communautaire de reference', 'Publique', 'Ouest', 'Grand-Goave', 18.42727, -72.77119, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 2, 15, 3, 1, 5, 2, 11, 1, 4, 4, 0, 2, 2, 0, 0, 7, 6, 1, 1, 1);
INSERT INTO spa VALUES (579, 12302, 'Centre de Sante de Meyer', 'Centre de sante a lit', 'Publique', 'Ouest', 'Grand-Goave', 18.34102, -72.70818, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, 1, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1);
INSERT INTO spa VALUES (580, 12303, 'Dispensaire de Dufour', 'Dispensaire', 'Publique', 'Ouest', 'Grand-Goave', 18.32132, -72.80486, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (581, 12304, 'Dispensaire de Bonhomme', 'Dispensaire', 'Publique', 'Ouest', 'Grand-Goave', 18.38280, -72.74585, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 2);
INSERT INTO spa VALUES (582, 12305, 'Dispensaire Baudin', 'Dispensaire', 'Publique', 'Ouest', 'Grand-Goave', 18.31337, -72.70823, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 1, 3, 2, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (583, 13101, 'Dispensaire de Bas Boen', 'Dispensaire', 'Publique', 'Ouest', 'Croix-des-Bouquets', 18.56679, -72.15134, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 4, 0, 0, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0);
INSERT INTO spa VALUES (584, 13103, 'Centre  de Sante de la Croix-des-Bouquets', 'Centre de sante a lit', 'Publique', 'Ouest', 'Croix-des-Bouquets', 18.57569, -72.22692, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 2, 17, 1, 1, 17, 17, 4, 0, 3, 3, 1, 0, 0, 0, 0, 3, 17, 2, 1, 1);
INSERT INTO spa VALUES (585, 13104, 'Centre de Sante de Double Harvest', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.54266, -72.19247, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 12, 3, NULL, NULL, NULL, 2, 1, 0, 2, 1, 0, 0, 1, 6, 3, 0, 0, 1, 0);
INSERT INTO spa VALUES (642, 13105, 'Help Incorporate de Vaudreuil', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.58782, -72.17622, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (586, 13106, 'Centre de Sante Lucelia Bontemps', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.61250, -72.31007, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 6, 0, 0, 2, 0, 0, 0, 0, 0, 4, 4, 0, 2, 0);
INSERT INTO spa VALUES (643, 13107, 'Centre de Sante de Turbe', 'Centre de sante a lit', 'Mixte', 'Ouest', 'Croix-des-Bouquets', 18.53600, -72.16661, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (689, 13108, 'Centre de Sante Ste Therese de Santo', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Croix-des-Bouquets', 18.59735, -72.25633, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (587, 13109, 'Centre de Sante Foyer Ste Camille', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.61527, -72.28800, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 2, 85, 1, NULL, NULL, NULL, 3, 0, 8, 4, 0, 1, 0, 0, 0, 41, 11, 0, 1, 0);
INSERT INTO spa VALUES (588, 13110, 'C/S Kampech Dumay', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.51668, -72.20282, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 5, 3, NULL, NULL, NULL, 3, 1, 0, 2, 0, 0, 0, 0, 0, 5, 2, 0, 2, 0);
INSERT INTO spa VALUES (589, 13111, 'Centre de Sante Life Line', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.58251, -72.22219, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, 4, 1, NULL, NULL, NULL, 2, 0, 1, 1, 1, 14, 0, 0, 0, 4, 2, 0, 0, 1);
INSERT INTO spa VALUES (590, 13115, 'FBSA/CMS (Fondation Bon samaritain en Action', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.62108, -72.27889, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 2, 2, NULL, NULL, NULL, 2, 0, 2, 2, 0, 0, 0, 0, 0, 3, 2, 0, 2, 0);
INSERT INTO spa VALUES (591, 13117, 'Clinique mennonite', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.58068, -72.22981, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 2, 1, 0, 0, 0, 0, 3, 1, 0, 1, 0);
INSERT INTO spa VALUES (592, 13118, 'Clinique St EsPrivet', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.60949, -72.24034, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, 1, 1, NULL, NULL, NULL, 3, 0, 0, 1, 0, 1, 1, 0, 0, 4, 2, 1, 0, 0);
INSERT INTO spa VALUES (593, 13119, 'Fwaye Ti zanmi Jezi', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.61518, -72.24630, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 2, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (594, 13120, 'Dispensaire Marie Louise de Jesus - Mixte', 'Dispensaire', 'Prive sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.59827, -72.23966, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 4, 1, NULL, NULL, NULL, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (595, 13122, 'Ebenezer Jumecaut', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.56559, -72.18326, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 13, 1, 1, 0, 0, 3, 0, 9, 4, 0, 1, 0, 0, 1, 7, 4, 1, 0, 2);
INSERT INTO spa VALUES (596, 13123, 'Les Palmes', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Croix-des-Bouquets', 18.60390, -72.26851, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 2, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0);
INSERT INTO spa VALUES (597, 13125, 'COSECO', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.58268, -72.23314, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 2, 12, 3, 1, 1, 3, 3, 0, 1, 5, 1, 2, 0, 0, 0, 9, 0, 0, 1, 0);
INSERT INTO spa VALUES (598, 13126, 'CEPRENULET', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Croix-des-Bouquets', 18.57223, -72.22107, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 2, 0, 0, 2, 0, 0, 0, 0, 0, 5, 2, 0, 1, 1);
INSERT INTO spa VALUES (599, 13127, 'Shalom Clinique Medicale', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.58177, -72.22136, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, 8, 3, 1, 8, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (600, 13128, 'Sodeth Clinique Hospitaliere', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.59266, -72.23909, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 2, 24, 1, 1, 24, 1, 6, 4, 21, 4, 2, 1, 0, 0, 0, 16, 7, 2, 1, 2);
INSERT INTO spa VALUES (601, 13129, 'Piscine de Bethesda', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.61445, -72.21321, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 3, 1, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0);
INSERT INTO spa VALUES (602, 13130, 'Mission Gospel d-Haiti', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Croix-des-Bouquets', 18.62283, -72.21135, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 1, NULL, NULL, NULL, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 2);
INSERT INTO spa VALUES (603, 13131, 'Hopital ital cubain', 'Hopital', 'Publique', 'Ouest', 'Croix-des-Bouquets', 18.57029, -72.21191, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 4, 3, NULL, NULL, NULL, 5, 0, 0, 1, 0, 1, 0, 0, 0, 15, 1, 0, 1, 0);
INSERT INTO spa VALUES (604, 13201, 'C/S de Thomazeau', 'Centre de sante a lit', 'Publique', 'Ouest', 'Thomazeau', 18.65339, -72.09383, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 2, 3, 1, 2, 2, 4, 0, 0, 1, 0, 1, 0, 0, 0, 1, 8, 0, 0, 1);
INSERT INTO spa VALUES (688, 13202, 'Centre de Sante Vision de Nehemi', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Thomazeau', 18.63237, -72.19181, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (605, 13302, 'Centre de Sante de Ganthier', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Ganthier', 18.53210, -72.06202, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 0, 3, NULL, NULL, NULL, 2, 0, 0, 1, 0, 0, 0, 0, 0, 1, 3, 0, 0, 1);
INSERT INTO spa VALUES (606, 13303, 'Dispensaire de Savane cabri', 'Dispensaire', 'Prive sans but lucratif', 'Ouest', 'Ganthier', 18.58640, -72.07810, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES (607, 13305, 'Love  a child', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Ganthier', 18.52094, -71.98214, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 1, 2, 0, 0, 3, 0, 1, 2, 0, 0, 0, 0, 0, 10, 5, 0, 0, 1);
INSERT INTO spa VALUES (608, 13306, 'Eau de vie', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Ganthier', 18.49209, -71.95186, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 2, NULL, NULL, NULL, 2, 0, 0, 3, 0, 0, 0, 0, 0, 3, 2, 0, 2, 0);
INSERT INTO spa VALUES (609, 13307, 'Centre de Sante de Thoman 1', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Ganthier', 18.45141, -71.94179, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0);
INSERT INTO spa VALUES (610, 13308, 'centre de Sante  de Thoman 2', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Ganthier', 18.44549, -71.92901, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (611, 13310, 'Dispensaire aux bons soins', 'Dispensaire', 'Prive a but lucratif', 'Ouest', 'Ganthier', 18.58669, -72.07822, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (710, 13313, 'Centre Hospitalier Christ pour tous', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Ganthier', 18.49981, -71.96147, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (612, 13401, 'Dispensaire de conillon', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Cornillon', 18.67546, -71.95142, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, 1, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (613, 13402, 'Dispensaire de Saint Pierre', 'Dispensaire', 'Publique', 'Ouest', 'Cornillon', 18.66335, -71.86005, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (614, 13403, 'Centre de Sante St Vincent de Paul', 'Centre de sante a lit', 'Prive sans but lucratif', 'Ouest', 'Cornillon', 18.65412, -71.87071, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 2, 15, 3, 1, 5, 2, 1, 0, 1, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (615, 13501, 'C/S de Fonds Verrettes', 'Centre de sante a lit', 'Publique', 'Ouest', 'Fonds-Verrettes', 18.39394, -71.85402, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 4, 3, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (616, 13503, 'Dispensaire d?Orianie', 'Dispensaire', 'Prive a but lucratif', 'Ouest', 'Fonds-Verrettes', 18.30606, -71.83239, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 5, 3, 1, 5, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES (617, 13504, 'Clinique Confiance en Dieu', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Fonds-Verrettes', 18.30772, -71.83222, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 2, 0, 0, 1, 1, 0, 0, 2, NULL, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1);
INSERT INTO spa VALUES (618, 14101, 'Nicolas Armand', 'Hopital communautaire de reference', 'Publique', 'Ouest', 'Arcahaie', 18.77158, -72.51314, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 9, 3, 1, 12, 12, 3, 1, 5, 5, 0, 1, 1, 0, 0, 2, 6, 0, 2, 0);
INSERT INTO spa VALUES (619, 14103, 'SADA Fonds Baptiste', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Arcahaie', 18.92443, -72.58689, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 2, 0, 0, 1);
INSERT INTO spa VALUES (620, 14104, 'SADA Matheux', 'Centre de sante a lit', 'Prive sans but lucratif', 'Ouest', 'Arcahaie', 18.82085, -72.53924, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 3, 3, NULL, NULL, NULL, 3, 0, 0, 2, 0, 0, 0, 0, 0, 11, 7, 1, 0, 1);
INSERT INTO spa VALUES (621, 14105, 'Dispensaire Notre Dame du Perpetuel Secours', 'Dispensaire', 'Publique', 'Ouest', 'Arcahaie', 18.81974, -72.56668, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (666, 14109, 'Centre de Sante Bon Samaritain', 'Dispensaire', 'Prive a but lucratif', 'Ouest', 'Arcahaie', 18.83624, -72.57194, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (622, 14110, 'Hopital Reforme de Saintard', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Arcahaie', 18.82992, -72.54969, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 18, 3, 2, 3, 3, 3, 0, 3, 2, 1, 1, 0, 1, 1, 1, 2, 1, 1, 0);
INSERT INTO spa VALUES (726, 14111, 'Centre de Sante de Rousseau', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Arcahaie', 18.94213, -72.70010, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (623, 14112, 'SADA-AME/Delices', 'Dispensaire', 'Prive sans but lucratif', 'Ouest', 'Arcahaie', 18.90646, -72.46419, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (624, 14113, 'Carrefour Poy', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Arcahaie', 18.79614, -72.50946, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, 1, 5, 1, 1, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (743, 14113, 'Centre de Sante Carrefour Pois', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Arcahaie', 18.79559, -72.50749, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES (667, 14114, 'Clinique Laguerre', 'Dispensaire', 'Prive a but lucratif', 'Ouest', 'Arcahaie', 18.83418, -72.57029, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (625, 14201, 'CSL de source matelas (SADA)', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Cabaret', 18.72131, -72.37375, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0);
INSERT INTO spa VALUES (626, 14202, 'CSL de Cabaret', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Cabaret', 18.73618, -72.41901, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 3, NULL, NULL, NULL, 3, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4, 0, 1, 0);
INSERT INTO spa VALUES (627, 14204, 'CSL de Belanger (SADA)', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Cabaret', 18.73234, -72.44175, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (628, 14205, 'Centre de Sante St Antoine de Titanyen', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Cabaret', 18.71186, -72.34477, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (629, 14207, 'C/S St Gerard', 'Centre de sante a lit', 'Mixte', 'Ouest', 'Cabaret', 18.71370, -72.37737, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (630, 14209, 'Centre de Sante Mission de l-espoir', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Cabaret', 18.71465, -72.35581, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 1, NULL, NULL, NULL, 4, 0, 0, 2, 0, 0, 0, 0, 0, 3, 2, 0, 1, 1);
INSERT INTO spa VALUES (631, 14210, 'Centre hospitalier de l-universite Academiqu', 'Centre de sante a lit', 'Prive sans but lucratif', 'Ouest', 'Cabaret', 18.70095, -72.34061, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 4, 3, 1, 2, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (742, 14211, 'Centre de Sante du Bon samaritain', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Cabaret', 18.79677, -72.38630, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (632, 15102, 'Dispensaire Bill-Rice', 'Centre de sante a lit', 'Mixte', 'Ouest', 'Anse-a-Galets', 18.78885, -72.84650, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 8, 3, 1, 4, 4, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1);
INSERT INTO spa VALUES (633, 15103, 'Hopital Wesleyen', 'Hopital communautaire de reference', 'Mixte', 'Ouest', 'Anse-a-Galets', 18.83388, -72.86237, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 25, 3, 1, 5, 2, 4, 0, 0, 3, 0, 1, 0, 0, 0, 6, 24, 0, 0, 1);
INSERT INTO spa VALUES (634, 15104, 'Dispensaire Marsucrin', 'Dispensaire', 'Prive a but lucratif', 'Ouest', 'Anse a Galets', 18.78775, -72.94595, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (635, 15105, 'Dispensaire Grande Source', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Anse-a-Galets', 18.82170, -72.95690, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, 2, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (636, 15106, 'Clinico Pharma amis des Enfants', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Anse-a-Galets', 18.83505, -72.87515, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1);
INSERT INTO spa VALUES (637, 15107, 'Dispensaire Trou Louis Jeune', 'Dispensaire', 'Mixte', 'Ouest', 'Anse-a-Galets', 18.89877, -73.03951, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 2, 3, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (638, 15108, 'Clinque Bon Samaritain', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Anse-a-Galets', 18.78135, -72.96380, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (639, 15202, 'Dispensaire de tamarin', 'Dispensaire', 'Prive sans but lucratif', 'Ouest', 'Pointe-a-Raquet', 18.90705, -73.20189, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 2, 3, 1, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1);
INSERT INTO spa VALUES (640, 15204, 'Centre World Vision  ti palmiste', 'Centre de sante a lit', 'Prive sans but lucratif', 'Ouest', 'Pointe-a-Raquette', 18.83838, -73.05195, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 2, 10, 1, 1, 4, 2, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (641, 15205, 'Dispensaire Saint-Louis', 'Centre de sante a lit', 'Mixte', 'Ouest', 'Pointe-a-Raquet', 18.78553, -73.06343, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, 4, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (646, 0, 'Centre de Sante St Michel', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.53053, -72.36700, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 3, NULL, NULL, NULL, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, 6, 0, 1, 0);
INSERT INTO spa VALUES (647, 0, 'Centre de Sante Tikajou', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Carrefour', 18.52583, -72.39899, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 2, 1, 0, 1, 2, 0, 1, 1, 1, 0, 2, NULL, 2, 2, 2, 1, 2, 0, 0, 1, 0, 0, 0, 0, 0, 3, 7, 0, 1, 1);
INSERT INTO spa VALUES (648, 0, 'Centre de Sante de Malanga', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.41456, -72.40655, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (649, 0, 'Centre de Sante Communautaire', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Port-au-Prince', 18.52431, -72.34403, 1, 0, 1, 0, 1, 2, 2, 1, 1, 1, 1, 0, 2, 1, 1, 0, 1, 1, 2, 0, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 3, 0, 0, 0, 0, 0, 1, 2, 0, 0, 1);
INSERT INTO spa VALUES (650, 0, 'Missionaires de la Charit� Coeur Immacule de', 'Centre de sante a lit', 'Mixte', 'Ouest', 'Port-au-Prince', 18.55058, -72.32729, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 174, 1, NULL, NULL, NULL, 1, 0, 1, 1, 0, 0, 0, 0, 0, 5, 8, 0, 0, 0);
INSERT INTO spa VALUES (651, 0, 'Centre de Sante Communautaire Williamson', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Arcahaie', 18.84453, -72.57597, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 1);
INSERT INTO spa VALUES (652, 0, 'Maison medicale JESHUA', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Anse-a-Galets', 18.83316, -72.86387, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 5, 3, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 1, 0, 0, 1);
INSERT INTO spa VALUES (653, 0, 'Dispensaire de Source a Philippe', 'Dispensaire', 'Mixte', 'Ouest', 'Pointe-a-Raquet', 18.81935, -73.12273, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (654, 0, 'Centre de Sante Evangelique de Siloe', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.52563, -72.33228, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES (655, 0, 'Centre de Sante des Pres', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.52573, -72.33146, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (656, 0, 'Hopital St Luc', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Tabarre', 18.57114, -72.25094, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 84, 1, NULL, NULL, NULL, 9, 1, 7, 2, 0, 6, 6, 0, 0, 43, 33, 0, 1, 1);
INSERT INTO spa VALUES (657, 0, 'Centre de Sante Laval', 'Dispensaire', 'Publique', 'Ouest', 'Carrefour', 18.44122, -72.41455, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (658, 0, 'Centre Hospitalier de Carrefour', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.53324, -72.38543, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 2, 19, 1, 1, 0, 0, 2, 1, 10, 7, 0, 1, 0, 0, 0, 14, 8, 0, 1, 9);
INSERT INTO spa VALUES (659, 0, 'Centre M�dico Social de P-au-P', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.54467, -72.32435, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (660, 0, 'Centre de Sante communautaire', 'Dispensaire', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.52170, -72.34448, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES (661, 0, 'MSF Suisse', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Leogane', 18.50875, -72.62406, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2, 160, 1, 1, 16, 10, 13, 6, 7, 7, 0, 2, 0, 0, 0, 97, 58, 24, 1, 3);
INSERT INTO spa VALUES (663, 0, 'Hopital Dash Tabarre', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Tabarre', 18.55700, -72.24536, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (664, 0, 'Centre de Sante Christ Roi', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Port-au-Prince', 18.54028, -72.31278, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 2, 0, 0, 1);
INSERT INTO spa VALUES (665, 0, 'CEJPEPH', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.55286, -72.33891, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 3, 3, 0, 0, 2, 0, 0, 1, 6, 1, 0, 0);
INSERT INTO spa VALUES (669, 0, 'Centre de Sante Shekinah', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Carrefour', 18.52658, -72.40120, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (670, 0, 'Centre Hospitalier Veramed', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Cabaret', 18.73370, -72.40379, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (671, 0, 'Centre de Sante Bienfaisance', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.56168, -72.34256, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (672, 0, 'Dispensaire Ste Croix', 'Dispensaire', 'Prive sans but lucratif', 'Ouest', 'Fonds-Verrettes', 18.39399, -71.85692, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES (673, 0, 'Clinique pre et post natale', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.53305, -72.41243, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (674, 0, 'Centre de Sante Jehova', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.52643, -72.35643, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 3, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (675, 0, 'Centre de Sante Bon secours', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.63460, -72.26206, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (676, 0, 'Centre de Sante Midha', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.53188, -72.41507, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 3, 1, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (677, 0, 'Centre de Sante medical', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.55061, -72.40534, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0);
INSERT INTO spa VALUES (678, 0, 'Centre Hospitalier de Santo', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.58821, -72.24675, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2, 8, 3, 1, 2, 1, 4, 2, 5, 2, 0, 0, 0, 0, 0, 4, 3, 0, 1, 0);
INSERT INTO spa VALUES (679, 0, 'GREFAJUR', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.51126, -72.27306, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 3, 1, 1, 2, 0, 0, 0, 0, 0, 3, 0, 0, 0, 1);
INSERT INTO spa VALUES (680, 0, 'Clinique centrale de l-�glise', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Cite-Soleil', 18.58038, -72.32894, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 1, NULL, NULL, NULL, 3, 0, 1, 1, 0, 0, 0, 0, 0, 3, 0, 0, 0, 2);
INSERT INTO spa VALUES (681, 0, 'Centre de Sante Familial', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Cite-Soleil', 18.59560, -72.31479, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 2, 0, 0, 1, 0);
INSERT INTO spa VALUES (682, 0, 'DASH Martissant 4', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53089, -72.36226, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 2, 8, 3, NULL, NULL, NULL, 2, 0, 3, 2, 0, 0, 0, 0, 0, 3, 0, 0, 0, 1);
INSERT INTO spa VALUES (685, 0, 'Clinique Familiale', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.53726, -72.32145, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2, 7, 3, 1, 5, 3, 1, 1, 0, 1, 0, 0, 0, 0, 0, 4, 1, 0, 0, 1);
INSERT INTO spa VALUES (686, 0, 'Centre de Sante Communautaire', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Port-au-Prince', 18.52173, -72.34435, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4, 0, 0, 0);
INSERT INTO spa VALUES (687, 0, 'Dispensaire Missionnaire', 'Dispensaire', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.55504, -72.34251, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 1, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0);
INSERT INTO spa VALUES (694, 0, 'MSF Drouillard', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Cite-Soleil', 18.59068, -72.31917, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 2, 127, 1, NULL, NULL, NULL, 2, 9, 13, 5, 0, 5, 0, 0, 0, 121, 63, 0, 2, 1);
INSERT INTO spa VALUES (695, 0, 'Maison la Sante Delmas', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Delmas', 18.54286, -72.30843, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 1, 0, 0, 0, 1, 0, 4, 0, 0, 0, 0);
INSERT INTO spa VALUES (696, 0, 'Centre M�dico social', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53689, -72.31815, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 2, 2, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (697, 0, 'Centre de Sante Bonke', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Croix-des-Bouquets', 18.61198, -72.24088, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 2, NULL, NULL, NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1);
INSERT INTO spa VALUES (698, 0, 'Centre Hospitalier communautaire Lilavois', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.63340, -72.25396, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 20, 1, 1, 4, 1, 2, 0, 0, 2, 1, 0, 0, 0, 0, 4, 0, 0, 1, 0);
INSERT INTO spa VALUES (700, 0, 'Centre de Sante Fondation st Luc', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Cite-Soleil', 18.56646, -72.34947, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (701, 0, 'Clinique medicale de soins communautaires', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.50882, -72.29053, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (702, 0, 'Mission Matana', 'Centre de sante sans lit', 'Publique', 'Ouest', 'Arcahaie', 18.81345, -72.50158, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 1, 1, 3, 1, 0, 0, 0, 1, 6, 2, 1, 2, 1);
INSERT INTO spa VALUES (703, 0, 'Centre de Sante Delouis', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Port-au-Prince', 18.52382, -72.36604, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, 2, 2, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (704, 0, 'Dispensaire Tombe Gateau', 'Dispensaire', 'Prive a but lucratif', 'Ouest', 'Leogane', 18.37549, -72.58781, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (705, 0, 'Centre de Sante de Lyro', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Tabarre', 18.55966, -72.24693, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 2, 3, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 1, 1, 0, 3, 0, 0, 0, 0);
INSERT INTO spa VALUES (706, 0, 'Clinique Pofamil', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Croix-des-Bouquets', 18.58151, -72.22539, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (707, 0, 'Centre d-attention Primaire', 'Dispensaire', 'Prive a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.55539, -72.18370, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 2, 3, 2, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 1, 0);
INSERT INTO spa VALUES (708, 0, 'Centre de Sante Procy Chauffard', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.47748, -72.38964, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (709, 0, 'Hopital Sans Frontiere', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.53109, -72.36273, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 30, 1, 1, 3, 12, 10, 0, 0, 0, 0, 4, 0, 0, 0, 26, 26, 5, 0, 3);
INSERT INTO spa VALUES (711, 0, 'Clinique Sante pour tous', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Delmas', 18.52408, -72.28443, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1);
INSERT INTO spa VALUES (712, 0, 'Hopital ste Marie', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Cite-Soleil', 18.58331, -72.33833, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 2, 30, 3, NULL, NULL, NULL, 3, 0, 1, 1, 0, 2, 0, 0, 0, 5, 8, 0, 1, 1);
INSERT INTO spa VALUES (713, 0, 'Centre de Sante Lumiere', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Cite-Soleil', 18.58588, -72.31183, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 5, 3, 2, 0, 0, 1, 0, 3, 1, 0, 0, 0, 0, 0, 2, 1, 0, 0, 1);
INSERT INTO spa VALUES (714, 0, 'Centre Hospitalier de Canaan', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.65042, -72.27113, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 2, 3, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0);
INSERT INTO spa VALUES (715, 0, 'Clinique Jesus le vrai chemin', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Croix-des-Bouquets', 18.65406, -72.28250, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0);
INSERT INTO spa VALUES (716, 0, 'Dispensaire de Jasmin', 'Dispensaire', 'Prive sans but lucratif', 'Ouest', 'Gressier', 18.51275, -72.51075, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (717, 0, 'Dispensaire Solo Christus', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Gressier', 18.49611, -72.53518, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1);
INSERT INTO spa VALUES (719, 0, 'Centre de Sante Pedodontique', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.53493, -72.35011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES (720, 0, 'Centre de Sante Bethesda', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Carrefour', 18.52903, -72.41161, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 2, 3, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (721, 0, 'Centre de Sante de Chauffard', 'Dispensaire', 'Prive sans but lucratif', 'Ouest', 'Carrefour', 18.53213, -72.38887, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0);
INSERT INTO spa VALUES (722, 0, 'Centre FOSREF', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Carrefour', 18.44578, -72.38038, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (723, 0, 'Hop a live clinic', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Carrefour', 18.54033, -72.45354, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO spa VALUES (724, 0, 'Centre de Sante Moula', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Carrefour', 18.53481, -72.42601, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 4, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 3, 1, 0, 1, 0);
INSERT INTO spa VALUES (725, 0, 'Centre medical de Paloma', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Carrefour', 18.54065, -72.42166, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 4, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 1, 0, 0, 3, 0, 0, 1, 1);
INSERT INTO spa VALUES (727, 0, 'Centre Sante Lassale.', 'Centre de sante sans lit', 'Mixte', 'Ouest', 'Leogane', 18.54824, -72.57624, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (729, 0, 'Clinimed', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.51483, -72.26736, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (730, 0, 'Clinique Sante pour tous', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.51658, -72.28734, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO spa VALUES (732, 0, 'Clinique St Jude', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Delmas', 18.56674, -72.29472, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 1, 0);
INSERT INTO spa VALUES (733, 0, 'Plurimedic', 'Hopital', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.53323, -72.32910, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 2, 998, 3, 1, 0, 0, 0, 2, 3, 1, 0, 6, 1, 10, 10, 25, 6, 0, 2, 3);
INSERT INTO spa VALUES (734, 0, 'Centre de Sante communautaire', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.52597, -72.34765, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO spa VALUES (735, 0, 'Centre de Sante communautaire de Tunnel', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Port-au-Prince', 18.52270, -72.33917, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO spa VALUES (736, 0, 'Centre de Sante Kay Hypocrate', 'Centre de sante a lit', 'Prive sans but lucratif', 'Ouest', 'Ganthier', 18.56659, -72.06616, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (737, 0, 'Clinique Fils Brillant', 'Dispensaire', 'Prive sans but lucratif', 'Ouest', 'Anse-a-Galets', 18.83474, -72.87734, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1);
INSERT INTO spa VALUES (738, 0, 'Dispensaire Stronght Health Clinic', 'Dispensaire', 'Publique', 'Ouest', 'Anse-a-Galets', 18.80807, -72.98143, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (739, 0, 'Rapha clinique medicale', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Delmas', 18.56215, -72.32201, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, NULL, 1, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (740, 0, 'MSF Belgique', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Tabarre', 18.56966, -72.26568, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 2, 107, 1, NULL, NULL, NULL, 5, 4, 12, 5, 1, 4, 0, 0, 0, 0, 0, 0, 1, 2);
INSERT INTO spa VALUES (741, 0, 'MSF Hollande', 'Hopital', 'Prive sans but lucratif', 'Ouest', 'Delmas', 18.55533, -72.29989, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 104, 1, 1, 110, 5, 0, 0, 26, 11, 0, 0, 0, 0, 0, 79, 45, 37, 1, 4);
INSERT INTO spa VALUES (745, 0, 'Clinique Repheka', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Port-au-Prince', 18.52299, -72.34084, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 3, 0, 3, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0);
INSERT INTO spa VALUES (746, 0, 'Family Memorial medical center', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Tabarre', 18.59754, -72.28455, 2, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 0, 1, 0, 0, 0, 0, 0, 3, 0, 0, 0, 1);
INSERT INTO spa VALUES (747, 0, 'Centre de Sante Repheka Pernier', 'Centre de sante sans lit', 'Prive a but lucratif', 'Ouest', 'Petion-Ville', 18.51888, -72.23596, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 2, 0, 2, 2, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0);
INSERT INTO spa VALUES (748, 0, 'Centre de Sante Fondation Racine', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Ouest', 'Leogane', 18.54019, -72.61938, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (749, 0, 'CEMEPIO', 'Centre de sante a lit', 'Prive sans but lucratif', 'Ouest', 'Cite-Soleil', 18.59496, -72.31188, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 6, 3, 1, 2, 2, 1, 0, 1, 2, 1, 0, 0, 0, 0, 2, 1, 1, 2, 1);
INSERT INTO spa VALUES (750, 0, 'Centre de Sante of Live', 'Centre de sante a lit', 'Prive a but lucratif', 'Ouest', 'Tabarre', 18.58251, -72.30486, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 6, 3, 1, 6, 6, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 1);
INSERT INTO spa VALUES (751, 71100, 'HIC', 'Hopital communautaire de reference', 'Publique', 'Sud', 'Les Cayes', 18.19346, -73.75095, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 146, 1, 1, 13, 13, 8, 3, 10, 14, 2, 3, 0, 0, 0, 85, 59, 5, 3, 0);
INSERT INTO spa VALUES (752, 71101, 'I. O. Brenda', 'Hopital', 'Mixte', 'Sud', 'Les Cayes', 18.19546, -73.75776, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, 42, 1, NULL, NULL, NULL, 1, 0, 5, 3, 0, 0, 0, 0, 0, 15, 15, 0, 1, 1);
INSERT INTO spa VALUES (753, 71102, 'Sanatorium', 'Hopital', 'Publique', 'Sud', 'Les Cayes', 18.22230, -73.74539, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 20, 3, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 3, 4, 0, 0, 0);
INSERT INTO spa VALUES (754, 71103, 'Citymed', 'Hopital', 'Prive a but lucratif', 'Sud', 'Les Cayes', 18.19222, -73.75244, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2, 9, 3, 1, 4, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 7, 3, 0, 0, 1);
INSERT INTO spa VALUES (755, 71104, 'Cite Lumiere', 'Hopital universitaire', 'Mixte', 'Sud', 'Les Cayes', 18.22852, -73.76136, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 2, 70, 3, 1, 4, 0, 6, 1, 0, 0, 0, 2, 1, 3, 0, 30, 15, 1, 0, 4);
INSERT INTO spa VALUES (756, 71105, 'Klinik Lafanmy', 'Centre de sante a lit', 'Prive a but lucratif', 'Sud', 'Les Cayes', 18.19453, -73.74921, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 3, 2, NULL, NULL, NULL, 0, 0, 1, 1, 0, 1, 0, 0, 0, 3, 2, 0, 0, 0);
INSERT INTO spa VALUES (757, 71106, 'Quatre Chemins', 'Centre de sante sans lit', 'Publique', 'Sud', 'Les Cayes', 18.20088, -73.75373, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 5, 0, 0, 0, 0, 0, 3, 6, 0, 0, 0);
INSERT INTO spa VALUES (758, 71109, 'Laborde', 'Dispensaire', 'Mixte', 'Sud', 'Les Cayes', 18.28221, -73.80329, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 2, 2, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (759, 71110, 'Colette', 'Dispensaire', 'Publique', 'Sud', 'Les Cayes', 18.19309, -73.77776, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (760, 71111, 'Laurent', 'Dispensaire', 'Publique', 'Sud', 'Les Cayes', 18.26232, -73.73537, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (761, 71112, 'Fonfred', 'Dispensaire', 'Mixte', 'Sud', 'Les Cayes', 18.23401, -73.80275, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (762, 71113, 'World Vision', 'Centre de sante sans lit', 'Mixte', 'Sud', 'Les Cayes', 18.26879, -73.77594, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (763, 71115, 'FORSREF', 'Centre de sante sans lit', 'Mixte', 'Sud', 'Les Cayes', 18.19922, -73.75873, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (764, 71116, 'Kay Timoun Bondye', 'Dispensaire', 'Prive a but lucratif', 'Sud', 'Les Cayes', 18.19448, -73.74355, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 3, 0, 0, 1);
INSERT INTO spa VALUES (765, 71117, 'Sacre Coeur', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Sud', 'Les Cayes', 18.21378, -73.75113, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 2, NULL, 1, NULL, NULL, NULL, 1, 0, 0, 6, 0, 0, 0, 0, 0, 5, 6, 0, 0, 1);
INSERT INTO spa VALUES (766, 71201, 'Maison de Naissance', 'Centre de sante a lit', 'Prive a but lucratif', 'Sud', 'Torbeck', 18.19720, -73.82662, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 2, 998, 1, 1, 7, 2, 0, 0, 0, 3, 0, 0, 0, 0, 0, 2, 11, 5, 1, 0);
INSERT INTO spa VALUES (767, 71203, 'Ducis', 'Dispensaire', 'Mixte', 'Sud', 'Torbeck', 18.23458, -73.88766, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (768, 71204, 'Maillard', 'Dispensaire', 'Prive a but lucratif', 'Sud', 'Torbeck', 18.17268, -73.83233, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0);
INSERT INTO spa VALUES (769, 71205, 'Beraud', 'Centre de sante sans lit', 'Publique', 'Sud', 'Torbeck', 18.20535, -73.85980, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0);
INSERT INTO spa VALUES (770, 71206, 'Ferme Leblanc', 'Dispensaire', 'Publique', 'Sud', 'Torbeck', 18.28793, -73.88375, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (771, 71207, 'Centre de Sante de Torbeck', 'Centre de sante sans lit', 'Publique', 'Sud', 'Torbeck', 18.16175, -73.82089, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0);
INSERT INTO spa VALUES (772, 71301, 'Chantal', 'Centre de sante sans lit', 'Publique', 'Sud', 'Chantal', 18.20300, -73.88899, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 1, 3, 1, 1, 1, 1, 0, 0, 5, 0, 0, 0, 0, 0, 5, 3, 0, 0, 2);
INSERT INTO spa VALUES (773, 71401, 'CS Camp-Perrin', 'Hopital communautaire de reference', 'Publique', 'Sud', 'Camp-Perrin', 18.31267, -73.86584, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 7, 3, 1, 4, 3, 5, 0, 0, 3, 1, 1, 0, 0, 0, 7, 6, 0, 0, 0);
INSERT INTO spa VALUES (774, 71402, 'Mazenod', 'Dispensaire', 'Mixte', 'Sud', 'Camp-Perrin', 18.32937, -73.85319, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (775, 71403, 'Guichard', 'Dispensaire', 'Mixte', 'Sud', 'Camp-Perrin', 18.29545, -73.82892, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 2, 1, 0, 0, 0, 0, 2, 3, 0, 0, 1);
INSERT INTO spa VALUES (776, 71404, 'Mersan', 'Dispensaire', 'Publique', 'Sud', 'Camp-Perrin', 18.28105, -73.84389, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (777, 71501, 'Maniche', 'Centre de sante sans lit', 'Mixte', 'Sud', 'Maniche', 18.34515, -73.77788, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, NULL, 3, 2, 4, 1, 1, 0, 0, 2, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (778, 71502, 'Dory', 'Dispensaire', 'Publique', 'Sud', 'Maniche', 18.35588, -73.72299, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 2, 3, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (779, 71503, 'Melon', 'Dispensaire', 'Publique', 'Sud', 'Maniche', 18.35335, -73.77325, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0);
INSERT INTO spa VALUES (780, 71601, 'Ile a Vache', 'Centre de sante sans lit', 'Publique', 'Sud', 'Ile-a-Vache', 18.08318, -73.65397, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 2, 3, 1, 2, 2, 1, 0, 0, 2, 0, 0, 0, 0, 0, 5, 3, 0, 0, 1);
INSERT INTO spa VALUES (781, 72101, 'Port Salut', 'Hopital', 'Prive sans but lucratif', 'Sud', 'Port-Salut', 18.10988, -73.93922, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, NULL, 3, NULL, NULL, NULL, 2, 0, 1, 1, 1, 0, 0, 0, 0, 4, 2, 0, 0, 0);
INSERT INTO spa VALUES (782, 72102, 'Dumont', 'Dispensaire', 'Publique', 'Sud', 'Port-Salut', 18.06013, -73.88500, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (783, 72103, 'Carpentier', 'Dispensaire', 'Publique', 'Sud', 'Port-Salut', 18.13206, -73.94707, 1, 0, 1, 1, 1, 2, 2, 1, 1, 2, 2, 2, 2, 1, 1, 2, 2, 2, 2, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (784, 72104, 'HCR de Port Salut', 'Hopital communautaire de reference', 'Publique', 'Sud', 'Port-Salut', 18.08199, -73.91998, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 2, 13, 1, 1, 5, 2, 6, 0, 1, 3, 0, 1, 2, 1, 0, 10, 5, 1, 1, 0);
INSERT INTO spa VALUES (785, 72201, 'St Jean', 'Centre de sante sans lit', 'Publique', 'Sud', 'Saint-Jean-du-Sud', 18.07627, -73.81247, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 2, 3, 2, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 3, 1, 0, 0);
INSERT INTO spa VALUES (786, 72202, 'Carrefour Joute', 'Dispensaire', 'Publique', 'Sud', 'Saint-Jean-du-Sud', 18.11502, -73.85211, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (787, 73101, 'C/S Aquin', 'Centre de sante sans lit', 'Mixte', 'Sud', 'Aquin', 18.31118, -73.19286, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 1);
INSERT INTO spa VALUES (788, 73102, 'C/S La Colline', 'Centre de sante a lit', 'Mixte', 'Sud', 'Aquin', 18.30811, -73.24628, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 6, 3, 1, 4, 2, 1, 0, 0, 3, 0, 0, 0, 0, 0, 3, 4, 0, 2, 1);
INSERT INTO spa VALUES (789, 73104, 'Charles Pasqua', 'Centre de sante a lit', 'Prive sans but lucratif', 'Sud', 'Aquin', 18.29408, -73.34419, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 15, 3, 1, 3, 1, 2, 1, 0, 3, 0, 0, 0, 0, 0, 1, 4, 0, 0, 0);
INSERT INTO spa VALUES (790, 73105, 'Vx Bourg', 'Dispensaire', 'Mixte', 'Sud', 'Aquin', 18.29894, -73.34353, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 4, 0, 0, 1);
INSERT INTO spa VALUES (791, 73106, 'Ste Helene', 'Dispensaire', 'Prive a but lucratif', 'Sud', 'Aquin', 18.31722, -73.37786, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 10, 3, NULL, NULL, NULL, 1, 0, 0, 2, 0, 0, 0, 0, 0, 2, 8, 0, 0, 1);
INSERT INTO spa VALUES (792, 73111, 'Hopital ital Saint Boniface', 'Hopital', 'Prive sans but lucratif', 'Sud', 'Aquin', 18.27732, -73.12987, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 60, 1, 1, 2, 3, 7, 0, 4, 7, 0, 2, 2, 3, 0, 35, 12, 2, 3, 5);
INSERT INTO spa VALUES (793, 73112, 'HCR d-Aquin', 'Hopital communautaire de reference', 'Publique', 'Sud', 'Aquin', 18.28103, -73.39755, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 2, 21, 3, 1, 8, 8, 1, 0, 1, 3, 0, 0, 1, 0, 0, 3, 4, 1, 0, 4);
INSERT INTO spa VALUES (794, 73201, 'Saint Louis', 'Centre de sante a lit', 'Publique', 'Sud', 'Saint-Jean-du-Sud', 18.26303, -73.54661, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 8, 3, 1, 1, 1, 1, 0, 0, 4, 0, 0, 0, 1, 0, 5, 10, 0, 0, 0);
INSERT INTO spa VALUES (795, 73202, 'Saint Patrick', 'Dispensaire', 'Prive a but lucratif', 'Sud', 'Saint-Jean-du-Sud', 18.26425, -73.54254, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (796, 73203, 'Sucrerie Henry', 'Dispensaire', 'Mixte', 'Sud', 'Saint-Jean-du-Sud', 18.29090, -73.57026, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 2, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0);
INSERT INTO spa VALUES (797, 73301, 'Hopital Bonne Fin', 'Hopital', 'Prive a but lucratif', 'Sud', 'Cavaillon', 18.39365, -73.61257, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 2, 100, 1, 1, 28, 2, 4, 2, 8, 5, 0, 2, 1, 0, 0, 16, 20, 0, 4, 0);
INSERT INTO spa VALUES (798, 73302, 'C/S Cavaillon', 'Centre de sante sans lit', 'Publique', 'Sud', 'Cavaillon', 18.29460, -73.64613, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 8, 3, 1, 8, 8, 3, 0, 0, 5, 0, 0, 0, 0, 0, 1, 10, 0, 2, 2);
INSERT INTO spa VALUES (799, 73303, 'Cavaillon NDPS', 'Centre de sante sans lit', 'Prive a but lucratif', 'Sud', 'Cavaillon', 18.29943, -73.65364, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (800, 73305, 'Com. Bonne Fin', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Sud', 'Cavaillon', 18.39356, -73.61374, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 10, 0, 0, 0);
INSERT INTO spa VALUES (801, 73307, 'Dispensaire St Joseph et St Charles', 'Dispensaire', 'Prive a but lucratif', 'Sud', 'Cavaillon', 18.24577, -73.65325, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (802, 73308, 'PPS Sante Communautaire Marc Lacet', 'Dispensaire', 'Mixte', 'Sud', 'Cavaillon', 18.41467, -73.65718, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (803, 74101, 'Coteaux', 'Centre de sante sans lit', 'Publique', 'Sud', 'Coteaux', 18.20600, -74.04046, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 3, 3, 1, 1, 1, 2, 0, 0, 1, 0, 0, 0, 0, 0, 1, 3, 0, 1, 0);
INSERT INTO spa VALUES (804, 74102, 'Damassin', 'Dispensaire', 'Publique', 'Sud', 'Coteaux', 18.22936, -74.06366, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 2, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 1);
INSERT INTO spa VALUES (805, 74201, 'Port a Piment', 'Centre de sante a lit', 'Publique', 'Sud', 'Port-a-Piment', 18.25376, -74.10002, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 3, 2, 4, 2, 0, 1, 0, 1, 0, 0, 0, 0, 0, 2, 4, 0, 0, 1);
INSERT INTO spa VALUES (806, 74301, 'Roche a Bateau', 'Dispensaire', 'Mixte', 'Sud', 'Roche-a-Bateau', 18.17980, -74.00349, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 4, 3, 1, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0);
INSERT INTO spa VALUES (807, 75101, 'Ste Anne', 'Dispensaire', 'Prive sans but lucratif', 'Sud', 'Chardonnieres', 18.27358, -74.16625, 1, 1, 1, 1, 1, 2, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 2, 0, 0, 0, 0, 0, 4, 1, 0, 0, 0);
INSERT INTO spa VALUES (808, 75102, 'Rendel', 'Dispensaire', 'Mixte', 'Sud', 'Chardonnieres', 18.31769, -74.09336, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 2, 0, 0, 1);
INSERT INTO spa VALUES (809, 75201, 'Les Anglais', 'Centre de sante a lit', 'Publique', 'Sud', 'Les Anglais', 18.30764, -74.21908, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 10, 1, 1, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 7, 7, 0, 1, 0);
INSERT INTO spa VALUES (810, 75301, 'Dispensaire Roger Paradis', 'Dispensaire', 'Mixte', 'Sud', 'Tiburon', 18.32536, -74.39614, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 2, 3, 2, 2, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 2, 3, 0, 0, 0);
INSERT INTO spa VALUES (811, 0, 'Centre Materno Infantil', 'Centre de sante sans lit', 'Prive a but lucratif', 'Sud', 'Cavaillon', 18.29028, -73.63299, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 2, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1);
INSERT INTO spa VALUES (812, 0, 'Dispensaire Marcabel', 'Dispensaire', 'Prive a but lucratif', 'Sud', 'Port-Salut', 18.07388, -73.88394, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (813, 0, 'Dispensaire Notre Dame du Bon Secours', 'Dispensaire', 'Mixte', 'Sud', 'Cavaillon', 18.30187, -73.65524, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (814, 0, 'Dispensaire Kakok', 'Dispensaire', 'Prive sans but lucratif', 'Sud', 'Ile-a-Vache', 18.10811, -73.70061, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (815, 0, 'PPS La Biche', 'Dispensaire', 'Prive sans but lucratif', 'Sud', 'Cavaillon', 18.35896, -73.63333, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (816, 0, 'FOSREF Lakay', 'Dispensaire', 'Prive sans but lucratif', 'Sud', 'Les Cayes', 18.20107, -73.76049, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (817, 0, 'Centre Communautaire de Baie Dumesle', 'Centre de sante sans lit', 'Publique', 'Sud', 'Saint-Jean-du-Sud', 18.22800, -73.61500, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (818, 21100, 'Hopital ital St Michel', 'Hopital departemental', 'Publique', 'Sud-Est', 'Jacmel', 18.23814, -72.54208, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 102, 1, 1, 14, 3, 9, 3, 20, 8, 0, 6, 0, 0, 1, 32, 32, 4, 1, 0);
INSERT INTO spa VALUES (819, 21101, 'CSLdes Orangers', 'Centre de sante sans lit', 'Publique', 'Sud-Est', 'Jacmel', 18.26012, -72.50866, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (820, 21102, 'CSL PROFAMIL (F)', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Sud-Est', 'Jacmel', 18.23332, -72.53717, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (821, 21103, 'Dispensaire Cyvadier', 'Dispensaire', 'Publique', 'Sud-Est', 'Jacmel', 18.22717, -72.46642, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (822, 21104, 'Dispensaire La Montagne', 'Dispensaire', 'Publique', 'Sud-Est', 'Jacmel', 18.21608, -72.62314, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (823, 21105, 'Dispensaire Marbial', 'Dispensaire', 'Publique', 'Sud-Est', 'Jacmel', 18.33357, -72.47214, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 2, 3, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0);
INSERT INTO spa VALUES (824, 21106, 'Dispensaire La Montagne la Voute', 'Dispensaire', 'Publique', 'Sud-Est', 'Jacmel', 18.32880, -72.51088, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, 2, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (825, 21107, 'Dispensaire La Vanneau', 'Dispensaire', 'Publique', 'Sud-Est', 'Jacmel', 18.25847, -72.60780, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (826, 21109, 'Dispensaire Bellevue la Montagne', 'Dispensaire', 'Publique', 'Sud-Est', 'Jacmel', 18.19450, -72.57141, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (827, 21110, 'Dispensaire Lafond', 'Dispensaire', 'Publique', 'Sud-Est', 'Jacmel', 18.28099, -72.51803, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (828, 21111, 'Centre de Fosref (F)', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Sud-Est', 'Jacmel', 18.23321, -72.52715, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (829, 21112, 'Centre a lits Christian Martinez (F)', 'Hopital', 'Prive a but lucratif', 'Sud-Est', 'Jacmel', 18.23392, -72.53605, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 2, 14, 3, 1, 2, 4, 1, 0, 0, 1, 0, 0, 0, 0, 0, 4, 2, 0, 0, 0);
INSERT INTO spa VALUES (830, 21201, 'Centre de Sante de Marigot', 'Centre de sante sans lit', 'Publique', 'Sud-Est', 'Marigot', 18.23139, -72.32670, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, NULL, 3, 1, 4, 3, 5, 0, 0, 4, 0, 0, 0, 0, 0, 4, 9, 2, 0, 1);
INSERT INTO spa VALUES (831, 21202, 'Dispensaire Peredo', 'Dispensaire', 'Publique', 'Sud-Est', 'Marigot', 18.25022, -72.30580, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 3, 3, 1, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (832, 21203, 'Dispensaire Seguin', 'Dispensaire', 'Publique', 'Sud-Est', 'Marigot', 18.31647, -72.23876, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (833, 21301, 'Centre de Sante Les Cayes Jacmel', 'Hopital communautaire de reference', 'Publique', 'Sud-Est', 'Cayes-Jacmel', 18.23092, -72.39783, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2, 8, 1, 1, 4, 3, 6, 1, 2, 0, 0, 1, 0, 0, 0, 5, 2, 1, 0, 0);
INSERT INTO spa VALUES (834, 21302, 'Centre de sante Emmanuel Baptiste (F)', 'Centre de sante a lit', 'Prive sans but lucratif', 'Sud-Est', 'Cayes-Jacmel', 18.24222, -72.39839, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 2, 12, 3, NULL, NULL, NULL, 0, 1, 2, 3, 0, 1, 0, 0, 0, 2, 7, 0, 0, 2);
INSERT INTO spa VALUES (835, 21303, 'Dispensaire Cap Rouge', 'Dispensaire', 'Publique', 'Sud-Est', 'Cayes-Jacmel', 18.26989, -72.42506, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, NULL, 3, 2, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (843, 21401, 'Centre a lits Joseph', 'Hopital', 'Publique', 'Sud-Est', 'La Vallee', 18.26791, -72.66615, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 20, 1, 1, 2, 2, 3, 0, 0, 1, 0, 0, 0, 0, 0, 2, 11, 0, 1, 0);
INSERT INTO spa VALUES (844, 22101, 'Centre a Lits de Bainet', 'Centre de sante a lit', 'Publique', 'Sud-Est', 'Bainet', 18.18314, -72.75501, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 6, 1, 1, 3, 2, 5, 0, 0, 6, 0, 1, 0, 0, 0, 3, 0, 1, 0, 1);
INSERT INTO spa VALUES (845, 22102, 'Dispensaire Saurel', 'Dispensaire', 'Publique', 'Sud-Est', 'Bainet', 18.19684, -72.86514, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (846, 22103, 'Dispensaire Bahot', 'Dispensaire', 'Publique', 'Sud-Est', 'Bainet', 18.23124, -72.73484, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (847, 22104, 'Dispensaire Chaumeille', 'Dispensaire', 'Publique', 'Sud-Est', 'Bainet', 18.17803, -72.80058, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 2, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (848, 22105, 'Dispensaire Bresilienne', 'Dispensaire', 'Mixte', 'Sud-Est', 'Bainet', 18.19009, -72.67404, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (849, 22106, 'Dispensaire Orangers', 'Dispensaire', 'Publique', 'Sud-Est', 'Bainet', 18.23595, -72.82644, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (850, 22107, 'Dispensaire Bras gauche', 'Dispensaire', 'Publique', 'Sud-Est', 'Bainet', 18.25731, -72.86056, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 0, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spa VALUES (851, 22201, 'Centre a lits de Gris Gris', 'Centre de sante sans lit', 'Mixte', 'Sud-Est', 'Cotes-de-Fer', 18.23217, -72.94109, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 3, 3, 1, 3, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1);
INSERT INTO spa VALUES (852, 22202, 'Dispensaire Saint Joseph', 'Centre de sante sans lit', 'Publique', 'Sud-Est', 'Cotes-de-Fer', 18.19031, -73.00335, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 6, 2, 1, 1, 2, 2, 0, 1, 1, 0, 0, 0, 0, 0, 2, 2, 0, 0, 1);
INSERT INTO spa VALUES (853, 22203, 'Dispensaire Boucan Belier', 'Dispensaire', 'Mixte', 'Sud-Est', 'Cotes-de-Fer', 18.26344, -72.95444, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (854, 22204, 'Dispensaire Ricot (F)', 'Dispensaire', 'Mixte', 'Sud-Est', 'Cotes-de-Fer', 18.26024, -72.99071, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1);
INSERT INTO spa VALUES (855, 22205, 'Foie et Vie', 'Centre de sante a lit', 'Prive sans but lucratif', 'Sud-Est', 'Cotes-de-Fer', 18.23853, -72.98385, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 2, 4, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 3, 2, 0, 1, 1);
INSERT INTO spa VALUES (856, 23101, 'Centre de Sante sans�lit de Belle Anse (F)', 'Centre de sante sans lit', 'Publique', 'Sud-Est', 'Belle-Anse', 18.23783, -72.06372, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 2, 3, 3, 1, 2, 2, 2, 0, 0, 2, 0, 0, 0, 0, 0, 3, 5, 0, 0, 0);
INSERT INTO spa VALUES (857, 23102, 'Dispensaire de Mapou', 'Dispensaire', 'Publique', 'Sud-Est', 'Belle-Anse', 18.26469, -71.97244, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0);
INSERT INTO spa VALUES (836, 23202, 'Dispensaire de Bodarie', 'Dispensaire', 'Publique', 'Sud-Est', 'Grand-Gosier', 18.25915, -71.89480, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (837, 23301, 'Centre sans lit de Thiotte', 'Centre de sante sans lit', 'Publique', 'Sud-Est', 'Thiotte', 18.23749, -71.85061, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 2, 0, 3, 2, 3, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 6, 3, 0, 0, 1);
INSERT INTO spa VALUES (838, 23302, 'Dispensaire Bleck', 'Centre de sante a lit', 'Mixte', 'Sud-Est', 'Thiotte', 18.21718, -71.84220, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 2, 2, 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1);
INSERT INTO spa VALUES (839, 23303, 'Dispensaire Savane Zombi', 'Dispensaire', 'Publique', 'Sud-Est', 'Thiotte', 18.27643, -71.81092, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);
INSERT INTO spa VALUES (840, 23305, 'CSL Sacre- Coeur', 'Centre de sante a lit', 'Prive sans but lucratif', 'Sud-Est', 'Thiotte', 18.24512, -71.84263, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 2, 10, 2, 2, 3, 2, 1, 0, 0, 1, 0, 0, 0, 0, 0, 2, 3, 0, 1, 0);
INSERT INTO spa VALUES (841, 23401, 'Centre sans lit des Anse-a-Pitres', 'Centre de sante sans lit', 'Publique', 'Sud-Est', 'Anse-a-Pitres', 18.04303, -71.75573, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 2, 3, 3, 1, 3, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 3, 2, 0, 0, 1);
INSERT INTO spa VALUES (842, 23402, 'Dispensaire de Banane', 'Dispensaire', 'Publique', 'Sud-Est', 'Anse-a-Pitres', 18.14408, -71.76070, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO spa VALUES (858, 0, 'Dispensaire de Platon Fedre', 'Dispensaire', 'Mixte', 'Sud-Est', 'Thiotte', 18.21480, -71.86350, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (859, 0, 'PPS Bel Air (ACDI VOCA)', 'Dispensaire', 'Prive sans but lucratif', 'Sud-Est', 'Belle-Anse', 18.27216, -72.05222, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (860, 0, 'C/S Corail Lamothe', 'Dispensaire', 'Publique', 'Sud-Est', 'Belle-Anse', 18.28119, -72.10464, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (861, 0, 'Point fixe Calumet (ACDI VOCA)', 'Dispensaire', 'Prive a but lucratif', 'Sud-Est', 'Belle-Anse', 18.25350, -72.12222, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (862, 0, 'Point fixe Baie d-Oranges (ACDIVOCA)', 'Dispensaire', 'Prive sans but lucratif', 'Sud-Est', 'Belle-Anse', 18.28263, -72.20460, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (863, 0, 'Point fixe Marebriole (ACDIVOCA)', 'Dispensaire', 'Prive sans but lucratif', 'Sud-Est', 'Belle-Anse', 18.29203, -72.16432, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (864, 0, 'Dispensaire et Centre Nutritionnel Bienheureu', 'Dispensaire', 'Prive sans but lucratif', 'Sud-Est', 'Jacmel', 18.26871, -72.57042, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (865, 0, 'Dispensaire Mayette', 'Dispensaire', 'Prive a but lucratif', 'Sud-Est', 'Cotes-de-Fer', 18.16222, -72.91446, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (866, 0, 'Dispensaire La Biche', 'Dispensaire', 'Prive a but lucratif', 'Sud-Est', 'Cotes-de-Fer', 18.20826, -72.90118, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (867, 0, 'Dispensaire Dariole MEBSH', 'Dispensaire', 'Prive sans but lucratif', 'Sud-Est', 'Cotes-de-Fer', 18.16237, -72.91403, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO spa VALUES (868, 0, 'Point Fixe Pichon (ACDI VOCA)', 'Dispensaire', 'Prive sans but lucratif', 'Sud-Est', 'Belle-Anse', 18.26305, -72.00190, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (869, 0, 'Dispensaire Amazone', 'Dispensaire', 'Prive sans but lucratif', 'Sud-Est', 'Cotes-de-Fer', 18.27734, -72.91573, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (870, 0, 'Dispensaire Bony', 'Dispensaire', 'Prive sans but lucratif', 'Sud-Est', 'Anse-a-Pitres', 18.20262, -71.81106, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (871, 0, 'Dispensaire Ka Toussaint', 'Dispensaire', 'Prive sans but lucratif', 'Sud-Est', 'Anse-a-Pitres', 18.16332, -71.78617, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO spa VALUES (872, 0, 'Dispensaire La Saline', 'Dispensaire', 'Prive sans but lucratif', 'Sud-Est', 'Jacmel', 18.22901, -72.52885, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO spa VALUES (873, 0, 'Point fixe de Damas (ACDI VOCA)', 'Dispensaire', 'Prive sans but lucratif', 'Sud-Est', 'Grand-Gosier', 18.26235, -71.91557, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (874, 0, 'Point fixe de Boulaille (ACDI VOCA)', 'Dispensaire', 'Prive sans but lucratif', 'Sud-Est', 'Grand-Gosier', 18.27894, -71.87707, 2, 1, 0, 1, 1, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, NULL, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO spa VALUES (875, 0, 'Centre de Sante St Benoit de Bodarie.', 'Centre de sante sans lit', 'Prive sans but lucratif', 'Sud-Est', 'Grand-Gosier', 18.26013, -71.89443, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 2, NULL, 2, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);


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
-- Name: datapopulation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY datapopulation
    ADD CONSTRAINT datapopulation_pkey PRIMARY KEY (id);


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
    ADD CONSTRAINT spa_pkey PRIMARY KEY (id);


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

