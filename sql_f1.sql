-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE "BD_F1"."TB_CIRCUITO"
(
    "ID_CIRCUITO" character varying(24) NOT NULL,
    "NM_CIRCUITO" character varying(40) NOT NULL,
    "NR_EXTENSAO" character varying(24),
    "ID_PAIS" integer,
    PRIMARY KEY ("ID_CIRCUITO")
);

CREATE TABLE "BD_F1"."TB_EQUIPE"
(
    "ID_EQUIPE" character varying(24) NOT NULL,
    "NM_EQUIPE" character varying(30) NOT NULL,
    "ID_PAIS" integer NOT NULL,
    PRIMARY KEY ("ID_EQUIPE")
);

CREATE TABLE "BD_F1"."TB_PAIS"
(
    "ID_PAIS" integer NOT NULL,
    "NM_PAIS" character varying(25) NOT NULL,
    "NR_POPULACION" integer NOT NULL,
    PRIMARY KEY ("ID_PAIS")
);

CREATE TABLE "BD_F1"."TB_PILOTO"
(
    "ID_PILOTO" character varying(24) NOT NULL,
    "NM_PILOTO" character varying(35) NOT NULL,
    "DT_NASCIMENTO" character varying(12),
    "ID_PAIS" integer,
    "ID_EQUIPE" character varying(24),
    PRIMARY KEY ("ID_PILOTO")
);

CREATE TABLE "BD_F1"."TB_PROVA"
(
    "ID_PROVA" integer NOT NULL,
    "DT_PROVA" character varying(12),
    "NM_SITUACAO" character varying(50),
    "ID_CIRCUITO" character varying(24),
    PRIMARY KEY ("ID_PROVA")
);

CREATE TABLE "BD_F1"."TB_RESULTADO"
(
    "ID_PROVA" integer,
    "ID_PILOTO" character varying(24),
    "NR_TEMPO_PROVA" character varying(15) NOT NULL,
    "NR_COLOC_FINAL" integer,
    "NR_POS_GRID" integer,
    "NR_MELHOR_VOLTA" character varying(12)
);

ALTER TABLE "BD_F1"."TB_CIRCUITO"
    ADD FOREIGN KEY ("ID_PAIS")
    REFERENCES "BD_F1"."TB_PAIS" ("ID_PAIS")
    NOT VALID;


ALTER TABLE "BD_F1"."TB_EQUIPE"
    ADD FOREIGN KEY ("ID_PAIS")
    REFERENCES "BD_F1"."TB_PAIS" ("ID_PAIS")
    NOT VALID;


ALTER TABLE "BD_F1"."TB_PILOTO"
    ADD FOREIGN KEY ("ID_EQUIPE")
    REFERENCES "BD_F1"."TB_EQUIPE" ("ID_EQUIPE")
    NOT VALID;


ALTER TABLE "BD_F1"."TB_PILOTO"
    ADD FOREIGN KEY ("ID_PAIS")
    REFERENCES "BD_F1"."TB_PAIS" ("ID_PAIS")
    NOT VALID;


ALTER TABLE "BD_F1"."TB_PROVA"
    ADD FOREIGN KEY ("ID_CIRCUITO")
    REFERENCES "BD_F1"."TB_CIRCUITO" ("ID_CIRCUITO")
    NOT VALID;


ALTER TABLE "BD_F1"."TB_RESULTADO"
    ADD FOREIGN KEY ("ID_PILOTO")
    REFERENCES "BD_F1"."TB_PILOTO" ("ID_PILOTO")
    NOT VALID;


ALTER TABLE "BD_F1"."TB_RESULTADO"
    ADD FOREIGN KEY ("ID_PROVA")
    REFERENCES "BD_F1"."TB_PROVA" ("ID_PROVA")
    NOT VALID;

END;