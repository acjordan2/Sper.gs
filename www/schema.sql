-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 17, 2013 at 03:19 PM
-- Server version: 5.5.29
-- PHP Version: 5.3.10-1ubuntu3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `spergs2`
--

-- --------------------------------------------------------

--
-- Table structure for table `ArchivedMessages`
--

CREATE TABLE IF NOT EXISTS `ArchivedMessages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `message` varchar(2048) NOT NULL,
  `posted` int(10) unsigned NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `ArchivedMessages`:
--   `user_id`
--       `Users` -> `user_id`
--   `topic_id`
--       `ArchivedTopics` -> `topic_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `ArchivedTopics`
--

CREATE TABLE IF NOT EXISTS `ArchivedTopics` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `board_id` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `board_id` (`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `ArchivedTopics`:
--   `user_id`
--       `Users` -> `user_id`
--   `board_id`
--       `Boards` -> `board_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `BoardCategories`
--

CREATE TABLE IF NOT EXISTS `BoardCategories` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Boards`
--

CREATE TABLE IF NOT EXISTS `Boards` (
  `board_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`board_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Boards`:
--   `category_id`
--       `BoardCategories` -> `category_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `Inventory`
--

CREATE TABLE IF NOT EXISTS `Inventory` (
  `inventory_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `transaction_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `user_id` (`user_id`),
  KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Inventory`:
--   `user_id`
--       `Users` -> `user_id`
--   `transaction_id`
--       `ShopTransactions` -> `transaction_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `InviteCodes`
--

CREATE TABLE IF NOT EXISTS `InviteCodes` (
  `invite_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invite_code` varchar(45) NOT NULL,
  `email` text NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created` int(11) unsigned NOT NULL,
  PRIMARY KEY (`invite_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `InviteCodes`:
--   `user_id`
--       `Users` -> `user_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `InviteTree`
--

CREATE TABLE IF NOT EXISTS `InviteTree` (
  `invite_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invited_by` int(11) unsigned NOT NULL,
  `Invited_user` int(11) unsigned DEFAULT NULL,
  `invite_code` varchar(45) NOT NULL,
  `email` text NOT NULL,
  `created` int(11) unsigned NOT NULL,
  PRIMARY KEY (`invite_id`),
  KEY `invited_by` (`invited_by`),
  KEY `Invited_user` (`Invited_user`),
  KEY `invite_code` (`invite_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `InviteTree`:
--   `invited_by`
--       `Users` -> `user_id`
--   `Invited_user`
--       `Users` -> `user_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `ItemClass`
--

CREATE TABLE IF NOT EXISTS `ItemClass` (
  `class_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(12) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Karma`
--

CREATE TABLE IF NOT EXISTS `Karma` (
  `karma_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `value` int(4) NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`karma_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Karma`:
--   `user_id`
--       `Users` -> `user_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `LinkCategories`
--

CREATE TABLE IF NOT EXISTS `LinkCategories` (
  `category_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `LinkFavorites`
--

CREATE TABLE IF NOT EXISTS `LinkFavorites` (
  `link_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created` int(11) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`user_id`),
  KEY `link_id` (`link_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `LinkFavorites`:
--   `link_id`
--       `Links` -> `link_id`
--   `user_id`
--       `Users` -> `user_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `LinkHistory`
--

CREATE TABLE IF NOT EXISTS `LinkHistory` (
  `link_history_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `link_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`link_history_id`),
  UNIQUE KEY `link_id` (`link_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `LinkHistory`:
--   `link_id`
--       `Links` -> `link_id`
--   `user_id`
--       `Users` -> `user_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `LinkMessages`
--

CREATE TABLE IF NOT EXISTS `LinkMessages` (
  `message_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `link_id` int(11) unsigned NOT NULL,
  `revision_no` int(11) unsigned NOT NULL,
  `message` varchar(5120) NOT NULL,
  `posted` int(11) unsigned NOT NULL,
  PRIMARY KEY (`message_id`,`revision_no`),
  KEY `link_id` (`link_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `LinkMessages`:
--   `user_id`
--       `Users` -> `user_id`
--   `link_id`
--       `Links` -> `link_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `Links`
--

CREATE TABLE IF NOT EXISTS `Links` (
  `link_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `title` varchar(80) NOT NULL,
  `url` varchar(512) NOT NULL,
  `description` text NOT NULL,
  `created` int(11) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Links`:
--   `user_id`
--       `Users` -> `user_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `LinksCategorized`
--

CREATE TABLE IF NOT EXISTS `LinksCategorized` (
  `link_cat_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `link_id` int(11) unsigned NOT NULL,
  `category_id` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`link_cat_id`),
  KEY `link_id` (`link_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `LinksCategorized`:
--   `link_id`
--       `Links` -> `link_id`
--   `category_id`
--       `LinkCategories` -> `category_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `LinksReported`
--

CREATE TABLE IF NOT EXISTS `LinksReported` (
  `report_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `link_id` int(11) unsigned NOT NULL,
  `reason` varchar(1024) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `link_id` (`link_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `LinksReported`:
--   `link_id`
--       `Links` -> `link_id`
--   `user_id`
--       `Users` -> `user_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `LinkVotes`
--

CREATE TABLE IF NOT EXISTS `LinkVotes` (
  `user_id` int(11) unsigned NOT NULL,
  `link_id` int(11) unsigned NOT NULL,
  `vote` smallint(2) NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`link_id`),
  KEY `user_id` (`user_id`),
  KEY `link_id` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `LinkVotes`:
--   `user_id`
--       `Users` -> `user_id`
--   `link_id`
--       `Links` -> `link_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `Messages`
--

CREATE TABLE IF NOT EXISTS `Messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `revision_no` int(10) unsigned NOT NULL,
  `message` varchar(8192) NOT NULL,
  `posted` int(10) unsigned NOT NULL,
  PRIMARY KEY (`message_id`,`revision_no`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Messages`:
--   `topic_id`
--       `Topics` -> `topic_id`
--   `user_id`
--       `Users` -> `user_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `Sessions`
--

CREATE TABLE IF NOT EXISTS `Sessions` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `session_key1` varchar(64) NOT NULL,
  `session_key2` varchar(64) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `last_active` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `useragent` varchar(256) NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Sessions`:
--   `user_id`
--       `Users` -> `user_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `ShopItems`
--

CREATE TABLE IF NOT EXISTS `ShopItems` (
  `item_id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(28) NOT NULL,
  `price` int(4) NOT NULL,
  `description` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `class_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ShopTransactions`
--

CREATE TABLE IF NOT EXISTS `ShopTransactions` (
  `transaction_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `item_id` int(4) unsigned NOT NULL,
  `value` int(4) NOT NULL,
  `date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `ShopTransactions`:
--   `user_id`
--       `Users` -> `user_id`
--   `item_id`
--       `ShopItems` -> `item_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `StickiedTopics`
--

CREATE TABLE IF NOT EXISTS `StickiedTopics` (
  `sticky_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created` int(11) unsigned NOT NULL,
  `mod` int(1) NOT NULL,
  PRIMARY KEY (`sticky_id`),
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `StickiedTopics`:
--   `topic_id`
--       `Topics` -> `topic_id`
--   `user_id`
--       `Users` -> `user_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `TopicHistory`
--

CREATE TABLE IF NOT EXISTS `TopicHistory` (
  `topic_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `message_id` int(11) unsigned NOT NULL,
  `date` int(11) unsigned NOT NULL,
  `page` int(5) unsigned NOT NULL,
  PRIMARY KEY (`topic_id`,`user_id`),
  KEY `message_id` (`message_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `TopicHistory`:
--   `topic_id`
--       `Topics` -> `topic_id`
--   `user_id`
--       `Users` -> `user_id`
--   `message_id`
--       `Messages` -> `message_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `Topics`
--

CREATE TABLE IF NOT EXISTS `Topics` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `board_id` int(10) unsigned NOT NULL,
  `title` varchar(80) NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `board_id` (`board_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Topics`:
--   `user_id`
--       `Users` -> `user_id`
--   `board_id`
--       `Boards` -> `board_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `private_email` varchar(45) DEFAULT NULL,
  `instant_messaging` varchar(45) DEFAULT NULL,
  `password` varchar(90) NOT NULL,
  `old_password` varchar(32) DEFAULT NULL,
  `account_created` int(11) DEFAULT NULL,
  `last_active` int(11) DEFAULT NULL,
  `status` int(3) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `signature` varchar(128) DEFAULT NULL,
  `quote` varchar(128) DEFAULT NULL,
  `timezone` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ArchivedMessages`
--
ALTER TABLE `ArchivedMessages`
  ADD CONSTRAINT `ArchivedMessages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `ArchivedMessages_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `ArchivedTopics` (`topic_id`);

--
-- Constraints for table `ArchivedTopics`
--
ALTER TABLE `ArchivedTopics`
  ADD CONSTRAINT `ArchivedTopics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `ArchivedTopics_ibfk_2` FOREIGN KEY (`board_id`) REFERENCES `Boards` (`board_id`);

--
-- Constraints for table `Boards`
--
ALTER TABLE `Boards`
  ADD CONSTRAINT `Boards_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `BoardCategories` (`category_id`);

--
-- Constraints for table `Inventory`
--
ALTER TABLE `Inventory`
  ADD CONSTRAINT `Inventory_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `Inventory_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `ShopTransactions` (`transaction_id`);

--
-- Constraints for table `InviteCodes`
--
ALTER TABLE `InviteCodes`
  ADD CONSTRAINT `InviteCodes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `InviteTree`
--
ALTER TABLE `InviteTree`
  ADD CONSTRAINT `InviteTree_ibfk_1` FOREIGN KEY (`invited_by`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `InviteTree_ibfk_2` FOREIGN KEY (`Invited_user`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `Karma`
--
ALTER TABLE `Karma`
  ADD CONSTRAINT `Karma_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `LinkFavorites`
--
ALTER TABLE `LinkFavorites`
  ADD CONSTRAINT `LinkFavorites_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `Links` (`link_id`),
  ADD CONSTRAINT `LinkFavorites_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `LinkHistory`
--
ALTER TABLE `LinkHistory`
  ADD CONSTRAINT `LinkHistory_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `Links` (`link_id`),
  ADD CONSTRAINT `LinkHistory_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `LinkMessages`
--
ALTER TABLE `LinkMessages`
  ADD CONSTRAINT `LinkMessages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `LinkMessages_ibfk_2` FOREIGN KEY (`link_id`) REFERENCES `Links` (`link_id`);

--
-- Constraints for table `Links`
--
ALTER TABLE `Links`
  ADD CONSTRAINT `Links_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `LinksCategorized`
--
ALTER TABLE `LinksCategorized`
  ADD CONSTRAINT `LinksCategorized_ibfk_2` FOREIGN KEY (`link_id`) REFERENCES `Links` (`link_id`),
  ADD CONSTRAINT `LinksCategorized_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `LinkCategories` (`category_id`);

--
-- Constraints for table `LinksReported`
--
ALTER TABLE `LinksReported`
  ADD CONSTRAINT `LinksReported_ibfk_2` FOREIGN KEY (`link_id`) REFERENCES `Links` (`link_id`),
  ADD CONSTRAINT `LinksReported_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `LinkVotes`
--
ALTER TABLE `LinkVotes`
  ADD CONSTRAINT `LinkVotes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `LinkVotes_ibfk_2` FOREIGN KEY (`link_id`) REFERENCES `Links` (`link_id`);

--
-- Constraints for table `Messages`
--
ALTER TABLE `Messages`
  ADD CONSTRAINT `Messages_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `Topics` (`topic_id`),
  ADD CONSTRAINT `Messages_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `Sessions`
--
ALTER TABLE `Sessions`
  ADD CONSTRAINT `Sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `ShopTransactions`
--
ALTER TABLE `ShopTransactions`
  ADD CONSTRAINT `ShopTransactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `ShopTransactions_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ShopItems` (`item_id`);

--
-- Constraints for table `StickiedTopics`
--
ALTER TABLE `StickiedTopics`
  ADD CONSTRAINT `StickiedTopics_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `Topics` (`topic_id`),
  ADD CONSTRAINT `StickiedTopics_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `TopicHistory`
--
ALTER TABLE `TopicHistory`
  ADD CONSTRAINT `TopicHistory_ibfk_6` FOREIGN KEY (`topic_id`) REFERENCES `Topics` (`topic_id`),
  ADD CONSTRAINT `TopicHistory_ibfk_7` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `TopicHistory_ibfk_8` FOREIGN KEY (`message_id`) REFERENCES `Messages` (`message_id`);

--
-- Constraints for table `Topics`
--
ALTER TABLE `Topics`
  ADD CONSTRAINT `Topics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `Topics_ibfk_2` FOREIGN KEY (`board_id`) REFERENCES `Boards` (`board_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
