BEGIN;
CREATE TABLE IF NOT EXISTS public.cita (
  "ID" integer NOT NULL DEFAULT nextval('"cita_ID_seq"'::regclass),
  fecha date,
  paciente_id integer,
  medico_id integer,
  consultorio_id integer,
  CONSTRAINT cita_pkey PRIMARY KEY ("ID")
);
CREATE TABLE IF NOT EXISTS public.consultorio (
  "ID" integer NOT NULL DEFAULT nextval('"consultorio_ID_seq"'::regclass),
  nombre character varying(30) COLLATE pg_catalog."default",
  enfermero_id integer,
  CONSTRAINT consultorio_pkey PRIMARY KEY ("ID")
);
CREATE TABLE IF NOT EXISTS public.enfermero (
  "ID" integer NOT NULL DEFAULT nextval('"enfermero_ID_seq"'::regclass),
  nombre character varying(30) COLLATE pg_catalog."default",
  apellido character varying(30) COLLATE pg_catalog."default",
  "DNI" integer,
  correo character varying COLLATE pg_catalog."default",
  consultorio_id integer,
  CONSTRAINT enfermero_pkey PRIMARY KEY ("ID")
);
CREATE TABLE IF NOT EXISTS public.historial (
  "ID" integer NOT NULL DEFAULT nextval('"historial_ID_seq"'::regclass),
  fecha date,
  patologia_id integer,
  paciente_id integer,
  CONSTRAINT historial_pkey PRIMARY KEY ("ID")
);
CREATE TABLE IF NOT EXISTS public.medicamento (
  "ID" integer NOT NULL DEFAULT nextval('"medicamento_ID_seq"'::regclass),
  nombre character varying(30) COLLATE pg_catalog."default",
  precio integer,
  stock integer,
  CONSTRAINT medicamento_pkey PRIMARY KEY ("ID")
);
CREATE TABLE IF NOT EXISTS public.medico (
  "ID" integer NOT NULL DEFAULT nextval('"medico_ID_seq"'::regclass),
  nombre character varying(30) COLLATE pg_catalog."default",
  apellido character varying(30) COLLATE pg_catalog."default",
  "DNI" integer,
  correo character varying(30) COLLATE pg_catalog."default",
  CONSTRAINT medico_pkey PRIMARY KEY ("ID")
);
CREATE TABLE IF NOT EXISTS public.paciente (
  "ID" integer NOT NULL DEFAULT nextval('"paciente_ID_seq"'::regclass),
  nombre character varying(30) COLLATE pg_catalog."default",
  apellido character varying(30) COLLATE pg_catalog."default",
  "DNI" integer,
  correo character varying(30) COLLATE pg_catalog."default",
  medico_id integer,
  historial_id integer,
  CONSTRAINT paciente_pkey PRIMARY KEY ("ID")
);
CREATE TABLE IF NOT EXISTS public.patologia (
  "ID" integer NOT NULL DEFAULT nextval('"patologia_ID_seq"'::regclass),
  nombre character varying(30) COLLATE pg_catalog."default",
  "duración" integer,
  medicamento_recomendado character varying(30) COLLATE pg_catalog."default",
  CONSTRAINT patologia_pkey PRIMARY KEY ("ID")
);
CREATE TABLE IF NOT EXISTS public.receta (
  "ID" integer NOT NULL DEFAULT nextval('"receta_ID_seq"'::regclass),
  fecha date,
  medico_id integer,
  paciente_id integer,
  medicamento_id integer,
  tiempo_en_tratamiento integer,
  CONSTRAINT receta_pkey PRIMARY KEY ("ID")
);
ALTER TABLE IF EXISTS public.cita
ADD CONSTRAINT consultorio_id FOREIGN KEY (consultorio_id) REFERENCES public.consultorio ("ID") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
ALTER TABLE IF EXISTS public.cita
ADD CONSTRAINT medico_id FOREIGN KEY (medico_id) REFERENCES public.medico ("ID") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
ALTER TABLE IF EXISTS public.cita
ADD CONSTRAINT paciente_id FOREIGN KEY (paciente_id) REFERENCES public.paciente ("ID") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
ALTER TABLE IF EXISTS public.consultorio
ADD CONSTRAINT enfermero_id FOREIGN KEY (enfermero_id) REFERENCES public.enfermero ("ID") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
ALTER TABLE IF EXISTS public.enfermero
ADD CONSTRAINT consultorio_id FOREIGN KEY (consultorio_id) REFERENCES public.consultorio ("ID") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
ALTER TABLE IF EXISTS public.historial
ADD CONSTRAINT paciente_id FOREIGN KEY (paciente_id) REFERENCES public.paciente ("ID") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
ALTER TABLE IF EXISTS public.historial
ADD CONSTRAINT patologia_id FOREIGN KEY (patologia_id) REFERENCES public.patologia ("ID") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
ALTER TABLE IF EXISTS public.paciente
ADD CONSTRAINT historial_id FOREIGN KEY (historial_id) REFERENCES public.historial ("ID") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
ALTER TABLE IF EXISTS public.paciente
ADD CONSTRAINT medico_id FOREIGN KEY (medico_id) REFERENCES public.medico ("ID") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
ALTER TABLE IF EXISTS public.receta
ADD CONSTRAINT medicamento_id FOREIGN KEY (medicamento_id) REFERENCES public.medicamento ("ID") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
ALTER TABLE IF EXISTS public.receta
ADD CONSTRAINT medico_id FOREIGN KEY (medico_id) REFERENCES public.medico ("ID") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
ALTER TABLE IF EXISTS public.receta
ADD CONSTRAINT paciente_id FOREIGN KEY (paciente_id) REFERENCES public.paciente ("ID") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
END;
