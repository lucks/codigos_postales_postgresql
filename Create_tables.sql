DROP TABLE IF EXISTS cat_estados;
CREATE TABLE cat_estados (
  idestado smallint CHECK (idestado > 0) NOT NULL,
  estado varchar(31) NOT NULL,
  PRIMARY KEY (idestado)
);

DROP TABLE IF EXISTS cat_municipios;
CREATE TABLE cat_municipios (
  idmunicipio int CHECK (idmunicipio > 0) NOT NULL,
  idestado smallint CHECK (idestado > 0) NOT NULL,
  municipio varchar(49) NOT NULL,
  PRIMARY KEY (idmunicipio, idestado),
  CONSTRAINT fk_cat_municipios_cat_estados1 FOREIGN KEY (idestado) REFERENCES cat_estados (idestado)
);

CREATE INDEX fk_cat_municipios_cat_estados1_idx ON cat_municipios (idestado);

DROP TABLE IF EXISTS cat_cp;
CREATE TABLE cat_cp (
  idcp int CHECK (idcp > 0) NOT NULL DEFAULT 0,
  idmunicipio int CHECK (idmunicipio > 0) NOT NULL,
  idestado smallint CHECK (idestado > 0) NOT NULL,
  cp integer NOT NULL,
  colonia varchar(60) NOT NULL,
  PRIMARY KEY (idcp),
  CONSTRAINT fk_cat_cp_cat_estados1 FOREIGN KEY (idestado) REFERENCES cat_estados (idestado),
  CONSTRAINT fk_cat_cp_cat_municipios1 FOREIGN KEY (idmunicipio, idestado) REFERENCES cat_municipios (idmunicipio, idestado)
);

CREATE INDEX fk_cat_cp_cat_municipios1_idx ON cat_cp (idmunicipio);
CREATE INDEX fk_cat_cp_cat_estados1_idx ON cat_cp (idestado);
CREATE INDEX cp_idx ON cat_cp (cp);