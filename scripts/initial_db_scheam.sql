CREATE DATABASE sca;

USE sca;

DROP TABLE IF EXISTS `business_model`;
CREATE TABLE `business_model` (
  `business_model_id` BIGINT(20) PRIMARY KEY NOT NULL,
  `label`             VARCHAR(20)            NOT NULL
);

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` BIGINT(20) PRIMARY KEY NOT NULL,
  `label`       VARCHAR(20)            NOT NULL
);

DROP TABLE IF EXISTS `score_item`;
CREATE TABLE `score_item` (
  `score_item_id` BIGINT(20) PRIMARY KEY NOT NULL,
  `label`         VARCHAR(20)            NOT NULL
);

DROP TABLE IF EXISTS `sub_score_item`;
CREATE TABLE `sub_score_item` (
  `sub_score_item_id` BIGINT(20) PRIMARY KEY NOT NULL,
  `score_item_id`     BIGINT(20)             NOT NULL REFERENCES score_item (score_item_id),
  `label`             VARCHAR(20)            NOT NULL,
  `score`             SMALLINT(6)            NOT NULL
);

DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule` (
  `rule_id`           BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rule_name`         VARCHAR(255)        NOT NULL,
  `business_model_id` BIGINT(20)                   DEFAULT NULL REFERENCES business_model (business_model_id),
  `category_id`       BIGINT(20)                   DEFAULT NULL REFERENCES category (category_id),
  `effective_time`    VARCHAR(20)                  DEFAULT NULL,
  `assessment_points` VARCHAR(225)        NOT NULL,
  `sub_score_item_id` BIGINT(20)                   DEFAULT NULL REFERENCES sub_score_item (sub_score_item_id),
  `rule_type`         VARCHAR(10)         NOT NULL,
  PRIMARY KEY (`rule_id`)
);

DROP TABLE IF EXISTS `keywords`;
CREATE TABLE `keywords` (
  `keywords_id` BIGINT(20) UNSIGNED NOT NULL PRIMARY KEY REFERENCES rule (rule_id),
  `occurence`   VARCHAR(20)         NOT NULL,
  `keywords`    VARCHAR(255)        NOT NULL
);

DROP TABLE IF EXISTS `regular_expression`;
CREATE TABLE `regular_expression` (
  `regular_expression_id` BIGINT(20) UNSIGNED NOT NULL PRIMARY KEY REFERENCES rule (rule_id),
  `regular_expression`    VARCHAR(255)        NOT NULL
);

DROP TABLE IF EXISTS `speed_detection`;
CREATE TABLE `speed_detection` (
  `speed_detection_id`  BIGINT(20) UNSIGNED NOT NULL PRIMARY KEY REFERENCES rule (rule_id),
  `max_word_per_minute` SMALLINT(6) DEFAULT NULL
);

DROP TABLE IF EXISTS `interrupt`;
CREATE TABLE `interrupt` (
  `interrupt_id`     BIGINT(20) UNSIGNED NOT NULL PRIMARY KEY REFERENCES rule (rule_id),
  `overlap_time_sec` SMALLINT(6) DEFAULT NULL,
  `overlap_char_qty` SMALLINT(6) DEFAULT NULL
);
