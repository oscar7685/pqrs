/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50542
Source Host           : localhost:3306
Source Database       : pqrs

Target Server Type    : MYSQL
Target Server Version : 50542
File Encoding         : 65001

Date: 2015-11-03 22:31:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `idarea` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  PRIMARY KEY (`idarea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', 'RECTORIA');
INSERT INTO `area` VALUES ('2', 'VICERECTORIA ACADEMICA');
INSERT INTO `area` VALUES ('3', 'VICERECTORIA DE INVESTIGACION');
INSERT INTO `area` VALUES ('4', 'CENTRO DE POSTGRADOS Y RELACIONES EXTERNAS');
INSERT INTO `area` VALUES ('5', 'SECCION ADQUISICION Y CONTROL DE BIENES');
INSERT INTO `area` VALUES ('6', 'CENTRO DE INFORMACION Y DOCUMENTACION');
INSERT INTO `area` VALUES ('7', 'CENTRO DE ADMISIONES, REGISTRO Y CONTROL ACADEMICO');
INSERT INTO `area` VALUES ('8', 'CENTRO DE CAPACITACION Y ASESORIA ACADEMICA');
INSERT INTO `area` VALUES ('9', 'INSTITUTO DE INVESTIGACIONES INMUNOLOGICAS');
INSERT INTO `area` VALUES ('10', 'CENTRO DE INFORMATICA');
INSERT INTO `area` VALUES ('11', 'FACULTAD DE MEDICINA');
INSERT INTO `area` VALUES ('12', 'DEPARTAMENTOS BASICOS DE MEDICINA');
INSERT INTO `area` VALUES ('13', 'FACULTAD DE ODONTOLOGIA');
INSERT INTO `area` VALUES ('14', 'FACULTAD DE CIENCIAS FARMACEUTICAS');
INSERT INTO `area` VALUES ('15', 'PROGRAMA DE QUIMICA');
INSERT INTO `area` VALUES ('16', 'PROGRAMA DE QUIMICA FARMACEUTICA');
INSERT INTO `area` VALUES ('17', 'FACULTAD DE ENFERMERIA');
INSERT INTO `area` VALUES ('18', 'FACULTAD DE DERECHO Y CIENCIAS POLITICAS');
INSERT INTO `area` VALUES ('19', 'FACULTAD DE CIENCIAS ECONOMICAS');
INSERT INTO `area` VALUES ('20', 'PROGRAMA DE ECONOMIA');
INSERT INTO `area` VALUES ('21', 'PROGRAMA DE ADMINISTRACION DE EMPRESAS');
INSERT INTO `area` VALUES ('22', 'PROGRAMA DE CONTADURIA PUBLICA');
INSERT INTO `area` VALUES ('23', 'FACULTAD DE CIENCIAS SOCIALES Y EDUCACION');
INSERT INTO `area` VALUES ('24', 'FACULTAD DE INGENIERIAS');
INSERT INTO `area` VALUES ('25', 'INSTITUTO DE HIDRAULICA Y SANEAMIENTO AMBIENTAL (IHSA)');
INSERT INTO `area` VALUES ('26', 'INSTITUTO DE POLITICAS PUBLICAS DE GOBIERNO Y ESCUELAS REGIONALES');
INSERT INTO `area` VALUES ('27', 'PROGRAMA DE INGENIERIA CIVIL');
INSERT INTO `area` VALUES ('28', 'FACULTAD DE CIENCIAS HUMANAS');
INSERT INTO `area` VALUES ('29', 'PROGRAMA DE LINGUISTICA Y LITERATURA');
INSERT INTO `area` VALUES ('30', 'PROGRAMA DE FILOSOFIA');
INSERT INTO `area` VALUES ('31', 'PROGRAMA DE HISTORIA');
INSERT INTO `area` VALUES ('32', 'EDUCACION ABIERTA Y A DISTANCIA');
INSERT INTO `area` VALUES ('33', 'ADMINISTRACION FINANCIERA');
INSERT INTO `area` VALUES ('34', 'ADMINISTRACION DE LOS SERVICIOS DE SALUD');
INSERT INTO `area` VALUES ('35', 'TECNOLOGIA DE ALIMENTOS');
INSERT INTO `area` VALUES ('36', 'INGENIERIA DE SISTEMAS (DISTANCIA)');
INSERT INTO `area` VALUES ('38', 'VICERECTORIA ADMINISTRATIVA');
INSERT INTO `area` VALUES ('40', 'DIVISION BIENESTAR UNIVERSITARIO');
INSERT INTO `area` VALUES ('41', 'DIVISION DE RECURSOS HUMANOS');
INSERT INTO `area` VALUES ('42', 'DIVISION DE SISTEMAS');
INSERT INTO `area` VALUES ('43', 'JUBILADOS');
INSERT INTO `area` VALUES ('46', 'POSTGRADOS FACULTAD DE MEDICINA');
INSERT INTO `area` VALUES ('49', 'MAGISTER EN MICROBILOGIA');
INSERT INTO `area` VALUES ('50', 'POSTGRADOS EN ODONTOLOGIA');
INSERT INTO `area` VALUES ('51', 'POSTGRADO DE ESTOMATOLOGIA Y CIRUGIA ORAL');
INSERT INTO `area` VALUES ('52', 'POSTGRADOS EN CIENCIAS QUIMICAS Y FARMACIAS');
INSERT INTO `area` VALUES ('54', 'POSTGRADO DE ENFERMERIA');
INSERT INTO `area` VALUES ('56', 'POSTGRADO SALUD OCUPACIONAL');
INSERT INTO `area` VALUES ('58', 'POSTGRADOS DE DERECHO Y CIENCIAS POLITICAS');
INSERT INTO `area` VALUES ('59', 'POSTGRADOS DE CIENCIAS ECONOMICAS');
INSERT INTO `area` VALUES ('60', 'ESPECIALIZACION EN GESTION GERENCIAL');
INSERT INTO `area` VALUES ('61', 'ESPECIALIZACION EN REVISORIA FISCAL');
INSERT INTO `area` VALUES ('63', 'ESPECIALIZACION EN FINANZAS');
INSERT INTO `area` VALUES ('66', 'POSTGRADOS DE CIENCIAS SOCIALES Y EDUCACION');
INSERT INTO `area` VALUES ('69', 'POSTGRADOS DE CIENCIAS E INGENIERIA');
INSERT INTO `area` VALUES ('70', 'ESPECIALIZACION EN GERENCIA DE PROYECTOS DE CONSTRUCCION');
INSERT INTO `area` VALUES ('71', 'ESPECIALIZACION EN INGENIERIA SANITARIA Y AMBIENTAL');
INSERT INTO `area` VALUES ('72', 'POSTGRADOS DE CIENCIAS HUMANAS');
INSERT INTO `area` VALUES ('74', 'PROGRAMA DE ADMINISTRACION INDUSTRIAL');
INSERT INTO `area` VALUES ('75', 'INSTITUTO INTERNACIONAL ESTUDIOS DEL CARIBE');
INSERT INTO `area` VALUES ('76', 'PROGRAMA DE TRABAJO SOCIAL');
INSERT INTO `area` VALUES ('77', 'PROGRAMA DE COMUNICACION SOCIAL');
INSERT INTO `area` VALUES ('78', 'PROGRAMA DE INGENIERIA DE ALIMENTOS');
INSERT INTO `area` VALUES ('79', 'PROGRAMA DE INGENIERIA DE SISTEMAS');
INSERT INTO `area` VALUES ('80', 'PROGRAMA DE INGENIERIA DE QUIMICA');
INSERT INTO `area` VALUES ('81', 'LICENCIATURA EN PEDAGOGIA INFANTIL');
INSERT INTO `area` VALUES ('82', 'LICENCIATURA EN EDUCACION BASICA ENFASIS EN LENGUA CASTELLANA');
INSERT INTO `area` VALUES ('83', 'LICENCIATURA EN EDUCACION BASICA ENFASIS EN ARTISTICA');
INSERT INTO `area` VALUES ('84', 'LICENCIATURA EN INFORMATICA');
INSERT INTO `area` VALUES ('85', 'ADMINISTRACION AGROPECUARIA');
INSERT INTO `area` VALUES ('86', 'ADMINISTRACION TURISTICA Y HOTELERA');
INSERT INTO `area` VALUES ('87', 'SALUD OCUPACIONAL');
INSERT INTO `area` VALUES ('88', 'TECNOLOGIA EN ELECTRONICA');
INSERT INTO `area` VALUES ('89', 'FACULTAD DE CIENCIAS EXACTAS Y NATURALES');
INSERT INTO `area` VALUES ('90', 'SECRETARIA GENERAL');
INSERT INTO `area` VALUES ('91', 'DIVISION COMUNICACIONES Y RELACIONES PUBLICAS');
INSERT INTO `area` VALUES ('92', 'OFICINA ASESORA DE PLANEACION');
INSERT INTO `area` VALUES ('93', 'OFICINA ASESORA JURIDICA');
INSERT INTO `area` VALUES ('94', 'OFICINA ASESORA DE CONTROL INTERNO');
INSERT INTO `area` VALUES ('95', 'OFICINA ASESORA DE CONTROL DISCIPLINARIO');
INSERT INTO `area` VALUES ('96', 'OFICINA ASESORA DE GESTION HUMANA  Y DESARROLLO ORGANIZACIONAL');
INSERT INTO `area` VALUES ('97', 'SECCION DE PUBLICACIONES');
INSERT INTO `area` VALUES ('98', 'ADMINISTRACION ACUICOLA Y PESQUERA');
INSERT INTO `area` VALUES ('99', 'DIVISION DE CONTRATOS');
INSERT INTO `area` VALUES ('101', 'SECCION TESORERIA Y PAGADURIA');
INSERT INTO `area` VALUES ('102', 'SECCION DE PRESUPUESTO');
INSERT INTO `area` VALUES ('103', 'SECCION DE CONTABILIDAD');
INSERT INTO `area` VALUES ('104', 'DEPARTAMENTO DE INVESTIGACION INGENIERIAS');
INSERT INTO `area` VALUES ('105', 'PROGRAMA DE MATEMATICAS');
INSERT INTO `area` VALUES ('106', 'PROGRAMA DE BIOLOGIA');
INSERT INTO `area` VALUES ('107', 'DEPARTAMENTO DE FISICA');
INSERT INTO `area` VALUES ('108', 'POSTGRADOS DE CIENCIAS EXACTAS Y NATURALES');
INSERT INTO `area` VALUES ('109', 'PROGRAMA DE ENFERMERIA');
INSERT INTO `area` VALUES ('110', 'DEPARTAMENTO DE INVESTIGACIONES CIENCIAS ECONOMICAS');
INSERT INTO `area` VALUES ('111', 'BIBLIOTECA - CENTRO SAN AGUSTIN');
INSERT INTO `area` VALUES ('112', 'BIBLIOTECA - ZARAGOCILLA');
INSERT INTO `area` VALUES ('113', 'BIBLIOTECA - PIEDRA DE BOLIVAR');
INSERT INTO `area` VALUES ('114', 'DOCTORADO EN CIENCIAS DE LA EDUCACION');
INSERT INTO `area` VALUES ('115', 'SECCION DE PERSONAL');
INSERT INTO `area` VALUES ('116', 'SECCION SELECCION Y CAPACITACION');
INSERT INTO `area` VALUES ('117', 'SECCION DE PRESTACIONES ECONOMICAS');
INSERT INTO `area` VALUES ('118', 'SECCION DE SALUD OCUPACIONAL');
INSERT INTO `area` VALUES ('119', 'SECCION DE ARCHIVO Y CORRESPONDENCIA');
INSERT INTO `area` VALUES ('120', 'SECCION DE ACTIVIDADES CULTURALES');
INSERT INTO `area` VALUES ('121', 'SECCION DE DEPORTES');
INSERT INTO `area` VALUES ('122', 'SECCION ASESORIA DE PSICOLOGIA');
INSERT INTO `area` VALUES ('123', 'SECCION DE TRABAJO SOCIAL');
INSERT INTO `area` VALUES ('124', 'SECCION DE EGRESADOS');
INSERT INTO `area` VALUES ('125', 'SECCION DE SERVICIOS GENERALES');
INSERT INTO `area` VALUES ('126', 'SECCION DE TELEVISION');
INSERT INTO `area` VALUES ('127', 'SECCION DE EMISORA');
INSERT INTO `area` VALUES ('128', 'CENTRO DE AUTOEVALUACION Y ACREDITACION INSTITUCIONAL');
INSERT INTO `area` VALUES ('129', 'POSTGRADOS EN EDUCACION ABIERTA Y A DISTANCIA');
INSERT INTO `area` VALUES ('130', 'SECCION DE INVENTARIOS');
INSERT INTO `area` VALUES ('131', 'SECCION DE SERVICIOS EN CONSULTORIAS, ASESORIAS Y DONACIONES');
INSERT INTO `area` VALUES ('132', 'COORDINACION ACADEMICA GENERAL');
INSERT INTO `area` VALUES ('133', 'SECCION DE CARTERA');
INSERT INTO `area` VALUES ('134', 'MATRICULAS POSTGRADOS');
INSERT INTO `area` VALUES ('135', 'MATRICULAS PREGRADO');
INSERT INTO `area` VALUES ('136', 'CONCILIACION BANCARIA');
INSERT INTO `area` VALUES ('137', 'ALMACEN GENERAL');
INSERT INTO `area` VALUES ('138', 'OBSERVATORIO PARA EL DESPLAZAMIENTO FORZADO');
INSERT INTO `area` VALUES ('139', 'CENTRO DE PRACTICAS EMP. INSERCION LAB');
INSERT INTO `area` VALUES ('140', 'CTRO.DE RECURSOS EDUC.Y TELECOMUN.');
INSERT INTO `area` VALUES ('141', 'DOCTORADO EN MEDICINA TROPICAL');
INSERT INTO `area` VALUES ('142', 'CENTRO DE INNOVACION DE ESTUDIOS VIRTUALES');
INSERT INTO `area` VALUES ('143', 'DEPARTAMENTO DE PRACTICAS EMPRESARIALES');
INSERT INTO `area` VALUES ('144', 'ALMACEN GENERAL');
INSERT INTO `area` VALUES ('145', 'DIVISION DE SISTEMAS');
INSERT INTO `area` VALUES ('146', 'DIVISION FINANCIERA');
INSERT INTO `area` VALUES ('162', 'DIVISION DE ALMACEN');
INSERT INTO `area` VALUES ('163', 'VICERRECTORIA DE BIENESTAR UNIVERSITARIA');
INSERT INTO `area` VALUES ('164', 'VICERRECTORIA DE ASUEGURAMIENTO DE LA CALIDAD');
INSERT INTO `area` VALUES ('165', 'DIVISION DE ASUNTOS LABORALES');
INSERT INTO `area` VALUES ('166', 'PROGRAMAS A DISTANCIA MUNICIPIOS');
INSERT INTO `area` VALUES ('167', 'VICERRECTORIA DE EXTENSION  Y PROYECCION SOCIAL');
INSERT INTO `area` VALUES ('168', 'VICERRECTORIA DE RELACIONES Y COPERACION INTERNACIONAL');
INSERT INTO `area` VALUES ('169', 'ESCUELA PARA EL TRABAJO Y DESARROLLO HUMANO AREA DE LA SALUD');
INSERT INTO `area` VALUES ('1000', 'DESCONOZCO A QUIEN CORRESPONDE');

-- ----------------------------
-- Table structure for asignacion
-- ----------------------------
DROP TABLE IF EXISTS `asignacion`;
CREATE TABLE `asignacion` (
  `asignacion_id` int(11) NOT NULL AUTO_INCREMENT,
  `pqrs_idpqrs` int(11) NOT NULL,
  `asignado_por` int(11) NOT NULL,
  `asignado_a` int(11) NOT NULL,
  `fecha_asignacion` date NOT NULL,
  PRIMARY KEY (`asignacion_id`),
  KEY `fk_asignacion_pqrs1_idx` (`pqrs_idpqrs`),
  KEY `fk_asignacion_responsable_area1_idx` (`asignado_por`),
  KEY `fk_asignacion_responsable_area2_idx` (`asignado_a`),
  CONSTRAINT `fk_asignacion_pqrs1` FOREIGN KEY (`pqrs_idpqrs`) REFERENCES `pqrs` (`idpqrs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignacion_responsable_area1` FOREIGN KEY (`asignado_por`) REFERENCES `responsable_area` (`idresponsable_area`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignacion_responsable_area2` FOREIGN KEY (`asignado_a`) REFERENCES `responsable_area` (`idresponsable_area`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asignacion
-- ----------------------------
INSERT INTO `asignacion` VALUES ('1', '4', '1047408359', '1051660552', '2015-11-02');
INSERT INTO `asignacion` VALUES ('2', '6', '1047408359', '1051660552', '2015-11-02');

-- ----------------------------
-- Table structure for mail
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `idmail` int(11) NOT NULL AUTO_INCREMENT,
  `username_sistema` varchar(100) DEFAULT NULL,
  `password_sistema` varchar(100) DEFAULT NULL,
  `username_administrador` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idmail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mail
-- ----------------------------
INSERT INTO `mail` VALUES ('1', 'micuenta40@gmail.com', 'qwe789..', 'micuenta40@gmail.com');

-- ----------------------------
-- Table structure for pqrs
-- ----------------------------
DROP TABLE IF EXISTS `pqrs`;
CREATE TABLE `pqrs` (
  `idpqrs` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `area_idarea` int(11) NOT NULL,
  `notificar_mail` varchar(45) DEFAULT NULL,
  `descripcion` varchar(5000) NOT NULL,
  `adjunto` varchar(2000) DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `estado` varchar(45) NOT NULL,
  `medio_ingreso` varchar(45) DEFAULT NULL,
  `reclamante_idreclamante` int(11) NOT NULL,
  `estadoSolicitud` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idpqrs`),
  KEY `fk_pqrs_area1_idx` (`area_idarea`),
  KEY `fk_pqrs_reclamante1_idx` (`reclamante_idreclamante`),
  CONSTRAINT `fk_pqrs_area1` FOREIGN KEY (`area_idarea`) REFERENCES `area` (`idarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pqrs_reclamante1` FOREIGN KEY (`reclamante_idreclamante`) REFERENCES `reclamante` (`idreclamante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pqrs
-- ----------------------------
INSERT INTO `pqrs` VALUES ('1', 'Peticion', '1000', 'on', 'esta es una petición', null, '2015-11-02', 'Activa', 'Web', '22999635', 'Verificacion PQRS');
INSERT INTO `pqrs` VALUES ('2', 'Peticion', '137', 'on', 'Necesito saber cuando llega mi pedido', '2-inicio y recuperacion.png', '2015-11-02', 'Activa', 'Manual', '22999635', 'Verificacion PQRS');
INSERT INTO `pqrs` VALUES ('3', 'Peticion', '92', 'on', 'otra peticion', '3-4.jpg', '2015-11-02', 'Activa', 'Correo', '22999635', 'Verificacion PQRS');
INSERT INTO `pqrs` VALUES ('4', 'Peticion', '79', 'on', 'esto es una prueba', '4-Penguins.jpg', '2015-11-02', 'Activa', 'Web', '22999635', 'Asignado a dependencia');
INSERT INTO `pqrs` VALUES ('5', 'Reclamo', '1000', 'on', 'aopsdfsdofs', '5-Koala.jpg', '2015-11-02', 'Activa', 'Web', '22999635', 'Verificacion PQRS');
INSERT INTO `pqrs` VALUES ('6', 'Queja', '79', 'on', 'dfgdfg', '6-Chrysanthemum.jpg', '2015-11-02', 'Activa', 'Correo', '22999635', 'Asignado a dependencia');

-- ----------------------------
-- Table structure for reclamante
-- ----------------------------
DROP TABLE IF EXISTS `reclamante`;
CREATE TABLE `reclamante` (
  `idreclamante` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`idreclamante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reclamante
-- ----------------------------
INSERT INTO `reclamante` VALUES ('22999635', 'Diana', 'Padilla', '3002755225', 'artemus1@gmail.com', '123456', 'PROFESOR');

-- ----------------------------
-- Table structure for responsable_area
-- ----------------------------
DROP TABLE IF EXISTS `responsable_area`;
CREATE TABLE `responsable_area` (
  `idresponsable_area` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `area_idarea` int(11) NOT NULL,
  PRIMARY KEY (`idresponsable_area`),
  KEY `fk_responsable_area_area_idx` (`area_idarea`),
  CONSTRAINT `fk_responsable_area_area` FOREIGN KEY (`area_idarea`) REFERENCES `area` (`idarea`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of responsable_area
-- ----------------------------
INSERT INTO `responsable_area` VALUES ('1047408359', 'NELSON', 'RAMIREZ RODRIGUEZ', 'micuenta40@gmail.com', '30047474747', '6666666', '123456', '1000');
INSERT INTO `responsable_area` VALUES ('1051660552', 'ROBER', 'FLOREZ', 'artemys6@gmail.com', '3007894561', null, '123456', '79');

-- ----------------------------
-- Table structure for respuesta
-- ----------------------------
DROP TABLE IF EXISTS `respuesta`;
CREATE TABLE `respuesta` (
  `idrespuesta` int(11) NOT NULL AUTO_INCREMENT,
  `pqrs_idpqrs` int(11) NOT NULL,
  `responsable_area_idresponsable_area` int(11) NOT NULL,
  `fecha_respuesta` date NOT NULL,
  PRIMARY KEY (`idrespuesta`),
  KEY `fk_respuesta_pqrs1_idx` (`pqrs_idpqrs`),
  KEY `fk_respuesta_responsable_area1_idx` (`responsable_area_idresponsable_area`),
  CONSTRAINT `fk_respuesta_pqrs1` FOREIGN KEY (`pqrs_idpqrs`) REFERENCES `pqrs` (`idpqrs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_respuesta_responsable_area1` FOREIGN KEY (`responsable_area_idresponsable_area`) REFERENCES `responsable_area` (`idresponsable_area`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of respuesta
-- ----------------------------
