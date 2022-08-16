-- MySQL dump 10.16  Distrib 10.2.31-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: u7050039_gisel
-- ------------------------------------------------------
-- Server version	10.2.31-MariaDB

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
-- Current Database: `u7050039_gisel`
--


--
-- Table structure for table `guess`
--

DROP TABLE IF EXISTS `guess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guess` (
  `id_guess` char(4) NOT NULL,
  `question` text NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `id_lesson` char(3) NOT NULL,
  `score_weight` int(3) NOT NULL,
  PRIMARY KEY (`id_guess`),
  KEY `id_lesson` (`id_lesson`),
  CONSTRAINT `guess_ibfk_1` FOREIGN KEY (`id_lesson`) REFERENCES `lesson` (`id_lesson`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guess`
--

LOCK TABLES `guess` WRITE;
/*!40000 ALTER TABLE `guess` DISABLE KEYS */;
INSERT INTO `guess` (`id_guess`, `question`, `correct_answer`, `id_lesson`, `score_weight`) VALUES ('g001','Pada sebuah tabel jurusan terdapat beberapa field di antaranya kode_jurusan, dan nama_jurusan. Bagaimana query untuk menampilkan seluruh field dari data jurusan yang ada?','select * from jurusan;','l01',25),('g002','Pada sebuah tabel mahasiswa terdapat beberapa field di antaranya nim, nama, jenis_kelamin, tgl_lahir, dan kota_asal. Bagaimana query untuk menampilkan data mahasiswa dengan jenis kelamin perempuan?','select * from mahasiswa where jenis_kelamin=’perempuan’;','l02',75),('g003','Pada sebuah tabel mahasiswa terdapat beberapa field di antaranya nim, nama, jenis_kelamin, tgl_lahir, dan kota_asal. Bagaimana query untuk menampilkan data mahasiswa yang bukan berjenis kelamin perempuan dan berasal dari kota Bekasi atau Karawang?','select * from mahasiswa where not jenis_kelamin=’perempuan’ and (kota_asal=’Bekasi’ or kota_asal=’Karawang’);','l03',125),('g004','Pada sebuah tabel mahasiswa terdapat beberapa field di antaranya nim, nama, jenis_kelamin, tgl_lahir, dan kota_asal. Bagaimana query untuk menampilkan data mahasiswa diurutkan berdasarkan kota_asal dari a ke z, dan tgl_lahir dari yang termuda?','select * from mahasiswa order by kota_asal asc, tgl_lahir desc;','l04',75),('g005','Pada sebuah tabel mahasiswa terdapat beberapa field di antaranya nim, nama, jenis_kelamin, tgl_lahir, dan kota_asal. Bagaimana query untuk menampilkan 10 data mahasiswa termuda?','select * from mahasiswa order by tgl_lahir desc limit 10;','l08',80),('g006','Pada sebuah tabel mahasiswa terdapat beberapa field di antaranya nim, nama, jenis_kelamin, tgl_lahir, kota_asal, dan jumlah_saudara. Bagaimana query untuk menampilkan nama mahasiswa yang memiliki jumlah saudara paling banyak?','select nama, max(jumlah_saudara) from mahasiswa;','l09',75),('g007','Pada sebuah tabel mahasiswa terdapat beberapa field di antaranya nim, nama, jenis_kelamin, tgl_lahir, dan kota_asal. Bagaimana query untuk menampilkan jumlah mahasiswa yang berasal dari kota Bekasi?','select count(nama) from mahasiswa where kota_asal=’Bekasi’;','l10',80),('g008','Pada sebuah tabel mahasiswa terdapat beberapa field di antaranya nim, nama, jenis_kelamin, tgl_lahir, dan kota_asal. Bagaimana query untuk menampilkan data mahasiswa pada angkatan tertentu (2018) berdasarkan dari nim?','select * from mahasiswa where nim like ‘180%’;','l11',75),('g009','Pada sebuah tabel mahasiswa terdapat beberapa field di antaranya nim, nama, jenis_kelamin, tgl_lahir, dan kota_asal. Bagaimana query untuk menampilkan data tempat tanggal lahir dengan format seperti berikut “kota_asal, tgl_lahir”?','select concat(kota_asal,’, ‘,tgl_lahir) as ttl from mahasiswa;','l15',100),('g010','Pada sebuah tabel calon_mahasiswa terdapat beberapa field di antaranya nama, jenis_kelamin, dan id_jurusan_pilihan. Dan tabel pilihan_jurusan dengan field id_jurusan, dan nama_jurusan. Bagaimana query untuk menampilkan data calon mahasiswa yang telah memilih jurusan?','select calon_mahasiswa.nama, pilihan_jurusan.nama_jurusan from calon_mahasiswa inner join pilihan_jurusan on calon_mahasiswa.id_jurusan_pilihan = pilihan_jurusan.id_jurusan;','l16',90),('g011','Pada sebuah tabel calon_mahasiswa terdapat beberapa field di antaranya nama, jenis_kelamin, dan id_jurusan_pilihan. Dan tabel pilihan_jurusan dengan field id_jurusan, dan nama_jurusan. Bagaimana query untuk menampilkan seluruh data calon mahasiswa yang sudah memilih jurusan maupun yang belum memilih?','select calon_mahasiswa.nama, pilihan_jurusan.nama_jurusan from calon_mahasiswa left join pilihan_jurusan on calon_mahasiswa.id_jurusan_pilihan = pilihan_jurusan.id_jurusan;','l17',90),('g012','Pada sebuah tabel calon_mahasiswa terdapat beberapa field di antaranya nama, jenis_kelamin, dan id_jurusan_pilihan. Dan tabel pilihan_jurusan dengan field id_jurusan, dan nama_jurusan. Bagaimana query untuk menampilkan seluruh data jurusan maupun yang belum sudah ataupun belum dipilih?','select calon_mahasiswa.nama, pilihan_jurusan.nama_jurusan from calon_mahasiswa right join pilihan_jurusan on calon_mahasiswa.id_jurusan_pilihan = pilihan_jurusan.id_jurusan;','l18',90),('g013','Pada sebuah tabel mahasiswa terdapat beberapa field di antaranya nim, nama, jenis_kelamin, tgl_lahir, dan kota_asal. Bagaimana query untuk menampilkan data jumlah mahasiswa dari setiap kota_asal yang sama ditampilkan dengan nama kolom jumlahMahasiswa dan diurutkan berdasarkan kota_asal dari atas ke bawah?','select count(nama) as jumlahMahasiswa, kota_asal from mahasiswa group by kota_asal order by kota_asal;','l22',100),('g014','Pada sebuah tabel mahasiswa terdapat beberapa field di antaranya nim, nama, jenis_kelamin, tgl_lahir, dan kota_asal. Bagaimana query untuk menampilkan data jumlah mahasiswa dari setiap kota_asal yang memiliki jumlah mahasiswa lebih dari 100 ditampilkan dengan nama kolom jumlahMahasiswa?','select count(nama) as jumlahMahasiswa, kota_asal from mahasiswa group by kota_asal having count(nama) > 100;','l23',125);
/*!40000 ALTER TABLE `guess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson` (
  `id_lesson` char(3) NOT NULL,
  `lesson_name` varchar(50) NOT NULL,
  `level` enum('beginner','intermediate','advanced','expert') NOT NULL,
  `position` int(2) NOT NULL,
  `content` text NOT NULL,
  `url_video` varchar(255) NOT NULL,
  `icon` varchar(100) NOT NULL,
  PRIMARY KEY (`id_lesson`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` (`id_lesson`, `lesson_name`, `level`, `position`, `content`, `url_video`, `icon`) VALUES ('l01','Select','beginner',1,'select.html','select.mp4','select.png'),('l02','Where','beginner',2,'where.html','where.mp4','where.png'),('l03','And, Or, Not','beginner',3,'aon.html','aon.mp4','aon.png'),('l04','Order By','beginner',4,'ob.html','ob.mp4','ob.png'),('l05','Insert','beginner',5,'insert.html','insert.mp4','insert.png'),('l06','Update','beginner',6,'update.html','update.mp4','update.png'),('l07','Delete','beginner',7,'delete.html','delete.mp4','delete.png'),('l08','Select Top','intermediate',1,'st.html','st.mp4','st.png'),('l09','Min and Max','intermediate',2,'mam.html','mam.mp4','mam.png'),('l10','Count, Avg, Sum','intermediate',3,'cas.html','cas.mp4','cas.png'),('l11','Like','intermediate',4,'like.html','like.mp4','like.png'),('l12','Wildcards','intermediate',5,'wildcards.html','wildcards.mp4','wildcards.png'),('l13','In','intermediate',6,'in.html','in.mp4','in.png'),('l14','Between','intermediate',7,'between.html','between.mp4','between.png'),('l15','Aliases','advanced',1,'alias.html','alias.mp4','alias.png'),('l16','Inner Join','advanced',2,'ij.html','ij.mp4','ij.png'),('l17','Left Join','advanced',3,'lj.html','lj.mp4','lj.png'),('l18','Right Join','advanced',4,'rj.html','rj.mp4','rj.png'),('l19','Full Join','advanced',5,'fj.html','fj.mp4','fj.png'),('l20','Self Join','advanced',6,'sj.html','sj.mp4','sj.png'),('l21','Union','advanced',7,'union.html','union.mp4','union.png'),('l22','Group By','expert',1,'gb.html','gb.mp4','gb.png'),('l23','Having','expert',2,'having.html','having.mp4','having.png'),('l24','Exists','expert',3,'exists.html','exists.mp4','exists.png'),('l25','Any, All','expert',4,'aa.html','aa.mp4','aa.png'),('l26','Case','expert',5,'case.html','case.mp4','case.png'),('l27','Null Functions','expert',6,'nf.html','nf.mp4','nf.png'),('l28','Stored Procedures','expert',7,'sp.html','sp.mp4','sp.png');
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progressG_seq`
--

DROP TABLE IF EXISTS `progressG_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progressG_seq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progressG_seq`
--

LOCK TABLES `progressG_seq` WRITE;
/*!40000 ALTER TABLE `progressG_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `progressG_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progressGuess`
--

DROP TABLE IF EXISTS `progressGuess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progressGuess` (
  `id_progguess` char(8) NOT NULL,
  `id_user` char(5) NOT NULL,
  `id_guess` char(4) NOT NULL,
  `answer` text NOT NULL,
  `type_answer` enum('true','false','error','wrong') NOT NULL,
  `dtAnswer` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_progguess`),
  KEY `id_user` (`id_user`),
  KEY `id_quiz` (`id_guess`),
  CONSTRAINT `progressGuess_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `progressGuess_ibfk_2` FOREIGN KEY (`id_guess`) REFERENCES `guess` (`id_guess`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progressGuess`
--

LOCK TABLES `progressGuess` WRITE;
/*!40000 ALTER TABLE `progressGuess` DISABLE KEYS */;
/*!40000 ALTER TABLE `progressGuess` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`u7050039`@`localhost`*/ /*!50003 TRIGGER `tg_pg_insert` BEFORE INSERT ON `progressGuess` FOR EACH ROW BEGIN
  INSERT INTO progressG_seq VALUES (NULL);
  SET NEW.id_progguess = CONCAT('s', LPAD(LAST_INSERT_ID(), 7, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `progressL_seq`
--

DROP TABLE IF EXISTS `progressL_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progressL_seq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progressL_seq`
--

LOCK TABLES `progressL_seq` WRITE;
/*!40000 ALTER TABLE `progressL_seq` DISABLE KEYS */;
INSERT INTO `progressL_seq` (`id`) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(91),(92),(93),(94),(95),(96),(97),(98),(99),(100),(101),(102),(103),(104),(105),(106),(107),(108),(109),(110),(111),(112),(113),(114),(115),(116),(117),(118),(119),(120),(121),(122),(123),(124),(125),(126),(127),(128),(129),(130),(131),(132),(133),(134),(135),(136),(137),(138),(139),(140),(141),(142),(143),(144),(145),(146),(147),(148),(149),(150),(151),(152),(153),(154),(155),(156),(157),(158),(159),(160),(161),(162),(163),(164),(165),(166),(167),(168),(169),(170),(171),(172),(173),(174),(175),(176),(177),(178),(179),(180),(181),(182),(183),(184),(185),(186),(187),(188),(189),(190),(191),(192),(193),(194),(195),(196),(197),(198),(199),(200),(201),(202),(203),(204),(205),(206),(207),(208),(209),(210),(211),(212),(213),(214),(215),(216),(217),(218),(219),(220),(221),(222),(223),(224),(225),(226),(227),(228),(229),(230),(231),(232),(233),(234),(235),(236),(237),(238),(239),(240),(241),(242),(243),(244),(245),(246),(247),(248),(249),(250),(251),(252);
/*!40000 ALTER TABLE `progressL_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progressLearn`
--

DROP TABLE IF EXISTS `progressLearn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progressLearn` (
  `id_proglearn` char(7) NOT NULL,
  `id_user` char(5) NOT NULL,
  `id_lesson` char(3) NOT NULL,
  `dt_finish` datetime DEFAULT NULL,
  `score` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_proglearn`),
  KEY `id_user` (`id_user`),
  KEY `id_lesson` (`id_lesson`),
  CONSTRAINT `progressLearn_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `progressLearn_ibfk_2` FOREIGN KEY (`id_lesson`) REFERENCES `lesson` (`id_lesson`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progressLearn`
--

LOCK TABLES `progressLearn` WRITE;
/*!40000 ALTER TABLE `progressLearn` DISABLE KEYS */;
INSERT INTO `progressLearn` (`id_proglearn`, `id_user`, `id_lesson`, `dt_finish`, `score`) VALUES ('p000001','u0001','l01','2020-05-31 23:54:47',25),('p000002','u0001','l02',NULL,0),('p000003','u0001','l03',NULL,NULL),('p000004','u0001','l04',NULL,NULL),('p000005','u0001','l05',NULL,NULL),('p000006','u0001','l06',NULL,NULL),('p000007','u0001','l07',NULL,NULL),('p000008','u0001','l08',NULL,NULL),('p000009','u0001','l09',NULL,NULL),('p000010','u0001','l10',NULL,NULL),('p000011','u0001','l11',NULL,NULL),('p000012','u0001','l12',NULL,NULL),('p000013','u0001','l13',NULL,NULL),('p000014','u0001','l14',NULL,NULL),('p000015','u0001','l15',NULL,NULL),('p000016','u0001','l16',NULL,NULL),('p000017','u0001','l17',NULL,NULL),('p000018','u0001','l18',NULL,NULL),('p000019','u0001','l19',NULL,NULL),('p000020','u0001','l20',NULL,NULL),('p000021','u0001','l21',NULL,NULL),('p000022','u0001','l22',NULL,NULL),('p000023','u0001','l23',NULL,NULL),('p000024','u0001','l24',NULL,NULL),('p000025','u0001','l25',NULL,NULL),('p000026','u0001','l26',NULL,NULL),('p000027','u0001','l27',NULL,NULL),('p000028','u0001','l28',NULL,NULL),('p000029','u0002','l01',NULL,0),('p000030','u0002','l02',NULL,NULL),('p000031','u0002','l03',NULL,NULL),('p000032','u0002','l04',NULL,NULL),('p000033','u0002','l05',NULL,NULL),('p000034','u0002','l06',NULL,NULL),('p000035','u0002','l07',NULL,NULL),('p000036','u0002','l08',NULL,NULL),('p000037','u0002','l09',NULL,NULL),('p000038','u0002','l10',NULL,NULL),('p000039','u0002','l11',NULL,NULL),('p000040','u0002','l12',NULL,NULL),('p000041','u0002','l13',NULL,NULL),('p000042','u0002','l14',NULL,NULL),('p000043','u0002','l15',NULL,NULL),('p000044','u0002','l16',NULL,NULL),('p000045','u0002','l17',NULL,NULL),('p000046','u0002','l18',NULL,NULL),('p000047','u0002','l19',NULL,NULL),('p000048','u0002','l20',NULL,NULL),('p000049','u0002','l21',NULL,NULL),('p000050','u0002','l22',NULL,NULL),('p000051','u0002','l23',NULL,NULL),('p000052','u0002','l24',NULL,NULL),('p000053','u0002','l25',NULL,NULL),('p000054','u0002','l26',NULL,NULL),('p000055','u0002','l27',NULL,NULL),('p000056','u0002','l28',NULL,NULL),('p000057','u0003','l01',NULL,0),('p000058','u0003','l02',NULL,NULL),('p000059','u0003','l03',NULL,NULL),('p000060','u0003','l04',NULL,NULL),('p000061','u0003','l05',NULL,NULL),('p000062','u0003','l06',NULL,NULL),('p000063','u0003','l07',NULL,NULL),('p000064','u0003','l08',NULL,NULL),('p000065','u0003','l09',NULL,NULL),('p000066','u0003','l10',NULL,NULL),('p000067','u0003','l11',NULL,NULL),('p000068','u0003','l12',NULL,NULL),('p000069','u0003','l13',NULL,NULL),('p000070','u0003','l14',NULL,NULL),('p000071','u0003','l15',NULL,NULL),('p000072','u0003','l16',NULL,NULL),('p000073','u0003','l17',NULL,NULL),('p000074','u0003','l18',NULL,NULL),('p000075','u0003','l19',NULL,NULL),('p000076','u0003','l20',NULL,NULL),('p000077','u0003','l21',NULL,NULL),('p000078','u0003','l22',NULL,NULL),('p000079','u0003','l23',NULL,NULL),('p000080','u0003','l24',NULL,NULL),('p000081','u0003','l25',NULL,NULL),('p000082','u0003','l26',NULL,NULL),('p000083','u0003','l27',NULL,NULL),('p000084','u0003','l28',NULL,NULL),('p000085','u0004','l01',NULL,0),('p000086','u0004','l02',NULL,NULL),('p000087','u0004','l03',NULL,NULL),('p000088','u0004','l04',NULL,NULL),('p000089','u0004','l05',NULL,NULL),('p000090','u0004','l06',NULL,NULL),('p000091','u0004','l07',NULL,NULL),('p000092','u0004','l08',NULL,NULL),('p000093','u0004','l09',NULL,NULL),('p000094','u0004','l10',NULL,NULL),('p000095','u0004','l11',NULL,NULL),('p000096','u0004','l12',NULL,NULL),('p000097','u0004','l13',NULL,NULL),('p000098','u0004','l14',NULL,NULL),('p000099','u0004','l15',NULL,NULL),('p000100','u0004','l16',NULL,NULL),('p000101','u0004','l17',NULL,NULL),('p000102','u0004','l18',NULL,NULL),('p000103','u0004','l19',NULL,NULL),('p000104','u0004','l20',NULL,NULL),('p000105','u0004','l21',NULL,NULL),('p000106','u0004','l22',NULL,NULL),('p000107','u0004','l23',NULL,NULL),('p000108','u0004','l24',NULL,NULL),('p000109','u0004','l25',NULL,NULL),('p000110','u0004','l26',NULL,NULL),('p000111','u0004','l27',NULL,NULL),('p000112','u0004','l28',NULL,NULL),('p000113','u0005','l01',NULL,0),('p000114','u0005','l02',NULL,NULL),('p000115','u0005','l03',NULL,NULL),('p000116','u0005','l04',NULL,NULL),('p000117','u0005','l05',NULL,NULL),('p000118','u0005','l06',NULL,NULL),('p000119','u0005','l07',NULL,NULL),('p000120','u0005','l08',NULL,NULL),('p000121','u0005','l09',NULL,NULL),('p000122','u0005','l10',NULL,NULL),('p000123','u0005','l11',NULL,NULL),('p000124','u0005','l12',NULL,NULL),('p000125','u0005','l13',NULL,NULL),('p000126','u0005','l14',NULL,NULL),('p000127','u0005','l15',NULL,NULL),('p000128','u0005','l16',NULL,NULL),('p000129','u0005','l17',NULL,NULL),('p000130','u0005','l18',NULL,NULL),('p000131','u0005','l19',NULL,NULL),('p000132','u0005','l20',NULL,NULL),('p000133','u0005','l21',NULL,NULL),('p000134','u0005','l22',NULL,NULL),('p000135','u0005','l23',NULL,NULL),('p000136','u0005','l24',NULL,NULL),('p000137','u0005','l25',NULL,NULL),('p000138','u0005','l26',NULL,NULL),('p000139','u0005','l27',NULL,NULL),('p000140','u0005','l28',NULL,NULL),('p000141','u0006','l01',NULL,0),('p000142','u0006','l02',NULL,NULL),('p000143','u0006','l03',NULL,NULL),('p000144','u0006','l04',NULL,NULL),('p000145','u0006','l05',NULL,NULL),('p000146','u0006','l06',NULL,NULL),('p000147','u0006','l07',NULL,NULL),('p000148','u0007','l01',NULL,0),('p000149','u0006','l08',NULL,NULL),('p000150','u0007','l02',NULL,NULL),('p000151','u0006','l09',NULL,NULL),('p000152','u0007','l03',NULL,NULL),('p000153','u0006','l10',NULL,NULL),('p000154','u0007','l04',NULL,NULL),('p000155','u0006','l11',NULL,NULL),('p000156','u0007','l05',NULL,NULL),('p000157','u0006','l12',NULL,NULL),('p000158','u0007','l06',NULL,NULL),('p000159','u0006','l13',NULL,NULL),('p000160','u0006','l14',NULL,NULL),('p000161','u0007','l07',NULL,NULL),('p000162','u0006','l15',NULL,NULL),('p000163','u0007','l08',NULL,NULL),('p000164','u0006','l16',NULL,NULL),('p000165','u0007','l09',NULL,NULL),('p000166','u0006','l17',NULL,NULL),('p000167','u0007','l10',NULL,NULL),('p000168','u0006','l18',NULL,NULL),('p000169','u0007','l11',NULL,NULL),('p000170','u0006','l19',NULL,NULL),('p000171','u0007','l12',NULL,NULL),('p000172','u0006','l20',NULL,NULL),('p000173','u0007','l13',NULL,NULL),('p000174','u0006','l21',NULL,NULL),('p000175','u0007','l14',NULL,NULL),('p000176','u0006','l22',NULL,NULL),('p000177','u0007','l15',NULL,NULL),('p000178','u0006','l23',NULL,NULL),('p000179','u0007','l16',NULL,NULL),('p000180','u0006','l24',NULL,NULL),('p000181','u0007','l17',NULL,NULL),('p000182','u0006','l25',NULL,NULL),('p000183','u0007','l18',NULL,NULL),('p000184','u0006','l26',NULL,NULL),('p000185','u0007','l19',NULL,NULL),('p000186','u0006','l27',NULL,NULL),('p000187','u0007','l20',NULL,NULL),('p000188','u0006','l28',NULL,NULL),('p000189','u0007','l21',NULL,NULL),('p000190','u0007','l22',NULL,NULL),('p000191','u0007','l23',NULL,NULL),('p000192','u0007','l24',NULL,NULL),('p000193','u0007','l25',NULL,NULL),('p000194','u0007','l26',NULL,NULL),('p000195','u0007','l27',NULL,NULL),('p000196','u0007','l28',NULL,NULL),('p000197','u0008','l01',NULL,0),('p000198','u0008','l02',NULL,NULL),('p000199','u0008','l03',NULL,NULL),('p000200','u0008','l04',NULL,NULL),('p000201','u0008','l05',NULL,NULL),('p000202','u0008','l06',NULL,NULL),('p000203','u0008','l07',NULL,NULL),('p000204','u0008','l08',NULL,NULL),('p000205','u0008','l09',NULL,NULL),('p000206','u0008','l10',NULL,NULL),('p000207','u0008','l11',NULL,NULL),('p000208','u0008','l12',NULL,NULL),('p000209','u0008','l13',NULL,NULL),('p000210','u0008','l14',NULL,NULL),('p000211','u0008','l15',NULL,NULL),('p000212','u0008','l16',NULL,NULL),('p000213','u0008','l17',NULL,NULL),('p000214','u0008','l18',NULL,NULL),('p000215','u0008','l19',NULL,NULL),('p000216','u0008','l20',NULL,NULL),('p000217','u0008','l21',NULL,NULL),('p000218','u0008','l22',NULL,NULL),('p000219','u0008','l23',NULL,NULL),('p000220','u0008','l24',NULL,NULL),('p000221','u0008','l25',NULL,NULL),('p000222','u0008','l26',NULL,NULL),('p000223','u0008','l27',NULL,NULL),('p000224','u0008','l28',NULL,NULL),('p000225','u0009','l01','2020-06-18 12:37:56',25),('p000226','u0009','l02',NULL,0),('p000227','u0009','l03',NULL,NULL),('p000228','u0009','l04',NULL,NULL),('p000229','u0009','l05',NULL,NULL),('p000230','u0009','l06',NULL,NULL),('p000231','u0009','l07',NULL,NULL),('p000232','u0009','l08',NULL,NULL),('p000233','u0009','l09',NULL,NULL),('p000234','u0009','l10',NULL,NULL),('p000235','u0009','l11',NULL,NULL),('p000236','u0009','l12',NULL,NULL),('p000237','u0009','l13',NULL,NULL),('p000238','u0009','l14',NULL,NULL),('p000239','u0009','l15',NULL,NULL),('p000240','u0009','l16',NULL,NULL),('p000241','u0009','l17',NULL,NULL),('p000242','u0009','l18',NULL,NULL),('p000243','u0009','l19',NULL,NULL),('p000244','u0009','l20',NULL,NULL),('p000245','u0009','l21',NULL,NULL),('p000246','u0009','l22',NULL,NULL),('p000247','u0009','l23',NULL,NULL),('p000248','u0009','l24',NULL,NULL),('p000249','u0009','l25',NULL,NULL),('p000250','u0009','l26',NULL,NULL),('p000251','u0009','l27',NULL,NULL),('p000252','u0009','l28',NULL,NULL);
/*!40000 ALTER TABLE `progressLearn` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_pl_insert` BEFORE INSERT ON `progressLearn` FOR EACH ROW BEGIN
  INSERT INTO progressL_seq VALUES (NULL);
  SET NEW.id_proglearn = CONCAT('p', LPAD(LAST_INSERT_ID(), 6, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `progressQ_seq`
--

DROP TABLE IF EXISTS `progressQ_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progressQ_seq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progressQ_seq`
--

LOCK TABLES `progressQ_seq` WRITE;
/*!40000 ALTER TABLE `progressQ_seq` DISABLE KEYS */;
INSERT INTO `progressQ_seq` (`id`) VALUES (1),(2);
/*!40000 ALTER TABLE `progressQ_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progressQuiz`
--

DROP TABLE IF EXISTS `progressQuiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progressQuiz` (
  `id_progquiz` char(8) NOT NULL,
  `id_user` char(5) NOT NULL,
  `id_quiz` char(4) NOT NULL,
  `answer` int(1) NOT NULL,
  `type_answer` enum('true','false') NOT NULL,
  `dtAnswer` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_progquiz`),
  KEY `id_user` (`id_user`),
  KEY `id_quiz` (`id_quiz`),
  CONSTRAINT `progressQuiz_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `progressQuiz_ibfk_2` FOREIGN KEY (`id_quiz`) REFERENCES `quiz` (`id_quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progressQuiz`
--

LOCK TABLES `progressQuiz` WRITE;
/*!40000 ALTER TABLE `progressQuiz` DISABLE KEYS */;
INSERT INTO `progressQuiz` (`id_progquiz`, `id_user`, `id_quiz`, `answer`, `type_answer`, `dtAnswer`) VALUES ('z0000001','u0001','q001',3,'true','2020-05-31 23:54:39'),('z0000002','u0009','q001',3,'true','2020-06-18 12:32:07');
/*!40000 ALTER TABLE `progressQuiz` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`u7050039`@`localhost`*/ /*!50003 TRIGGER `tg_pq_insert` BEFORE INSERT ON `progressQuiz` FOR EACH ROW BEGIN
  INSERT INTO progressQ_seq VALUES (NULL);
  SET NEW.id_progquiz = CONCAT('z', LPAD(LAST_INSERT_ID(), 7, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz` (
  `id_quiz` char(4) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer1` varchar(255) NOT NULL,
  `answer2` varchar(255) NOT NULL,
  `answer3` varchar(255) NOT NULL,
  `answer4` varchar(255) NOT NULL,
  `answer_key` int(1) NOT NULL,
  `id_lesson` char(3) NOT NULL,
  PRIMARY KEY (`id_quiz`),
  KEY `id_lesson` (`id_lesson`),
  CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`id_lesson`) REFERENCES `lesson` (`id_lesson`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` (`id_quiz`, `question`, `answer1`, `answer2`, `answer3`, `answer4`, `answer_key`, `id_lesson`) VALUES ('q001','Perintah select digunakan untuk memilih?','Database','Table','Data pada table','Table pada database',3,'l01'),('q002','Pernyataan where dapat digunakan pada perintah, kecuali?','Select','Insert','Update','Delete',2,'l02'),('q003','Berikut ini yang tidak termasuk dalam operator logika adalah..','Equal','Not','And','Or',1,'l03'),('q004','Berikut ini yang merupakan kegunaan ORDER BY dengan keyword ASC pada data teks adalah..','Mengurutkan dari z ke a','Mengurutkan dari a ke z','Mengurutkan dari 0 ke 9','Mengurutkan dari 9 ke 0',2,'l04'),('q005','Di setiap sistem database memiliki cara yang berbeda untuk menampilkan data teratas, berikut ini yang bukan termasuk adalah..','Select Top','Limit','Rownum','Max',4,'l08'),('q006','Berikut ini yang merupakan tujuan dari statement max pada query adalah..','mengembalikan nilai terbesar dari data pada kolom yang dipilih','mengembalikan nilai terkecil dari data pada kolom yang dipilih','mengurutkan data dari terbesar ke terkecil','mengurutkan data dari terkecil ke terbesar',1,'l09'),('q007','Berikut ini pernyataan yang salah tentang fungsi count(), avg(), dan sum() adalah..','count untuk mengembalikan nilai jumlah data kolom yang dipilih','count untuk mengembalikan nilai hasil perhitungan dari jumlah baris dari tabel','avg untuk mengembalikan nilai rata-rata dari kolom yang terpilih','sum untuk mengembalikan nilai jumlah data baris yang dipilih',1,'l10'),('q008','Berikut ini yang tidak dapat dilakukan oleh operator like, adalah.. ','LIKE ‘a%‘','LIKE ‘%or%‘','LIKE ‘_r%‘','LIKE ‘%_%’',4,'l11'),('q009','Aliases saat select from table digunakan untuk memberikan nama sementara pada..','table','column','baris','database',2,'l15'),('q010','Inner join berfungsi untuk mengambil data dari beberapa tabel yang digabungkan jika..','data pada kolom terdapat pada tabel ke-1 dan tabel ke-2','data pada kolom tabel ke-1 ditampilkan semua walaupun tidak ada pada kolom tabel ke-2','data pada kolom tabel ke-2 ditampilkan semua walaupun tidak ada pada kolom tabel ke-1','data pada kedua kolom tabel ditampilkan semua walaupun tidak saling terdapat',1,'l16'),('q011','Left join berfungsi untuk mengambil data dari beberapa tabel yang digabungkan jika..','data pada kolom terdapat pada tabel ke-1 dan tabel ke-2','data pada kolom tabel ke-1 ditampilkan semua walaupun tidak ada pada kolom tabel ke-2','data pada kolom tabel ke-2 ditampilkan semua walaupun tidak ada pada kolom tabel ke-1','data pada kedua kolom tabel ditampilkan semua walaupun tidak saling terdapat',2,'l17'),('q012','Right join berfungsi untuk mengambil data dari beberapa tabel yang digabungkan jika..','data pada kolom terdapat pada tabel ke-1 dan tabel ke-2','data pada kolom tabel ke-1 ditampilkan semua walaupun tidak ada pada kolom tabel ke-2','data pada kolom tabel ke-2 ditampilkan semua walaupun tidak ada pada kolom tabel ke-1','data pada kedua kolom tabel ditampilkan semua walaupun tidak saling terdapat',3,'l18'),('q013','Group by digunakan untuk menggabungkan beberapa..','tabel yang sama','kolom yang sama','baris yang sama','database yang sama',2,'l22'),('q014','Berikut ini operator perbandingan yang tidak dapat digunakan pada pernyataan having..','>','<','=','&&',4,'l23');
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_image`
--

DROP TABLE IF EXISTS `upload_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_image` (
  `pathToFile` varchar(255) NOT NULL,
  UNIQUE KEY `pathToFile` (`pathToFile`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_image`
--

LOCK TABLES `upload_image` WRITE;
/*!40000 ALTER TABLE `upload_image` DISABLE KEYS */;
INSERT INTO `upload_image` (`pathToFile`) VALUES ('http://zeecodeku.xyz/gisel/img_photo/1590816886592.jpg'),('http://zeecodeku.xyz/gisel/img_photo/1590826015051.jpg'),('http://zeecodeku.xyz/gisel/img_photo/1590943260322.jpg'),('http://zeecodeku.xyz/gisel/img_photo/1590943345769.jpg'),('http://zeecodeku.xyz/gisel/img_photo/1591889737189.jpg'),('http://zeecodeku.xyz/gisel/img_photo/1592027169683.jpg'),('http://zeecodeku.xyz/gisel/img_photo/1592457879307.jpg'),('http://zeecodeku.xyz/gisel/img_photo/1592458065108.jpg');
/*!40000 ALTER TABLE `upload_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` char(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `age` int(2) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `dt_join` datetime NOT NULL DEFAULT current_timestamp(),
  `img_photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id_user`, `username`, `password`, `fullname`, `age`, `gender`, `dt_join`, `img_photo`) VALUES ('u0001','_robbyakbar','$2y$10$3jlE4dXn2bIYFLWSxQm3vOZxeQhA4GC7n6BthgBGqegKmmpdCT4Wq','Robby Akbar',20,'Male','2020-05-30 12:37:19','http://zeecodeku.xyz/gisel/img_photo/1590816886592.jpg'),('u0002','ibbor','$2y$10$suoSj52Lud3UcdBXEPSX1OSwuDfvQbJIwQk7nyrnQ1FhQ82uBywQa','Rabka Ibbor',18,'Male','2020-05-30 15:09:15','http://zeecodeku.xyz/gisel/img_photo/1590826015051.jpg'),('u0003','ddss','$2y$10$TdNw7t6AMNCQ81uFV/3E2OPrjcVO2snAQtzUjG9LG9lTFj4.veeXm','Duma Diani Sari',20,'Female','2020-05-31 23:43:18','http://zeecodeku.xyz/gisel/img_photo/1590943260322.jpg'),('u0004','dep','$2y$10$rdRNmG92eA7qEvht3klvXuDfcWcAdx3cagQ5qg4ZKzmrWk.swfjI2','Deden Eka Purwanto',19,'Male','2020-05-31 23:44:47','http://zeecodeku.xyz/gisel/img_photo/1590943345769.jpg'),('u0005','ggg','$2y$10$anKhblmR0gqX72MZjruDku084Tf2Y7kRhYW1nzK8pbwIMPTjNiyYO','ggg',5,'Male','2020-06-11 22:36:07','http://zeecodeku.xyz/gisel/img_photo/1591889737189.jpg'),('u0006','lilin','$2y$10$aJRUZOJuKlGOLroRWAQH9.2L4OJRv8f/85rR1UqTwijpd7ZaUA0Ve','lilinlilin',123123,'Male','2020-06-13 12:46:25','http://zeecodeku.xyz/gisel/img_photo/1592027169683.jpg'),('u0007','lilin','$2y$10$E/3ubkbqiYPUV9GBQgiL/.hpU8E3pSZcfRfcfm.VKE9BJg2kheM1S','lilinlilin',123123,'Male','2020-06-13 12:46:25','http://zeecodeku.xyz/gisel/img_photo/1592027169683.jpg'),('u0008','SQLIER','$2y$10$FAiVmPyntcWaGWz3CcH0ieJUzDKbSbT1odq1z8Bp.oszPckf8cRLO','Farhan Imaduddin',1000,'Male','2020-06-18 12:26:54','http://zeecodeku.xyz/gisel/img_photo/1592457879307.jpg'),('u0009','frhn','$2y$10$8bzSHtYixjJ77Zx1bu69bO8/1m.7Lp/IZx04ifCAvQLLsf6fu/2wy','Farhan',1000,'Male','2020-06-18 12:30:28','http://zeecodeku.xyz/gisel/img_photo/1592458065108.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_seq`
--

DROP TABLE IF EXISTS `user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_seq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seq`
--

LOCK TABLES `user_seq` WRITE;
/*!40000 ALTER TABLE `user_seq` DISABLE KEYS */;
INSERT INTO `user_seq` (`id`) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9);
/*!40000 ALTER TABLE `user_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'u7050039_gisel'
--

--
-- Dumping routines for database 'u7050039_gisel'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-25 19:51:06
