CREATE DATABASE `daec` /*!40100 DEFAULT CHARACTER SET utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `message` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
CREATE TABLE `submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `species` varchar(45) DEFAULT NULL,
  `chr` varchar(45) DEFAULT NULL,
  `start` varchar(45) DEFAULT NULL,
  `end` varchar(45) DEFAULT NULL,
  `targetgene` varchar(45) DEFAULT NULL,
  `diseasetype` varchar(45) DEFAULT NULL,
  `vartype` varchar(45) DEFAULT NULL,
  `varname` varchar(45) DEFAULT NULL,
  `varchar` varchar(45) DEFAULT NULL,
  `varstart` varchar(45) DEFAULT NULL,
  `varend` varchar(45) DEFAULT NULL,
  `muttype` varchar(45) DEFAULT NULL,
  `varcons` varchar(45) DEFAULT NULL,
  `pmid` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `suggestion` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
CREATE TABLE `maindiseaseenhancer` (
  `id` varchar(32) DEFAULT NULL,
  `enhchr` varchar(32) DEFAULT NULL,
  `enhstart` varchar(32) DEFAULT NULL,
  `enhend` varchar(32) DEFAULT NULL,
  `targetgene` varchar(512) DEFAULT NULL,
  `diseasetype` varchar(512) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `subdiseaseenhancer` (
  `id` varchar(64) DEFAULT NULL,
  `vartype` varchar(64) DEFAULT NULL,
  `varname` varchar(64) DEFAULT NULL,
  `varchr` varchar(64) DEFAULT NULL,
  `varstart` varchar(64) DEFAULT NULL,
  `varend` varchar(64) DEFAULT NULL,
  `targetgene` varchar(1024) DEFAULT NULL,
  `muttype` varchar(64) DEFAULT NULL,
  `varcons` varchar(512) DEFAULT NULL,
  `pmid` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `enhancermutation` (
  `id` varchar(32) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `length` varchar(32) DEFAULT NULL,
  `start` varchar(32) DEFAULT NULL,
  `end` varchar(32) DEFAULT NULL,
  `ty` varchar(32) DEFAULT NULL,
  `locus` varchar(32) DEFAULT NULL,
  `dataset` varchar(32) DEFAULT NULL,
  `sample` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

