-- MySQL dump 10.19  Distrib 10.3.31-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_gstore
-- ------------------------------------------------------
-- Server version	10.3.31-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `head` varchar(50) NOT NULL,
  `content` varchar(100) NOT NULL,
  `text_color` enum('text-dark','text-light') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `banners_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (4,3,'7f835b7235cd45661cac8a6c3de3f000.jpg','Anno 1880','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui, cupiditate Lorem ipsum dolor sit amet','text-light'),(5,1,'f2ea03a2f9af29c035d12d14bcc0dc48.jpg','Assasins\'s Creeds Halvala','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui, cupiditate Lorem ipsum dolor sit amet','text-light');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` text NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (4,5,'2020-06-29','520200629021101',705000,'User','Tangerang','123123123','paid'),(5,6,'2021-10-25','620211025211708',700000,'udin','jl kenanga','081123456','waiting');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_confirm`
--

DROP TABLE IF EXISTS `orders_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_confirm`
--

LOCK TABLES `orders_confirm` WRITE;
/*!40000 ALTER TABLE `orders_confirm` DISABLE KEYS */;
INSERT INTO `orders_confirm` VALUES (3,4,'User','111222333',99999999,'asdfasdfasdf','23c839ec129597ed7735de78e515120a.jpg');
/*!40000 ALTER TABLE `orders_confirm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_detail`
--

DROP TABLE IF EXISTS `orders_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_detail`
--

LOCK TABLES `orders_detail` WRITE;
/*!40000 ALTER TABLE `orders_detail` DISABLE KEYS */;
INSERT INTO `orders_detail` VALUES (7,4,1,205000),(8,4,5,500000),(9,5,4,700000);
/*!40000 ALTER TABLE `orders_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `edition` varchar(45) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `requirements` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Kendo Cotton Gold edition',80000,'Cotton','2674aa20ee1c3ec899b09a3d2acb63e3.jpeg','Ready !!<br>.<br>Kendo Vape Cotton - Gold Edition by @kendovapecotton .<br>.<br>Kendo Vape Cotton is a 100% organic, cultivated Japanese cotton specially selected for vapers. Its heat-resistant property makes it 2x longer lasting than ordinary cotton. Its excellent e-juice absorption allows vapers to do long pulls at high wattages without the cotton going dry. The Kendo Vape Cotton is ready to use, making the wicking process easier than ever! Gold edition. ','Cotton lengths: 1.2m<br>Material: 100% Japanese Organic Cotton<br>Package Size: 143 x 77mm<br>.<br>.<br>IDR 80k<br>IDR 80k<br>IDR 80k<br><br>Available in our little store<br>JVS HEADQUARTER<br>Jl.ciputat raya no.30 RT.4/RW.1,<br>south kebayoran lama , kebayoran lama , south jakarta city<br>12240<br>.'),(2,'Watch Dogs 2',689000,'premium','watchdogs2.jpg','<p>							Use hacking as a weapon in the massive &amp; dynamic open world of Watch Dogs 2.\r\n\r\nIn 2016, ctOS 2.0, an advanced operating system networking city infrastructure, was implemented in several US cities to create a safer, more efficient metropolis.\r\nPlay as Marcus Holloway, a brilliant young hacker living in the birthplace of the tech revolution, the San Francisco Bay Area. </p><p>Team up with Dedsec, a notorious group of hackers, and expose the hidden dangers of ctOS 2.0, which, in the hands of corrupt corporations, is being wrongfully used to monitor and manipulate citizens on a massive scale.\r\nWith the power of hacking and Dedsec by your side, launch the Hack of the Century, take down ctOS 2.0 and give freedom back to whom it belongs: the people.\r\n\r\nFeatures\r\n</p><p><b><br></b></p><p><b>WELCOME TO THE SAN FRANCISCO BAY AREA</b></p><p>\r\nExplore a massive and dynamic open-world offering an incredible variety of gameplay possibilities. Hack your way through traffic while you engage in dangerous car chases through the winding streets of San Francisco, traverse the rooftops of the colorful &amp; vibrant neighborhoods of Oakland, and infiltrate the cutting edge offices of Silicon Valley companies. There are many secrets to uncover in the birthplace of the tech revolution.\r\n</p><p>\r\n</p><p><b><br></b></p><p><b>HACKING IS YOUR WEAPON\r\n</b></p><p>Hack into the city’s infrastructure, every connected device, and everyone’s personal database. Take control of drones, cars, cranes, security robots, and much more. Hack your enemies and bystanders alike– manipulate them in different ways to trigger unpredictable chains of events. Every person, any vehicle they might drive, any connected device they possess can be hacked.\r\n\r\n</p><p><b><br></b></p><p><b>YOU ARE IN CTRL</b>\r\n</p><p>Use hacking and stealth to complete missions without killing a single enemy or combine hacking and your weapons for a more ferocious approach. Develop different skills to suit your playstyle, and upgrade your hacker tools – RC cars, Quadcopter drones, 3D printed weapons and much more.\r\n\r\n</p><p><br></p><p><b>SEAMLESSLY CONNECT WITH FRIENDS</b>\r\n</p><p>Stay connected to your friends with a brand new seamless multiplayer experience that includes both Co-op and Player vs. Player activities, all available in a shared open world experience.\r\n\r\n</p><p><br></p><p><b>PUT YOUR EYES IN CTRL</b>\r\n</p><p>Get the upper hand with Tobii Eye Tracking. Let your gaze aid you in weaponizing the “internet of things”, aim at enemies and take cover while you naturally explore the environment. Combine the extensive eye tracking feature set to pinpoint enemies, interact with your surroundings, locate shelter points, and rapidly select hackable targets. Let your vision lead the hacking of the city’s digital brain.						</p>','<p>							<u>RECOMMENDED\r\n</u></p><p>OS: Windows 7 SP1, Windows 8.1, Windows 10 (64bit versions only)\r\n</p><p>PROCESSOR: Intel Core i5 3470 @ 3.2 GHz, AMD FX 8120 @ 3.9 GHz\r\n</p><p>VIDEO CARD: NVIDIA GeForce GTX 780 | AMD Radeon R9 290, with 3GB VRAM or better - See supported List*\r\n</p><p>SYSTEM RAM: 8 GB\r\nHARD DRIVE: 50 GB\r\n</p><p>SOUND CARD: DirectX-compatible using the latest drivers</p><p>\r\nDVD-ROM DRIVE: DVD-ROM Dual Layer\r\n</p><p>DIRECT X: DirectX End-User Runtimes (June 2010)\r\nPERIPHERALS: Microsoft Xbox One Controller, DUALSHOCK® 4 Controller, Windows-compatible keyboard, mouse, optional controller\r\nMULTIPLAYER: 256 kbps or faster broadband connection						</p>'),(3,'Anno 1800',1149000,'premium','anno.jpg','<p>							Enhance your Anno 1800 experience with the Complete Edition including the following digital content:\r\n\r\nAnno 1800 - Full Game\r\n\r\n</p><p>Season 2 Pass, which includes 3 upcoming DLCs:\r\n</p><p>• Seat of Power: Show off the power of your city with a prestigious palace and government departments that can boost your economy with a variety of policies.\r\n<br>• Bright Harvest: Bring the wonders of mechanized farming to the countryside as you boost the efficiency of your farms with tractors and more.<br>\r\n• Land of Lions: Travel to the Southern continent and join forces with an embattled Emperor to bring life to the desert using a new irrigation system.\r\n\r\nAnd 3 exclusive ornaments\r\n\r\nSeason 1 Pass, which includes The Sunken Treasure, Botanica and The Passage DLCs						</p>','<p>							<u>MINIMUM\r\n</u></p><p>Minimum specifications – 1080p Low Preset @30 FPS\r\n\r\n</p><p>CPU: Intel i5-2500K - 3.3 Ghz, AMD FX 6350 - 3.9 Ghz              \r\n\r\nGPU: Nvidia GTX 660 - 2GB, AMD Radeon R7 260X - 2GB\r\n\r\n</p><p>RAM: 8GB\r\n\r\n \r\n\r\nMinimum specifications – 1080p Low Preset @60 FPS\r\n\r\n</p><p>CPU: Intel i5-4460 - 3.2 Ghz, AMD Ryzen3 1200 - 3.1 Ghz              \r\n\r\n</p><p>GPU: Nvidia GTX 670 - 2GB, AMD Radeon R9 270X - 2GB\r\n\r\n</p><p>RAM: 8GB\r\n\r\n \r\n\r\n</p><p><br></p><p><u>RECOMMENDED\r\n</u></p><p>Recommended specifications – 1080p High Preset @30 FPS</p><p>\r\n\r\nCPU: Intel i5-4690K - 3.5 Ghz, AMD Ryzen5 1400 - 3.2 Ghz            \r\n\r\n</p><p>GPU: Nvidia GTX 770 - 4GB, AMD Radeon R9 285 - 2GB\r\n\r\n</p><p>RAM: 8GB\r\n\r\n \r\n\r\nRecommended specifications – 1080p High Preset @60 FPS\r\n\r\n</p><p>CPU: Intel i5-4690K - 3.5 Ghz, AMD Ryzen5 1500X - 3.5 Ghz         \r\n</p><p>GPU: Nvidia GTX 970 - 4GB, AMD Radeon R9 290X - 4GB\r\n\r\n</p><p>RAM: 8GB						</p>'),(4,'Assassin\'s Creed Valhalla',700000,'reguler','6d593e0b9fe86690a49fd1fd32d26983.jpg','							<p>Become Eivor, a legendary Viking raider on a quest for glory. Explore\r\n England\'s Dark Ages as you raid your enemies, grow your settlement, and\r\n build your political power.</p>\r\n\r\n<p>\r\n• Lead epic Viking raids against Saxon fortresses throughout England.<br>\r\n• Dual-wield powerful weapons and relive the visceral fighting style of the Vikings.<br>\r\n• Challenge yourself with the most varied collection of enemies ever found in Assassin\'s Creed.<br>\r\n• Shape the growth of your character with every choice you make and carve your path to glory.<br>\r\n• Explore a Dark Age open world, from the harsh shores of Norway to the beautiful kingdoms of England.<br>\r\n</p>\r\n\r\n\r\n\r\n<p><strong>THE GAME</strong><br>\r\n• Copy of the Ultimate Edition of <strong>Assassin’s Creed Valhalla</strong>, including the following digital content.<br></p>\r\n\r\n<p><strong>THE SEASON PASS</strong><br>\r\nExtend your experience with the<strong> Season Pass*</strong>:<br>\r\n• Get access to epic new content, explore new lands and discover new gear.<br>\r\n• Enjoy an immersive Story Mission, available at Launch.\r\n </p>\r\n\r\n<strong>THE ULTIMATE PACK</strong><br>\r\n\r\nStrike fear into the hearts of your enemies, dominate raids and rivers with the set of items included in the <strong>Ultimate Pack*</strong>: <br>\r\n• <strong>The Berserker Gear Pack </strong>includes the Bearded Axe, the\r\n Ursine Guard Light Shield, a new skin for your Raven, the ferocious \r\nHati Wolf Mount and the Berserker Set for Eivor.<br>\r\n• <strong>The Berserker Longship Pack</strong> includes a majestic Longship which comes with a unique figurehead and a set of new sails. <br>\r\n• <strong>The Berserker Settlement Pack </strong>includes new ways to customise your settlement in England.<br>\r\n• <strong>A Set of Runes </strong>to sharpen the weapons or improve the gear of your choice.						','							<p>							<u>MINIMUM CONFIGURATION\r\n</u></p><p>\r\nOS: Windows 7 SP1, Windows 8.1, Windows 10 (64-bit versions only)</p><p>PROCESSOR: Intel Core i5-2400s @ 2.5 GHz or AMD FX-6350 @ 3.9 GHz or equivalent\r\n</p><p>\r\nVIDEO CARD: NVIDIA GeForce GTX 660 or AMD R9 270 (2048 MB VRAM with Shader Model 5.0 or better)\r\n\r\n</p><p>SYSTEM RAM: 6GB\r\n\r\nResolution: 720p\r\n\r\nVideo Preset: Lowest\r\n\r\n</p><p><br></p><p><u>RECOMMENDED CONFIGURATION\r\n</u></p><p>\r\nOS: Windows 7 SP1, Windows 8.1, Windows 10 (64-bit versions only)\r\n</p><p>\r\nPROCESSOR: Intel Core i7- 3770 @ 3.5 GHz or AMD FX-8350 @ 4.0 GHz</p><p>\r\n\r\nVIDEO CARD: NVIDIA GeForce GTX 760 or AMD R9 280X (3GB VRAM with Shader Model 5.0 or better)\r\n\r\n</p><p>SYSTEM RAM: 8GB\r\n\r\nResolution: 1080p\r\n\r\nVideo Preset: High						</p>						'),(5,'Far Cry 5',500000,'reguler','a15512528a86ac45c1ee4c9c47e4cb3c.jpg','							<h3><span style=\"color:null;\">Product Description<span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></span></h3>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></span><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Seventeen\r\n years after a global nuclear catastrophe, civilization re-emerges from \r\nthe chaos to find a world dramatically changed. In Hope County, Montana,\r\n the remaining populace has gathered into different groups, each with \r\ntheir own rules for survival. </span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">In\r\n this new world order, the vicious Highwaymen, led by twin sisters \r\nMickey and Lou, travel from place to place bleeding people dry of all \r\navailable resources. As the Survivors try to defend their lands against \r\nthe </span><span style=\"font-family:\'Stratum1 Regular\',sans-serif\" lang=\"EN-US\">Highwaymen\'s relentless onslaught, </span><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">it\'s up to you to come to their aid and lead the fight. </span><span style=\"font-family:\'Stratum1 Regular\',sans-serif\" lang=\"EN-CA\"><span style=\"font-variant:small-caps\"></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">In the latest installment of the award-winning Far Cry franchise,</span><span style=\"font-family:\'Stratum1 Regular\',sans-serif\" lang=\"EN-US\">\r\n you are the last line of defense in a transformed, post-apocalyptic \r\nHope County. Help the community of Survivors grow stronger, craft a \r\nmakeshift arsenal through Turf Wars and cross-country Expeditions, and \r\nform unexpected alliances to fight for survival in a dangerous new \r\nfrontier.</span><span style=\"font-size:9.0pt\" lang=\"EN-US\"><span style=\"font-family:\'Arial\',sans-serif\"></span></span></span></span></p>\r\n\r\n<p style=\"margin: 0cm 0cm 0.0001pt; text-align: justify;\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Stratum1 Regular\',sans-serif\" lang=\"EN-US\"></span><span style=\"font-size:9.0pt\" lang=\"EN-US\"><span style=\"font-family:\'Arial\',sans-serif\"></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Stratum1 Regular\',sans-serif\" lang=\"EN-US\"></span><span style=\"font-size:9.0pt\" lang=\"EN-US\"><span style=\"font-family:\'Arial\',sans-serif\"></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"> </p>\r\n\r\n<h3 style=\"text-align: justify; margin: 0cm 0cm 0.0001pt;\"><span style=\"color:null;\">Key Features</span></h3>\r\n\r\n<p><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></b></span></span></span></p>\r\n\r\n<p style=\"margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">FIGHT FOR SURVIVAL IN A BREATHTAKING POST-APOCALYPTIC WORLD</span></b></span></span></span></p>\r\n\r\n<ul><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:Symbol\" lang=\"EN-US\"></span><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Sprawling\r\n superbloom fields and dense overgrowth invite you into a wildly \r\nbeautiful yet deadly post-apocalyptic landscape, to discover on your own\r\n or with a friend in two player co-op.</span></span></span></span></li><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:Symbol\" lang=\"EN-US\"></span><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Wildlife has not gone untouched by the disaster, with some predators evolving rugged natural defenses.</span></span></span></span></li></ul>\r\n\r\n<p style=\"margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></b></span></span></span></p>\r\n\r\n<p style=\"margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">UNFORGETTABLE CHARACTERS COLLIDE WITH A RELENTLESS DOUBLE THREAT</span></b> </span></span></span></p>\r\n\r\n<ul><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Clash\r\n with the brutal Highwaymen and their unruly leaders Mickey and Lou. \r\nKnown as The Twins, these sisters combine brains and brawn to give their\r\n army an iron grip on Hope County\'s precious resources.</span></span></span></span></li><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Recruit\r\n an eclectic cast of Guns and Fangs for Hire to fight by your side. \r\nThese new allies, as well as some familiar faces, each bring unique and \r\ncritical skills to the fray.</span></span></span></span></li><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Find the former doomsday cult and seek out the charismatic leader who prophesized the collapse of civilization: Joseph Seed.</span></span></span></span></li></ul>\r\n\r\n<p style=\"margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span lang=\"EN-US\"></span></span></span></span></p>\r\n\r\n<p style=\"margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">GROW THE SURVIVORS TO BUILD UP YOUR HOMEBASE</span></b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></span></p>\r\n\r\n<ul><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Specialists join the Survivors to help you craft</span><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">\r\n weapons and vehicles, train your Guns for Hire, and even go on \r\nExpeditions from the eight Homebase facilities: the workbench, training \r\ncamp, explosives lab, infirmary, garage, healing garden, cartography, \r\nand expeditions. </span></span></span></span></li><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Grow your community and upgrade your Homebase to improve your facilities and unlock more powerful weapons and gear. </span></span></span></span></li></ul>\r\n\r\n<p style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></b></span></span></span></p>\r\n\r\n<p style=\"margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">BATTLE FOR RESOURCES IN HOPE COUNTY AND BEYOND</span></b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></span></p>\r\n\r\n<ul><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Engage\r\n the Highwaymen in Turf Wars by clearing their outposts and then \r\nscavenging them for Ethanol and other materials. When the Highwaymen \r\nreturn with stronger reinforcements, you can take on a greater challenge\r\n for even more of these valuable resources.</span></span></span></span></li><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">For\r\n the first time in Far Cry, the adventure is not just local. Venture \r\noutside of Hope County on thrilling Expeditions to unique and memorable \r\nlocations across the USA including wetlands, canyons, and coastal \r\nregions.</span><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></span></li><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:Symbol\" lang=\"EN-US\"></span><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Expeditions\r\n and Outposts are different every playthrough, for rewarding missions \r\nthat increase in challenge and are surprising every time. </span></span></span></span></li></ul>						','							<div class=\"section-content requirements-min\">\r\n                <h3>MINIMUM CONFIGURATION:</h3>\r\n\r\n<ul><li><font style=\"color:#bcbcbc;\">OPERATING SYSTEM: </font>Windows 7 SP1, Windows 8.1, Windows 10 (64bit versions only)</li><li><font style=\"color:#bcbcbc;\">PROCESSOR: </font>Intel Core i5 2400 @ 3.1 GHz or AMD FX 6350 @ 3.9 GHz</li><li><font style=\"color:#bcbcbc;\">RAM: </font>8GB</li><li><font style=\"color:#bcbcbc;\">VIDEO CARD: </font>NVIDIA GeForce GTX 670 (2GB) or AMD Radeon R9 270X (2GB) or better</li><li><font style=\"color:#bcbcbc;\">RESOLUTION: </font>720p</li><li><font style=\"color:#bcbcbc;\">VIDEO PRESET: </font>Low</li><li><font style=\"color:#bcbcbc;\">DIRECTX: </font>June2010 Redistributable</li><li><font style=\"color:#bcbcbc;\">SOUND: </font>DirectX 9.0c compatible sound card with latest drivers</li><li><font style=\"color:#bcbcbc;\">HARD DRIVE: </font>30 GB available space</li><li><font style=\"color:#bcbcbc;\">PERIPHERALS: </font>Windows-compatible keyboard, mouse, headset</li></ul>\r\n\r\n<p> </p>\r\n            </div>\r\n        \r\n\r\n        \r\n            \r\n                <h3>RECOMMENDED CONFIGURATION:</h3>\r\n\r\n<ul><li><font style=\"color:#bcbcbc;\">OPERATING SYSTEM: </font>Windows 7 SP1, Windows 8.1, Windows 10 (64bit versions only)</li><li><font style=\"color:#bcbcbc;\">PROCESSOR: </font>Intel Core i7-4790 @ 3.6 GHz or AMD Ryzen 5 1600 @ 3.2 GHz</li><li><font style=\"color:#bcbcbc;\">RAM: </font>8GB</li><li><font style=\"color:#bcbcbc;\">VIDEO CARD: </font>NVIDIA GeForce GTX 970 (4GB) or AMD Radeon R9 290X (4GB) or better</li><li><font style=\"color:#bcbcbc;\">RESOLUTION: </font>1080p</li><li><font style=\"color:#bcbcbc;\">VIDEO PRESET: </font>High</li><li><font style=\"color:#bcbcbc;\">DIRECTX: </font>DirectX June2010 Redistributable</li><li><font style=\"color:#bcbcbc;\">SOUND: </font>DirectX 9.0c compatible sound card with latest drivers</li><li><font style=\"color:#bcbcbc;\">HARD DRIVE: </font>30 GB available space</li><li><font style=\"color:#bcbcbc;\">PERIPHERALS: </font>Windows-compatible keyboard, mouse, headset <br></li></ul>						');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('1','2') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@gmail.com','$2y$10$I52FUe8oEeyXPw8y6olwD.m12vecYpd0FiS66r2iN08cOiRmHE.I6','1'),(2,'demo','demo@gmail.com','$2y$10$qP4PexMvYub6df.6xrXVZOw7JINRy6iSQiBhz.aO6DFDC2dqUVUGm','1'),(5,'user','user@gmail.com','$2y$10$pdl1pLYi305EZ4WGc1BnfeboLPY/sTS4JJd3TbC9edOH.KPzAPtLe','2'),(6,'uudin','udinyeah@yahoo.com','$2y$10$0JfnYVR.l6vnNL232bDEH.v3hL/ybdrynndpFnQHHznu/XP08w5mm','2');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-28 22:07:52
