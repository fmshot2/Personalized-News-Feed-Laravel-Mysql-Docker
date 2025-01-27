-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 29, 2022 at 09:18 AM
-- Server version: 8.0.28
-- PHP Version: 8.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bizcard_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `flag` varchar(250) DEFAULT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint DEFAULT NULL,
  `phonecode` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso`, `name`, `nicename`, `flag`, `iso3`, `numcode`, `phonecode`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'af.png', 'AFG', 4, 93, '2022-07-29 08:44:46', '2022-07-29 07:44:58'),
(2, 'AL', 'ALBANIA', 'Albania', 'al.png', 'ALB', 8, 355, '2022-07-29 08:44:46', '2022-07-29 07:44:58'),
(3, 'DZ', 'ALGERIA', 'Algeria', 'dz.png', 'DZA', 12, 213, '2022-07-29 08:44:46', '2022-07-29 07:44:58'),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'as.png', 'ASM', 16, 1684, '2022-07-29 08:44:46', '2022-07-29 07:44:58'),
(5, 'AD', 'ANDORRA', 'Andorra', 'ad.png', 'AND', 20, 376, '2022-07-29 08:44:46', '2022-07-29 07:44:58'),
(6, 'AO', 'ANGOLA', 'Angola', 'ao.png', 'AGO', 24, 244, '2022-07-29 08:44:46', '2022-07-29 07:44:58'),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'ai.png', 'AIA', 660, 1264, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', 'aq.png', 'ANT', NULL, 0, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ag.png', 'ATG', 28, 1268, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ar.png', 'ARG', 32, 54, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(11, 'AM', 'ARMENIA', 'Armenia', 'am.png', 'ARM', 51, 374, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(12, 'AW', 'ARUBA', 'Aruba', 'aw.png', 'ABW', 533, 297, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(13, 'AU', 'AUSTRALIA', 'Australia', 'au.png', 'AUS', 36, 61, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(14, 'AT', 'AUSTRIA', 'Austria', 'at.png', 'AUT', 40, 43, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'az.png', 'AZE', 31, 994, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'bs.png', 'BHS', 44, 1242, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'bh.png', 'BHR', 48, 973, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'bd.png', 'BGD', 50, 880, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(19, 'BB', 'BARBADOS', 'Barbados', 'bb.png', 'BRB', 52, 1246, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(20, 'BY', 'BELARUS', 'Belarus', 'by.png', 'BLR', 112, 375, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(21, 'BE', 'BELGIUM', 'Belgium', 'be.png', 'BEL', 56, 32, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(22, 'BZ', 'BELIZE', 'Belize', 'bz.png', 'BLZ', 84, 501, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(23, 'BJ', 'BENIN', 'Benin', 'bj.png', 'BEN', 204, 229, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(24, 'BM', 'BERMUDA', 'Bermuda', 'bm.png', 'BMU', 60, 1441, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(25, 'BT', 'BHUTAN', 'Bhutan', 'bt.png', 'BTN', 64, 975, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'bo.png', 'BOL', 68, 591, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'ba.png', 'BIH', 70, 387, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(28, 'BW', 'BOTSWANA', 'Botswana', 'bw.png', 'BWA', 72, 267, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', 'bv.png', 'BIS', NULL, 0, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(30, 'BR', 'BRAZIL', 'Brazil', 'br.png', 'BRA', 76, 55, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', 'io.png', 'BIT', NULL, 246, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'bn.png', 'BRN', 96, 673, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'bg.png', 'BGR', 100, 359, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'bf.png', 'BFA', 854, 226, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(35, 'BI', 'BURUNDI', 'Burundi', 'bi.png', 'BDI', 108, 257, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'kh.png', 'KHM', 116, 855, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(37, 'CM', 'CAMEROON', 'Cameroon', 'cm.png', 'CMR', 120, 237, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(38, 'CA', 'CANADA', 'Canada', 'ca.png', 'CAN', 124, 1, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'cv.png', 'CPV', 132, 238, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'ky.png', 'CYM', 136, 1345, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'cf.png', 'CAF', 140, 236, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(42, 'TD', 'CHAD', 'Chad', 'td.png', 'TCD', 148, 235, '2022-07-29 08:44:46', '2022-07-29 07:44:59'),
(43, 'CL', 'CHILE', 'Chile', 'cl.png', 'CHL', 152, 56, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(44, 'CN', 'CHINA', 'China', 'cn.png', 'CHN', 156, 86, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', 'cx.png', 'CXI', NULL, 61, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', 'cc.png', 'CCI', NULL, 672, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(47, 'CO', 'COLOMBIA', 'Colombia', 'co.png', 'COL', 170, 57, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(48, 'KM', 'COMOROS', 'Comoros', 'km.png', 'COM', 174, 269, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(49, 'CG', 'CONGO', 'Congo', 'cg.png', 'COG', 178, 242, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'cd.png', 'COD', 180, 242, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'ck.png', 'COK', 184, 682, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'cr.png', 'CRI', 188, 506, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'ci.png', 'CIV', 384, 225, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(54, 'HR', 'CROATIA', 'Croatia', 'hr.png', 'HRV', 191, 385, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(55, 'CU', 'CUBA', 'Cuba', 'cu.png', 'CUB', 192, 53, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(56, 'CY', 'CYPRUS', 'Cyprus', 'cy.png', 'CYP', 196, 357, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'cz.png', 'CZE', 203, 420, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(58, 'DK', 'DENMARK', 'Denmark', 'dk.png', 'DNK', 208, 45, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'dj.png', 'DJI', 262, 253, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(60, 'DM', 'DOMINICA', 'Dominica', 'dm.png', 'DMA', 212, 1767, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'do.png', 'DOM', 214, 1809, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ec.png', 'ECU', 218, 593, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(63, 'EG', 'EGYPT', 'Egypt', 'eg.png', 'EGY', 818, 20, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'sv.png', 'SLV', 222, 503, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'gq.png', 'GNQ', 226, 240, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(66, 'ER', 'ERITREA', 'Eritrea', 'er.png', 'ERI', 232, 291, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(67, 'EE', 'ESTONIA', 'Estonia', 'ee.png', 'EST', 233, 372, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'et.png', 'ETH', 231, 251, '2022-07-29 08:44:46', '2022-07-29 07:45:00'),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'fk.png', 'FLK', 238, 500, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'fo.png', 'FRO', 234, 298, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(71, 'FJ', 'FIJI', 'Fiji', 'fj.png', 'FJI', 242, 679, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(72, 'FI', 'FINLAND', 'Finland', 'fi.png', 'FIN', 246, 358, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(73, 'FR', 'FRANCE', 'France', 'fr.png', 'FRA', 250, 33, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'gf.png', 'GUF', 254, 594, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'pf.png', 'PYF', 258, 689, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', 'tf.png', 'TFS', NULL, 0, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(77, 'GA', 'GABON', 'Gabon', 'ga.png', 'GAB', 266, 241, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(78, 'GM', 'GAMBIA', 'Gambia', 'gm.png', 'GMB', 270, 220, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(79, 'GE', 'GEORGIA', 'Georgia', 'ge.png', 'GEO', 268, 995, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(80, 'DE', 'GERMANY', 'Germany', 'de.png', 'DEU', 276, 49, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(81, 'GH', 'GHANA', 'Ghana', 'gh.png', 'GHA', 288, 233, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'gi.png', 'GIB', 292, 350, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(83, 'GR', 'GREECE', 'Greece', 'gr.png', 'GRC', 300, 30, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(84, 'GL', 'GREENLAND', 'Greenland', 'gl.png', 'GRL', 304, 299, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(85, 'GD', 'GRENADA', 'Grenada', 'gd.png', 'GRD', 308, 1473, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'gp.png', 'GLP', 312, 590, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(87, 'GU', 'GUAM', 'Guam', 'gu.png', 'GUM', 316, 1671, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'gt.png', 'GTM', 320, 502, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(89, 'GN', 'GUINEA', 'Guinea', 'gn.png', 'GIN', 324, 224, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'gw.png', 'GNB', 624, 245, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(91, 'GY', 'GUYANA', 'Guyana', 'gy.png', 'GUY', 328, 592, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(92, 'HT', 'HAITI', 'Haiti', 'ht.png', 'HTI', 332, 509, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', 'hm.png', 'HMI', NULL, 0, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'va.png', 'VAT', 336, 39, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(95, 'HN', 'HONDURAS', 'Honduras', 'hn.png', 'HND', 340, 504, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'hk.png', 'HKG', 344, 852, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(97, 'HU', 'HUNGARY', 'Hungary', 'hu.png', 'HUN', 348, 36, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(98, 'IS', 'ICELAND', 'Iceland', 'is.png', 'ISL', 352, 354, '2022-07-29 08:44:46', '2022-07-29 07:45:01'),
(99, 'IN', 'INDIA', 'India', 'in.png', 'IND', 356, 91, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(100, 'ID', 'INDONESIA', 'Indonesia', 'id.png', 'IDN', 360, 62, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'ir.png', 'IRN', 364, 98, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(102, 'IQ', 'IRAQ', 'Iraq', 'iq.png', 'IRQ', 368, 964, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(103, 'IE', 'IRELAND', 'Ireland', 'ie.png', 'IRL', 372, 353, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(104, 'IL', 'ISRAEL', 'Israel', 'il.png', 'ISR', 376, 972, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(105, 'IT', 'ITALY', 'Italy', 'it.png', 'ITA', 380, 39, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(106, 'JM', 'JAMAICA', 'Jamaica', 'jm.png', 'JAM', 388, 1876, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(107, 'JP', 'JAPAN', 'Japan', 'jp.png', 'JPN', 392, 81, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(108, 'JO', 'JORDAN', 'Jordan', 'jo.png', 'JOR', 400, 962, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'kz.png', 'KAZ', 398, 7, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(110, 'KE', 'KENYA', 'Kenya', 'ke.png', 'KEN', 404, 254, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'ki.png', 'KIR', 296, 686, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'kp.png', 'PRK', 408, 850, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'kr.png', 'KOR', 410, 82, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(114, 'KW', 'KUWAIT', 'Kuwait', 'kw.png', 'KWT', 414, 965, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'kg.png', 'KGZ', 417, 996, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'la.png', 'LAO', 418, 856, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(117, 'LV', 'LATVIA', 'Latvia', 'lv.png', 'LVA', 428, 371, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(118, 'LB', 'LEBANON', 'Lebanon', 'lb.png', 'LBN', 422, 961, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(119, 'LS', 'LESOTHO', 'Lesotho', 'ls.png', 'LSO', 426, 266, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(120, 'LR', 'LIBERIA', 'Liberia', 'lr.png', 'LBR', 430, 231, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'ly.png', 'LBY', 434, 218, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'li.png', 'LIE', 438, 423, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'lt.png', 'LTU', 440, 370, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'lu.png', 'LUX', 442, 352, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(125, 'MO', 'MACAO', 'Macao', 'mo.png', 'MAC', 446, 853, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'mk.png', 'MKD', 807, 389, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'mg.png', 'MDG', 450, 261, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(128, 'MW', 'MALAWI', 'Malawi', 'mw.png', 'MWI', 454, 265, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'my.png', 'MYS', 458, 60, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(130, 'MV', 'MALDIVES', 'Maldives', 'mv.png', 'MDV', 462, 960, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(131, 'ML', 'MALI', 'Mali', 'ml.png', 'MLI', 466, 223, '2022-07-29 08:44:46', '2022-07-29 07:45:02'),
(132, 'MT', 'MALTA', 'Malta', 'mt.png', 'MLT', 470, 356, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'mh.png', 'MHL', 584, 692, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'mq.png', 'MTQ', 474, 596, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'mr.png', 'MRT', 478, 222, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'mu.png', 'MUS', 480, 230, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(137, 'YT', 'MAYOTTE', 'Mayotte', 'yt.png', 'YTM', NULL, 269, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(138, 'MX', 'MEXICO', 'Mexico', 'mx.png', 'MEX', 484, 52, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'fm.png', 'FSM', 583, 691, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'md.png', 'MDA', 498, 373, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(141, 'MC', 'MONACO', 'Monaco', 'mc.png', 'MCO', 492, 377, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'mn.png', 'MNG', 496, 976, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'ms.png', 'MSR', 500, 1664, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(144, 'MA', 'MOROCCO', 'Morocco', 'ma.png', 'MAR', 504, 212, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'mz.png', 'MOZ', 508, 258, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(146, 'MM', 'MYANMAR', 'Myanmar', 'mm.png', 'MMR', 104, 95, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(147, 'NA', 'NAMIBIA', 'Namibia', 'na.png', 'NAM', 516, 264, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(148, 'NR', 'NAURU', 'Nauru', 'nr.png', 'NRU', 520, 674, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(149, 'NP', 'NEPAL', 'Nepal', 'np.png', 'NPL', 524, 977, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'nl.png', 'NLD', 528, 31, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'an.png', 'ANT', 530, 599, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'nc.png', 'NCL', 540, 687, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'nz.png', 'NZL', 554, 64, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'ni.png', 'NIC', 558, 505, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(155, 'NE', 'NIGER', 'Niger', 'ne.png', 'NER', 562, 227, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(156, 'NG', 'NIGERIA', 'Nigeria', 'ng.png', 'NGA', 566, 234, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(157, 'NU', 'NIUE', 'Niue', 'nu.png', 'NIU', 570, 683, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'nf.png', 'NFK', 574, 672, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'mp.png', 'MNP', 580, 1670, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(160, 'NO', 'NORWAY', 'Norway', 'no.png', 'NOR', 578, 47, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(161, 'OM', 'OMAN', 'Oman', 'om.png', 'OMN', 512, 968, '2022-07-29 08:44:46', '2022-07-29 07:45:03'),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'pk.png', 'PAK', 586, 92, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(163, 'PW', 'PALAU', 'Palau', 'pw.png', 'PLW', 585, 680, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', 'ps.png', 'PST', NULL, 970, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(165, 'PA', 'PANAMA', 'Panama', 'pa.png', 'PAN', 591, 507, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'pg.png', 'PNG', 598, 675, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'py.png', 'PRY', 600, 595, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(168, 'PE', 'PERU', 'Peru', 'pe.png', 'PER', 604, 51, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'ph.png', 'PHL', 608, 63, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'pn.png', 'PCN', 612, 0, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(171, 'PL', 'POLAND', 'Poland', 'pl.png', 'POL', 616, 48, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(172, 'PT', 'PORTUGAL', 'Portugal', 'pt.png', 'PRT', 620, 351, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'pr.png', 'PRI', 630, 1787, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(174, 'QA', 'QATAR', 'Qatar', 'qa.png', 'QAT', 634, 974, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(175, 'RE', 'REUNION', 'Reunion', 're.png', 'REU', 638, 262, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(176, 'RO', 'ROMANIA', 'Romania', 'ro.png', 'ROM', 642, 40, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'ru.png', 'RUS', 643, 70, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(178, 'RW', 'RWANDA', 'Rwanda', 'rw.png', 'RWA', 646, 250, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'sh.png', 'SHN', 654, 290, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'kn.png', 'KNA', 659, 1869, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'lc.png', 'LCA', 662, 1758, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'pm.png', 'SPM', 666, 508, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'vc.png', 'VCT', 670, 1784, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(184, 'WS', 'SAMOA', 'Samoa', 'ws.png', 'WSM', 882, 684, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(185, 'SM', 'SAN MARINO', 'San Marino', 'sm.png', 'SMR', 674, 378, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'st.png', 'STP', 678, 239, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'sa.png', 'SAU', 682, 966, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(188, 'SN', 'SENEGAL', 'Senegal', 'sn.png', 'SEN', 686, 221, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', 'cs.png', 'CSM', NULL, 381, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'sc.png', 'SYC', 690, 248, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'sl.png', 'SLE', 694, 232, '2022-07-29 08:44:46', '2022-07-29 07:45:04'),
(192, 'SG', 'SINGAPORE', 'Singapore', 'sg.png', 'SGP', 702, 65, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'sk.png', 'SVK', 703, 421, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'si.png', 'SVN', 705, 386, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'sb.png', 'SLB', 90, 677, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(196, 'SO', 'SOMALIA', 'Somalia', 'so.png', 'SOM', 706, 252, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'za.png', 'ZAF', 710, 27, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', 'gs.png', 'GSS', NULL, 0, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(199, 'ES', 'SPAIN', 'Spain', 'es.png', 'ESP', 724, 34, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'lk.png', 'LKA', 144, 94, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(201, 'SD', 'SUDAN', 'Sudan', 'sd.png', 'SDN', 736, 249, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(202, 'SR', 'SURINAME', 'Suriname', 'sr.png', 'SUR', 740, 597, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'sj.png', 'SJM', 744, 47, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'sz.png', 'SWZ', 748, 268, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(205, 'SE', 'SWEDEN', 'Sweden', 'se.png', 'SWE', 752, 46, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'ch.png', 'CHE', 756, 41, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'sy.png', 'SYR', 760, 963, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'tw.png', 'TWN', 158, 886, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'tj.png', 'TJK', 762, 992, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'tz.png', 'TZA', 834, 255, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(211, 'TH', 'THAILAND', 'Thailand', 'th.png', 'THA', 764, 66, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', 'tl.png', 'TLM', NULL, 670, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(213, 'TG', 'TOGO', 'Togo', 'tg.png', 'TGO', 768, 228, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(214, 'TK', 'TOKELAU', 'Tokelau', 'tk.png', 'TKL', 772, 690, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(215, 'TO', 'TONGA', 'Tonga', 'to.png', 'TON', 776, 676, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'tt.png', 'TTO', 780, 1868, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(217, 'TN', 'TUNISIA', 'Tunisia', 'tn.png', 'TUN', 788, 216, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(218, 'TR', 'TURKEY', 'Turkey', 'tr.png', 'TUR', 792, 90, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'tm.png', 'TKM', 795, 7370, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'tc.png', 'TCA', 796, 1649, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(221, 'TV', 'TUVALU', 'Tuvalu', 'tv.png', 'TUV', 798, 688, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(222, 'UG', 'UGANDA', 'Uganda', 'ug.png', 'UGA', 800, 256, '2022-07-29 08:44:46', '2022-07-29 07:45:05'),
(223, 'UA', 'UKRAINE', 'Ukraine', 'ua.png', 'UKR', 804, 380, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ae.png', 'ARE', 784, 971, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'gb.png', 'GBR', 826, 44, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(226, 'US', 'UNITED STATES', 'United States', 'us.png', 'USA', 840, 1, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', 'um.png', 'UMI', NULL, 1, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(228, 'UY', 'URUGUAY', 'Uruguay', 'uy.png', 'URY', 858, 598, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'uz.png', 'UZB', 860, 998, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(230, 'VU', 'VANUATU', 'Vanuatu', 'vu.png', 'VUT', 548, 678, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(231, 'VE', 'VENEZUELA', 'Venezuela', 've.png', 'VEN', 862, 58, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'vn.png', 'VNM', 704, 84, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'vg.png', 'VGB', 92, 1284, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'vi.png', 'VIR', 850, 1340, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'wf.png', 'WLF', 876, 681, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'eh.png', 'ESH', 732, 212, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(237, 'YE', 'YEMEN', 'Yemen', 'ye.png', 'YEM', 887, 967, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'zm.png', 'ZMB', 894, 260, '2022-07-29 08:44:46', '2022-07-29 07:45:06'),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'zw.png', 'ZWE', 716, 263, '2022-07-29 08:44:46', '2022-07-29 07:45:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
