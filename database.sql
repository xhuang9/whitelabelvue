-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: craft-vue
-- ------------------------------------------------------
-- Server version	5.7.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `craft_assetindexdata`
--

DROP TABLE IF EXISTS `craft_assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `craft_assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `craft_assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetindexdata`
--

LOCK TABLES `craft_assetindexdata` WRITE;
/*!40000 ALTER TABLE `craft_assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assets`
--

DROP TABLE IF EXISTS `craft_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `craft_assets_folderId_idx` (`folderId`),
  KEY `craft_assets_volumeId_idx` (`volumeId`),
  KEY `craft_assets_uploaderId_fk` (`uploaderId`),
  CONSTRAINT `craft_assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assets`
--

LOCK TABLES `craft_assets` WRITE;
/*!40000 ALTER TABLE `craft_assets` DISABLE KEYS */;
INSERT INTO `craft_assets` VALUES (8,1,4,1,'logo_200308_033239.png','image',200,200,6591,NULL,0,0,'2020-03-08 03:32:39','2020-03-08 03:32:26','2020-03-08 03:32:39','54622be4-6d60-458c-920b-c8e152c886ce'),(9,1,4,1,'logo.png','image',200,200,6591,NULL,NULL,NULL,'2020-03-08 03:56:21','2020-03-08 03:56:21','2020-03-08 03:56:25','ba106f55-1cd7-49bf-a70b-8d8fab876617'),(10,2,5,1,'loading.gif','image',200,200,1181,NULL,NULL,NULL,'2020-05-29 07:14:01','2020-05-29 07:14:01','2020-05-29 07:14:27','40b52fbe-2f53-4280-89c1-a486acda062c'),(11,2,5,1,'error.jpg','image',381,381,5004,NULL,NULL,NULL,'2020-05-29 07:24:43','2020-05-29 07:24:43','2020-05-29 07:24:43','f8707b2d-1ef8-4643-9ce7-a0bfa05e2323');
/*!40000 ALTER TABLE `craft_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assettransformindex`
--

DROP TABLE IF EXISTS `craft_assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransformindex`
--

LOCK TABLES `craft_assettransformindex` WRITE;
/*!40000 ALTER TABLE `craft_assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assettransforms`
--

DROP TABLE IF EXISTS `craft_assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransforms`
--

LOCK TABLES `craft_assettransforms` WRITE;
/*!40000 ALTER TABLE `craft_assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categories`
--

DROP TABLE IF EXISTS `craft_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categories_groupId_idx` (`groupId`),
  KEY `craft_categories_parentId_fk` (`parentId`),
  CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categories`
--

LOCK TABLES `craft_categories` WRITE;
/*!40000 ALTER TABLE `craft_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups`
--

DROP TABLE IF EXISTS `craft_categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categorygroups_name_idx` (`name`),
  KEY `craft_categorygroups_handle_idx` (`handle`),
  KEY `craft_categorygroups_structureId_idx` (`structureId`),
  KEY `craft_categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `craft_categorygroups_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups`
--

LOCK TABLES `craft_categorygroups` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups_sites`
--

DROP TABLE IF EXISTS `craft_categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `craft_categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `craft_categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups_sites`
--

LOCK TABLES `craft_categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_changedattributes`
--

DROP TABLE IF EXISTS `craft_changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `craft_changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `craft_changedattributes_siteId_fk` (`siteId`),
  KEY `craft_changedattributes_userId_fk` (`userId`),
  CONSTRAINT `craft_changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_changedattributes`
--

LOCK TABLES `craft_changedattributes` WRITE;
/*!40000 ALTER TABLE `craft_changedattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_changedfields`
--

DROP TABLE IF EXISTS `craft_changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `craft_changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `craft_changedfields_siteId_fk` (`siteId`),
  KEY `craft_changedfields_fieldId_fk` (`fieldId`),
  KEY `craft_changedfields_userId_fk` (`userId`),
  CONSTRAINT `craft_changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_changedfields`
--

LOCK TABLES `craft_changedfields` WRITE;
/*!40000 ALTER TABLE `craft_changedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_content`
--

DROP TABLE IF EXISTS `craft_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `craft_content_siteId_idx` (`siteId`),
  KEY `craft_content_title_idx` (`title`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_content`
--

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;
INSERT INTO `craft_content` VALUES (1,1,1,NULL,'2020-02-20 03:18:57','2020-02-20 04:13:58','6dd3493f-6835-4f45-a590-487cede81768'),(3,3,1,'Home','2020-02-20 03:45:40','2020-02-20 03:51:52','1e37098e-e7d2-4e25-8b8d-aa51ae89ed21'),(4,4,1,'Home','2020-02-20 03:45:40','2020-02-20 03:45:40','3b8d31db-1533-4f2e-8cec-17fd2758687b'),(5,5,1,'Home','2020-02-20 03:51:36','2020-02-20 03:51:36','a0130280-2e6c-4dc0-b089-7a22cc734591'),(6,6,1,'Home','2020-02-20 03:51:52','2020-02-20 03:51:52','0a165bca-3849-4e20-b744-e8b33b18a59d'),(7,7,1,NULL,'2020-03-08 03:29:07','2020-06-01 02:53:14','e1792263-4356-40ac-8959-4861fb3eda06'),(8,8,1,'Logo','2020-03-08 03:32:26','2020-03-08 03:55:49','83192646-82af-4ae7-8bd4-60fead0cf201'),(9,9,1,'Logo','2020-03-08 03:56:21','2020-03-08 03:56:25','401cfbcf-3762-42ad-a2b6-c80bac684965'),(10,10,1,'Loading','2020-05-29 07:14:01','2020-05-29 07:14:27','0d5ac690-29b9-48df-8195-5ba3d5e12577'),(11,11,1,'Error','2020-05-29 07:24:43','2020-05-29 07:24:43','8ca28faf-5fee-4608-ba6d-c2f88c6d9be4');
/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_craftidtokens`
--

DROP TABLE IF EXISTS `craft_craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craft_craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_craftidtokens`
--

LOCK TABLES `craft_craftidtokens` WRITE;
/*!40000 ALTER TABLE `craft_craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_deprecationerrors`
--

DROP TABLE IF EXISTS `craft_deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_deprecationerrors`
--

LOCK TABLES `craft_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `craft_deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_drafts`
--

DROP TABLE IF EXISTS `craft_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_drafts_creatorId_fk` (`creatorId`),
  KEY `craft_drafts_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_drafts`
--

LOCK TABLES `craft_drafts` WRITE;
/*!40000 ALTER TABLE `craft_drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elementindexsettings`
--

DROP TABLE IF EXISTS `craft_elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elementindexsettings`
--

LOCK TABLES `craft_elementindexsettings` WRITE;
/*!40000 ALTER TABLE `craft_elementindexsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements`
--

DROP TABLE IF EXISTS `craft_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  KEY `craft_elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `craft_elements_draftId_fk` (`draftId`),
  KEY `craft_elements_revisionId_fk` (`revisionId`),
  CONSTRAINT `craft_elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `craft_drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `craft_revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements`
--

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;
INSERT INTO `craft_elements` VALUES (1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2020-02-20 03:18:57','2020-02-20 04:13:58',NULL,'6248a848-81e9-487f-ae85-9c8750d5f7ef'),(3,NULL,NULL,NULL,'craft\\elements\\Entry',1,0,'2020-02-20 03:45:40','2020-02-20 03:51:52',NULL,'b3ca2fd1-fcb6-4aaa-a2c3-2f910cc5af10'),(4,NULL,1,NULL,'craft\\elements\\Entry',1,0,'2020-02-20 03:45:40','2020-02-20 03:45:40',NULL,'d7cd328b-17e7-427d-bf1f-dfbcf06117dc'),(5,NULL,2,NULL,'craft\\elements\\Entry',1,0,'2020-02-20 03:51:36','2020-02-20 03:51:36',NULL,'16fa950d-9df0-4cf6-a183-1c2ef752639f'),(6,NULL,3,NULL,'craft\\elements\\Entry',1,0,'2020-02-20 03:51:52','2020-02-20 03:51:52',NULL,'93c52710-2a88-44a0-a3e0-d51b80faaf62'),(7,NULL,NULL,1,'craft\\elements\\GlobalSet',1,0,'2020-03-08 03:29:07','2020-06-01 02:53:14',NULL,'041b8d0c-ad9c-40bb-9e27-58c477724fdf'),(8,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-03-08 03:32:26','2020-03-08 03:55:49','2020-03-08 03:56:11','831733c6-4acf-4b75-a413-ed9b88fc829b'),(9,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-03-08 03:56:21','2020-03-08 03:56:25',NULL,'e0c1ef0b-2749-421c-bb63-c03326658049'),(10,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-05-29 07:14:01','2020-05-29 07:14:27',NULL,'7ad5504b-0015-4e4a-8aa0-158c0027970d'),(11,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-05-29 07:24:43','2020-05-29 07:24:43',NULL,'b28164aa-e19a-4b7a-805f-449617daa4c6');
/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements_sites`
--

DROP TABLE IF EXISTS `craft_elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `craft_elements_sites_siteId_idx` (`siteId`),
  KEY `craft_elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `craft_elements_sites_enabled_idx` (`enabled`),
  KEY `craft_elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `craft_elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements_sites`
--

LOCK TABLES `craft_elements_sites` WRITE;
/*!40000 ALTER TABLE `craft_elements_sites` DISABLE KEYS */;
INSERT INTO `craft_elements_sites` VALUES (1,1,1,NULL,NULL,1,'2020-02-20 03:18:57','2020-02-20 03:18:57','1633dc95-bf2d-4400-a764-58bd6e6d77d7'),(3,3,1,'__home__','__home__',1,'2020-02-20 03:45:40','2020-02-20 03:45:41','fb6ae1c6-46d7-4583-8927-aefdc3cd8712'),(4,4,1,'__home__','__home__',1,'2020-02-20 03:45:40','2020-02-20 03:45:40','f6a670a8-b4d5-4a97-93da-c677f7e775a0'),(5,5,1,'__home__','__home__',1,'2020-02-20 03:51:36','2020-02-20 03:51:36','05b8b2e4-c489-471d-9716-f57d69a1ed2c'),(6,6,1,'__home__','__home__',1,'2020-02-20 03:51:52','2020-02-20 03:51:52','b2ecb3d8-606a-42ae-856d-bef3577a3f9e'),(7,7,1,NULL,NULL,1,'2020-03-08 03:29:07','2020-03-08 03:29:07','531c720f-2677-49da-87bd-d3178b1e3f85'),(8,8,1,NULL,NULL,1,'2020-03-08 03:32:26','2020-03-08 03:32:26','70298f79-bfb6-4c27-9d27-bd5222a869bf'),(9,9,1,NULL,NULL,1,'2020-03-08 03:56:21','2020-03-08 03:56:21','3ba9d4cc-aa20-408a-9b61-915dd41846c1'),(10,10,1,NULL,NULL,1,'2020-05-29 07:14:01','2020-05-29 07:14:01','35cf931e-e0b3-4c7b-a3a0-8cbc23a3a158'),(11,11,1,NULL,NULL,1,'2020-05-29 07:24:43','2020-05-29 07:24:43','25ee2032-a697-4dab-8949-e9f2318d1f52');
/*!40000 ALTER TABLE `craft_elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entries`
--

DROP TABLE IF EXISTS `craft_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_idx` (`authorId`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_parentId_fk` (`parentId`),
  CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entries`
--

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;
INSERT INTO `craft_entries` VALUES (3,1,NULL,1,1,'2020-02-20 03:45:00',NULL,NULL,'2020-02-20 03:45:40','2020-02-20 03:45:40','e3e23818-9244-4066-bc86-0039ef245f19'),(4,1,NULL,1,1,'2020-02-20 03:45:00',NULL,NULL,'2020-02-20 03:45:40','2020-02-20 03:45:40','9745f6aa-23b6-4abb-ab57-61b153c704c9'),(5,1,NULL,1,1,'2020-02-20 03:45:00',NULL,NULL,'2020-02-20 03:51:36','2020-02-20 03:51:36','b63721b4-77af-4b71-99d2-629ae8a3024a'),(6,1,NULL,1,1,'2020-02-20 03:45:00',NULL,NULL,'2020-02-20 03:51:52','2020-02-20 03:51:52','ae43bb44-3f30-4a80-b4fb-0038b1fb588a');
/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entrytypes`
--

DROP TABLE IF EXISTS `craft_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `craft_entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `craft_entrytypes_sectionId_idx` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `craft_entrytypes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrytypes`
--

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;
INSERT INTO `craft_entrytypes` VALUES (1,1,NULL,'Home Template','homeTemplate',1,'Title','',1,'2020-02-20 03:45:01','2020-02-20 03:45:21',NULL,'c2159ed1-734b-4efa-ab5d-aa138f85185e');
/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_feedme_feeds`
--

DROP TABLE IF EXISTS `craft_feedme_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_feedme_feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `feedUrl` text NOT NULL,
  `feedType` varchar(255) DEFAULT NULL,
  `primaryElement` varchar(255) DEFAULT NULL,
  `elementType` varchar(255) NOT NULL,
  `elementGroup` text,
  `siteId` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `duplicateHandle` text,
  `paginationNode` text,
  `fieldMapping` text,
  `fieldUnique` text,
  `passkey` varchar(255) NOT NULL,
  `backup` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_feedme_feeds`
--

LOCK TABLES `craft_feedme_feeds` WRITE;
/*!40000 ALTER TABLE `craft_feedme_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_feedme_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldgroups`
--

DROP TABLE IF EXISTS `craft_fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldgroups`
--

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;
INSERT INTO `craft_fieldgroups` VALUES (2,'System','2020-03-08 03:28:19','2020-03-08 03:28:19','c127e2a1-ad92-4078-8710-98f15fca7274');
/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayoutfields`
--

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `craft_fieldlayoutfields` VALUES (5,1,3,2,0,2,'2020-06-01 02:52:57','2020-06-01 02:52:57','7c0802f1-f595-4e41-b584-1bee817c512e'),(6,1,3,3,0,3,'2020-06-01 02:52:57','2020-06-01 02:52:57','26784039-28fc-4bea-a9dc-c70b4c53d4bb'),(7,1,3,1,0,1,'2020-06-01 02:52:57','2020-06-01 02:52:57','97655a08-378e-4c5e-8a73-d6946794c07c');
/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouts`
--

DROP TABLE IF EXISTS `craft_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouts`
--

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;
INSERT INTO `craft_fieldlayouts` VALUES (1,'craft\\elements\\GlobalSet','2020-03-08 03:29:07','2020-03-08 03:29:07',NULL,'73d84f56-5fb3-4075-beec-8d96afdb7be3');
/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouttabs`
--

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `craft_fieldlayouttabs` VALUES (3,1,'System',1,'2020-06-01 02:52:57','2020-06-01 02:52:57','6d0aad43-8dc4-4154-b7ab-809aeaa1f25f');
/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fields`
--

DROP TABLE IF EXISTS `craft_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_groupId_idx` (`groupId`),
  KEY `craft_fields_context_idx` (`context`),
  CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fields`
--

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;
INSERT INTO `craft_fields` VALUES (1,2,'Logo','logo','global','You can put more than one logo, but on default the first one will be used. Other logos will require template configuration.',1,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":\"\",\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:5c2279a4-677d-493b-9d5d-60afcf08eeaa\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:5c2279a4-677d-493b-9d5d-60afcf08eeaa\",\"singleUploadLocationSubpath\":\"system\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":\"\",\"viewMode\":\"list\"}','2020-03-08 03:28:49','2020-06-01 02:55:35','74a47440-4da2-4a66-b349-45be2dea967c'),(2,2,'Place Holder','placeHolder','global','if none provide, will use logo instead.',1,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":\"\",\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:5c2279a4-677d-493b-9d5d-60afcf08eeaa\",\"defaultUploadLocationSubpath\":\"system\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:5c2279a4-677d-493b-9d5d-60afcf08eeaa\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":\"\",\"viewMode\":\"list\"}','2020-03-08 03:28:49','2020-06-01 02:57:08','2cc8809f-9f35-4610-9a34-c52aa6dd9ae8'),(3,2,'Favicon','favicon','global','',1,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":\"\",\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:db3da7fe-1151-4a78-94f2-be47b936ff63\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:5c2279a4-677d-493b-9d5d-60afcf08eeaa\",\"singleUploadLocationSubpath\":\"system\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":\"\",\"viewMode\":\"list\"}','2020-06-01 02:52:48','2020-06-01 02:53:43','5d074a03-536e-4f6d-9ad6-17e28525a0b7');
/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_globalsets`
--

DROP TABLE IF EXISTS `craft_globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_globalsets_name_idx` (`name`),
  KEY `craft_globalsets_handle_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_globalsets`
--

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;
INSERT INTO `craft_globalsets` VALUES (7,'System','system',1,'2020-03-08 03:29:07','2020-06-01 02:51:44','041b8d0c-ad9c-40bb-9e27-58c477724fdf');
/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_gqlschemas`
--

DROP TABLE IF EXISTS `craft_gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_gqlschemas`
--

LOCK TABLES `craft_gqlschemas` WRITE;
/*!40000 ALTER TABLE `craft_gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_gqltokens`
--

DROP TABLE IF EXISTS `craft_gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_gqltokens_accessToken_unq_idx` (`accessToken`),
  UNIQUE KEY `craft_gqltokens_name_unq_idx` (`name`),
  KEY `craft_gqltokens_schemaId_fk` (`schemaId`),
  CONSTRAINT `craft_gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `craft_gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_gqltokens`
--

LOCK TABLES `craft_gqltokens` WRITE;
/*!40000 ALTER TABLE `craft_gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_info`
--

DROP TABLE IF EXISTS `craft_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_info`
--

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;
INSERT INTO `craft_info` VALUES (1,'3.4.21','3.4.10',0,'[]','vI1J8XXidyai','2020-02-20 03:18:57','2020-06-01 02:57:08','020b647d-a5db-4345-99fd-19e49bac65d1');
/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocks`
--

DROP TABLE IF EXISTS `craft_matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocks`
--

LOCK TABLES `craft_matrixblocks` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocktypes`
--

DROP TABLE IF EXISTS `craft_matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocktypes`
--

LOCK TABLES `craft_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_migrations`
--

DROP TABLE IF EXISTS `craft_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_migrations_pluginId_idx` (`pluginId`),
  KEY `craft_migrations_type_pluginId_idx` (`type`,`pluginId`),
  CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_migrations`
--

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;
INSERT INTO `craft_migrations` VALUES (1,NULL,'app','Install','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','b8c69712-3f47-4810-8cfb-a4da6137fc74'),(2,NULL,'app','m150403_183908_migrations_table_changes','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','04f399ce-a0b1-461a-b5cd-5c7fd1c8cb30'),(3,NULL,'app','m150403_184247_plugins_table_changes','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','2083c048-ac20-4e8a-b5e2-b6aeafb5d85c'),(4,NULL,'app','m150403_184533_field_version','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','59ecd10e-a112-43a0-83a4-2c573aebb993'),(5,NULL,'app','m150403_184729_type_columns','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','e0aaa783-82c1-4fa4-b7d7-87b3730824c3'),(6,NULL,'app','m150403_185142_volumes','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','0b6e22d3-a7f8-4fbb-bc80-f058c0638eab'),(7,NULL,'app','m150428_231346_userpreferences','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','ca46da95-cde5-42a7-bf92-08aeb8a0e6f5'),(8,NULL,'app','m150519_150900_fieldversion_conversion','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','f935c333-f24e-4855-bbb2-3ab2c137708d'),(9,NULL,'app','m150617_213829_update_email_settings','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','1bb9660b-7217-4660-934a-a7aae86fbc34'),(10,NULL,'app','m150721_124739_templatecachequeries','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','97334c87-3bb8-4bd5-b727-ebd1147b03ce'),(11,NULL,'app','m150724_140822_adjust_quality_settings','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','c070a992-d1ad-4cb2-ae9e-605d5e01219b'),(12,NULL,'app','m150815_133521_last_login_attempt_ip','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','cdc2a487-49a8-4f6e-835f-8de8ffd2f9d7'),(13,NULL,'app','m151002_095935_volume_cache_settings','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','5679aa50-48fb-4f89-9113-563e76138fc0'),(14,NULL,'app','m151005_142750_volume_s3_storage_settings','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','2b0d4c09-e8a3-4f35-b294-623b1868b477'),(15,NULL,'app','m151016_133600_delete_asset_thumbnails','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','cb486a5e-6355-46e8-91bb-41a347043ae0'),(16,NULL,'app','m151209_000000_move_logo','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','aa1d9863-d523-457c-938f-0a115117ac48'),(17,NULL,'app','m151211_000000_rename_fileId_to_assetId','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','d2c005ce-d5ab-4ef3-a3a9-409faa98f7fd'),(18,NULL,'app','m151215_000000_rename_asset_permissions','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','f5c6d1ee-0b39-46e3-9df2-7da88f054922'),(19,NULL,'app','m160707_000001_rename_richtext_assetsource_setting','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','b7f1b483-d408-4bdb-bb4e-1a3e6a942e74'),(20,NULL,'app','m160708_185142_volume_hasUrls_setting','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','d9bbc013-0090-4da4-b53c-62f9fac6913a'),(21,NULL,'app','m160714_000000_increase_max_asset_filesize','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','b02195e2-ab88-4f79-a693-d359fca3caa6'),(22,NULL,'app','m160727_194637_column_cleanup','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','38c7665c-bd75-42d0-8550-2f63832c40a6'),(23,NULL,'app','m160804_110002_userphotos_to_assets','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','496ba712-22dc-45e2-9721-a5bcfca757e0'),(24,NULL,'app','m160807_144858_sites','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','fdc393c0-2f3d-46ac-b334-4bef0a816d31'),(25,NULL,'app','m160829_000000_pending_user_content_cleanup','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','d035c0cb-f5b8-4474-ac96-74b042bea1dc'),(26,NULL,'app','m160830_000000_asset_index_uri_increase','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','4415b566-6f18-4f9d-9f78-fff481f30a27'),(27,NULL,'app','m160912_230520_require_entry_type_id','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','8d103ba4-d4fc-4420-99f3-86c856e75018'),(28,NULL,'app','m160913_134730_require_matrix_block_type_id','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','c367f46a-dcbc-45c0-9337-e4e81b7a11af'),(29,NULL,'app','m160920_174553_matrixblocks_owner_site_id_nullable','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','cf87117f-5d73-4ec0-9386-e98b25c7e337'),(30,NULL,'app','m160920_231045_usergroup_handle_title_unique','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','05ae1e48-ba7a-4969-80cf-04fa9a5212da'),(31,NULL,'app','m160925_113941_route_uri_parts','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','45de40a7-b772-4b8c-9db8-cea72d378047'),(32,NULL,'app','m161006_205918_schemaVersion_not_null','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','e5f69154-3c51-481a-9584-da8964830b8c'),(33,NULL,'app','m161007_130653_update_email_settings','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','48159d89-ce55-4f06-81a4-22879aead3c0'),(34,NULL,'app','m161013_175052_newParentId','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','e5d8e0b0-286d-470e-8a98-598b90775aff'),(35,NULL,'app','m161021_102916_fix_recent_entries_widgets','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','06f162b0-f065-4bd6-b6f6-0b4497d2cad8'),(36,NULL,'app','m161021_182140_rename_get_help_widget','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','d1ed139d-2a03-4897-be2d-3b69b561e2ea'),(37,NULL,'app','m161025_000000_fix_char_columns','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','6e7e9ecf-c06b-464b-be33-44a85d82dba7'),(38,NULL,'app','m161029_124145_email_message_languages','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','85722a1d-5f14-40e7-82d8-37ae529f3e0e'),(39,NULL,'app','m161108_000000_new_version_format','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','cfb27f7b-a763-45aa-ab75-5cdd9e2cb507'),(40,NULL,'app','m161109_000000_index_shuffle','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','46163ac0-0a89-499c-8f9a-613fed786a5e'),(41,NULL,'app','m161122_185500_no_craft_app','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','855f4f89-54ca-4f78-a2c5-a9047e7d5e3a'),(42,NULL,'app','m161125_150752_clear_urlmanager_cache','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','ef8011fb-5adb-4b3f-a2d8-2b761fce3f29'),(43,NULL,'app','m161220_000000_volumes_hasurl_notnull','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','742f11e4-0b3b-4c21-8404-779ec951d940'),(44,NULL,'app','m170114_161144_udates_permission','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','94592532-78de-4dd1-9e6a-f6ae33251783'),(45,NULL,'app','m170120_000000_schema_cleanup','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','028faf5c-42e1-417a-8cef-9eee14d92f80'),(46,NULL,'app','m170126_000000_assets_focal_point','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','9c257d3c-99c6-4263-87b3-51e3f9979119'),(47,NULL,'app','m170206_142126_system_name','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','14d2e10e-af2f-4d5d-a8e8-8d3226fae1f9'),(48,NULL,'app','m170217_044740_category_branch_limits','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','1f6977a5-08d3-48ea-8de7-eb03f5079429'),(49,NULL,'app','m170217_120224_asset_indexing_columns','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','163ad277-e7a0-4e2f-a22c-27b7168c1360'),(50,NULL,'app','m170223_224012_plain_text_settings','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','93f50c1c-4e6f-4e7c-b07c-e8f719dd863e'),(51,NULL,'app','m170227_120814_focal_point_percentage','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','997aaf34-c132-4e9b-98e1-bd9023aad975'),(52,NULL,'app','m170228_171113_system_messages','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','b0908d22-35bd-4218-bca1-b6ecbcc620cb'),(53,NULL,'app','m170303_140500_asset_field_source_settings','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','f38159d8-ce94-418c-bfd0-7c135408e14b'),(54,NULL,'app','m170306_150500_asset_temporary_uploads','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','f39af62b-2a7b-4ad4-888a-e51e13c2fa7b'),(55,NULL,'app','m170523_190652_element_field_layout_ids','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','7d97f28b-5aa3-4485-a0d7-37351ef86aa0'),(56,NULL,'app','m170612_000000_route_index_shuffle','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','47339edb-bb9a-4450-96d9-678d569fc648'),(57,NULL,'app','m170621_195237_format_plugin_handles','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','dc655b94-b2bf-4d20-98d2-960b9a929080'),(58,NULL,'app','m170630_161027_deprecation_line_nullable','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','fc1f8868-0bfa-4fc7-825f-096b05f3f3b7'),(59,NULL,'app','m170630_161028_deprecation_changes','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','75bc2bf9-1a59-4980-9a11-1ca2f0731c9a'),(60,NULL,'app','m170703_181539_plugins_table_tweaks','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','4a2880b4-a1a1-4a21-ae1e-121176621679'),(61,NULL,'app','m170704_134916_sites_tables','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','e39213cc-9734-48ed-ae03-a0251f1f9612'),(62,NULL,'app','m170706_183216_rename_sequences','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','6f363350-2b1c-47be-a318-4aaaf0212258'),(63,NULL,'app','m170707_094758_delete_compiled_traits','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','ea5eb87e-8222-425e-8548-ce888f56dbb7'),(64,NULL,'app','m170731_190138_drop_asset_packagist','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','93e0f567-5eb0-42da-bb4a-29b239048c6c'),(65,NULL,'app','m170810_201318_create_queue_table','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','e2c8bb03-7e17-4390-8e6a-dc9c7f33a95e'),(66,NULL,'app','m170903_192801_longblob_for_queue_jobs','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','a1a88745-8e66-4b3c-acea-6dd8998b86c8'),(67,NULL,'app','m170914_204621_asset_cache_shuffle','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','f78269a9-f9b9-4eb6-aeb4-22a1d19fe4c0'),(68,NULL,'app','m171011_214115_site_groups','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','2088f9c3-8179-4dd8-9ba5-9cfa8ca60300'),(69,NULL,'app','m171012_151440_primary_site','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','dd4e45ed-4566-4c2b-b72c-1c6c3ebbf8df'),(70,NULL,'app','m171013_142500_transform_interlace','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','eea078cf-820e-466e-8372-143c5ee4ba01'),(71,NULL,'app','m171016_092553_drop_position_select','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','c5ac42aa-b55b-49dd-8c7c-48327bfc45a3'),(72,NULL,'app','m171016_221244_less_strict_translation_method','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','758320ae-22cb-4894-bcb7-14c5d6194bea'),(73,NULL,'app','m171107_000000_assign_group_permissions','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','e4a5f57e-0aaa-482d-8bfa-9cee05c09a22'),(74,NULL,'app','m171117_000001_templatecache_index_tune','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','83328cd8-6fad-46cb-a3e7-807b3c3bd02d'),(75,NULL,'app','m171126_105927_disabled_plugins','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','8e155ea3-b994-462f-951e-adb871fa9ac1'),(76,NULL,'app','m171130_214407_craftidtokens_table','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','df5e6690-d924-4155-b719-3f8511a31e54'),(77,NULL,'app','m171202_004225_update_email_settings','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','96b485b6-2648-430c-a53a-f8d7846caef3'),(78,NULL,'app','m171204_000001_templatecache_index_tune_deux','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','813a102c-6635-4721-b75b-c1573dbc7818'),(79,NULL,'app','m171205_130908_remove_craftidtokens_refreshtoken_column','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','ab09e696-090a-4702-96a6-7066028a0ac4'),(80,NULL,'app','m171218_143135_longtext_query_column','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','bb3c011c-a6ce-4c04-be54-efea1f4a5ac6'),(81,NULL,'app','m171231_055546_environment_variables_to_aliases','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','d05d46af-5b33-4eda-86f5-817598730df2'),(82,NULL,'app','m180113_153740_drop_users_archived_column','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','b0c6d055-eb48-4c13-a876-6e269f3a283b'),(83,NULL,'app','m180122_213433_propagate_entries_setting','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','7e8e6f31-c038-4ba5-b3b7-0235a83a5eaa'),(84,NULL,'app','m180124_230459_fix_propagate_entries_values','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','74c9b389-c7b8-48ea-b5ac-00562efe6c4e'),(85,NULL,'app','m180128_235202_set_tag_slugs','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','6f5a7562-5764-4613-b688-3321af859c1c'),(86,NULL,'app','m180202_185551_fix_focal_points','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','8e793f4f-ed39-4ab0-a9df-267118f52b63'),(87,NULL,'app','m180217_172123_tiny_ints','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','65941689-cb1b-42a4-a642-c90f51ffa13b'),(88,NULL,'app','m180321_233505_small_ints','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','c8e13c2a-5f8f-48a6-aec3-fb9c341a264f'),(89,NULL,'app','m180328_115523_new_license_key_statuses','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','ca5b6bcd-e493-4f02-a046-312040b51fab'),(90,NULL,'app','m180404_182320_edition_changes','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','84c7a894-c003-48b7-9e8e-74553dbbfddc'),(91,NULL,'app','m180411_102218_fix_db_routes','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','6b2be4e1-0641-4b35-a359-38565065d829'),(92,NULL,'app','m180416_205628_resourcepaths_table','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','851c59e5-d566-4c41-aea6-97d8bff0326a'),(93,NULL,'app','m180418_205713_widget_cleanup','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','4c7cfe5b-7161-4201-b1e6-b1e080fc00f4'),(94,NULL,'app','m180425_203349_searchable_fields','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','21878316-d96a-4f90-bd4f-b9eee6e069f4'),(95,NULL,'app','m180516_153000_uids_in_field_settings','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','6c06334a-69d4-41cb-bd9a-7e8f901f516e'),(96,NULL,'app','m180517_173000_user_photo_volume_to_uid','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','39636edd-5ae9-468f-861c-bae76872b9fb'),(97,NULL,'app','m180518_173000_permissions_to_uid','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','935b97db-e01d-4e30-b819-9abd4205bc71'),(98,NULL,'app','m180520_173000_matrix_context_to_uids','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','2812197a-97d3-4311-819a-e7e1a3394a97'),(99,NULL,'app','m180521_172900_project_config_table','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','b3c2b81f-f9b7-4403-8874-b7140707930c'),(100,NULL,'app','m180521_173000_initial_yml_and_snapshot','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','ea6b13df-a6a6-4d48-bbf1-8e6475326c8f'),(101,NULL,'app','m180731_162030_soft_delete_sites','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','68fc9618-df75-48e7-a9e3-d70d6ef12265'),(102,NULL,'app','m180810_214427_soft_delete_field_layouts','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','ddb0f036-cee2-4c0d-a7e8-360e20ce918e'),(103,NULL,'app','m180810_214439_soft_delete_elements','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','d89a5dcb-a8ca-4ff9-b1d0-b64d2dafe9c8'),(104,NULL,'app','m180824_193422_case_sensitivity_fixes','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','daf6fd5b-f670-46b9-bffc-d8649cfa36a5'),(105,NULL,'app','m180901_151639_fix_matrixcontent_tables','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','7ded172c-df3e-49ed-a505-f06d3780e278'),(106,NULL,'app','m180904_112109_permission_changes','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','5acafba4-0ebc-4d72-acc0-010a23039a41'),(107,NULL,'app','m180910_142030_soft_delete_sitegroups','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','887b3994-f9b7-4e92-a3b9-29437daa862c'),(108,NULL,'app','m181011_160000_soft_delete_asset_support','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','9ae8c14a-d52e-4341-a35c-5fec0b144895'),(109,NULL,'app','m181016_183648_set_default_user_settings','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','c9ee73d5-2f99-4981-b885-cf9126a9b5d1'),(110,NULL,'app','m181017_225222_system_config_settings','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','e679b009-82a3-4668-b762-4efcc3da7afb'),(111,NULL,'app','m181018_222343_drop_userpermissions_from_config','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','df647b2a-00b1-4ec0-88a8-26459af96003'),(112,NULL,'app','m181029_130000_add_transforms_routes_to_config','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','0b394248-f35b-4eca-b5a9-872a07021875'),(113,NULL,'app','m181112_203955_sequences_table','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','a46ccc4a-1694-42bb-b8fd-7ad6672db521'),(114,NULL,'app','m181121_001712_cleanup_field_configs','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','9e1b9173-2118-457e-bba7-4e87d7e0c461'),(115,NULL,'app','m181128_193942_fix_project_config','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','757a5001-545e-45f5-b47a-4c68927ea5d1'),(116,NULL,'app','m181130_143040_fix_schema_version','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','7a7df049-a825-4087-a496-d0dfa0551590'),(117,NULL,'app','m181211_143040_fix_entry_type_uids','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','a3a020b6-367e-4eb0-92e0-106d674a199c'),(118,NULL,'app','m181213_102500_config_map_aliases','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','17b34872-0f0e-489f-92a3-3485f41300b2'),(119,NULL,'app','m181217_153000_fix_structure_uids','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','d68dc2a8-fd90-4f4a-98c2-cc3993db520d'),(120,NULL,'app','m190104_152725_store_licensed_plugin_editions','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','6179e955-452c-4bfc-abd9-10e50bd336a7'),(121,NULL,'app','m190108_110000_cleanup_project_config','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','a716095a-2768-4fab-9763-8235006a16f8'),(122,NULL,'app','m190108_113000_asset_field_setting_change','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','8e592819-0e82-443e-98e8-7b6bfcb1aee2'),(123,NULL,'app','m190109_172845_fix_colspan','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','f61e94f4-eb61-46fe-a3c5-d202b6fc92b6'),(124,NULL,'app','m190110_150000_prune_nonexisting_sites','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','282c37d3-003e-4803-ac3d-39a2549a0849'),(125,NULL,'app','m190110_214819_soft_delete_volumes','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','9c9d1155-5273-46d3-a7d1-3872b766ad98'),(126,NULL,'app','m190112_124737_fix_user_settings','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','6ae70562-bde1-42b7-8b1e-00cd1898c6fb'),(127,NULL,'app','m190112_131225_fix_field_layouts','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','8bcd4450-82c9-463e-b855-56b5ab9b4074'),(128,NULL,'app','m190112_201010_more_soft_deletes','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','62096846-1f27-4aea-bd17-fefcc8f7f343'),(129,NULL,'app','m190114_143000_more_asset_field_setting_changes','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','ba43539a-a126-4604-9c9f-8e5f1635a85d'),(130,NULL,'app','m190121_120000_rich_text_config_setting','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','4b79f597-f940-41aa-95b3-5bec92a999fe'),(131,NULL,'app','m190125_191628_fix_email_transport_password','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','d0e0096d-6d9f-44e8-bcef-319f0b425a77'),(132,NULL,'app','m190128_181422_cleanup_volume_folders','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','f486218a-4cb9-480a-b932-e496943bc8ad'),(133,NULL,'app','m190205_140000_fix_asset_soft_delete_index','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','a5d7015b-ebdd-4510-b768-8d4a889e294c'),(134,NULL,'app','m190208_140000_reset_project_config_mapping','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','34ae545c-3f5b-44c1-91ad-5b248220eea6'),(135,NULL,'app','m190218_143000_element_index_settings_uid','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','88b950ff-2678-4e85-8bff-ee61cf66284d'),(136,NULL,'app','m190312_152740_element_revisions','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','3beb2c0d-e998-4343-b6a8-04571adbf33b'),(137,NULL,'app','m190327_235137_propagation_method','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','1e112314-c41c-4fbd-b713-792b676a6cc9'),(138,NULL,'app','m190401_223843_drop_old_indexes','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','ad620388-d121-42e0-aea1-3364e3d02f12'),(139,NULL,'app','m190416_014525_drop_unique_global_indexes','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','9f21e749-ad24-4246-9aab-b20683fe3677'),(140,NULL,'app','m190417_085010_add_image_editor_permissions','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','609b1f04-ea65-401f-b326-cbc0e7a8c350'),(141,NULL,'app','m190502_122019_store_default_user_group_uid','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','5730d53e-0ee1-41bb-865e-6bec86322703'),(142,NULL,'app','m190504_150349_preview_targets','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','8f0e905b-d62a-4c9d-b26d-77684f0d3307'),(143,NULL,'app','m190516_184711_job_progress_label','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','001ece73-f2ca-4d96-a914-1f3ec05fc681'),(144,NULL,'app','m190523_190303_optional_revision_creators','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','48955179-831b-4ac6-9afd-66c4fff2295e'),(145,NULL,'app','m190529_204501_fix_duplicate_uids','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','c300507e-1eec-4333-9364-f52fcfa0c458'),(146,NULL,'app','m190605_223807_unsaved_drafts','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','9b7e2f40-3baa-487c-944d-2e208b51fa06'),(147,NULL,'app','m190607_230042_entry_revision_error_tables','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','c7cef49a-2aaa-4ee7-a3c4-00d18472334c'),(148,NULL,'app','m190608_033429_drop_elements_uid_idx','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','0d8b9391-cbd2-493e-9f56-0c9a10944f74'),(149,NULL,'app','m190617_164400_add_gqlschemas_table','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','4248c1ea-46be-4b5a-b62c-7af9427ff198'),(150,NULL,'app','m190624_234204_matrix_propagation_method','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','fd08813e-f73f-4146-90e0-b6e2df4d3f49'),(151,NULL,'app','m190711_153020_drop_snapshots','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','dadeadf4-67f3-4e97-8f7a-f5fd6db3c2da'),(152,NULL,'app','m190712_195914_no_draft_revisions','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','9ecf0224-d8fd-41c9-8298-11381bc1cee1'),(153,NULL,'app','m190723_140314_fix_preview_targets_column','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','c6bff90d-2635-48f2-9ba6-d19ea4795b87'),(154,NULL,'app','m190820_003519_flush_compiled_templates','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','0769e76e-4b49-4336-9e10-85f906dde135'),(155,NULL,'app','m190823_020339_optional_draft_creators','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','0c01cabe-255b-48bf-ab57-17c2004a906d'),(156,NULL,'app','m190913_152146_update_preview_targets','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','d87eee4c-c559-4fa5-8dcb-78766f783d8b'),(157,NULL,'app','m191107_122000_add_gql_project_config_support','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','561b52ca-86c7-4a9a-b934-aa9cfafadf6d'),(158,NULL,'app','m191204_085100_pack_savable_component_settings','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','9764dc9c-60a1-457a-af89-49bcd8ca1b19'),(159,NULL,'app','m191206_001148_change_tracking','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','1e0cedcd-ad53-4d67-bda7-a41789a6b75b'),(160,NULL,'app','m191216_191635_asset_upload_tracking','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','320d1669-b06d-4dbe-b779-4b3caab6a885'),(161,NULL,'app','m191222_002848_peer_asset_permissions','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','b1220127-b9f2-41d7-a185-62125aa6a05e'),(162,NULL,'app','m200127_172522_queue_channels','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','64afbdec-107d-400e-9ec2-499198c613ac'),(163,NULL,'app','m200211_175048_truncate_element_query_cache','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','490d7463-81ac-46a2-8cf3-0a43f8a1aa28'),(164,NULL,'app','m200213_172522_new_elements_index','2020-02-20 03:18:58','2020-02-20 03:18:58','2020-02-20 03:18:58','afe83d52-0a2e-4bfd-84b1-5b05e0c6d1cb'),(165,1,'plugin','Install','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','d81e5a85-7398-4ee2-9072-f844a6b46b2e'),(166,1,'plugin','m180221_161521_update_type','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','02c2c1af-db11-4c3c-991e-ac383b2865d8'),(167,1,'plugin','m180221_161522_notes_fields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','3a4fc0f0-4d01-458b-929a-8ef4b438adfb'),(168,1,'plugin','m180221_161523_phone_fields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','38df4141-ae5a-4b7f-8304-0941c35443d5'),(169,1,'plugin','m180221_161524_email_select_fields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','eb87518a-9d9e-4ba2-a657-5752b25ae721'),(170,1,'plugin','m180221_161525_regular_expression_fields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','d081c5eb-85e7-4916-9c43-a609e1b93285'),(171,1,'plugin','m180221_161526_link_fields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','faaadc49-ef55-4109-90c0-19013f275935'),(172,1,'plugin','m180221_161527_email_fields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','780907b4-d08e-47c4-996e-34d177ae9179'),(173,1,'plugin','m180221_161528_hidden_fields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','3523d06e-3f29-4266-bdaf-d3b619fea364'),(174,1,'plugin','m180221_161529_invisible_fields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','3eb7c4e8-a40c-464b-bff2-36017ca933d9'),(175,1,'plugin','m180228_161529_settings_to_null','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','6ea87a52-3a7a-4ea5-ae5e-ed0fe5be3d30'),(176,1,'plugin','m180328_073816_create_address_table','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','66a73410-a206-4fe0-a2fd-a53cc81b1ca8'),(177,1,'plugin','m190116_000000_address_field','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','9713ee7a-1090-40c4-9480-d981ae04e9b9'),(178,1,'plugin','m190313_000000_rename_administrative_area_code_column_sproutfields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','c22e0b51-6d8c-4a6e-9529-fe5572be321c'),(179,1,'plugin','m190313_000001_fix_non_abbreviation_administrative_codes_sproutfields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','71ed3858-4aba-4aea-a252-93c06e815431'),(180,1,'plugin','m190521_000000_add_predefined_data_type_setting_sproutfields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','9d785788-63f4-4e4f-93fc-8fdf9fe301ec'),(181,1,'plugin','m190524_000000_add_dynamic_rendering_and_standalone_predefined_date_field_sproutfields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','da6d4aaf-f6eb-4572-ae33-46ec8578c276'),(182,1,'plugin','m191218_000000_remove_addressHelper_from_settings_sproutfields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','608b47ef-93f1-49d4-88e6-a713ec5c268b'),(183,1,'plugin','m200102_000000_remove_address_field_content_column_sproutfields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','c3f48918-bcb8-4679-862a-ac4bfd627a83'),(184,1,'plugin','m200102_000000_update_empty_name_fields_to_null_sproutfields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','2e9e3e44-31dd-4d4d-8629-65392fc4cc23'),(185,1,'plugin','m200102_000000_update_empty_phone_fields_to_null_sproutfields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','70ac72c7-35f9-4b47-bf0a-18590d07d838'),(186,1,'plugin','m200109_000000_update_address_tables_sproutfields','2020-02-20 03:30:29','2020-02-20 03:30:29','2020-02-20 03:30:29','91481eb4-454a-448c-9a15-facd7668a2f4'),(187,3,'plugin','Install','2020-02-20 03:42:25','2020-02-20 03:42:25','2020-02-20 03:42:25','0a4366b1-9f1f-4ff2-87fb-81b7f0a36d7e'),(188,3,'plugin','m180210_000000_migrate_content_tables','2020-02-20 03:42:25','2020-02-20 03:42:25','2020-02-20 03:42:25','71666394-bc57-40ee-82b3-5bd570d66615'),(189,3,'plugin','m180211_000000_type_columns','2020-02-20 03:42:25','2020-02-20 03:42:25','2020-02-20 03:42:25','cd95f51e-d760-4799-8f5d-130d4ef8ce49'),(190,3,'plugin','m180219_000000_sites','2020-02-20 03:42:25','2020-02-20 03:42:25','2020-02-20 03:42:25','ed1a6a80-e1e8-4273-9bcc-6a076d1a24f1'),(191,3,'plugin','m180220_000000_fix_context','2020-02-20 03:42:25','2020-02-20 03:42:25','2020-02-20 03:42:25','ad81335e-7633-47c8-88b7-e55d41d6948a'),(192,3,'plugin','m190117_000000_soft_deletes','2020-02-20 03:42:25','2020-02-20 03:42:25','2020-02-20 03:42:25','f032dfee-80e8-4b40-8527-f3b1d8ffcdf6'),(193,3,'plugin','m190117_000001_context_to_uids','2020-02-20 03:42:25','2020-02-20 03:42:25','2020-02-20 03:42:25','c3635134-7946-4fc3-8023-e880fcf932a2'),(194,3,'plugin','m190120_000000_fix_supertablecontent_tables','2020-02-20 03:42:25','2020-02-20 03:42:25','2020-02-20 03:42:25','7087cd8e-351d-43ec-baea-a9ddf393c069'),(195,3,'plugin','m190131_000000_fix_supertable_missing_fields','2020-02-20 03:42:25','2020-02-20 03:42:25','2020-02-20 03:42:25','d09ec0e0-d4c0-497f-afa8-2ad14fa7c409'),(196,3,'plugin','m190227_100000_fix_project_config','2020-02-20 03:42:25','2020-02-20 03:42:25','2020-02-20 03:42:25','38583f3b-9b2b-4a51-968d-75b544f240cd'),(197,3,'plugin','m190511_100000_fix_project_config','2020-02-20 03:42:25','2020-02-20 03:42:25','2020-02-20 03:42:25','e0257e6c-3487-410d-b403-fdf1707d5d57'),(198,3,'plugin','m190520_000000_fix_project_config','2020-02-20 03:42:25','2020-02-20 03:42:25','2020-02-20 03:42:25','e2b9d502-fdf9-4a5b-a42c-f23c3ad90782'),(199,3,'plugin','m190714_000000_propagation_method','2020-02-20 03:42:25','2020-02-20 03:42:25','2020-02-20 03:42:25','ffe3bc48-e21e-4752-bb5b-d4fe787f9baf'),(200,3,'plugin','m191127_000000_fix_width','2020-02-20 03:42:25','2020-02-20 03:42:25','2020-02-20 03:42:25','6d031b2a-9061-426b-aa97-71c4c6535974'),(201,NULL,'app','m200228_195211_long_deprecation_messages','2020-03-08 02:37:02','2020-03-08 02:37:02','2020-03-08 02:37:02','5c2fa430-68c0-4326-833b-a25f03c63c90'),(202,8,'plugin','m180430_204710_remove_old_plugins','2020-05-29 05:37:34','2020-05-29 05:37:34','2020-05-29 05:37:34','204c3e01-e164-4a56-a878-490a3e7c920e'),(203,8,'plugin','Install','2020-05-29 05:37:34','2020-05-29 05:37:34','2020-05-29 05:37:34','afa08163-954d-44fe-863b-2452e9f606ce'),(204,8,'plugin','m190225_003922_split_cleanup_html_settings','2020-05-29 05:37:34','2020-05-29 05:37:34','2020-05-29 05:37:34','62bdfba1-0178-4372-9d3f-e8c313b982af'),(205,11,'plugin','Install','2020-05-29 06:00:07','2020-05-29 06:00:07','2020-05-29 06:00:07','08157f27-5b15-46a6-b3e7-3ead2be4feba'),(206,11,'plugin','m180305_000000_migrate_feeds','2020-05-29 06:00:07','2020-05-29 06:00:07','2020-05-29 06:00:07','8b9e1a8a-354c-4653-bb21-a85258ccbb27'),(207,11,'plugin','m181113_000000_add_paginationNode','2020-05-29 06:00:07','2020-05-29 06:00:07','2020-05-29 06:00:07','ebb220ed-2a24-481e-bb7c-d98d2f31bf55'),(208,11,'plugin','m190201_000000_update_asset_feeds','2020-05-29 06:00:07','2020-05-29 06:00:07','2020-05-29 06:00:07','7e637262-c036-4b4b-b581-c25a238eec3b'),(209,11,'plugin','m190320_000000_renameLocale','2020-05-29 06:00:07','2020-05-29 06:00:07','2020-05-29 06:00:07','76d8b2f3-0a55-4ed1-9460-96307d89c486'),(210,11,'plugin','m190406_000000_sortOrder','2020-05-29 06:00:07','2020-05-29 06:00:07','2020-05-29 06:00:07','66e32562-e04f-4fbe-9abf-d57485369fb7');
/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_plugins`
--

DROP TABLE IF EXISTS `craft_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_plugins`
--

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;
INSERT INTO `craft_plugins` VALUES (1,'sprout-fields','3.8.3','3.5.3','unknown',NULL,'2020-02-20 03:30:29','2020-02-20 03:30:29','2020-06-01 03:55:23','8efd8018-d1d4-44d1-a80d-64999a6f2b93'),(2,'twigpack','1.2.2','1.0.0','unknown',NULL,'2020-02-20 03:33:25','2020-02-20 03:33:25','2020-06-01 03:55:23','10561b8e-fd7c-451e-b236-ae3d0ab15e13'),(3,'super-table','2.4.9','2.2.1','unknown',NULL,'2020-02-20 03:42:24','2020-02-20 03:42:24','2020-06-01 03:55:23','3f132401-73ed-4e71-9fb4-ec49ee62b410'),(4,'field-manager','2.1.6','1.0.0','unknown',NULL,'2020-02-20 03:44:16','2020-02-20 03:44:16','2020-06-01 03:55:23','4bdf0b28-6ac5-4de7-b044-edf06836b260'),(5,'cp-css','2.2.1','2.0.0','unknown',NULL,'2020-05-29 05:37:15','2020-05-29 05:37:15','2020-06-01 03:55:23','6a36d6ac-c481-4dbf-99c5-1a7b147fa672'),(6,'cp-js','2.2.1','2.0.0','unknown',NULL,'2020-05-29 05:37:19','2020-05-29 05:37:19','2020-06-01 03:55:23','3f8ec63f-f39b-4c47-a17b-b93ede862b5f'),(7,'dashboard-begone','1.0.1','1.0.0','unknown',NULL,'2020-05-29 05:37:28','2020-05-29 05:37:28','2020-06-01 03:55:23','e0de9a6a-0f47-4fbe-af8c-6bd57920bae6'),(8,'redactor','2.6.1','2.3.0','unknown',NULL,'2020-05-29 05:37:34','2020-05-29 05:37:34','2020-06-01 03:55:23','359ae575-f9c9-4ad0-b2c2-b26921380db6'),(9,'twig-perversion','2.1.0','1.0.0','unknown',NULL,'2020-05-29 05:37:39','2020-05-29 05:37:39','2020-06-01 03:55:23','149c6378-5866-482d-bec5-0509595feddd'),(10,'logs','3.0.3','3.0.0','unknown',NULL,'2020-05-29 05:55:54','2020-05-29 05:55:54','2020-06-01 03:55:23','222c81b8-ba88-4a56-bb2e-5b75dbba4f40'),(11,'feed-me','4.2.3','2.1.2','unknown',NULL,'2020-05-29 06:00:07','2020-05-29 06:00:07','2020-06-01 03:55:23','58f666ea-ab0a-42a4-8030-f59b408ba48c'),(12,'contact-form','2.2.7','1.0.0','unknown',NULL,'2020-05-29 06:00:29','2020-05-29 06:00:29','2020-06-01 03:55:23','172075f8-7423-4b47-a887-ea440a858193');
/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_projectconfig`
--

DROP TABLE IF EXISTS `craft_projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_projectconfig`
--

LOCK TABLES `craft_projectconfig` WRITE;
/*!40000 ALTER TABLE `craft_projectconfig` DISABLE KEYS */;
INSERT INTO `craft_projectconfig` VALUES ('dateModified','1590980228'),('email.fromEmail','\"huangxiaotian1300@gmail.com\"'),('email.fromName','\"craftvue\"'),('email.replyToEmail','\"huangxiaotian1300@gmail.com\"'),('email.template','null'),('email.transportSettings.encryptionMethod','\"tls\"'),('email.transportSettings.host','\"smtp.gmail.com\"'),('email.transportSettings.password','\"mmg_pa55\"'),('email.transportSettings.port','\"587\"'),('email.transportSettings.timeout','\"10\"'),('email.transportSettings.useAuthentication','\"1\"'),('email.transportSettings.username','\"mmgweb2@gmail.com\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Smtp\"'),('fieldGroups.c127e2a1-ad92-4078-8710-98f15fca7274.name','\"System\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.contentColumnType','\"string\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.fieldGroup','\"c127e2a1-ad92-4078-8710-98f15fca7274\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.handle','\"placeHolder\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.instructions','\"if none provide, will use logo instead.\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.name','\"Place Holder\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.searchable','true'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.allowedKinds.0','\"image\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.allowSelfRelations','\"\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.defaultUploadLocationSource','\"volume:5c2279a4-677d-493b-9d5d-60afcf08eeaa\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.defaultUploadLocationSubpath','\"system\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.limit','\"1\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.localizeRelations','false'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.restrictFiles','\"1\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.selectionLabel','\"\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.showUnpermittedFiles','false'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.showUnpermittedVolumes','false'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.singleUploadLocationSource','\"volume:5c2279a4-677d-493b-9d5d-60afcf08eeaa\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.singleUploadLocationSubpath','\"\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.source','null'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.sources','\"*\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.targetSiteId','null'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.useSingleFolder','false'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.validateRelatedElements','\"\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.settings.viewMode','\"list\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.translationKeyFormat','null'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.translationMethod','\"site\"'),('fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.type','\"craft\\\\fields\\\\Assets\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.contentColumnType','\"string\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.fieldGroup','\"c127e2a1-ad92-4078-8710-98f15fca7274\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.handle','\"favicon\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.instructions','\"\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.name','\"Favicon\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.searchable','true'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.allowedKinds.0','\"image\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.allowSelfRelations','\"\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.defaultUploadLocationSource','\"volume:db3da7fe-1151-4a78-94f2-be47b936ff63\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.defaultUploadLocationSubpath','\"\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.limit','\"1\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.localizeRelations','false'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.restrictFiles','\"1\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.selectionLabel','\"\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.showUnpermittedFiles','false'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.showUnpermittedVolumes','false'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.singleUploadLocationSource','\"volume:5c2279a4-677d-493b-9d5d-60afcf08eeaa\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.singleUploadLocationSubpath','\"system\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.source','null'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.sources','\"*\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.targetSiteId','null'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.useSingleFolder','true'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.validateRelatedElements','\"\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.settings.viewMode','\"list\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.translationKeyFormat','null'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.translationMethod','\"site\"'),('fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.type','\"craft\\\\fields\\\\Assets\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.contentColumnType','\"string\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.fieldGroup','\"c127e2a1-ad92-4078-8710-98f15fca7274\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.handle','\"logo\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.instructions','\"You can put more than one logo, but on default the first one will be used. Other logos will require template configuration.\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.name','\"Logo\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.searchable','true'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.allowedKinds.0','\"image\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.allowSelfRelations','\"\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.defaultUploadLocationSource','\"volume:5c2279a4-677d-493b-9d5d-60afcf08eeaa\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.defaultUploadLocationSubpath','\"\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.limit','\"\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.localizeRelations','false'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.restrictFiles','\"1\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.selectionLabel','\"\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.showUnpermittedFiles','false'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.showUnpermittedVolumes','false'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.singleUploadLocationSource','\"volume:5c2279a4-677d-493b-9d5d-60afcf08eeaa\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.singleUploadLocationSubpath','\"system\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.source','null'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.sources','\"*\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.targetSiteId','null'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.useSingleFolder','true'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.validateRelatedElements','\"\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.settings.viewMode','\"list\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.translationKeyFormat','null'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.translationMethod','\"site\"'),('fields.74a47440-4da2-4a66-b349-45be2dea967c.type','\"craft\\\\fields\\\\Assets\"'),('globalSets.041b8d0c-ad9c-40bb-9e27-58c477724fdf.fieldLayouts.73d84f56-5fb3-4075-beec-8d96afdb7be3.tabs.0.fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.required','false'),('globalSets.041b8d0c-ad9c-40bb-9e27-58c477724fdf.fieldLayouts.73d84f56-5fb3-4075-beec-8d96afdb7be3.tabs.0.fields.2cc8809f-9f35-4610-9a34-c52aa6dd9ae8.sortOrder','2'),('globalSets.041b8d0c-ad9c-40bb-9e27-58c477724fdf.fieldLayouts.73d84f56-5fb3-4075-beec-8d96afdb7be3.tabs.0.fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.required','false'),('globalSets.041b8d0c-ad9c-40bb-9e27-58c477724fdf.fieldLayouts.73d84f56-5fb3-4075-beec-8d96afdb7be3.tabs.0.fields.5d074a03-536e-4f6d-9ad6-17e28525a0b7.sortOrder','3'),('globalSets.041b8d0c-ad9c-40bb-9e27-58c477724fdf.fieldLayouts.73d84f56-5fb3-4075-beec-8d96afdb7be3.tabs.0.fields.74a47440-4da2-4a66-b349-45be2dea967c.required','false'),('globalSets.041b8d0c-ad9c-40bb-9e27-58c477724fdf.fieldLayouts.73d84f56-5fb3-4075-beec-8d96afdb7be3.tabs.0.fields.74a47440-4da2-4a66-b349-45be2dea967c.sortOrder','1'),('globalSets.041b8d0c-ad9c-40bb-9e27-58c477724fdf.fieldLayouts.73d84f56-5fb3-4075-beec-8d96afdb7be3.tabs.0.name','\"System\"'),('globalSets.041b8d0c-ad9c-40bb-9e27-58c477724fdf.fieldLayouts.73d84f56-5fb3-4075-beec-8d96afdb7be3.tabs.0.sortOrder','1'),('globalSets.041b8d0c-ad9c-40bb-9e27-58c477724fdf.handle','\"system\"'),('globalSets.041b8d0c-ad9c-40bb-9e27-58c477724fdf.name','\"System\"'),('plugins.contact-form.edition','\"standard\"'),('plugins.contact-form.enabled','true'),('plugins.contact-form.schemaVersion','\"1.0.0\"'),('plugins.contact-form.settings.allowAttachments','\"\"'),('plugins.contact-form.settings.prependSender','\"On behalf of\"'),('plugins.contact-form.settings.prependSubject','\"New message from craftvue\"'),('plugins.contact-form.settings.successFlashMessage','\"Your message has been sent.\"'),('plugins.contact-form.settings.toEmail','\"huangxiaotian1300@gmail.com\"'),('plugins.cp-css.edition','\"standard\"'),('plugins.cp-css.enabled','true'),('plugins.cp-css.schemaVersion','\"2.0.0\"'),('plugins.cp-js.edition','\"standard\"'),('plugins.cp-js.enabled','true'),('plugins.cp-js.schemaVersion','\"2.0.0\"'),('plugins.dashboard-begone.edition','\"standard\"'),('plugins.dashboard-begone.enabled','true'),('plugins.dashboard-begone.schemaVersion','\"1.0.0\"'),('plugins.feed-me.edition','\"standard\"'),('plugins.feed-me.enabled','true'),('plugins.feed-me.schemaVersion','\"2.1.2\"'),('plugins.field-manager.edition','\"standard\"'),('plugins.field-manager.enabled','true'),('plugins.field-manager.schemaVersion','\"1.0.0\"'),('plugins.logs.edition','\"standard\"'),('plugins.logs.enabled','true'),('plugins.logs.schemaVersion','\"3.0.0\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('plugins.sprout-fields.edition','\"standard\"'),('plugins.sprout-fields.enabled','true'),('plugins.sprout-fields.schemaVersion','\"3.5.3\"'),('plugins.super-table.edition','\"standard\"'),('plugins.super-table.enabled','true'),('plugins.super-table.schemaVersion','\"2.2.1\"'),('plugins.twig-perversion.edition','\"standard\"'),('plugins.twig-perversion.enabled','true'),('plugins.twig-perversion.schemaVersion','\"1.0.0\"'),('plugins.twigpack.edition','\"standard\"'),('plugins.twigpack.enabled','true'),('plugins.twigpack.schemaVersion','\"1.0.0\"'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.enableVersioning','true'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.entryTypes.c2159ed1-734b-4efa-ab5d-aa138f85185e.handle','\"homeTemplate\"'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.entryTypes.c2159ed1-734b-4efa-ab5d-aa138f85185e.hasTitleField','true'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.entryTypes.c2159ed1-734b-4efa-ab5d-aa138f85185e.name','\"Home Template\"'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.entryTypes.c2159ed1-734b-4efa-ab5d-aa138f85185e.sortOrder','1'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.entryTypes.c2159ed1-734b-4efa-ab5d-aa138f85185e.titleFormat','\"\"'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.entryTypes.c2159ed1-734b-4efa-ab5d-aa138f85185e.titleLabel','\"Title\"'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.handle','\"siteContent\"'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.name','\"Pages\"'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.propagationMethod','\"all\"'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.siteSettings.ff848a01-68fe-4320-a917-2b12790ddb39.enabledByDefault','true'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.siteSettings.ff848a01-68fe-4320-a917-2b12790ddb39.hasUrls','true'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.siteSettings.ff848a01-68fe-4320-a917-2b12790ddb39.template','\"_entrytypes\"'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.siteSettings.ff848a01-68fe-4320-a917-2b12790ddb39.uriFormat','\"{slug}\"'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.structure.maxLevels','null'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.structure.uid','\"45668b20-1162-49d2-ac96-c3a493fc6812\"'),('sections.2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0.type','\"structure\"'),('siteGroups.086cf356-308e-49ba-af99-f5f70d55f135.name','\"craftvue\"'),('sites.ff848a01-68fe-4320-a917-2b12790ddb39.baseUrl','\"$DEFAULT_SITE_URL\"'),('sites.ff848a01-68fe-4320-a917-2b12790ddb39.handle','\"default\"'),('sites.ff848a01-68fe-4320-a917-2b12790ddb39.hasUrls','true'),('sites.ff848a01-68fe-4320-a917-2b12790ddb39.language','\"en-US\"'),('sites.ff848a01-68fe-4320-a917-2b12790ddb39.name','\"craftvue\"'),('sites.ff848a01-68fe-4320-a917-2b12790ddb39.primary','true'),('sites.ff848a01-68fe-4320-a917-2b12790ddb39.siteGroup','\"086cf356-308e-49ba-af99-f5f70d55f135\"'),('sites.ff848a01-68fe-4320-a917-2b12790ddb39.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"craftvue\"'),('system.schemaVersion','\"3.4.10\"'),('system.timeZone','\"Australia/Hobart\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','\"\"'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.5c2279a4-677d-493b-9d5d-60afcf08eeaa.handle','\"site\"'),('volumes.5c2279a4-677d-493b-9d5d-60afcf08eeaa.hasUrls','true'),('volumes.5c2279a4-677d-493b-9d5d-60afcf08eeaa.name','\"Site\"'),('volumes.5c2279a4-677d-493b-9d5d-60afcf08eeaa.settings.path','\"@webroot/assets/img\"'),('volumes.5c2279a4-677d-493b-9d5d-60afcf08eeaa.sortOrder','1'),('volumes.5c2279a4-677d-493b-9d5d-60afcf08eeaa.type','\"craft\\\\volumes\\\\Local\"'),('volumes.5c2279a4-677d-493b-9d5d-60afcf08eeaa.url','\"@baseUrl/assets/img\"'),('volumes.db3da7fe-1151-4a78-94f2-be47b936ff63.handle','\"repoImg\"'),('volumes.db3da7fe-1151-4a78-94f2-be47b936ff63.hasUrls','true'),('volumes.db3da7fe-1151-4a78-94f2-be47b936ff63.name','\"Image in this folder will get updated to github repository\"'),('volumes.db3da7fe-1151-4a78-94f2-be47b936ff63.settings.path','\"@webroot/assets/repoImg\"'),('volumes.db3da7fe-1151-4a78-94f2-be47b936ff63.sortOrder','2'),('volumes.db3da7fe-1151-4a78-94f2-be47b936ff63.type','\"craft\\\\volumes\\\\Local\"'),('volumes.db3da7fe-1151-4a78-94f2-be47b936ff63.url','\"@baseUrl/assets/repoImg\"');
/*!40000 ALTER TABLE `craft_projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_queue`
--

DROP TABLE IF EXISTS `craft_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `craft_queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `craft_queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_queue`
--

LOCK TABLES `craft_queue` WRITE;
/*!40000 ALTER TABLE `craft_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_relations`
--

DROP TABLE IF EXISTS `craft_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `craft_relations_sourceId_idx` (`sourceId`),
  KEY `craft_relations_targetId_idx` (`targetId`),
  KEY `craft_relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_relations`
--

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;
INSERT INTO `craft_relations` VALUES (2,1,7,NULL,9,1,'2020-03-08 03:56:46','2020-03-08 03:56:46','6756efb5-f645-4102-b441-a438bd6e22fd');
/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_resourcepaths`
--

DROP TABLE IF EXISTS `craft_resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_resourcepaths`
--

LOCK TABLES `craft_resourcepaths` WRITE;
/*!40000 ALTER TABLE `craft_resourcepaths` DISABLE KEYS */;
INSERT INTO `craft_resourcepaths` VALUES ('133a3442','@app/web/assets/feed/dist'),('13799368','@lib/fileupload'),('151bd68f','@lib/velocity'),('1577b5d6','@verbb/supertable/resources/dist'),('16704334','@app/web/assets/sites/dist'),('1904a0ab','@app/web/assets/feed/dist'),('1f254266','@lib/velocity'),('213a1eee','@lib/element-resize-detector'),('23cf717f','@lib/fabric'),('264a984','@app/web/assets/utilities/dist'),('27da04f4','@app/web/assets/fields/dist'),('28cef4c4','@app/web/assets/matrixsettings/dist'),('2b048a07','@lib/element-resize-detector'),('2bd5b546','@craft/web/assets/dashboard/dist'),('302ed8e','@lib/jquery.payment'),('3689a541','@lib/garnishjs'),('3f40e5cb','@app/web/assets/updates/dist'),('43e88ef6','@app/web/assets/updateswidget/dist'),('450cfc9b','@craft/web/assets/plugins/dist'),('4744b6de','@app/web/assets/craftsupport/dist'),('49421f2','@bower/jquery/dist'),('49d61a1f','@app/web/assets/updateswidget/dist'),('4d7a2237','@app/web/assets/craftsupport/dist'),('51650d63','@lib/axios'),('518cd9c3','@lib/jquery-ui'),('5296938d','@craft/web/assets/feed/dist'),('534b2c7','@lib/d3'),('53bddcc9','@app/web/assets/updater/dist'),('5583fb98','@lib/xregexp'),('561fabb6','@verbb/supertable/resources/dist'),('59834820','@app/web/assets/updater/dist'),('5b5b998a','@lib/axios'),('5bb24d2a','@lib/jquery-ui'),('5d72760e','@app/web/assets/generalsettings/dist'),('5fefbf12','@lib/selectize'),('601feb15','@app/web/assets/cp/dist'),('604a0d0b','@verbb/base/resources/dist'),('627667a9','@app/web/assets/plugins/dist'),('6421fe6b','@app/web/assets/login/dist'),('65851904','@craft/web/assets/login/dist'),('6a217ffc','@app/web/assets/cp/dist'),('6a7ca3ed','@lib/timepicker'),('6d83aec9','@craft/web/assets/craftsupport/dist'),('6e1f6a82','@app/web/assets/login/dist'),('711932d7','@app/web/assets/pluginstore/dist'),('76b03aff','@lib/vue'),('776c5871','@app/web/assets/recententries/dist'),('7b27a63e','@app/web/assets/pluginstore/dist'),('7c8eae16','@lib/vue'),('7d52cc98','@app/web/assets/recententries/dist'),('7e78eeea','@app/web/assets/admintable/dist'),('81cb2667','@app/web/assets/utilities/dist'),('8200899c','@lib/picturefill'),('83b46759','@app/web/assets/editentry/dist'),('85a3d6d','@app/web/assets/utilities/dist'),('85a4b55e','@lib/jquery-touch-events'),('869b3d24','@lib/d3'),('873bae11','@bower/jquery/dist'),('883e1d75','@lib/picturefill'),('88e14838','@app/web/assets/tablesettings/dist'),('898af3b0','@app/web/assets/editentry/dist'),('8a93f684','@lib/jquery.payment'),('8ca5a9cd','@lib/d3'),('8d1c2b3e','@lib/prismjs'),('8f2ec512','@sproutbase/web/assets/cp/dist'),('8f9a21b7','@lib/jquery-touch-events'),('90d61c8b','@lib/fileupload'),('93c7967','@lib/jquery.payment'),('95dfccd7','@app/web/assets/sites/dist'),('9664be93','@app/web/assets/dbbackup/dist'),('96b4596c','@lib/velocity'),('9855090','@sproutbasefields/web/assets/address/dist'),('9ae88862','@lib/fileupload'),('9f35d11','@craft/feedme/web/assets/feedme/dist'),('9fe1583e','@app/web/assets/sites/dist'),('a060fe9c','@lib/fabric'),('a312a559','@app/web/assets/dashboard/dist'),('a4758b17','@app/web/assets/fields/dist'),('a6d8719e','@verbb/base/resources/dist'),('a8ab05e4','@lib/element-resize-detector'),('a92c31b0','@app/web/assets/dashboard/dist'),('aa5e6a75','@lib/fabric'),('ab617b27','@app/web/assets/matrixsettings/dist'),('ae4b1ffe','@app/web/assets/fields/dist'),('b4ec7db','@app/web/assets/tablesettings/dist'),('b5262aa2','@lib/garnishjs'),('b6d1fec1','@app/web/assets/updates/dist'),('b919296','@lib/picturefill'),('bcef6a28','@app/web/assets/updates/dist'),('bf18be4b','@lib/garnishjs'),('c1a28163','@app/web/assets/edituser/dist'),('c35ae54','@lib/jquery-touch-events'),('c71cfb24','@sproutbasefieldslib/quill'),('ca2f58c0','@craft/web/assets/updateswidget/dist'),('cd90647','@sproutbasefieldslib/quill'),('d012532a','@app/web/assets/updater/dist'),('d0518151','@craft/web/assets/cp/dist'),('d2ca8280','@lib/axios'),('d4e36d04','@app/web/assets/generalsettings/dist'),('d62c747b','@lib/xregexp'),('d67ea418','@lib/selectize'),('d81dc2c9','@lib/jquery-ui'),('d92ab12c','@craft/web/assets/pluginstore/dist'),('da6f15b8','@craft/web/assets/cp/dist'),('dc12e092','@lib/xregexp'),('dc4030f1','@lib/selectize'),('dcce1f17','@verbb/fieldmanager/resources/dist'),('e1d8b79b','@app/web/assets/editsection/dist'),('e1d9e84a','@app/web/assets/plugins/dist'),('e3b064f6','@app/web/assets/cp/dist'),('e3edb8e7','@lib/timepicker'),('e9d32c0e','@lib/timepicker'),('eaab51b','@bower/jquery/dist'),('eb3a4dd','@lib/prismjs'),('ebe62372','@app/web/assets/editsection/dist'),('ebe77ca3','@app/web/assets/plugins/dist'),('f4951aae','@craft/web/assets/recententries/dist'),('f7e9f5e0','@app/web/assets/admintable/dist'),('fabcd00e','@app/web/assets/clearcaches/dist'),('fd565cf1','@craft/web/assets/updater/dist'),('fdd76109','@app/web/assets/admintable/dist'),('ff2121f5','@lib/vue');
/*!40000 ALTER TABLE `craft_resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_revisions`
--

DROP TABLE IF EXISTS `craft_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  KEY `craft_revisions_creatorId_fk` (`creatorId`),
  CONSTRAINT `craft_revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_revisions`
--

LOCK TABLES `craft_revisions` WRITE;
/*!40000 ALTER TABLE `craft_revisions` DISABLE KEYS */;
INSERT INTO `craft_revisions` VALUES (1,3,1,1,NULL),(2,3,1,2,NULL),(3,3,1,3,NULL);
/*!40000 ALTER TABLE `craft_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_searchindex`
--

DROP TABLE IF EXISTS `craft_searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_searchindex`
--

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;
INSERT INTO `craft_searchindex` VALUES (1,'email',0,1,' huangxiaotian1300 gmail com '),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'firstname',0,1,''),(1,'username',0,1,' parry '),(3,'slug',0,1,' home '),(3,'title',0,1,' home '),(1,'slug',0,1,''),(7,'slug',0,1,''),(8,'extension',0,1,' png '),(8,'kind',0,1,' image '),(8,'filename',0,1,' logo 200308 033239 png '),(7,'field',2,1,''),(8,'slug',0,1,''),(8,'title',0,1,' logo '),(9,'kind',0,1,' image '),(9,'extension',0,1,' png '),(9,'filename',0,1,' logo png '),(9,'slug',0,1,''),(9,'title',0,1,' logo '),(7,'field',1,1,' logo '),(10,'kind',0,1,' image '),(10,'slug',0,1,''),(10,'extension',0,1,' gif '),(10,'filename',0,1,' loading gif '),(10,'title',0,1,' loading '),(11,'filename',0,1,' error jpg '),(11,'extension',0,1,' jpg '),(11,'kind',0,1,' image '),(11,'slug',0,1,''),(11,'title',0,1,' error '),(7,'field',3,1,'');
/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections`
--

DROP TABLE IF EXISTS `craft_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sections_handle_idx` (`handle`),
  KEY `craft_sections_name_idx` (`name`),
  KEY `craft_sections_structureId_idx` (`structureId`),
  KEY `craft_sections_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections`
--

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;
INSERT INTO `craft_sections` VALUES (1,1,'Pages','siteContent','structure',1,'all',NULL,'2020-02-20 03:45:01','2020-06-01 02:50:11',NULL,'2b1c85d2-cfb1-4dd7-82ed-87f2cc5337e0');
/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections_sites`
--

DROP TABLE IF EXISTS `craft_sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `craft_sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `craft_sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections_sites`
--

LOCK TABLES `craft_sections_sites` WRITE;
/*!40000 ALTER TABLE `craft_sections_sites` DISABLE KEYS */;
INSERT INTO `craft_sections_sites` VALUES (1,1,1,1,'{slug}','_entrytypes',1,'2020-02-20 03:45:01','2020-02-20 03:45:01','c897e929-198b-43c6-b4ff-5417582db93c');
/*!40000 ALTER TABLE `craft_sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sequences`
--

DROP TABLE IF EXISTS `craft_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sequences`
--

LOCK TABLES `craft_sequences` WRITE;
/*!40000 ALTER TABLE `craft_sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sessions`
--

DROP TABLE IF EXISTS `craft_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_idx` (`userId`),
  CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sessions`
--

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;
INSERT INTO `craft_sessions` VALUES (2,1,'zNVRmQlu2qyqCThSS735jPZ7bk2Rs6r167xoTKalVKOp1KRqWYhFLQfjrM6ZAxC83TXwcpIDBbkLNuyZJwJr4SjZKjtPoitb9kgy','2020-02-20 04:14:01','2020-02-20 04:14:14','1c97239c-7cfc-40e0-a90e-7db746f85bc4'),(3,1,'124wDOfqSeci03nfeDEpt0XTt6gKIbFt-Fr1GiqOU9f3BjSqVc4qlcq8nxxLQmwjKDGrpgsXDpzxoA0JydGHyY99alzvEFgk2NN4','2020-03-08 02:32:37','2020-03-08 03:56:49','b289a0da-73a8-44b8-87a8-878917dc6424'),(4,1,'RppQwUAI0qZ4dJRDuzn4qv-Kryg9AvAEO9Mq91ItsZxdkYJN-tfvG0gNGU4v7ITHuSOuAVohBC5ENLU-FirkWRSRwWKr3m9GWn3i','2020-05-29 05:36:27','2020-05-29 07:33:18','187818a2-14e6-438e-9ccd-e34769b81e52'),(5,1,'lq4_6Bx8JTfpeZn3VHbE9MH7kPhuDpPwovpMyhXuRszLuf_u3lzJ2sEdZCGx8uAOeJ63YBccPiyGqFhps3PjeCFrewBpDXL56CDP','2020-05-31 23:16:08','2020-05-31 23:25:27','6d778b5c-b1ba-40ab-ba8b-772e5433ad9f'),(6,1,'n6-nwYAqhUQ9RxRRTN62eq6X93CObTPNfPj_-KjUaTGSciYlxivu3J_jdrnNHWttq5pJq_-vDJymVGqT_St906A-j0kqCo37sHH-','2020-06-01 02:49:54','2020-06-01 06:19:28','59c8d817-1652-4747-b92a-856a64a66a78');
/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_shunnedmessages`
--

DROP TABLE IF EXISTS `craft_shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_shunnedmessages`
--

LOCK TABLES `craft_shunnedmessages` WRITE;
/*!40000 ALTER TABLE `craft_shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sitegroups`
--

DROP TABLE IF EXISTS `craft_sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sitegroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sitegroups`
--

LOCK TABLES `craft_sitegroups` WRITE;
/*!40000 ALTER TABLE `craft_sitegroups` DISABLE KEYS */;
INSERT INTO `craft_sitegroups` VALUES (1,'craftvue','2020-02-20 03:18:57','2020-03-08 02:33:13',NULL,'086cf356-308e-49ba-af99-f5f70d55f135');
/*!40000 ALTER TABLE `craft_sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sites`
--

DROP TABLE IF EXISTS `craft_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sites_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_sites_handle_idx` (`handle`),
  KEY `craft_sites_sortOrder_idx` (`sortOrder`),
  KEY `craft_sites_groupId_fk` (`groupId`),
  CONSTRAINT `craft_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sites`
--

LOCK TABLES `craft_sites` WRITE;
/*!40000 ALTER TABLE `craft_sites` DISABLE KEYS */;
INSERT INTO `craft_sites` VALUES (1,1,1,'craftvue','default','en-US',1,'$DEFAULT_SITE_URL',1,'2020-02-20 03:18:57','2020-02-20 04:13:05',NULL,'ff848a01-68fe-4320-a917-2b12790ddb39');
/*!40000 ALTER TABLE `craft_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sprout_addresses`
--

DROP TABLE IF EXISTS `craft_sprout_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_sprout_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) DEFAULT NULL,
  `siteId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) DEFAULT NULL,
  `administrativeAreaCode` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sprout_addresses`
--

LOCK TABLES `craft_sprout_addresses` WRITE;
/*!40000 ALTER TABLE `craft_sprout_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sprout_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structureelements`
--

DROP TABLE IF EXISTS `craft_structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `craft_structureelements_root_idx` (`root`),
  KEY `craft_structureelements_lft_idx` (`lft`),
  KEY `craft_structureelements_rgt_idx` (`rgt`),
  KEY `craft_structureelements_level_idx` (`level`),
  KEY `craft_structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structureelements`
--

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;
INSERT INTO `craft_structureelements` VALUES (1,1,NULL,1,1,10,0,'2020-02-20 03:45:27','2020-02-20 03:51:52','cafa1129-aa85-44bc-80ed-556c8fee28fa'),(3,1,3,1,2,3,1,'2020-02-20 03:45:40','2020-02-20 03:45:40','f7d49d75-6125-4784-8245-1d5d01431194'),(4,1,4,1,4,5,1,'2020-02-20 03:45:40','2020-02-20 03:45:40','54423a17-7f08-42c4-b22d-5c40e6008662'),(5,1,5,1,6,7,1,'2020-02-20 03:51:36','2020-02-20 03:51:36','d3491179-9b83-4f2b-a9cd-d46a6f96df45'),(6,1,6,1,8,9,1,'2020-02-20 03:51:52','2020-02-20 03:51:52','7e35c497-8826-474f-87e5-205fe1ef8bbb');
/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structures`
--

DROP TABLE IF EXISTS `craft_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structures`
--

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;
INSERT INTO `craft_structures` VALUES (1,NULL,'2020-02-20 03:45:01','2020-02-20 03:45:01',NULL,'45668b20-1162-49d2-ac96-c3a493fc6812');
/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_supertableblocks`
--

DROP TABLE IF EXISTS `craft_supertableblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_supertableblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_supertableblocks_ownerId_idx` (`ownerId`),
  KEY `craft_supertableblocks_fieldId_idx` (`fieldId`),
  KEY `craft_supertableblocks_typeId_idx` (`typeId`),
  KEY `craft_supertableblocks_sortOrder_idx` (`sortOrder`),
  CONSTRAINT `craft_supertableblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_supertableblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_supertableblocks`
--

LOCK TABLES `craft_supertableblocks` WRITE;
/*!40000 ALTER TABLE `craft_supertableblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_supertableblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_supertableblocktypes`
--

DROP TABLE IF EXISTS `craft_supertableblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_supertableblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_supertableblocktypes_fieldId_idx` (`fieldId`),
  KEY `craft_supertableblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `craft_supertableblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_supertableblocktypes`
--

LOCK TABLES `craft_supertableblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_supertableblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_systemmessages`
--

DROP TABLE IF EXISTS `craft_systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `craft_systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_systemmessages`
--

LOCK TABLES `craft_systemmessages` WRITE;
/*!40000 ALTER TABLE `craft_systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_taggroups`
--

DROP TABLE IF EXISTS `craft_taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_taggroups_name_idx` (`name`),
  KEY `craft_taggroups_handle_idx` (`handle`),
  KEY `craft_taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_taggroups`
--

LOCK TABLES `craft_taggroups` WRITE;
/*!40000 ALTER TABLE `craft_taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tags`
--

DROP TABLE IF EXISTS `craft_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tags_groupId_idx` (`groupId`),
  CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tags`
--

LOCK TABLES `craft_tags` WRITE;
/*!40000 ALTER TABLE `craft_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecacheelements`
--

DROP TABLE IF EXISTS `craft_templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `craft_templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `craft_templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecacheelements`
--

LOCK TABLES `craft_templatecacheelements` WRITE;
/*!40000 ALTER TABLE `craft_templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecachequeries`
--

DROP TABLE IF EXISTS `craft_templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `craft_templatecachequeries_type_idx` (`type`),
  CONSTRAINT `craft_templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecachequeries`
--

LOCK TABLES `craft_templatecachequeries` WRITE;
/*!40000 ALTER TABLE `craft_templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecaches`
--

DROP TABLE IF EXISTS `craft_templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `craft_templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `craft_templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `craft_templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecaches`
--

LOCK TABLES `craft_templatecaches` WRITE;
/*!40000 ALTER TABLE `craft_templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tokens`
--

DROP TABLE IF EXISTS `craft_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  KEY `craft_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tokens`
--

LOCK TABLES `craft_tokens` WRITE;
/*!40000 ALTER TABLE `craft_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups`
--

DROP TABLE IF EXISTS `craft_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_handle_unq_idx` (`handle`),
  UNIQUE KEY `craft_usergroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups`
--

LOCK TABLES `craft_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups_users`
--

DROP TABLE IF EXISTS `craft_usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups_users`
--

LOCK TABLES `craft_usergroups_users` WRITE;
/*!40000 ALTER TABLE `craft_usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions`
--

DROP TABLE IF EXISTS `craft_userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions`
--

LOCK TABLES `craft_userpermissions` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_usergroups`
--

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_usergroups`
--

LOCK TABLES `craft_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_users`
--

DROP TABLE IF EXISTS `craft_userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_users`
--

LOCK TABLES `craft_userpermissions_users` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpreferences`
--

DROP TABLE IF EXISTS `craft_userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `craft_userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpreferences`
--

LOCK TABLES `craft_userpreferences` WRITE;
/*!40000 ALTER TABLE `craft_userpreferences` DISABLE KEYS */;
INSERT INTO `craft_userpreferences` VALUES (1,'{\"language\":\"en-US\",\"weekStartDay\":\"1\",\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `craft_userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_users`
--

DROP TABLE IF EXISTS `craft_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_email_idx` (`email`),
  KEY `craft_users_username_idx` (`username`),
  KEY `craft_users_photoId_fk` (`photoId`),
  CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `craft_assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_users`
--

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;
INSERT INTO `craft_users` VALUES (1,'parry',NULL,'','','huangxiaotian1300@gmail.com','$2y$13$dmE4aKm0r7oo9yQJRVwshOhZOcb89lsWynaWATB.Gs02qHqZv9dWi',1,0,0,0,'2020-06-01 02:49:54',NULL,NULL,NULL,'2020-05-29 05:36:02',NULL,1,NULL,NULL,NULL,0,'2020-02-20 04:14:01','2020-02-20 03:18:58','2020-06-01 02:49:54','c66047d9-9790-4be3-b44b-c901b91de12d');
/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_volumefolders`
--

DROP TABLE IF EXISTS `craft_volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `craft_volumefolders_parentId_idx` (`parentId`),
  KEY `craft_volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `craft_volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_volumefolders`
--

LOCK TABLES `craft_volumefolders` WRITE;
/*!40000 ALTER TABLE `craft_volumefolders` DISABLE KEYS */;
INSERT INTO `craft_volumefolders` VALUES (1,NULL,1,'Site','','2020-02-20 03:42:58','2020-02-20 03:42:58','c6257f2a-2a41-49de-b8e6-cbbfe30ba7b2'),(2,NULL,NULL,'Temporary source',NULL,'2020-03-08 03:26:54','2020-03-08 03:26:54','27fac7ca-5db2-4f0e-ba30-45872879a326'),(3,2,NULL,'user_1','user_1/','2020-03-08 03:26:54','2020-03-08 03:26:54','fc525758-f260-48b1-9de6-39aed4a64122'),(4,1,1,'system','system/','2020-03-08 03:32:04','2020-03-08 03:32:04','b7c3ddfe-4974-458d-af1e-05759ebf1b4d'),(5,NULL,2,'Image in this folder will get updated to github repository','','2020-05-29 07:11:09','2020-06-01 02:56:26','7f579224-7acd-4bcf-8b0c-fd38763260a3');
/*!40000 ALTER TABLE `craft_volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_volumes`
--

DROP TABLE IF EXISTS `craft_volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_volumes_name_idx` (`name`),
  KEY `craft_volumes_handle_idx` (`handle`),
  KEY `craft_volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `craft_volumes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `craft_volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_volumes`
--

LOCK TABLES `craft_volumes` WRITE;
/*!40000 ALTER TABLE `craft_volumes` DISABLE KEYS */;
INSERT INTO `craft_volumes` VALUES (1,NULL,'Site','site','craft\\volumes\\Local',1,'@baseUrl/assets/img','{\"path\":\"@webroot/assets/img\"}',1,'2020-02-20 03:42:58','2020-02-20 03:42:58',NULL,'5c2279a4-677d-493b-9d5d-60afcf08eeaa'),(2,NULL,'Image in this folder will get updated to github repository','repoImg','craft\\volumes\\Local',1,'@baseUrl/assets/repoImg','{\"path\":\"@webroot/assets/repoImg\"}',2,'2020-05-29 07:11:09','2020-06-01 02:56:26',NULL,'db3da7fe-1151-4a78-94f2-be47b936ff63');
/*!40000 ALTER TABLE `craft_volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_widgets`
--

DROP TABLE IF EXISTS `craft_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_idx` (`userId`),
  CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_widgets`
--

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;
INSERT INTO `craft_widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}',1,'2020-02-20 03:24:24','2020-02-20 03:24:24','eb0e2eba-21e8-4eeb-9aef-eb0e134eb144'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2020-02-20 03:24:24','2020-02-20 03:24:24','3b4c3c23-e72c-4be1-9c69-46ed1afd8607'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2020-02-20 03:24:24','2020-02-20 03:24:24','184ddf83-08bb-4326-8df9-eff19e809d50'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2020-02-20 03:24:25','2020-02-20 03:24:25','49109b5b-cdad-4be3-80df-306b62421845');
/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'craft-vue'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-01 16:29:41
