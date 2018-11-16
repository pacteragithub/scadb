CREATE DATABASE sca;

USE sca;

DROP TABLE IF EXISTS `business_model`;
DROP TABLE IF EXISTS `score_item`;
DROP TABLE IF EXISTS `sub_score_item`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `regular_expression`;
DROP TABLE IF EXISTS `keywords`;
DROP TABLE IF EXISTS `speed_detection`;
DROP TABLE IF EXISTS `interrupt`;
DROP TABLE IF EXISTS `rule`;

CREATE TABLE `business_model` (
  `business_model_id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `label`             VARCHAR(20)                           NOT NULL
);

INSERT INTO `business_model` VALUES (1, 'General');
INSERT INTO `business_model` VALUES (2, 'Renew');


CREATE TABLE `category` (
  `category_id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `label`       VARCHAR(20)                           NOT NULL
);

INSERT INTO `category` VALUES (1, 'All');
INSERT INTO `category` VALUES (2, 'Pending');
INSERT INTO `category` VALUES (3, 'Exception');


CREATE TABLE `score_item` (
  `score_item_id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `label`         VARCHAR(20)                           NOT NULL
);


CREATE TABLE `sub_score_item` (
  `sub_score_item_id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `score_item_id`     BIGINT(20)                            NOT NULL REFERENCES score_item (score_item_id),
  `label`             VARCHAR(20)                           NOT NULL,
  `score`             SMALLINT(6)                           NOT NULL
);


CREATE TABLE `rule` (
  `rule_id`           BIGINT(20)   NOT NULL PRIMARY KEY  AUTO_INCREMENT,
  `rule_name`         VARCHAR(255) NOT NULL,
  `business_model_id` BIGINT(20)                         DEFAULT NULL REFERENCES business_model (business_model_id),
  `category_id`       BIGINT(20)                         DEFAULT NULL REFERENCES category (category_id),
  `effective_time`    VARCHAR(20)                        DEFAULT NULL,
  `assessment_points` VARCHAR(225) NOT NULL,
  `sub_score_item_id` BIGINT(20)                         DEFAULT NULL REFERENCES sub_score_item (sub_score_item_id)
);


CREATE TABLE `keywords` (
  `keywords_id` BIGINT(20)   NOT NULL,
  `occurence`   VARCHAR(20)  NOT NULL,
  `keywords`    VARCHAR(255) NOT NULL,
  FOREIGN KEY (`keywords_id`) REFERENCES rule (rule_id)
);


CREATE TABLE `regular_expression` (
  `regular_expression_id` BIGINT(20)   NOT NULL,
  `regular_expression`    VARCHAR(255) NOT NULL,
  FOREIGN KEY (`regular_expression_id`) REFERENCES rule (rule_id)
);


CREATE TABLE `speed_detection` (
  `speed_detection_id`  BIGINT(20) NOT NULL,
  `max_word_per_minute` SMALLINT(6) DEFAULT NULL,
  FOREIGN KEY (`speed_detection_id`) REFERENCES rule (rule_id)
);


CREATE TABLE `interrupt` (
  `interrupt_id`     BIGINT(20) NOT NULL,
  `overlap_time_sec` SMALLINT(6) DEFAULT NULL,
  `overlap_char_qty` SMALLINT(6) DEFAULT NULL,
  FOREIGN KEY (`interrupt_id`) REFERENCES rule (rule_id)
);
