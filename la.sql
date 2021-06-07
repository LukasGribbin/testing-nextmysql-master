CREATE DATABASE  IF NOT EXISTS `lectric` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lectric`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 35.224.32.143    Database: lectric
-- ------------------------------------------------------
-- Server version	5.7.33-google

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(50) DEFAULT NULL,
  `logoUrl` varchar(250) DEFAULT NULL,
  `webUrl` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Panasonic','panasonic-logo','https://www.panasonic.com/ca/'),(2,'Telus','telus-logo','https://telus.com'),(3,'Koodo','koodo-logo','https://www.koodomobile.com'),(4,'Breville','breville-logo','https://www.breville.com/ca/en/home/index.html'),(5,'GoPro','gopro-logo-light','https://gopro.com'),(6,'iRobot','irobot','https://www.irobot.com'),(7,'Klipsch','klipsch','https://www.klipsch.ca'),(8,'Yamaha','yamaha','https://ca.yamaha.com'),(9,'Brother','brother','https://www.brother.ca'),(10,'Lenovo','lenovo','https://www.lenovo.com'),(11,'Dyson','dyson','https://www.dysoncanada.ca'),(12,'Sonos','sonos','https://www.sonos.com'),(13,'Hewlett-Packard','hp','https://www8.hp.com/ca/en/home.html'),(14,'Apple','apple','https://www.apple.com/ca'),(15,'Beats','beats','https://www.apple.com/ca/search/Beats-Headphones'),(16,'Otter','otterbox','https://www.otterbox.com'),(17,'lifeproof','lifeproof','https://www.lifeproof.com'),(18,'Sony','sony','https://www.sony.ca/en'),(19,'Jura','jura','https://ca.jura.com/en'),(20,'Technics','technics','https://www.technics.com/ca_en/');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(100) DEFAULT NULL,
  `imgUrl` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Home',NULL),(2,'Kitchen',NULL),(3,'TVs',NULL),(4,'Audio',NULL),(5,'Phones',NULL),(6,'Tablets',NULL),(7,'Laptops',NULL),(8,'Computers',NULL),(9,'GoPro',NULL),(10,'Accessories',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photoFileName` varchar(50) DEFAULT NULL,
  `productName` varchar(200) DEFAULT NULL,
  `shortDesc` text,
  `price` int(11) DEFAULT NULL,
  `promoPrice` int(11) DEFAULT NULL,
  `description` text,
  `brand` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `onSale` bit(1) DEFAULT NULL,
  `onPromo` bit(1) DEFAULT NULL,
  `options` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productBrand_idx` (`brand`),
  KEY `productCategory_idx` (`category`),
  KEY `productOptions_idx` (`options`),
  CONSTRAINT `productBrand` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `productCategory` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `productOptions` FOREIGN KEY (`options`) REFERENCES `productOptions` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (59,'1547836831086.jpg','The All In One™','Blending, Mashing, Chopping and Slicing all at your fingertips.',22999,18999,'',4,2,'\0','\0',NULL),(84,'1547749926009.jpg','Espresso the Bambino™ Plus','Café quality coffee in a compact footprint.',69999,44999,'The Bambino Plus doesn\'t compromise on the 4 key elements of café quality coffee. Delivering barista-quality performance using a 54mm portafilter with 19 grams for full flavor and automatic milk texturing. With a 3 second heat up time and precise espresso extraction, you go from bean to cup, faster than ever before. Just like your local café.',4,2,'\0','\0',NULL),(86,'1547755131625.png','HERO7 Black','Insanely smooth video.',52999,0,'',5,9,'\0','\0',NULL),(87,'1547757905042.jpg','iPad 10.2\" (7th Generation) Wi-Fi 32GB','Like a computer. Unlike any computer. Available in Gold, Silver and Space Grey',42999,0,'',14,6,'\0','\0',NULL),(88,'1547758050791.jpg','21.5-inch iMac','2.3GHz Dual-Core Processor with Turbo Boost up to 3.6GHz; 1TB Storage',139999,0,'4096-by-2304 Retina 4K Display, Stunning 5mm thin design, Radeon Pro 555X pr 560X graphics processor; 2 Thunderbolt 3 (USB-C) ports',14,8,'\0','\0',NULL),(89,'1547758149473.jpg','21.5-inch iMac','Retina 4K Display, 3.0GHz Processor,  1TB Storage',169999,0,'4096-by-2304 Retina 4K Display, Stunning 5mm thin design, Radeon Pro 555X pr 560X graphics processor; 2 Thunderbolt 3 (USB-C) ports',14,8,'\0','\0',NULL),(90,'1547758216009.jpg','21.5-inch iMac','Retina 4K Display; 3.0GHz 6-Core Processor, 1TB Fusion Drive',194999,0,'4096-by-2304 Retina 4K Display, Stunning 5mm thin design, Radeon Pro 555X pr 560X graphics processor; 2 Thunderbolt 3 (USB-C) ports',14,8,'\0','\0',NULL),(97,'1547763654053.jpg','iPhone X/Xs Otterbox Purple/Grey Defender case','Multi-layer, drop proof construction',5995,0,'',16,10,'\0','\0',NULL),(100,'1547767451974.jpg','iPhone XR Otterbox Black Defender case','Multi-layer, drop proof construction',6495,0,'',16,10,'\0','\0',NULL),(101,'1547767980482.jpg','iPhone Xs Max Otterbox Black Defender case','Multi-layer, drop proof construction',6495,0,'',16,10,'\0','\0',NULL),(102,'1547768879605.jpg','iPhone 8/7 Otterbox Black Defender case ','Built-in screen protector',5995,0,'',16,10,'\0','\0',NULL),(103,'1547827415564.jpg','iPhone 8/7 Otterbox Black Defender case ','Built-in screen protector',5995,0,'',16,10,'\0','\0',NULL),(104,'1547769023497.jpg','iPhone 6/6S Otterbox Black/Black Defender case','Built-in screen protector ',5995,0,'',16,10,'\0','\0',NULL),(105,'1547769115849.jpg','iPhone 5/5S/SE Otterbox Black/Black Defender case ','Built-in screen protector ',5995,0,'',16,10,'\0','\0',NULL),(112,'1547830731665.png','Smart Speaker SC-GA10','Serious Sound just got Smarter with Google Assistant',29999,22999,'',1,4,'','\0',NULL),(114,'1547833118426.jpg','the Juice Fountain™ Plus','With whole fruit feed chute',22999,19999,'',4,2,'\0','\0',NULL),(118,'1547833426208.jpg','Apple TV 4K - 32GB','Cinematic in every sense.',22999,0,'',14,3,'\0','\0',NULL),(119,'1547833524191.jpg','Apple TV - 32GB','From TV programmes, films and live sport to thousands of games and apps, it’s all available on Apple TV.',19999,0,'',14,3,'\0','\0',NULL),(120,'1547833658266.jpg','the Juice Fountain™ Compact','Compact design packed with power.',16999,14999,'',4,2,'\0','\0',NULL),(121,'1547833789393.jpg','the Citrus Press™','Fresh juice without the effort',19999,12999,'',4,2,'\0','\0',NULL),(122,'1547836192614.jpg','the Fresh & Furious™','with 9 task controls and timer ',24999,21999,'',4,2,'\0','\0',NULL),(123,'1547837008579.jpg','the Control Grip™','Gain total control with the Control Grip',11999,9999,'',4,2,'\0','\0',NULL),(124,'1547837436422.jpg','Espresso the Barista Express™','From bean to espresso in under a minute',79999,59999,'',4,2,'\0','\0',NULL),(126,'1547846847886.jpg','Espresso  the Infuser™','Guides you to the perfect espresso with the built in pressure gauge',64999,44999,'',4,2,'\0','\0',NULL),(127,'1547847752435.jpg','Nespresso  Creatista Uno™','New From Nespresso & Breville',54999,34999,'',4,2,'\0','\0',NULL),(128,'1547848943164.jpg','the Milk Cafe™','Make the ultimate rich and creamy hot milk drinks',19999,16999,'',4,2,'\0','\0',NULL),(129,'1547849466330.jpg','the Grind Control™','Adjustable grinder and calibration function to suit any palate',39999,34999,'',4,2,'\0','\0',NULL),(132,'1547849727476.jpg','the Breville Precision Brewer™Thermal','Brew craft filter coffee automatically',34999,25999,'',4,2,'\0','\0',NULL),(133,'1547849841505.jpg','the Breville Precision Brewer™ Glass','Brew craft filter coffee automatically',32999,24999,'',4,2,'\0','\0',NULL),(134,'1547849980355.jpg','the Breville Smart Tea Infuser™','The right temperature and steep time for your tea',24999,15999,'',4,2,'\0','\0',NULL),(137,'1547850397188.jpg','the IQ™ Kettle','5 temperature settings and soft open lid',19999,13999,'',4,2,'\0','\0',NULL),(138,'1547851465449.jpg','the Crystal Clear™','Elegant and efficient kettle with Dura Glass™. ',14999,12999,'',4,2,'\0','\0',NULL),(139,'1547851588543.jpg','the Panini Grill','Indoor grill & sandwich press',14999,11999,'',4,2,'\0','\0',NULL),(140,'1547851877570.jpg','the No-mess Waffle™','Classic circular waffle maker',19999,16999,'',4,2,'\0','\0',NULL),(141,'1547851986875.jpg','the Bit More® 4-Slice Toaster','Long-slot 4 slice stainless steel',15999,13999,'',4,2,'\0','\0',NULL),(142,'1547852170836.jpg','the Bit More® 2 Slice','2-slice toaster with progress indicator',12999,10999,'',4,2,'\0','\0',NULL),(143,'1547853375916.jpg','the Hot Wok™','Powerful wok lets you stir fry quickly to retain crispness',17999,13999,'',4,2,'\0','\0',NULL),(144,'1547853668722.jpg','the Fast Slow Cooker™','Advanced Multi-cooker',22999,19999,'',4,2,'\0','\0',NULL),(145,'1547853925229.jpg','the Handy Mix Scraper™','With intuitive ergonomic control',17999,14999,'',4,2,'\0','\0',NULL),(146,'1547854037490.jpg','the Smart Fryer™','4-Qt capacity with 7 cooking presets & timer',22999,18999,'',4,2,'\0','\0',NULL),(147,'1547854353243.jpg','the Quick Touch™ Compact','Intuitive microwave with smart settings',29999,21999,'',4,2,'\0','\0',NULL),(148,'1548350561123.png','HERO7 White','Taking photos. Taking names.',39995,0,'',5,9,'\0','\0',NULL),(149,'1548350731064.png','HERO7 White','HERO7 White is built tough and waterproof to 33ft (10m).',26995,19999,'',5,9,'\0','\0',NULL),(150,'1548361392709.jpg','27-inch iMac','Retina 5K Display; 3.0GHz 6-core i5; 8GB RAM; 1TB Fusion Drive; Radeon Pro 570X 4GB',239999,0,'',14,8,'\0','\0',NULL),(151,'1548361474564.jpg','27-inch iMac','Retina 5K Display; 3.1 GHz 6-core i5; 8GB RAM; 1TB Fusion Drive; Radion Pro 576X 4GB',264999,0,'',14,8,'\0','\0',NULL),(152,'1548361666832.jpg','27-inch iMac','Retina 5K Display ; 3.8 GHz 6-core i5; 8GB RAM; 2TB Fusion Drive; Radeon Pro 580X 8GB',307999,0,'',14,8,'\0','\0',NULL),(154,'1548435848804.jpg','iPhone 8/7 Otterbox Black Commuter case',' a slim and sleek look to complement your device',3995,0,'',16,10,'\0','\0',NULL),(156,'1548436457620.jpg','iPhone XR Otterbox Black Commuter case','a slim yet tough look ',4495,0,'',16,10,'\0','\0',NULL),(157,'1548436887227.jpg','iPhone Xs Max Otterbox Black Commuter  case','a slim yet tough look ',4495,0,'',16,10,'\0','\0',NULL),(158,'1548437244742.jpg','iPhone X/Xs Otterbox Black Commuter  case','the multi-layer case ',3995,0,'',16,10,'\0','\0',NULL),(159,'1548437718346.jpg','iPhone XR Otterbox Black/Clear Pursuit case ','toughest, most protective case ',7495,0,'',16,10,'\0','\0',NULL),(160,'1548438105819.jpg','iPhone X/Xs Otterbox Black/Clear Pursuit case ','toughest, most protective case ',6995,0,'',16,10,'\0','\0',NULL),(161,'1548438368092.jpg','iPhone Xs Max Otterbox Black/Clear Pursuit case','toughest, most protective case ',7995,0,'',16,10,'\0','\0',NULL),(162,'1548442163409.jpg','iPhone XR Otterbox Brown/Brown (Espresso) Leather Strada Folio case ',' blends handcrafted style and premium protection. ',6495,0,'',16,10,'\0','\0',NULL),(165,'1548446802013.jpg','iPhone X/Xs Otterbox Brown/Brown (Espresso) Leather Strada Folio case','handcrafted style and premium protection. ',5995,0,'',16,10,'\0','\0',NULL),(166,'1548447067204.jpg','iPhone 8/7 Otterbox Brown/Brown (Espresso) Leather Strada Folio case ',' handcrafted style with premium protecti',5995,0,'',16,10,'\0','\0',NULL),(167,'1548447690853.jpg','iPhone XR Otterbox That Willow Do Symmetry Series case',' slim and ultra-protective case ',4995,0,'',16,10,'\0','\0',NULL),(168,'1548448938455.jpg','iPhone Xs Otterbox Clear/Silver Flake (Stardust) Symmetry Series case ','slim and ultra-protective ',4495,0,'',16,10,'\0','\0',NULL),(169,'1548449335699.jpg','iPhone 8/7 Otterbox Millenium Falcon Symmetry Star Wars Case','Sleek, stylish, pocket-friendly design',4495,0,'',16,10,'\0','\0',NULL),(170,'1548450790547.jpg','iPhone Xs Max LifeProof Grey/Blue (Body Surf) Fre case ','Stay protected from all the elements ',8995,0,'',17,10,'\0','\0',NULL),(171,'1548451362567.jpg','iPhone XR LifeProof Blue/Orange (Boosted) Fre case ','Stay protected from all the elements ',8495,0,'',17,10,'\0','\0',NULL),(172,'1548452367766.jpg','iPhone Xs LifeProof Light Blue/Lime (Tiki) Fre case ','Stay protected from all the elements ',7995,0,'',17,10,'\0','\0',NULL),(173,'1548693296719.jpg','iPhone 8 Plus/7 Plus LifeProof Black/Lime (Night Lite) Fre case ','Thin, light and all-protective case ',7995,7995,'',17,10,'\0','\0',NULL),(174,'1548693735745.jpg','iPhone 8/7 LifeProof Purple/Pink (Chakra) Fre case','Thin, light and all-protective case',7995,7995,'',17,10,'\0','\0',NULL),(175,'1548694208483.jpg','iPhone 5/5S/SE LifeProof Black Fre case ','Thin, light and all-protective case',7995,7995,'',17,10,'\0','\0',NULL),(176,'1548694678043.jpg','iPhone XR UAG Midnight Camo Pathfinder Series case ','Armor shell and impact resistant soft core',3495,3495,'',14,10,'\0','\0',NULL),(177,'1548694835137.jpg','iPhone X/Xs UAG Cobalt/Silver Metropolis Series Folio case ','Feather-light impact resistant core',3995,3995,'',14,10,'\0','\0',NULL),(178,'1548695235562.jpg','Samsung Galaxy S9 Otterbox Black Defender case','New screenless design complements your curved screen',5995,5995,'',16,10,'\0','\0',NULL),(179,'1548697239820.jpg','Samsung Galaxy S9 Otterbox Black/Black Commuter case ',' a slim and sleek look',3995,3995,'',16,10,'\0','\0',NULL),(180,'1548784399700.jpg','Mac Mini M1','Apple Silicon 8 core M1 processor l 256 GB Storage ',89999,0,'',14,8,'\0','\0',NULL),(181,'1548784433619.jpg','Mac Mini Intel','3.0GHz 6-Core i5 Processor with Turbo Boost up to 4.1GHz 256 GB Storage',139999,0,'',14,8,'\0','\0',NULL),(182,'1548784943784.png','KX-TGC380C','Digital Cordless Phone',5499,0,'',1,5,'\0','\0',NULL),(183,'1548785170742.png','KX-TGC382C','Digital Cordless Phone',8999,0,'',1,5,'\0','\0',NULL),(184,'1548785346120.jpg','AirPods','Wireless. Effortless. Magical.',21999,0,'',14,4,'\0','\0',NULL),(185,'1548785394788.png','KX-TGD392C','Digital Cordless Phone with Answering Machine',10999,0,'',1,5,'\0','\0',NULL),(186,'1548785527916.png','KX-TGC383C','Digital Cordless Phone',12999,0,'',1,5,'\0','\0',NULL),(187,'1548785617463.png','KX-TGD393C','Digital Cordless Phone with Answering Machine',14999,0,'',1,5,'\0','\0',NULL),(188,'1548785918974.jpg','KX-TGD593C','Digital Cordless Phone with Answering Machine & Link2Cell Feature',15999,0,'',1,5,'\0','\0',NULL),(189,'1548786120001.png','KX-PRW130C','Premium Design Phone with Smartphone Connect',16995,11995,'',1,5,'\0','',NULL),(190,'1548786233858.png','KX-TGF343C','Digital Cordless Answering System',17999,0,'',1,5,'\0','\0',NULL),(191,'1548786334013.png','KX-TGD394C','Digital Cordless Phone with Answering Machine',15999,0,'',1,5,'\0','\0',NULL),(192,'1548786462922.png','KX-TGC384C','Digital Cordless Phone',14499,0,'',1,5,'\0','\0',NULL),(193,'1548786574259.png','KX-TGF352C','Digital Corded/Cordless Answering System',12999,0,'',1,5,'\0','\0',NULL),(194,'1548786694194.jpg','KX-TSC11CB','Integrated Corded Telephone System',4495,0,'',1,5,'\0','\0',NULL),(195,'1548786858223.png','KX-TS500C','Corded Telephone, WHITE',2499,0,'',1,5,'\0','\0',NULL),(196,'1548787020216.png','KX-TGM470C','Amplified Digital Cordless Telephone with Answering Machine',17999,0,'',1,5,'\0','\0',NULL),(197,'1548788493379.png','SR-DF101','Electronic Rice Cooker',11999,0,'1.0 Litre; 750W',1,2,'\0','\0',NULL),(198,'1548788778306.jpg','NN-SG626B','Microwave Oven',16999,0,'',1,2,'\0','\0',NULL),(200,'1548789422664.png','KX-HNA101C','Home Network System',4999,0,'',1,1,'\0','\0',NULL),(201,'1548789645532.jpg','KX-HNC805C','HD Camera, Smart Home Monitoring',24999,19999,'',1,1,'\0','',NULL),(202,'1548789752355.png','KX-HN3051C','Long Range Baby Monitor',18999,0,'',1,1,'\0','\0',NULL),(203,'1548789963146.png','KX-HN7052C','Wireless Outdoor HD Cameras / HomeHawk Front Door/Outdoor',49999,0,'',1,1,'\0','\0',NULL),(204,'1548790406169.png','KX-HN7051C','HomeHawk Front Door / Wireless Outdoor HD Camera',29999,0,'',1,1,'\0','\0',NULL),(205,'1548791721449.jpg','Play:5','Ultimate Wireless Smart Speaker ',64999,0,'',12,4,'\0','\0',NULL),(206,'1588805567090.png','Sonos One','Compact Wireless Speaker for streaming music',22999,0,'',12,4,'\0','\0',NULL),(207,'1548791943481.png','Beam','Compact Smart TV Soundbar / Wireless Home Theatre / Music Streaming ',49999,0,'',12,4,'\0','\0',NULL),(208,'1548792164482.png','SC-UA7','Wireless Speaker System',79999,49999,'',1,4,'\0','',NULL),(212,'1550004645737.png',' Bluetooth® Earphones RP-BTS35                  ','3D-Flex sport clips and quick-fit adjuster',9999,0,'',1,4,'\0','\0',NULL),(214,'1550005041633.png','Bluetooth® Earbuds RP-HJE120B','Clear Sound & Robust Bass',4999,0,'',1,4,'\0','\0',NULL),(216,'1550011053461.png','Lumix Point & Shoot Camera DMC-TS30','Waterproof & tough for active lifestyles',18999,0,'',1,10,'\0','\0',NULL),(217,'1550011883525.png','LUMIX Digital Camera DC-TS7','undefeated toughness',57999,0,'',1,10,'\0','\0',NULL),(218,'1551815909659.jpg','SR-G06FGE (Silver)','Automatic Rice Cooker / Steamer',4999,0,'',1,2,'\0','\0',NULL),(221,'1551816311805.jpg','NN-SG656W','Microwave Oven',16999,0,'',1,2,'\0','\0',NULL),(222,'1551816398907.png','NN-ST663S (Stainless)','Microwave Oven',24999,0,'',1,2,'\0','\0',NULL),(224,'1558027894168.jpg','the Barista Touch™','Create café quality coffee at home with ease.',149999,119999,'',4,2,'\0','\0',NULL),(225,'1558028144614.jpg','the Smart Oven™ Air','13 smart cooking functions with air fry and dehydrate.',59999,47999,'',4,2,'\0','\0',NULL),(226,'1558029189809.jpg','the Smart Grinder™ Pro','Grind intelligently with Dosing IQ technology',29999,22999,'',4,2,'\0','\0',NULL),(227,'1558029297107.jpg','the Dose Control™ Pro','Adjust in 1 second increments for control of your grind.',23999,17999,'',4,2,'\0','\0',NULL),(228,'1558029389250.jpg','The Sous Chef™ 12','Precision preparation has never been easier.',39999,29999,'',4,2,'\0','\0',NULL),(229,'1558029605462.jpg','the Scraper Mixer™ Pro','Mixing without the mess.',39999,29999,'',4,2,'\0','\0',NULL),(230,'1567794536181.jpg','NN-SG448S','Compact Microwave Oven',13999,0,'',1,2,'\0','\0',NULL),(231,'1567794831699.jpg','NN-SG656S','Mid-Size Genius® Microwave with Stainless Steel Finish',22999,0,'',1,2,'\0','\0',NULL),(232,'1567795060990.jpg','NN-ST66KB','Mid-Size Genius® Inverter® Microwave Oven',19999,0,'',1,2,'\0','\0',NULL),(233,'1567795329586.jpg','NN-ST27HW','Genius® Inverter® Over-The-Range Microwave Oven',59999,0,'',1,2,'\0','\0',NULL),(234,'1567795481241.jpg','NN-SG158S','Genius® Over-The-Range Microwave Oven',44999,0,'',1,2,'\0','\0',NULL),(235,'1588800615770.png','Macbook Pro 16-inch with Touch Bar','2.6 GHz 6-core Intel Core I i7 Processor l TurboBoost up to 4.5 GHz l 12MB shared L3 cache l 512GB SSD l 16\" Retina Display with True Tone l Four Thunderbolt 3 ports',299999,0,'',14,7,'\0','\0',NULL),(236,'1588800524871.png','Macbook Pro 16-inch with Touch Bar','2.3GHz 8-core Intel Core i9 processor l TurboBoost up to 4.8 GHz l 16MB shared L3 cache l 1TB SSD l 16\" Retina Display with TrueTone l Four Thunderbolt 3 ports',349999,0,'',14,7,'\0','\0',NULL),(237,'1588800861165.jpg','MacBook Air 13-inch GOLD','Apple Silicon 8 core M1 processor l 256 GB Storage l Touch ID',129999,0,'',14,7,'\0','\0',NULL),(238,'1588800978971.jpg','MacBook Air 13-inch SPACE GREY','Apple Silicon 8 core M1 processor l 256 GB Storage l Touch ID',129999,0,'',14,7,'\0','\0',NULL),(239,'1588801042512.jpg','MacBook Air 13-inch SILVER','Apple Silicon 8 core M1 processor l 256 GB Storage l Touch ID',129999,0,'',14,7,'\0','\0',NULL),(240,'1588801419952.jpg','MacBook Air 13-inch SILVER','Apple Silicon 8 core M1 processor l 512 GB Storage l Touch ID',169999,0,'',14,7,'\0','\0',NULL),(241,'1588803448350.png','iPad 10.2\" (7th Generation) Wi-Fi 128GB GOLD','Like a computer. Unlike any computer',54999,0,'',NULL,6,'\0','\0',NULL),(243,'1588803613423.png','iPad 10.2\" (7th Generation) Wi-Fi 128GB SILVER','Like a computer. Unlike any computer',54999,0,'',NULL,6,'\0','\0',NULL),(244,'1588803648856.png','iPad 10.2\" (7th Generation) Wi-Fi 128GB SPACE GREY','Like a computer. Unlike any computer',54999,0,'',14,6,'\0','\0',NULL),(245,'1588804127189.png','iPad Mini 64GB GOLD','Mini just got mightier.',52999,0,'',NULL,6,'\0','\0',NULL),(246,'1588804166229.png','iPad Mini 64GB SILVER','Mini just got mightier.',52999,0,'',14,6,'\0','\0',NULL),(247,'1588804205005.png','iPad Mini 64GB SPACE GREY','Mini just got mightier.',52999,0,'',14,6,'\0','\0',NULL),(248,'1588804443146.jpg','Airpods PRO','Magic like you’ve never heard.',32999,0,'',14,4,'\0','\0',NULL),(250,'1588805793837.jpg','RP-HD305BT - Bluetooth® Wireless Headphones','High-resolution entertainment',24999,0,'',1,4,'\0','\0',NULL),(251,'1588805978377.png','RP-TCM125 Earbuds PURPLE','Wired Stereo Earphones with MIC for Mobile Phones',2999,0,'',1,4,'\0','\0',NULL),(252,'1588806038946.png','RP-TCM125 Earbuds BLUE','Wired Stereo Earphones with MIC for Mobile Phones',2999,0,'',1,4,'\0','\0',NULL),(253,'1588806090302.png','RP-TCM125 Earbuds BLACK','Wired Stereo Earphones with MIC for Mobile Phones',2999,0,'',1,4,'\0','\0',NULL),(254,'1588806123287.png','RP-TCM125 Earbuds WHITE','Wired Stereo Earphones with MIC for Mobile Phones',2999,0,'',1,4,'\0','\0',NULL),(255,'1597273298535.jpg','Macbook Pro 13-Inch with Touch Bar SPACE GREY','Apple Silicon 8 core M1 processor l 256 GB Storage l Touch Bar and Touch ID',169999,0,'',NULL,7,'\0','\0',NULL),(256,'1597273388463.jpg','Macbook Pro 13-Inch with Touch Bar SILVER','Apple Silicon 8 core M1 processor l 256 GB Storage l Touch Bar and Touch ID',169999,0,'',14,7,'\0','\0',NULL),(257,'1597273573878.jpg','the Smart Oven™ Pizzaiolo','Brick oven performance at a fraction of the cost.',109999,0,'',4,2,'\0','\0',NULL),(258,'1597275335791.jpg','the Steam Wand Cleaner','10 pack Breville steam wand cleaner',2499,0,'',4,2,'\0','\0',NULL),(259,'1597275574240.jpg','ESPRESSO CLEANING TABLETS','8 tablets per pack l designed to remove coffee oils and residues',1999,0,'',4,2,'\0','\0',NULL),(260,'1597275668878.jpg','the Knock Box Mini','Strike the portafilter against the knock bar for quick, easy and mess-free disposal of the coffee puck.',2999,0,'',4,2,'\0','\0',NULL),(261,'1597275795287.jpg','Milk Jug (480ML)','',3699,0,'',4,2,'\0','\0',NULL),(262,'1597275907139.jpg','the Smart Oven™ Air Fryer','11 smart cooking functions including Air Fry',49999,0,'',4,2,'\0','\0',NULL),(263,'1597276079300.png','iPad Pro 11\" Wi-Fi','The world’s most advanced mobile display.',104999,0,'',14,6,'\0','\0',NULL),(264,'1597276152682.png','iPad Pro 12.9\" Wi-Fi','The world’s most advanced mobile display.',129999,0,'',14,6,'\0','\0',NULL),(266,'1605815568847.jpg','Sony X800H 43\"','X800H | 4K Ultra HD | High Dynamic Range (HDR) | Smart TV (Android TV)',79999,0,'',18,3,'\0','\0',NULL),(267,'1606339090409.png','Panasonic True Wireless Headphones RZ-S500W','True Wireless  I  Noise-cancelling ',24999,14999,'',1,4,'\0','',NULL),(268,'1606339652790.jpg','Panasonic True Wireless Headphones RZ-S300W','True Wireless  l  Stable Bluetooth Connection  l  Water Resistant',16999,9999,'',1,4,'\0','',NULL),(269,'1606339969894.png','Technics True Wireless Headphones ','Industry leading noise-cancellation  l  Extraordinary sound quality',32999,19999,'',20,4,'\0','',NULL),(270,'1606340721374.undefined','Jura S8 ','Swiss Espresso Machine',289999,0,'',19,2,'\0','\0',NULL),(271,'1606418477128.jpg','Jura ENA8 Sunset Red','small, stunning, simple – freshly ground, not capsuled',229500,0,'',19,2,'\0','\0',NULL),(272,'1606418596072.jpg','Jura D6 (Piano Black)','Freshly ground - not capsuled',155000,0,'',19,2,'\0','\0',NULL),(273,'1606418748287.jpg','Jura A1 – Piano Black','pure espresso',119900,0,'',19,2,'\0','\0',NULL),(274,'1606420102117.jpg','The Café Roma™','Espresso machine with Stainless Steel finish',22999,0,'',4,2,'\0','\0',NULL),(275,'1610040792689.jpg','Mac Mini M1','Apple Silicon 8 core M1 processor l 512 GB Storage ',114999,0,'',NULL,8,'\0','\0',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productOption`
--

DROP TABLE IF EXISTS `productOption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productOption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgFile` varchar(250) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `options` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `optionOptions_idx` (`options`),
  CONSTRAINT `optionOptions` FOREIGN KEY (`options`) REFERENCES `productOptions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productOption`
--

LOCK TABLES `productOption` WRITE;
/*!40000 ALTER TABLE `productOption` DISABLE KEYS */;
/*!40000 ALTER TABLE `productOption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productOptions`
--

DROP TABLE IF EXISTS `productOptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productOptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productOptions`
--

LOCK TABLES `productOptions` WRITE;
/*!40000 ALTER TABLE `productOptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `productOptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'lectric'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-31 10:53:13
