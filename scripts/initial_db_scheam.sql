CREATE DATABASE sca;

USE sca;

DROP TABLE IF EXISTS `rule_master`;
CREATE TABLE `rule_master` (
  `id`             BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `label`          VARCHAR(128)        NOT NULL,
  `pattern`        VARCHAR(20)                  DEFAULT NULL,
  `category`       VARCHAR(20)                  DEFAULT NULL,
  `rule_type`      VARCHAR(5)          NOT NULL,
  `effective_time` VARCHAR(20)                  DEFAULT NULL,
  `key_points`     VARCHAR(225)        NOT NULL,
  `score_1`        SMALLINT(6)                  DEFAULT NULL,
  `score_2`        SMALLINT(6)                  DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `rule_pace`;
CREATE TABLE `rule_pace` (
  `id`   BIGINT(20) UNSIGNED NOT NULL PRIMARY KEY REFERENCES rule_master (id),
  `pace` SMALLINT(6) DEFAULT NULL
);

DROP TABLE IF EXISTS `rule_interrupt`;
CREATE TABLE `rule_interrupt` (
  `id`                 BIGINT(20) UNSIGNED NOT NULL PRIMARY KEY REFERENCES rule_master (id),
  `overlap_time`       SMALLINT(6) DEFAULT NULL,
  `overlap_characters` SMALLINT(6) DEFAULT NULL
);

DROP TABLE IF EXISTS `rule_regex`;
CREATE TABLE `rule_regex` (
  `id`    BIGINT(20) UNSIGNED NOT NULL PRIMARY KEY REFERENCES rule_master (id),
  `regex` VARCHAR(255)        NOT NULL
);


DROP TABLE IF EXISTS `rule_keywords`;
CREATE TABLE `rule_keywords` (
  `id`       BIGINT(20) UNSIGNED NOT NULL PRIMARY KEY REFERENCES rule_master (id),
  `coverage` VARCHAR(20)         NOT NULL,
  `keywords` VARCHAR(255)        NOT NULL
);