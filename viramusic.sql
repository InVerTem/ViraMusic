-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 05 2021 г., 19:41
-- Версия сервера: 10.4.12-MariaDB
-- Версия PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `viramusic`
--
CREATE DATABASE IF NOT EXISTS `viramusic` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `viramusic`;

-- --------------------------------------------------------

--
-- Структура таблицы `access_status`
--

CREATE TABLE `access_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `access_status`
--

INSERT INTO `access_status` (`id`, `name`) VALUES
(1, 'private'),
(3, 'public');

-- --------------------------------------------------------

--
-- Структура таблицы `album`
--

CREATE TABLE `album` (
  `id` bigint(20) NOT NULL,
  `artist` bigint(20) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `creator` bigint(20) NOT NULL,
  `editor` bigint(20) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `album`
--

INSERT INTO `album` (`id`, `artist`, `number`, `name`, `signature`, `year`, `image`, `creator`, `editor`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Skillet', '', 1996, 'FYdDnoEmTdAANeb2tzgR1ix2bAyAbutR.jpg', 1, 1, 1619383325, 1619383325),
(2, 1, 2, 'Hey You, I Love Your Soul', '', 1998, 'b4ujzFzYFpALdvNIzlAJnhv29KZFbVqv.jpg', 1, 1, 1619386359, 1619386359),
(3, 1, 3, 'Invincible', '', 2000, '9NLBn7tGA5c4dJ6Lnkul694zJ-iDucIl.jpg', 1, 1, 1619386375, 1619386375),
(4, 1, 4, 'Alien youth', '', 2001, 'h4A7XMtxUaj3xUa2PNbLGK3To35LHtWo.jpg', 1, 1, 1619386393, 1619386393),
(5, 1, 5, 'Collide', '', 2004, 'SEs9Vx_8aPAgk09mJOff-B0IdGQ0laQg.jpg', 1, 1, 1619386459, 1619386459),
(6, 1, 6, 'Comatose', '', 2006, 'CePodG3C9eCkaJz79ObYCtF9ZdP61TUf.jpg', 1, 1, 1619386475, 1619386475),
(7, 1, 7, 'Awake', 'Deluxe edition', 2009, 'VBHkMaVujN_uVFTwBwKchx_z8jjzA3yx.jpg', 1, 1, 1619386503, 1619386503),
(8, 1, 8, 'Rise', '', 2013, 'pQ980u1I45K76s6cL1ziyj-pQnvIVRRV.jpg', 1, 1, 1619386524, 1619386524),
(9, 1, 9, 'Vital Sings', '', 2014, 'XRRqdJ7O4DIdKc1Qcx96LhMH2JW84JNO.jpg', 1, 1, 1619386547, 1619386547),
(10, 1, 10, 'Unleashed', '', 2016, 'g8Or6zA4YcFTHudHtpUECo0C8zbAad7-.jpg', 1, 1, 1619386574, 1620635725),
(11, 1, 11, 'Victorious', '', 2019, 'T1ZLuXZb0b_8hSC1uRidK7USfquqSVlg.jpg', 1, 1, 1619386588, 1619386588),
(12, 2, 1, 'Kill \'Em All', '', 1983, '1NsYGUYvt6OlrD2MZ3oS7JUbW-yFpN_W.jpg', 1, 1, 1619634414, 1619634414),
(13, 2, 2, 'Ride The Lightning', '', 1984, 'ppnGpitnPzGXIBX5DyY7g4BYTjIewIjT.jpg', 1, 1, 1619648731, 1619648731),
(14, 2, 3, 'Master Of Puppets', '', 1986, 'rRxSCoswGU6fauSfPvVWsQdAaYjIc-Ry.jpg', 1, 1, 1619648752, 1619648752),
(15, 2, 4, '...And Justice For All', '', 1988, '9XwmV6to3NSQJui8Q_96MfaAcqOYex7V.jpg', 1, 1, 1619648929, 1619648929),
(16, 2, 5, 'Metallica', '', 1991, 'Zs24Ng_TNqT9VunawS4LtnRCNWYUofrf.jpg', 1, 1, 1619648968, 1619648968),
(17, 2, 6, 'Load', '', 1996, 'g__hDRb2b_tLxxT6ug479zpc93YAjmyZ.jpg', 1, 1, 1619649008, 1619649008),
(18, 2, 7, 'ReLoad', '', 1997, '-Hx3gLVq-a62QlaEp2CuwpdOTmHCGftF.jpg', 1, 1, 1619649597, 1619649597),
(19, 2, 8, 'Garage Inc', '', 1998, '6CGE1bGJst3b0tQcja2TP6d_gMjW3YIp.jpg', 1, 1, 1619649647, 1619649647),
(20, 2, 9, 'St. Anger', '', 2003, '91jq8qDRdOh0dElgy8IPv6lAvRb7t3q-.jpg', 1, 1, 1619650733, 1619650733),
(21, 2, 10, 'Death Magnetic', '', 2008, 'cssQ2tA878lWsBIWAO3IuJ58PlLj0txP.jpg', 1, 1, 1619650776, 1619650776),
(22, 3, 1, 'Night Visions', '', 2012, '-vP06AQEJFmjcTfXDb_2zuuSbU14mrXg.jpg', 1, 1, 1619651479, 1619651479),
(23, 3, 2, 'Smoke + Mirrors', '', 2015, 'y2NYJcLB_r7xJJFUWzmUpLDDYPfLGLc4.jpg', 1, 1, 1619651536, 1619651536),
(24, 3, 3, 'Evolve', '', 2017, 'FXCvAvYGXDB6_nMFqTGC1RF-CK-Nkl26.jpg', 1, 1, 1619651654, 1619651654),
(25, 3, 4, 'Origins', '', 2018, '9r2LY_iOwff5i5pP2_SZeejgol1lW3AV.jpg', 1, 1, 1619651736, 1619651747),
(27, 4, 1, 'The Way Of The Fist', '', 2007, 'XWkxyi_kLtSvQ28avEJDjy4_eNdzlfty.jpg', 1, 1, 1619708700, 1619708700),
(28, 4, 2, 'War Is The Answer', '', 2009, 'ZWAb8Cww2XNDMvhpqw9kYx7fNIOjuCDc.jpg', 1, 1, 1619708766, 1619708766),
(29, 4, 3, 'American Capitalist', '', 2011, '14U-Ke3_uA2WpA-c9i_7ftixmoEdUCMU.jpg', 1, 1, 1619708837, 1619708837),
(30, 4, 4, 'The Wrong Side Of Heaven And The Righteous Side Of Hell, Volume 1', '', 2013, 'lLqCLu3u2sayUIP5Kf51s5rrUrejbZ4d.jpg', 1, 1, 1619708921, 1619708921),
(31, 4, 5, 'The Wrong Side Of Heaven And The Righteous Side Of Hell, Volume 2', '', 2013, 'L1m2RDLg_G6TlDe61KboNppkTQYGWuYM.jpg', 1, 1, 1619805763, 1619805763),
(32, 4, 6, 'Got Your Six', 'Deluxe Edition', 2015, '34TovKxxbIRWhjyh2TLsVK4cB2LTpx5s.jpg', 1, 1, 1619818119, 1619818119),
(33, 4, 7, 'A Decade of Destruction', '', 2017, 'm1zmXCCwDQnLvRQRoH_VMaR5EdZpFoGh.jpg', 1, 1, 1619818186, 1619818186),
(34, 4, 8, 'And Justice For None', '', 2018, 'QkXc1iAU-9lvF0QMKRZxdxxSNVODtEpH.jpg', 1, 1, 1619818249, 1619818249),
(35, 5, 1, 'Будь как дома, путник', '', 1994, 'cqbfS344qImTmT1wj-IIEGG9v1aYOpyn.jpg', 1, 1, 1620568119, 1620568119),
(36, 5, 2, 'Камнем по Голове', '', 1996, '8Fz-a1uI05vzi2JJfrlNhZXq_VEsKL4p.jpg', 1, 1, 1620579433, 1620579450),
(37, 5, 4, 'Герои и Злодеи', '', 2000, '9kQ7H-n0KWyKcFZhBFU38PHHwUbJ5hkL.jpg', 1, 1, 1620579584, 1620634591),
(38, 5, 5, 'Как в старой сказке', '', 2001, '6GF3d8QEw_jKtW75_Aq8JpEalOAJIkyI.jpg', 1, 1, 1620581739, 1620634588),
(39, 5, 6, 'Жаль, нет ружья!', '', 2002, 'd3iSAaZv6OajOFcaRr4PUH-SVfnJSJWu.jpg', 1, 1, 1620581791, 1620634585),
(40, 5, 7, 'Бунт на корабле', '', 2004, 'i1UiJkbypJX93n-uoiQAFWDBzjNOj9pU.jpg', 1, 1, 1620581831, 1620634581),
(41, 5, 8, 'Продавец Кошмаров', '', 2006, 'ZXBkT2v08JmIG_JWrbtDDV3s3VVBTuYB.jpg', 1, 1, 1620581875, 1620634579),
(42, 5, 9, 'Страшные Сказки', '', 2007, 'H3PwlLvldsjoR4kMXDuPpIvMqWkuX6ry.jpg', 1, 1, 1620581936, 1620634576),
(43, 5, 10, 'Тень Клоуна', '', 2008, 'Umujgej5tC-2tQDvgh2Qn94JqiGxnhx2.jpg', 1, 1, 1620581973, 1620634573),
(44, 5, 11, 'Театр Демона', '', 2010, 'K5Lut1DB1PhBXX6RwQW9q7qpj8OM4zLI.jpg', 1, 1, 1620582014, 1620634571),
(45, 5, 12, 'TODD. Акт 1.Праздник крови', '', 2011, 'wxlCNrnH4Vc8twqVwKOWO_WSYh0vCe6W.jpg', 1, 1, 1620582044, 1620634558),
(46, 5, 13, 'TODD. Акт 2. На краю', '', 2012, 'MIC_eCFW23AmIWdRPjNWcD1ySPawkX05.jpg', 1, 1, 1620582084, 1620634471),
(47, 5, 3, 'Акустический альбом', '', 2000, 'QZ0acK2zhd8v1Sq8krcdlYkUX136fAr4.jpg', 1, 1, 1620634620, 1620634620),
(48, 6, 1, 'Herzeleid', '', 1995, 'fNpJxXl9_h414ztNbH-_MHtLIAIJ-ug_.jpg', 1, 1, 1621100121, 1621100121),
(49, 6, 2, 'Sehnsucht', '', 1997, 'w-KarDkDcU_KeeH2MXiGpUyDSHF5rrUG.jpg', 1, 1, 1621103051, 1621103051),
(50, 6, 3, 'Mutter', 'Limited Tour Edition', 2001, 'xM-h8NZLsT5dgEBWR8q_A6cRQWznhjiy.jpg', 1, 1, 1621103598, 1621103598),
(51, 6, 4, 'Reise, Reise', 'Japanese Edition', 2004, 'OKLDabnJu4QqcnpiJnEWeX7nRQSAB_-x.jpg', 1, 1, 1621103787, 1621103787),
(52, 6, 5, 'Rosenrot', 'Limited Edition', 2005, '76PgrkR4mnPoq-Tqz-QWQ6R-BQCeb5Mu.jpg', 1, 1, 1621103832, 1621103832),
(53, 6, 6, 'Liebe Ist Fur Alle Da', 'Limited Edition', 2009, '_E-3rt-J-KkU3sxEjiP8GtB-NVSiXiYv.jpg', 1, 1, 1621103878, 1621103878),
(54, 6, 7, 'Rammstein', 'Special Edition', 2019, 'vC8RCrlD_kSoicB6diFDi9i8TZS7mddS.jpg', 1, 1, 1621103930, 1621103930),
(55, 15, 1, 'Пыльная Быль', '', 1994, 'xcb349J8VTM9ePxjMhiKNSd6zihtzurE.jpg', 1, 1, 1621975454, 1621976140),
(56, 15, 2, 'Коллекционер оружия', '', 1996, 'KOGkSywWhkO2gT8kXIZ5gKgstuKrtVc3.jpg', 1, 1, 1621976224, 1621976224),
(57, 15, 3, 'Фонарь под глазом', '', 1997, 'mTqu85BO00MWLWERw3L_wAtqK5wfYQ5Y.jpg', 1, 1, 1621976292, 1621976292),
(58, 15, 4, 'Гранатовый Альбом', '', 1998, 'UOwEIWINoac-YzUgdbMYtCmXfT-bEgjz.jpg', 1, 1, 1621976352, 1621976352),
(59, 15, 5, 'Альтависта', '', 1999, 'KSLqtZtEXvrxDcZqZ1U-Xhu6UipN16Eh.jpg', 1, 1, 1621976550, 1621976550),
(60, 15, 6, '25-й кадр', 'Limited Edition', 2001, 'ZPCR9QNl45PmG3dCKQapMtwPQwuWY6Bn.jpg', 1, 1, 1621976593, 1621976593),
(61, 15, 7, 'Новые Люди', '', 2003, 'Ky2P_J2MMWRYIMTGE2nRppKQkOQf0CQ8.jpg', 1, 1, 1621976631, 1621976631),
(62, 15, 8, 'Реверсивная Хроника Событий', '', 2004, 'yYLGa8atjXCFVwsVzX_nxGnzV0EGqbIJ.jpg', 1, 1, 1621976679, 1621976679),
(63, 15, 9, 'Раздвоение Личности', '', 2007, 'BMZU2UFKFpUk_iOyFo-GXkzZuXwQUQTq.jpg', 1, 1, 1621976740, 1621976740),
(64, 15, 10, 'Сигнал из Космоса', '', 2009, 'X6HjDyIqFemJOwDYdXcc2s-2FzQQNqHM.jpg', 1, 1, 1621976802, 1621976802),
(65, 15, 11, 'Обман зрения', '', 2012, 'Vxfz-AmHkFCfvdBPWO-FPa533GJHyOrp.jpg', 1, 1, 1621976874, 1621976874),
(66, 15, 12, 'Резонанс. Часть 1', '', 2014, 'srXtMYu07abXC010eZkB0xoI5yR9Z343.jpg', 1, 1, 1621976930, 1621976930),
(67, 15, 13, 'Резонанс. Часть 2', '', 2014, 'ZozSdMCk9lSy_AUWguShvuN8IYY4dkN9.jpg', 1, 1, 1621976995, 1621976995),
(68, 15, 14, 'Ключ к шифру', '', 2016, 'ylCLq2azJ7mCT2xN67LehiLVGdsiXBDu.jpg', 1, 1, 1621977079, 1621977079),
(69, 15, 15, 'Встречная полоса', '', 2018, '1zf6TYvOJYNG4ffrY54B1xf9Rs4DlSXa.jpg', 1, 1, 1621977112, 1621977112),
(70, 15, 16, 'Тайком', '', 2019, 'sOK9UN5i-L7ePke1fwY7RmxOpDXoPXcr.jpg', 1, 1, 1621977139, 1621977139),
(71, 7, 1, 'The Sickness', '', 2000, 'WIN28x4Eqf4bwMLraqGfUXEHFV_O3f20.jpg', 1, 1, 1621978690, 1621978690),
(72, 7, 2, 'Believe', '', 2002, '7YHTCJIr5CrC9rWMdFCQMEeKPB6sRJcg.jpg', 1, 1, 1621978721, 1621978721),
(73, 7, 3, 'Ten Thousand Fists', '', 2006, 'm8xI5BJLs2CjJog34BYwl23uICp5ZZVc.jpg', 1, 1, 1621978750, 1621978750),
(74, 7, 4, 'Indestructible', '', 2008, '_PFIamwOXZ2ZSCuwpnESJXL-afa7Ffb4.jpg', 1, 1, 1621978789, 1621978789),
(75, 7, 5, 'Asylum', '', 2010, '2caXpRgoOUSeXzr0n3WnmjOh_qdFQdZY.jpg', 1, 1, 1621980111, 1621980111),
(76, 7, 6, 'The Lost Children', '', 2011, 'Zii_753qS02pQ9c2u6imqbwlCWcN1IAH.jpg', 1, 1, 1621980143, 1621980143),
(77, 7, 7, 'Immortalized', 'Deluxe Edition', 2015, '_S-Shc_Krnp17KhEQ-4CS8_gT2yiTyVD.jpg', 1, 1, 1621980201, 1621980201),
(78, 7, 8, 'Evolution', '', 2018, '_vGmcAreo76OBYSQP_b7PFbkR1eFAb66.jpg', 1, 1, 1621980281, 1621980281),
(79, 8, 1, 'Bleach', '', 1989, 'liTqlzs_dHRuOubdjgkGqURk3TWEcM83.png', 1, 1, 1621982477, 1621982477),
(80, 8, 2, 'Nevermind', '', 1991, '0e1sFQMZj9nqEW57_IZXa36vlHapAni6.jpg', 1, 1, 1621982518, 1621982518),
(81, 8, 3, 'In Utero', '', 1993, 'ZKiFBde9Dl3fiTfDuP1g1mlh8JLmy2Xk.png', 1, 1, 1621982549, 1621982549),
(82, 16, 1, 'Primo Victoria', '', 2005, 'OYHXIxkw0-ft4j1VRneh82_80zuPxwi5.jpg', 1, 1, 1621982602, 1621982602),
(83, 16, 2, 'Attero Dominatus', '', 2006, 'rQIBHbzcE71fymBy5RY2f2wV2-fjgrFj.jpg', 1, 1, 1621982643, 1621982643),
(84, 16, 3, 'Metalizer', 'Limited Edition', 2007, 'QzVNmDf700JQy4jJi_oORcgFi1IRjsXh.jpg', 1, 1, 1621982679, 1621982679),
(85, 16, 4, 'The Art Of War', 'Limited Edition', 2008, 'SaqxWw_sz0Cfg8dUaSesDC8WGtF32JoA.jpg', 1, 1, 1621982847, 1621982847),
(86, 16, 5, 'Coat Of Arms', 'Limited Edition', 2010, 'OcnEK_e4TtColddwZ6HggnYY6M89S7co.jpg', 1, 1, 1621982914, 1621982914),
(87, 16, 6, 'Carolus Rex', 'Mailorder Earbook Edition', 2012, 'M6pwRXbkp9eR_VmXRuP37oDshjQ-W276.jpg', 1, 1, 1621982976, 1621982976),
(88, 16, 7, 'Heroes', 'Deluxe Earbook Limited Edition', 2014, 'Gzua-Am3mKnzSUvuQ81ZRI2j_L1hjwhx.jpg', 1, 1, 1621983127, 1621983127),
(89, 9, 1, 'Stand Up and Scream', '', 2009, '6cblbxiHqQeEf0BLveYx-GpIfA_Sydk4.jpg', 1, 1, 1621983289, 1621983289),
(90, 9, 2, 'Reckless & Relentless', '', 2011, '5ci6z5ASwFRVX235VdbZ3RiTCZc2T7cT.jpg', 1, 1, 1621983344, 1621983344),
(91, 9, 3, 'From Death to Destiny', '', 2013, 'oLnOcKNo_QJL0F9kTpuUL_O1jyAb1yHl.jpg', 1, 1, 1621983443, 1621983443),
(92, 9, 4, 'Asking Alexandria', '', 2017, 'K2RLdpUhTU2gW1FWSJaXfEUJ_tphfkte.jpg', 1, 1, 1621983518, 1621983518),
(93, 14, 1, 'Twenty One Pilots', '', 2009, '9UuqSwSf7WR-APTS8-LNLcW_RvPbHGB9.jpg', 1, 1, 1621983566, 1621983566),
(94, 14, 2, 'Regional at best', 'Newsletter Edition', 2011, 'ni5Q3BBXYnYe6ctraCCt_Lh5BLgrzfYQ.jpg', 1, 1, 1621983613, 1621983613),
(95, 14, 3, 'Vessel', 'Deluxe Edition', 2013, 'dtQl6kvJmhlKBDcV1_2lcwt49BmVkLwz.jpg', 1, 1, 1621984217, 1621984217),
(96, 14, 4, 'Blurryface', '', 2015, '7Eqo_Okfu2Qh6ShmTqDGgcfSu_QkW3wA.jpg', 1, 1, 1621984257, 1621984257),
(97, 14, 5, 'Trench', '', 2018, 'wp2ZuCGXdgCmatE8tgDlkgt5aDWUmyTa.jpg', 1, 1, 1621984290, 1621984290),
(98, 13, 1, 'Three Days Grace', 'Japanese Edition', 2003, 'g0UQrLQnXbdVHfk6Tt0iIWeQOTSrvDuh.jpg', 1, 1, 1621984344, 1621984344),
(99, 13, 2, 'One-X', 'Japanese Special Edition', 2007, 'HFJLSShLNPxoY4EH521bKWaI1bQjfbQd.jpg', 1, 1, 1621984397, 1621984397),
(100, 13, 3, 'Life Starts Now', 'Limited Edition', 2009, 'SBegXWhSmX5PxJu6gUzCKMMvAa1ke-1G.jpg', 1, 1, 1621984439, 1621984439),
(101, 13, 4, 'Transit Of Venus', '', 2012, 'qx-7hzr0cBU5v81llqA0xUEOKlJMjUId.jpg', 1, 1, 1621984856, 1621984856),
(102, 13, 5, 'Human', '', 2015, 'Jn-BoaNFAHK-AieZEwAZxE1kthzc4K2O.jpg', 1, 1, 1621984904, 1621984904),
(103, 13, 6, 'Outsider', '', 2018, 'sVNmFI_heLPjLwOPyVLUbq7dZjinKS_v.jpg', 1, 1, 1621984933, 1621984933),
(104, 10, 1, 'The Poison', '', 2005, 'cQLRuYjzRjf2pr-99_arRpW2pJXagcKp.jpg', 1, 1, 1621984977, 1621984977),
(105, 10, 2, 'Scream Aim Fire', '', 2008, 'XdGZ9Oq0QhVavaXTSgrWTpBv4sjZAs1X.jpg', 1, 1, 1621985118, 1621985118),
(106, 10, 3, 'Fever', '', 2010, 'qyqrfWg3wWn5KD-_Tn0hPQLze6-klaQB.jpg', 1, 1, 1621985165, 1621985165),
(107, 10, 4, 'Temper Temper', 'Deluxe Edition', 2013, 'Xs1nbw2b7w2YaAWxjW278UJRtyjvSvJh.jpg', 1, 1, 1621985211, 1621985211),
(108, 10, 5, 'Venom', 'Deluxe Edition', 2015, 'dxhNlDCphC7sHGS2FIpiOlOGksP2UB89.jpg', 1, 1, 1621985303, 1621985303),
(109, 10, 6, 'Gravity', 'Deluxe Edition', 2018, '5ngYc0d0oBm3rKk0_NgjF35jd7Xn171O.jpg', 1, 1, 1621985347, 1621985347),
(110, 11, 1, 'Return In Bloodred', '', 2005, '5FvrpO-g1FfHh3oDzWhYlw2_apPF9fjO.jpg', 1, 1, 1621985769, 1621985769),
(111, 11, 2, 'Lupus Dei', '', 2007, 'uoCI_Riy6ginSDTZOrXiVxMpW2hDc5qg.jpg', 1, 1, 1621985801, 1621985801),
(112, 11, 3, 'Bible Of The Beast', '', 2009, 'H9OGHThzivH2f5OJaO-fxU_gZ4JkohAv.jpg', 1, 1, 1621985893, 1621985893),
(113, 11, 4, 'Blood Of The Saints', '', 2011, 'PhSKUlWT1wo9_vWJmyYmQj833meeInfO.jpg', 1, 1, 1621985939, 1621985939),
(114, 11, 5, 'Preachers Of The Night', '', 2013, 'GwN5edoN4Y_h3mOA-YjXMT8PimsBMYRi.jpg', 1, 1, 1621985973, 1621985973),
(115, 11, 6, 'Blessed & Possessed', '', 2015, 'uncPwR2KHzNSnjArm9C8sWH31hFxR803.jpg', 1, 1, 1621986025, 1621986025),
(116, 11, 7, 'The Sacrament of Sin', '', 2018, '6mQUQbkmBQR-t5LP9bmfCT6vvOn7u79y.jpg', 1, 1, 1621986066, 1621986066),
(117, 11, 8, 'Metallum Nostrum', '', 2019, 'h012YtkrD23mtaC4euzgLYu_2VsWwkkz.jpg', 1, 1, 1621986097, 1621986097),
(118, 12, 1, 'Slipknot', 'Limited Edition', 1999, 'RZIc48YlMB0IzSzC2HBqec1AKt1Avfi4.jpg', 1, 1, 1621986157, 1621986157),
(119, 12, 2, 'Iowa', 'Japanese Edition', 2001, 'l-emjWyTMjiWaJtOvzT4lerTNqWnzb4X.jpg', 1, 1, 1621986258, 1621986258),
(120, 12, 3, 'Vol. 3', 'The Subliminal Verses, Special Edition', 2004, 'xMBBX8QH2wzMLloQDp5P_qjbY2Nuca6a.jpg', 1, 1, 1621986310, 1621986310),
(121, 12, 4, 'All Hope Is Gone', 'Special Edition', 2008, 'faKghivqZxIXSB5tw2Z29LR39FSQ0gd8.jpg', 1, 1, 1621986384, 1621986384),
(122, 12, 5, '.5 - The Gray Chapter', 'Special Edition', 2014, 'BwbHfEof9IgK8L7h2spcS6oiPTpJccCy.jpg', 1, 1, 1621986481, 1621986481),
(123, 12, 6, 'We Are Not Your Kind', '', 2019, '3dRzIEAE3kn8UoZKbdxW18l2CtZnuEiN.jpg', 1, 1, 1621986578, 1621986578),
(124, 17, 1, 'Good', '', 1992, 'MCkyRvuddGK0MqJA_5jwGaUkz3-YFuuj.jpg', 1, 1, 1622910001, 1622910001),
(125, 17, 2, 'Cure for Pain', '', 1993, 'pOpxDZUFRUtnJYSxP1GZTqc6nGDZXYPY.jpg', 1, 1, 1622910204, 1622910204),
(126, 17, 3, 'Yes', '', 1995, 'Cbu8Tb7hICqQqA9maaSlF8vOmXrio112.jpg', 1, 1, 1622910240, 1622910240),
(127, 17, 4, 'Like Swimming', '', 1997, '_1_Y-AZRHM7E7QWw2PBLqBmWU_NoVw_P.jpg', 1, 1, 1622910302, 1622910302),
(128, 17, 5, 'The Night', '', 2000, '5NkQGhaPc3YQc5xKWl7pJlwfqjevmjKv.jpg', 1, 1, 1622910336, 1622910336);

-- --------------------------------------------------------

--
-- Структура таблицы `artist`
--

CREATE TABLE `artist` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `info` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `creator` bigint(20) NOT NULL,
  `editor` bigint(20) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `artist`
--

INSERT INTO `artist` (`id`, `name`, `info`, `image`, `creator`, `editor`, `created_at`, `updated_at`) VALUES
(1, 'Skillet', 'American Christian rock band formed in Memphis, Tennessee, in 1996. The band currently consists of husband John and wife Korey Cooper along with Jen Ledger and Seth Morrison. The band has released ten albums, with two, Collide and Comatose, receiving Grammy nominations. Two of their albums, Comatose and Awake, are certified Platinum and Double Platinum respectively by the RIAA while Rise and Unleashed are certified Gold as of December 4, 2018.', '9eGgzBN7srAH-E_a4aUH51Vedh2UT6k8.jpg', 1, 1, 1619186769, 1621499499),
(2, 'Metallica', 'American heavy metal band. The band was formed in 1981 in Los Angeles, California, by drummer Lars Ulrich and vocalist/guitarist James Hetfield, and has been based in San Francisco, California for most of its career. The group\'s fast tempos, instrumentals and aggressive musicianship made them one of the founding \"big four\" bands of thrash metal, alongside Megadeth, Anthrax and Slayer. Metallica\'s current lineup comprises founding members Hetfield and Ulrich, longtime lead guitarist Kirk Hammett and bassist Robert Trujillo. Guitarist Dave Mustaine and bassists Ron McGovney, Cliff Burton and Jason Newsted are former members of the band.', 'lvG7tVQnGFkGdSesm_k14GdgG-VC1PmM.jpg', 1, 1, 1619282718, 1619282988),
(3, 'Imagine Dragons', 'American pop rock band from Las Vegas, Nevada, consisting of lead vocalist Dan Reynolds, lead guitarist Wayne Sermon, bassist Ben McKee, and drummer Daniel Platzman. The band first gained exposure with the release of their single \"It\'s Time\", followed by their award-winning debut studio album Night Visions, which resulted in the chart-topping singles \"Radioactive\" and \"Demons\". Rolling Stone named \"Radioactive\", which holds the record for most weeks charted on the Billboard Hot 100, the \"biggest rock hit of the year\".', 'rYiOo77crD1RylYwIqrSGJTC-YZSiUGu.jpg', 1, 1, 1619282788, 1619282970),
(4, 'Five Finger Death Punch', 'American heavy metal band from Las Vegas, Nevada. Formed in 2005, the band\'s name comes from kung fu cinema. The band originally consisted of vocalist Ivan Moody, guitarist Zoltan Bathory, guitarist Caleb Andrew Bingham, bassist Matt Snell, and drummer Jeremy Spencer. Bingham was replaced by guitarist Darrell Roberts in 2006, who was then replaced by Jason Hook in 2009. Bassist Matt Snell departed from the band in 2010, and was replaced by Chris Kael in 2011. Spencer then departed the band in 2018 due to re-occurring back issues, and was replaced by Charlie Engen, making Bathory and Moody the only original members of the band.', 'fUxrRQzwswPgQg8Z_5_Nqm8mvQrCYCNc.jpg', 1, 1, 1619287825, 1619287825),
(5, 'Король и Шут', 'Were a Russian horror punk band from Saint Petersburg that took inspiration and costumes from tales and fables. In Russia this band has an iconic status.', 'iEpFy7K5VclnvnVjT091SAhjD8opWOV0.jpg', 1, 1, 1619288103, 1619288103),
(6, 'Rammstein', 'German Neue Deutsche Härte band formed in Berlin in 1994. Their six-man lineup-lead vocalist Till Lindemann, lead guitarist Richard Z. Kruspe, rhythm guitarist Paul Landers, bassist Oliver Riedel, drummer Christoph Schneider, and keyboardist Christian \"Flake\" Lorenz-has remained unchanged throughout their existence. Prior to their formation, some members were associated with acts such as Feeling B and First Arsch.', 'cz3gNSZg38rI4yNsa0NodEOEBxri4nhe.jpg', 1, 1, 1619288347, 1619288347),
(7, 'Disturbed', 'American heavy metal band from Chicago, formed in 1994. The band includes vocalist David Draiman, guitarist/keyboardist Dan Donegan, bassist John Moyer and drummer Mike Wengren. They have had very few lineup changes, with Donegan and Wengren being the 2 remaining original members. Former band members are vocalist Erich Awalt, and bassist Steve Kmak.', 'rQzJ6COscE1pCKXs9OU_h-pvNtXJuXzY.jpg', 1, 1, 1619288419, 1619288436),
(8, 'Nirvana', 'American rock band formed in Aberdeen, Washington in 1987. It was founded by lead singer and guitarist Kurt Cobain and bassist Krist Novoselic. Nirvana went through a succession of drummers, the best known being Dave Grohl, who joined in 1990. Though the band dissolved in 1994 after the death of Cobain, their music maintains a popular following and continues to influence modern rock and roll culture.', 'gNi8r6EpIO9Jvfha3qbGsNzU7JkTOaC0.jpg', 1, 1, 1619288501, 1619288511),
(9, 'Asking Alexandria', 'Are a British rock band from York, North Yorkshire, consisting of guitarists Ben Bruce and Cameron Liddell, drummer James Cassells, lead vocalist Danny Worsnop, and bassist Sam Bettley. Initially formed in 2006 by Ben Bruce, the band officially established as a six-piece in 2008 with the founding line-up consisting of Bruce, Worsnop, Cassells, Liddell, Joe Lancaster and Ryan Binns.', 's1fsACyQPCetDxqSox256KHb9pcVQlOb.jpg', 1, 1, 1619288553, 1619288553),
(10, 'Bullet For My Valentine', 'Bullet for My Valentine, often abbreviated as BFMV, are a Welsh heavy metal band from Bridgend, Wales, formed in 1998. The band is currently composed of Matthew Tuck, Michael Paget, Jason Bowld and Jamie Mathias. Former members include Michael Thomas, Jason James and Nick Crandle; the latter were on bass. They were formed under the name Jeff Killed John and started their music career by covering songs by Metallica and Nirvana. Jeff Killed John recorded six songs which were not released; two of these tracks were reworked later in their career as Bullet for My Valentine. A change of style from that of Jeff Killed John led the band to change their name. In 2002, the band secured a five-album deal with Sony BMG...', '_D3OqZca48NEBOOg5htsA08V_H-4Ru25.jpg', 1, 1, 1619288702, 1619288702),
(11, 'Powerwolf', 'German power metal band created in 2003 by David Vogt and Benjamin Buss. The group uses dark themes and images, musically and lyrically, contrary to traditional power metal music, as well as corpse paint, gothic-tinged compositions and songs about Transylvanian werewolf and vampire legends.', 'ztWbX_vvME7nM9KAfil4RqR0vpFjpw1a.jpg', 1, 1, 1619289040, 1619289040),
(12, 'Slipknot', 'American heavy metal band from Des Moines, Iowa. The band was founded in 1995 by percussionist Shawn Crahan, drummer Joey Jordison and bassist Paul Gray. After several lineup changes in its early years, the band settled on nine members for more than a decade: Crahan, Jordison, Gray, Craig Jones, Mick Thomson, Corey Taylor, Sid Wilson, Chris Fehn, and Jim Root. Gray died on May 24, 2010, and was replaced during 2011-2014 by guitarist Donnie Steele. Jordison left the band due to illness on December 12, 2013. Steele left during the recording sessions for .5: The Gray Chapter. The band found replacements in Alessandro Venturella on bass and Jay Weinberg on drums.', 'QEcoVJrZWu-8pTg_S4WHlik2Q7IH5yPS.jpg', 1, 1, 1619289148, 1619289659),
(13, 'Three Days Grace', 'Canadian rock band formed in Norwood, Ontario in 1997. Based in Toronto, the band\'s original line-up consisted of guitarist and lead vocalist Adam Gontier, drummer and backing vocalist Neil Sanderson, and bassist Brad Walst. In 2003, Barry Stock was recruited as the band\'s lead guitarist, making them a four-member band. In 2013, Gontier left the band and was replaced by My Darkest Days\' vocalist Matt Walst, who is also the younger brother of bassist Brad Walst.', 'ZFdsMRHRupJgch2zcb5Se0nDJkpTBLeG.jpg', 1, 1, 1619289700, 1619289700),
(14, 'Twenty One Pilots', 'American musical duo from Columbus, Ohio. The band was formed in 2009 by lead vocalist Tyler Joseph along with Nick Thomas and Chris Salih, both of whom left in 2011. Since their departure, the line-up has consisted of Joseph and drummer Josh Dun. The duo is best known for the singles \"Stressed Out\", \"Ride\", and \"Heathens\". The group received a Grammy Award for Best Pop Duo/Group Performance at the 59th Annual Grammy Awards for \"Stressed Out\".', 'Vxsfl_GHFFdk5KQqB__mxaLJFCHh2OdY.jpg', 1, 1, 1619290429, 1619290429),
(15, 'Сплин', 'Popular Russian rock band. They were formed and released their first album in 1994. Since then, they have remained one of the most popular rock bands in Russia and the former Soviet Union. The band\'s name is derived from \"spleen\", and the \"ea\" spelling in English is a pun on the spelling of the Beatles. It was borrowed from a short poem by Sasha Cherny, which the band set to music.', 'rDF6O2vq3t6hyaLaRJxyNFTI5wXfS0In.jpg', 1, 1, 1619291449, 1619291449),
(16, 'Sabaton', 'Swedish power metal band from Falun. The band\'s main lyrical themes are based on war, historical battles, and acts of heroism-the name is a reference to a sabaton, knight\'s foot armor. The armor and battle theme is heard in the albums Primo Victoria, Attero Dominatus, The Art of War, Coat of Arms, Carolus Rex, Heroes, and The Last Stand in which all of the songs contain these motifs, except final tracks which are tribute songs to influential heavy metal bands. Their latest album, The Great War, was released on 19 July 2019, with the songs all being based on World War I. Lyrical content drawn from World War I, World War II and other historical conflicts is prevalent and lyrics often recite stories of heroic deeds by men, women and armies.', '71a9F1_Ytb40nlRgjrfmk9VXkkY5Lt_-.jpg', 1, 1, 1619291673, 1619291673),
(17, 'Morphine', 'American alternative rock group formed by Mark Sandman, Dana Colley, and Jerome Deupree in Cambridge, Massachusetts in 1989. After five successful albums and extensive touring, they disbanded after lead vocalist Sandman died of a heart attack onstage in Palestrina, Italy, on July 3, 1999. Founding members have reformed into the band Vapors of Morphine, maintaining much of the original style and sound.', 'ZjjkRSlApu_tBuBlVAyNNrsrK5p6GPtm.jpg', 1, 1, 1622906542, 1622906542);

-- --------------------------------------------------------

--
-- Структура таблицы `content_type`
--

CREATE TABLE `content_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `content_type`
--

INSERT INTO `content_type` (`id`, `name`) VALUES
(1, 'artist'),
(2, 'album'),
(3, 'track'),
(4, 'playlist'),
(5, 'favorite'),
(6, 'genre'),
(8, 'social');

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `creator` bigint(20) NOT NULL,
  `editor` bigint(20) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`id`, `name`, `creator`, `editor`, `created_at`, `updated_at`) VALUES
(1, 'Rock', 1, 1, 1618852236, 1618852236),
(2, 'Classic metal', 1, 1, 1618852294, 1618852638),
(4, 'Alternative', 1, 1, 1618852605, 1618852641),
(5, 'Hard rock', 1, 1, 1618852622, 1618852669),
(6, 'Punk', 1, 1, 1618852659, 1618852820),
(8, 'Nu metal', 1, 1, 1619288063, 1619288063),
(9, 'Industrial', 1, 1, 1619288364, 1619288364),
(10, 'Post-hardcore', 1, 1, 1619288576, 1619291476),
(11, 'Electronic', 1, 1, 1619288581, 1619288581),
(12, 'Extreme metal', 1, 1, 1619288722, 1619288722),
(13, 'Epic metal', 1, 1, 1619289066, 1619289066),
(14, 'Indie', 1, 1, 1619290544, 1619290544),
(15, 'Russian rock', 1, 1, 1619291466, 1619291466),
(17, 'Blues-rock', 1, 1, 1622909822, 1622909822),
(18, 'Jazz-rock', 1, 1, 1622909825, 1622909825),
(19, 'Low-rock', 1, 1, 1622909829, 1622909829);

-- --------------------------------------------------------

--
-- Структура таблицы `genre_content`
--

CREATE TABLE `genre_content` (
  `id` bigint(20) NOT NULL,
  `genre` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `content` bigint(20) NOT NULL,
  `creator` bigint(20) NOT NULL,
  `editor` bigint(20) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genre_content`
--

INSERT INTO `genre_content` (`id`, `genre`, `type`, `content`, `creator`, `editor`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 1, 1, 1, 1619277795, 1619277795),
(2, 1, 1, 1, 1, 1, 1619277846, 1619372534),
(3, 2, 1, 2, 1, 1, 1619282752, 1619282752),
(4, 1, 1, 3, 1, 1, 1619282811, 1619282811),
(5, 8, 1, 4, 1, 1, 1619288070, 1619288070),
(6, 6, 1, 5, 1, 1, 1619288185, 1619288185),
(7, 9, 1, 6, 1, 1, 1619288369, 1619288369),
(8, 1, 1, 6, 1, 1, 1619288374, 1619288374),
(9, 4, 1, 7, 1, 1, 1619288447, 1619288447),
(10, 8, 1, 7, 1, 1, 1619288453, 1619288453),
(11, 1, 1, 7, 1, 1, 1619288457, 1619288457),
(12, 1, 1, 8, 1, 1, 1619288520, 1619288520),
(13, 4, 1, 8, 1, 1, 1619288524, 1619288524),
(14, 10, 1, 9, 1, 1, 1619288593, 1619288593),
(16, 1, 1, 9, 1, 1, 1619288655, 1619288655),
(17, 11, 1, 9, 1, 1, 1619288660, 1619288660),
(18, 12, 1, 10, 1, 1, 1619288726, 1619288726),
(19, 13, 1, 11, 1, 1, 1619289074, 1619289074),
(20, 8, 1, 12, 1, 1, 1619289276, 1619289276),
(21, 1, 1, 13, 1, 1, 1619290287, 1619290287),
(22, 4, 1, 13, 1, 1, 1619290291, 1619290291),
(24, 14, 1, 14, 1, 1, 1619290580, 1619290580),
(28, 15, 1, 15, 1, 1, 1619291633, 1619291633),
(29, 13, 1, 16, 1, 1, 1619291689, 1619291689),
(37, 17, 1, 17, 1, 1, 1622909844, 1622909844),
(38, 18, 1, 17, 1, 1, 1622909847, 1622909847),
(39, 19, 1, 17, 1, 1, 1622909851, 1622909851);

-- --------------------------------------------------------

--
-- Структура таблицы `heart`
--

CREATE TABLE `heart` (
  `id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `content` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `creator` bigint(20) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `heart`
--

INSERT INTO `heart` (`id`, `type`, `content`, `status`, `creator`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, 1, 1620903406, 1622910591),
(2, 1, 2, 1, 1, 1620915816, 1622550373),
(3, 1, 1, 1, 1, 1620915823, 1621451398),
(4, 1, 15, 1, 1, 1620915846, 1621454889),
(5, 3, 227, 1, 1, 1620918544, 1621504406),
(6, 3, 355, 1, 1, 1620921710, 1621454707),
(7, 3, 203, 1, 1, 1620921924, 1621454700),
(8, 2, 11, 1, 1, 1620923118, 1621454847),
(9, 3, 152, 1, 1, 1621071247, 1621071247),
(10, 1, 2, 1, 2, 1621075592, 1621075592),
(11, 3, 227, 1, 2, 1621099060, 1621099060),
(12, 3, 150, 1, 1, 1621106062, 1621451428),
(13, 3, 199, 1, 1, 1621420437, 1621454693),
(14, 3, 208, 1, 1, 1621420449, 1621420449),
(15, 2, 16, 1, 1, 1621420454, 1621420454),
(16, 2, 25, 1, 1, 1621438613, 1621438613),
(17, 3, 148, 1, 1, 1621451039, 1621451548),
(18, 2, 10, 1, 1, 1621451236, 1621451396),
(19, 3, 200, 1, 1, 1621454368, 1621454368),
(20, 3, 762, 1, 1, 1621505431, 1621506610),
(21, 2, 47, 1, 1, 1621506130, 1621506956),
(22, 2, 43, 1, 1, 1621506958, 1621506958),
(23, 2, 22, 1, 1, 1621516705, 1621516705),
(24, 1, 5, 1, 1, 1621635673, 1621635673),
(25, 3, 1912, 1, 1, 1622910365, 1622910589),
(26, 1, 17, 1, 1, 1622910596, 1622910596),
(27, 2, 128, 1, 1, 1622910598, 1622910598);

-- --------------------------------------------------------

--
-- Структура таблицы `heart_status`
--

CREATE TABLE `heart_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `heart_status`
--

INSERT INTO `heart_status` (`id`, `name`) VALUES
(1, 'active'),
(2, 'inactive');

-- --------------------------------------------------------

--
-- Структура таблицы `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `language`
--

INSERT INTO `language` (`id`, `name`, `code`) VALUES
(1, 'English', 'en-US'),
(2, 'Russian', 'ru-RU');

-- --------------------------------------------------------

--
-- Структура таблицы `playlist`
--

CREATE TABLE `playlist` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `access` int(11) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `creator` bigint(20) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `playlist`
--

INSERT INTO `playlist` (`id`, `name`, `access`, `image`, `creator`, `created_at`, `updated_at`) VALUES
(1, 'Аниме', 3, 'jSPjd-z9vUj65G0wV5_BJyUhXjF0vhnR.gif', 1, 1621461161, 1622391026),
(5, 'Интересное', 3, NULL, 2, 1621509248, 1621509838);

-- --------------------------------------------------------

--
-- Структура таблицы `playlist_content`
--

CREATE TABLE `playlist_content` (
  `id` bigint(20) NOT NULL,
  `playlist` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `content` bigint(20) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `playlist_content`
--

INSERT INTO `playlist_content` (`id`, `playlist`, `type`, `content`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 2, 1621468260, 1621468260),
(4, 1, 1, 1, 1621503318, 1621503318),
(5, 1, 2, 18, 1621504037, 1621504037),
(6, 1, 3, 227, 1621504121, 1621504121),
(8, 1, 3, 148, 1621504588, 1621504588),
(10, 1, 3, 199, 1621504720, 1621504720),
(12, 1, 3, 150, 1621508712, 1621508712),
(13, 1, 3, 355, 1621508959, 1621508959),
(14, 5, 1, 2, 1621509830, 1621509830);

-- --------------------------------------------------------

--
-- Структура таблицы `social`
--

CREATE TABLE `social` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `creator` bigint(20) NOT NULL,
  `editor` bigint(20) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `social`
--

INSERT INTO `social` (`id`, `name`, `image`, `creator`, `editor`, `created_at`, `updated_at`) VALUES
(1, 'Website', 'ovTSojwBg889tCFNVudDk-XL7FfuFsDV.svg', 1, 1, 1618856679, 1618858993),
(2, 'VK', 'CqDswULZrZen8zu1dMnmH6Qgqz5Wiv78.svg', 1, 1, 1618857150, 1618858497),
(3, 'Facebook', 'w_tdTeRj1jtQfLlfsItO2UQ9GSDpVZrz.svg', 1, 1, 1618859008, 1618859008),
(4, 'Twitter', 'Lb32YOb8Ab3HFcS57EaxYP2YLnYEfRpV.svg', 1, 1, 1618859018, 1618859018),
(5, 'Youtube', '5IGanOAejIK4pFaS18HeMrL8KzBKDHSI.svg', 1, 1, 1618859032, 1618859032),
(6, 'Instagram', 'M-t9uq-jKmflSluhgApTCuJQi6yMl5Ta.svg', 1, 1, 1618859046, 1618859046);

-- --------------------------------------------------------

--
-- Структура таблицы `social_content`
--

CREATE TABLE `social_content` (
  `id` bigint(20) NOT NULL,
  `social` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `artist` bigint(20) NOT NULL,
  `creator` bigint(20) NOT NULL,
  `editor` bigint(20) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `social_content`
--

INSERT INTO `social_content` (`id`, `social`, `url`, `artist`, `creator`, `editor`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://skillet.com', 1, 1, 1, 1619296299, 1619372545),
(2, 2, 'https://vk.com/skillet', 1, 1, 1, 1619299936, 1619299936),
(3, 3, 'https://facebook.com/skillet', 1, 1, 1, 1619299951, 1619299951),
(4, 4, 'https://twitter.com/skilletmusic', 1, 1, 1, 1619299960, 1619299960),
(5, 5, 'https://youtube.com/skilletband', 1, 1, 1, 1619299969, 1619299969),
(6, 6, 'https://instagram.com/skilletmusic', 1, 1, 1, 1619299977, 1619299977),
(7, 1, 'https://www.metallica.com', 2, 1, 1, 1619300280, 1619300280),
(8, 3, 'https://facebook.com/Metallica', 2, 1, 1, 1619300289, 1619300289),
(9, 4, 'https://twitter.com/metallica', 2, 1, 1, 1619300299, 1619300299),
(10, 5, 'https://youtube.com/user/MetallicaTV', 2, 1, 1, 1619300309, 1619300309),
(11, 6, 'https://instagram.com/metallica', 2, 1, 1, 1619300321, 1619300321),
(12, 1, 'https://www.imaginedragonsmusic.com', 3, 1, 1, 1619300409, 1619300409),
(13, 3, 'https://www.facebook.com/ImagineDragons', 3, 1, 1, 1619300415, 1619300415),
(14, 4, 'https://twitter.com/imaginedragons', 3, 1, 1, 1619300426, 1619300426),
(15, 5, 'https://www.youtube.com/user/ImagineDragonsVEVO', 3, 1, 1, 1619300436, 1619300436),
(16, 6, 'https://www.instagram.com/imaginedragons', 3, 1, 1, 1619300444, 1619300444),
(17, 1, 'https://www.fivefingerdeathpunch.com', 4, 1, 1, 1619300472, 1619300472),
(18, 3, 'https://www.facebook.com/fivefingerdeathpunch', 4, 1, 1, 1619300483, 1619300483),
(19, 4, 'https://twitter.com/ffdp', 4, 1, 1, 1619300491, 1619300491),
(20, 5, 'https://www.youtube.com/user/5fdp', 4, 1, 1, 1619300502, 1619300502),
(21, 6, 'https://www.instagram.com/5fdp', 4, 1, 1, 1619300509, 1619300509),
(22, 1, 'https://www.korol-i-shut.ru', 5, 1, 1, 1619300534, 1619300534),
(23, 2, 'https://vk.com/korol_i_shut_ru', 5, 1, 1, 1619300542, 1619300542),
(24, 3, 'https://www.facebook.com/korolishut', 5, 1, 1, 1619300550, 1619300550),
(25, 4, 'https://twitter.com/korol_i_shut', 5, 1, 1, 1619300558, 1619300558),
(26, 5, 'https://www.youtube.com/thekorolishut', 5, 1, 1, 1619300565, 1619300565),
(27, 1, 'https://www.rammstein.de', 6, 1, 1, 1619300587, 1619300587),
(28, 3, 'https://www.facebook.com/Rammstein', 6, 1, 1, 1619300599, 1619300599),
(29, 4, 'https://twitter.com/RSprachrohr', 6, 1, 1, 1619300609, 1619300609),
(30, 5, 'https://www.youtube.com/channel/UCYp3rk70ACGXQ4gFAiMr1SQ', 6, 1, 1, 1619300617, 1619300617),
(31, 6, 'https://www.instagram.com/rammsteinofficial', 6, 1, 1, 1619300625, 1619300625),
(32, 1, 'https://www.disturbed1.com', 7, 1, 1, 1619300651, 1619300651),
(33, 2, 'https://vk.com/disturbedofficial', 7, 1, 1, 1619300662, 1619300662),
(34, 3, 'https://www.facebook.com/Disturbed', 7, 1, 1, 1619300670, 1619300670),
(35, 4, 'https://twitter.com/Disturbed', 7, 1, 1, 1619300679, 1619300679),
(36, 5, 'https://www.youtube.com/user/DisturbedTV', 7, 1, 1, 1619300688, 1619300688),
(37, 6, 'https://www.instagram.com/disturbed', 7, 1, 1, 1619300698, 1619300698),
(38, 1, 'https://www.nirvana.com/', 8, 1, 1, 1619300754, 1619300754),
(39, 3, 'https://www.facebook.com/Nirvana', 8, 1, 1, 1619300766, 1619300766),
(40, 4, 'https://twitter.com/Nirvana', 8, 1, 1, 1619300774, 1619300774),
(41, 5, 'https://www.youtube.com/user/NirvanaVEVO', 8, 1, 1, 1619300783, 1619300783),
(42, 1, 'https://www.askingalexandria.com/', 9, 1, 1, 1619300812, 1619300812),
(43, 3, 'https://www.facebook.com/askingalexandria', 9, 1, 1, 1619300818, 1619300818),
(44, 4, 'https://twitter.com/aaofficial', 9, 1, 1, 1619300828, 1619300828),
(45, 6, 'https://www.instagram.com/askingalexandria/', 9, 1, 1, 1619300834, 1619300834),
(46, 1, 'https://www.bulletformyvalentine.com/', 10, 1, 1, 1619300866, 1619300866),
(47, 3, 'https://www.facebook.com/BulletForMyValentine', 10, 1, 1, 1619300873, 1619300873),
(48, 4, 'https://twitter.com/bfmvofficial', 10, 1, 1, 1619300883, 1619300883),
(49, 5, 'https://www.youtube.com/user/bullettv', 10, 1, 1, 1619300893, 1619300893),
(50, 6, 'https://www.instagram.com/bfmvofficial/', 10, 1, 1, 1619300901, 1619300901),
(51, 1, 'https://www.powerwolf.net', 11, 1, 1, 1619300925, 1619300925),
(52, 3, 'https://www.facebook.com/powerwolfmetal', 11, 1, 1, 1619300933, 1619300933),
(53, 4, 'https://twitter.com/powerwolfband', 11, 1, 1, 1619300940, 1619300940),
(54, 5, 'https://www.youtube.com/user/Powerwolfmetal', 11, 1, 1, 1619300948, 1619300948),
(55, 6, 'https://www.instagram.com/officialpowerwolf', 11, 1, 1, 1619300957, 1619300957),
(56, 1, 'https://www.slipknot1.com', 12, 1, 1, 1619300980, 1619300980),
(57, 3, 'https://www.facebook.com/slipknot', 12, 1, 1, 1619300990, 1619300990),
(58, 4, 'https://twitter.com/slipknot', 12, 1, 1, 1619300998, 1619300998),
(59, 5, 'https://www.youtube.com/channel/UCh9xZWuDWSMeedunotdYYrQ', 12, 1, 1, 1619301005, 1619301005),
(60, 6, 'https://www.instagram.com/slipknot', 12, 1, 1, 1619301014, 1619301014),
(61, 1, 'https://threedaysgrace.com/', 13, 1, 1, 1619301036, 1619301036),
(62, 2, 'https://vk.com/threedaysgraceofficial', 13, 1, 1, 1619301043, 1619301043),
(63, 3, 'https://www.facebook.com/threedaysgrace', 13, 1, 1, 1619301051, 1619301051),
(64, 4, 'https://twitter.com/threedaysgrace', 13, 1, 1, 1619301063, 1619301063),
(65, 5, 'https://www.youtube.com/user/ThreeDaysGraceVEVO', 13, 1, 1, 1619301070, 1619301070),
(66, 6, 'https://www.instagram.com/threedaysgraceofficial/', 13, 1, 1, 1619301076, 1619301076),
(67, 1, 'https://www.twentyonepilots.com/', 14, 1, 1, 1619301094, 1619301094),
(68, 3, 'https://www.facebook.com/twentyonepilots', 14, 1, 1, 1619301101, 1619301101),
(69, 4, 'https://twitter.com/twentyonepilots', 14, 1, 1, 1619301111, 1619301349),
(70, 5, 'https://www.youtube.com/channel/UCBQZwaNPFfJ1gZ1fLZpAEGw', 14, 1, 1, 1619301120, 1619301354),
(71, 6, 'https://www.instagram.com/twentyonepilots/', 14, 1, 1, 1619301127, 1619301360),
(72, 1, 'https://splean.ru/', 15, 1, 1, 1619301486, 1619301486),
(73, 2, 'https://vk.com/spleanru', 15, 1, 1, 1619301493, 1619301493),
(74, 3, 'https://www.facebook.com/SpleanRu/', 15, 1, 1, 1619301501, 1619301501),
(75, 4, 'https://twitter.com/spleanru', 15, 1, 1, 1619301509, 1619301509),
(76, 5, 'https://www.youtube.com/user/spleanmasterskaya', 15, 1, 1, 1619301516, 1619301516),
(77, 6, 'https://www.instagram.com/spleanband/', 15, 1, 1, 1619301524, 1619301524),
(78, 1, 'https://www.sabaton.net', 16, 1, 1, 1619301558, 1619301558),
(79, 3, 'https://www.facebook.com/sabaton', 16, 1, 1, 1619301576, 1619301576),
(80, 4, 'https://twitter.com/sabaton', 16, 1, 1, 1619301585, 1619301585),
(81, 5, 'https://www.youtube.com/user/sabaton', 16, 1, 1, 1619301593, 1619301593),
(82, 6, 'https://www.instagram.com/sabatonofficial', 16, 1, 1, 1619301599, 1619301599),
(83, 3, 'https://www.facebook.com/morphinemusic', 17, 1, 1, 1622909664, 1622909664);

-- --------------------------------------------------------

--
-- Структура таблицы `track`
--

CREATE TABLE `track` (
  `id` bigint(20) NOT NULL,
  `album` bigint(20) NOT NULL,
  `disk` int(11) DEFAULT 1,
  `number` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `playtime` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `creator` bigint(20) NOT NULL,
  `editor` bigint(20) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `track`
--

INSERT INTO `track` (`id`, `album`, `disk`, `number`, `name`, `signature`, `playtime`, `file`, `creator`, `editor`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'I Can', '', '4:18', 'Fgd2LN3LfmUXb-SBZTwPOl5DxXVWGEcf.mp3', 1, 1, 1619629602, 1619629602),
(2, 1, 1, 2, 'Gasoline', '', '4:02', 'gqEZMPbwcGQXZlWjAYlfFUr8G3-VncBQ.mp3', 1, 1, 1619629602, 1619629602),
(3, 1, 1, 3, 'Saturn', '', '5:10', 'koNxy7CSiqRiNnro8-xyom0zl14TZRHY.mp3', 1, 1, 1619629602, 1619629602),
(4, 1, 1, 4, 'My Beautiful Robe', '', '3:39', 'oz7kH9jnVYpFKu75nX059XpB6dc2S6iM.mp3', 1, 1, 1619629602, 1619629602),
(5, 1, 1, 5, 'Promise Blender', '', '3:56', 'XWYHTljm4ZWW4OLyyKudfT8pSB6zsnpT.mp3', 1, 1, 1619629602, 1619629602),
(6, 1, 1, 6, 'Paint', '', '3:21', 'a-EgQYpdYjMcvKMkC7ia5C0hAJLPUYcY.mp3', 1, 1, 1619629602, 1619629602),
(7, 1, 1, 7, 'Safe With You', '', '3:49', 'DbgiM8c8WULQqtDRF2hK_iu8waqFt7Yh.mp3', 1, 1, 1619629602, 1619629602),
(8, 1, 1, 8, 'You Thought', '', '3:41', 'iU6Dgmvm5W2mNxOESModLA7U-XBLyISc.mp3', 1, 1, 1619629602, 1619629602),
(9, 1, 1, 9, 'Boundaries', '', '4:06', '6JqG-Hb67AVpZyHVWkl7nb5OUnRArebx.mp3', 1, 1, 1619629602, 1619629602),
(10, 1, 1, 10, 'Splinter', '', '2:41', 'yPu2fuGVGe75ewVfmZUawvN-rzdg_gri.mp3', 1, 1, 1619629602, 1619629602),
(11, 2, 1, 1, 'Hey You, I Love Your Soul', '', '2:59', 'xzL0zG_WETGeZkHM7bWrOBeG33zt7Zi7.mp3', 1, 1, 1619629724, 1619629724),
(12, 2, 1, 2, 'Deeper', '', '3:48', 'jaYHKJ3Lfnqyi5Rmhvwk9CrDrq3rAtgn.mp3', 1, 1, 1619629724, 1619629724),
(13, 2, 1, 3, 'Locked In A Cage', '', '3:55', 'aPoI7do8ivb3Zz2GtrM7v-hSZTiE2oDT.mp3', 1, 1, 1619629724, 1619629724),
(14, 2, 1, 4, 'Your Love (Keeps Me Alive)', '', '3:56', 'OFD5DD8G257Q5qQCYC0jSuqNuRKT6nPz.mp3', 1, 1, 1619629724, 1619629724),
(15, 2, 1, 5, 'More Faithful', '', '3:45', 'VemUDAUplLzGAQeJ04vngKV3TTYdn2X-.mp3', 1, 1, 1619629724, 1619629724),
(16, 2, 1, 6, 'Pour', '', '4:19', 'l3nOs2sA-zc2j8DRs-hGIL3VRwYgq-lY.mp3', 1, 1, 1619629724, 1619629724),
(17, 2, 1, 7, 'Suspended In You', '', '3:09', 'S_mZGgRjJB2ex1JQ-NkQcbk_TKdAmRUJ.mp3', 1, 1, 1619629725, 1619629725),
(18, 2, 1, 8, 'Take', '', '4:13', 'icmQlwsYXf5VYZi2va_eBiLY2HegAnGO.mp3', 1, 1, 1619629725, 1619629725),
(19, 2, 1, 9, 'Coming Down', '', '5:07', 'pzbBVIzghJCPf0rx4z6LphqdZK_3efnz.mp3', 1, 1, 1619629725, 1619629725),
(20, 2, 1, 10, 'Whirlwind', '', '4:02', 'z2V-BLRDnTX-hWi3hDNfQ5_SwWvcfchc.mp3', 1, 1, 1619629725, 1619629725),
(21, 2, 1, 11, 'Dive Over In', '', '3:43', 'geGyp3sFqtVrAy7r31yfZhlnjWuWLTvV.mp3', 1, 1, 1619629725, 1619629725),
(22, 2, 1, 12, 'Scarecrow', '', '4:18', '2HxdGzgNYWBWtJRddW2ttxWaq6o9oJw1.mp3', 1, 1, 1619629725, 1619629725),
(23, 3, 1, 1, 'Best Kept Secret', '', '3:55', 'tWCFO3denRIKkrW2o-rZOpL02GBsKqbo.mp3', 1, 1, 1619631925, 1619631925),
(24, 3, 1, 2, 'You Take My Rights Away', '', '4:32', 'VFBnqEVzsES7jyXlLhPObx56ek6T0D0M.mp3', 1, 1, 1619631925, 1619631925),
(25, 3, 1, 3, 'Invincible', '', '3:52', '7R2F-r63MpChVzPO_J6HWJQKycqJQSNy.mp3', 1, 1, 1619631925, 1619631925),
(26, 3, 1, 4, 'Rest', '', '3:48', 'ZSXXvlLtLCafAJquamTHGUDDUaHWNY3W.mp3', 1, 1, 1619631925, 1619631925),
(27, 3, 1, 5, 'Come on to the Future', '', '3:54', 'ZRK_lq4HCtb2PHEiHREPVbFW8z80I2qU.mp3', 1, 1, 1619631926, 1619631926),
(28, 3, 1, 6, 'You\'re Powerful', '', '3:26', '-LYSmHLfDQ_5PpOXnwilGkZ5GwRHrX2c.mp3', 1, 1, 1619631926, 1619631926),
(29, 3, 1, 7, 'I Trust You', '', '3:39', 'MA9ilhAmF3bD16CnTaaB7eGV2Uxam3aw.mp3', 1, 1, 1619631926, 1619631926),
(30, 3, 1, 8, 'Each Other', '', '3:26', 'ZvnO1uRrgiGbsRDbvbmRRsueSdfD5fzo.mp3', 1, 1, 1619631926, 1619631926),
(31, 3, 1, 9, 'The Fire Breathers', '', '3:42', 'Xewncb-y87s1tIVdesrjOwhVrYsSoPcB.mp3', 1, 1, 1619631926, 1619631926),
(32, 3, 1, 10, 'Say It Loud', '', '3:32', 'H9WorFdL1fDeqckTEZiwjjH1Ziag_kLv.mp3', 1, 1, 1619631926, 1619631926),
(33, 3, 1, 11, 'The One', '', '4:12', 'Nsz1-MynH0xDkcUo5ZnY-hxdFcusUEMn.mp3', 1, 1, 1619631926, 1619631926),
(34, 3, 1, 12, 'You\'re in My Brain/Angels Fall', '', '10:41', '1uC0W1zofCOckqdL4AHSwXhfrYphM-1a.mp3', 1, 1, 1619631926, 1619631926),
(35, 4, 1, 1, 'Alien Youth', '', '4:12', 'AFNa0LgRNGsMjF2-G3E_TsqANtvQDaTX.mp3', 1, 1, 1619631951, 1619631951),
(36, 4, 1, 2, 'Vapor', '', '3:39', 'RrZ5SJpTF47w8Y06BBeh8SILAXNw8EEE.mp3', 1, 1, 1619631951, 1619631951),
(37, 4, 1, 3, 'Earth Invasion', '', '4:47', 'zB4yGtHuQh1xbQmTJQG6WTb-lBxD9ge_.mp3', 1, 1, 1619631951, 1619631951),
(38, 4, 1, 4, 'You Are My Hope', '', '4:15', 'UhYO0cJJBShC6pkziMj0OeMq3Rq1v0QO.mp3', 1, 1, 1619631951, 1619631951),
(39, 4, 1, 5, 'Eating Me Away', '', '3:38', 'a3ZHb1n3oCwNOPeopqxL1Xpspha2zh3A.mp3', 1, 1, 1619631951, 1619631951),
(40, 4, 1, 6, 'Kill Me Heal Me', '', '3:36', 'io-HN9WD0OmQ-8Cyb_s0wgKhfe_iQb6H.mp3', 1, 1, 1619631952, 1619631952),
(41, 4, 1, 7, 'The Thirst Is Taking Over', '', '6:33', 'miSHjwJkMHCbRX8DK2t1YMiVBNXCUwcS.mp3', 1, 1, 1619631952, 1619631952),
(42, 4, 1, 8, 'One Real Thing', '', '3:35', '9dsB1kaiA6y95Fyd3BAuQ-iCo5kcG3fv.mp3', 1, 1, 1619631952, 1619631952),
(43, 4, 1, 9, 'Stronger', '', '4:07', 'u0zDOWlSGXfkg0lSpKS-uSp9ptouStJ5.mp3', 1, 1, 1619631952, 1619631952),
(44, 4, 1, 10, 'Rippin\' Me Off', '', '4:46', 'ekYBs6lXPjSPjrXjSfz51XlNchvyi1Hz.mp3', 1, 1, 1619631952, 1619631952),
(45, 4, 1, 11, 'Will You Be There', '', '5:09', '2aWPF5GkZdEwyOLxXitdyIKw_N6fwln-.mp3', 1, 1, 1619631952, 1619631952),
(46, 4, 1, 12, 'Come My Way', '', '5:02', 'RVDvKozUxairK7ELNLZYawABn8N7d6WR.mp3', 1, 1, 1619631952, 1619631952),
(47, 5, 1, 1, 'Forsaken', '', '4:12', 'G2wS91FyeO5Pb_LoUZxPJg7z3558-kOu.mp3', 1, 1, 1619631987, 1619631987),
(48, 5, 1, 2, 'Savior', '', '4:34', 'INarCasvh_AI7vPcnNJfnwLtLC3SRAPk.mp3', 1, 1, 1619631987, 1619631987),
(49, 5, 1, 3, 'Open Wounds', '', '3:16', 'RSsp4Z0l49CxdS4hrgblf6VWjVN0y177.mp3', 1, 1, 1619631987, 1619631987),
(50, 5, 1, 4, 'A Little More', '', '4:50', 'A3FaTot1fdAzUSDSdy71Llrjw5-VAUfb.mp3', 1, 1, 1619631987, 1619631987),
(51, 5, 1, 5, 'My Obsession', '', '5:01', 'nWn6cTFhDWW1gKwqCHfDqezamTdBbZpY.mp3', 1, 1, 1619631987, 1619631987),
(52, 5, 1, 6, 'Collide', '', '5:38', 'NPzOkA36chSkLRDGGnHIx8QEva5mlQMJ.mp3', 1, 1, 1619631987, 1619631987),
(53, 5, 1, 7, 'Fingernails', '', '5:07', '5xENbPATFKK45hMqTxcDhJJJqfZnZ0nd.mp3', 1, 1, 1619631987, 1619631987),
(54, 5, 1, 8, 'Imperfection', '', '4:07', 'sLOAnXynl25tsfvofrUcrj3LnvZ6t1K3.mp3', 1, 1, 1619631987, 1619631987),
(55, 5, 1, 9, 'Under My Skin', '', '4:06', 'njo8RFTsmXnhmpCnrOH8anFuBWoLIQmS.mp3', 1, 1, 1619631987, 1619631987),
(56, 5, 1, 10, 'Energy', '', '3:57', '1UTl7v_y3i4660j-5bk-R2Mx44AvLu5i.mp3', 1, 1, 1619631987, 1619631987),
(57, 5, 1, 11, 'Cycle Down', '', '3:58', 'b9v9shasSEuanz7gbs7svgmXyY7yIruu.mp3', 1, 1, 1619631987, 1619631987),
(69, 6, 1, 1, 'Rebirthing', '', '3:53', 'Ald92dCR8cLBUbko-Gd-VE5rhzSlFESx.mp3', 1, 1, 1619632113, 1619632113),
(70, 6, 1, 2, 'The Last Night', '', '3:32', 'aNrYm7qKmXC3k02Xf5lgR2wQWqMh85aq.mp3', 1, 1, 1619632113, 1619632113),
(71, 6, 1, 3, 'Yours To Hold', '', '3:42', '37JvQQtz8BAdRvV2j16GhnkKQV5UNDc6.mp3', 1, 1, 1619632114, 1619632114),
(72, 6, 1, 4, 'Better Than Drugs', '', '3:58', 'BfiUeufCQygewZsEL_jueIJyK-IqNhV_.mp3', 1, 1, 1619632114, 1619632114),
(73, 6, 1, 5, 'Comatose', '', '3:51', '-FfQq9QHd4EwSUigcSU1FB-_TdAXcKqH.mp3', 1, 1, 1619632114, 1619632114),
(74, 6, 1, 6, 'The Older I Get', '', '3:38', 'V8unjwEFU6986hTgN4j7UdiOPgkQlFUm.mp3', 1, 1, 1619632114, 1619632114),
(75, 6, 1, 7, 'Those Nights', '', '3:47', 'dTy7L89JLt-vvC7F6OMK3SR68Oo6j9ZI.mp3', 1, 1, 1619632114, 1619632114),
(76, 6, 1, 8, 'Falling Inside the Black', '', '3:30', 'UCRABt18PinaZO2xjTxFbDP5Ja9GWSw5.mp3', 1, 1, 1619632114, 1619632114),
(77, 6, 1, 9, 'Say Goodbye', '', '4:17', 'gH4XP7PXeJ29nWntHdI5y7LQmJruMRHe.mp3', 1, 1, 1619632114, 1619632114),
(78, 6, 1, 10, 'Whispers in the Dark', '', '3:24', 'so1b2BA5DXUTn9yNU7KSvyX4kGeT2lgu.mp3', 1, 1, 1619632114, 1619632114),
(79, 6, 1, 11, 'Looking For Angels', '', '4:33', '1yLG-nCTxPQWS3Jac6vDaN0wi_yfTX0E.mp3', 1, 1, 1619632114, 1619632114),
(80, 6, 1, 12, 'Live Free Or Let Me Die', '', '3:52', 'TNQQq2G4kt8tX1m-VG2WE2z_AMqZO0Ql.mp3', 1, 1, 1619632114, 1619632114),
(96, 7, 1, 1, 'Hero', '', '3:07', 'MNIiEJyrZhEuLIhMhxxYI3bXa4tIxaUD.mp3', 1, 1, 1619633408, 1619633408),
(97, 7, 1, 2, 'Monster', '', '2:58', '0tHZb2dipmbu2tMoq32oIr2Ir55dbUk6.mp3', 1, 1, 1619633408, 1619633408),
(98, 7, 1, 3, 'Don\'t Wake Me', '', '3:55', '98tGbfIS-nxxHCdXtTFb2Ee43GQU0fdJ.mp3', 1, 1, 1619633408, 1619633408),
(99, 7, 1, 4, 'Awake And Alive', '', '3:32', 'pP-gdHllOdud95PYludrhn4l1bIEdR4T.mp3', 1, 1, 1619633408, 1619633408),
(100, 7, 1, 5, 'One Day Too Late', '', '3:40', 'ChkK7aj0LAppHUNTsL9qUqRt1U6Yp2K5.mp3', 1, 1, 1619633409, 1619633409),
(101, 7, 1, 6, 'It\'s Not Me It\'s You', '', '3:25', 'xiQgGnjZABgExck49hkHBJJ9LpM6CB0M.mp3', 1, 1, 1619633409, 1619633409),
(102, 7, 1, 7, 'Should\'ve When You Could\'ve', '', '3:31', 'frNInsumQCaiXTLAx_wgatCHZBLm8t3W.mp3', 1, 1, 1619633409, 1619633409),
(103, 7, 1, 8, 'Believe', '', '3:51', 'jqkQvIQPdp_A1veypKlSey-LrK0Ar4PP.mp3', 1, 1, 1619633409, 1619633409),
(104, 7, 1, 9, 'Forgiven', '', '3:40', 'cnJKUwK3nLRSeU-UEn36pr6wnx7aoA7N.mp3', 1, 1, 1619633409, 1619633409),
(105, 7, 1, 10, 'Sometimes', '', '3:29', 'InJ9NdgMtZMQPfvwHYUm08ZHn80IBxfa.mp3', 1, 1, 1619633409, 1619633409),
(106, 7, 1, 11, 'Never Surrender', '', '3:31', 'Vf40-iGhcvzZmvgSykxE2UlDjpOxE6PE.mp3', 1, 1, 1619633409, 1619633409),
(107, 7, 1, 12, 'Lucy', '', '3:42', '9kVjHV3Xo8kkpAHPQ1wEvUnVIYA3dpYM.mp3', 1, 1, 1619633409, 1619633409),
(108, 7, 1, 13, 'Dead Inside', 'Bonus Track', '2:57', 'ehATg86e_jq6GYRF4ts_ncNwbZIJJ70R.mp3', 1, 1, 1619633409, 1619633427),
(109, 7, 1, 14, 'Would It Matter', 'Bonus Track', '4:12', 'PjWLucWcQtjub5Dct-ONlWFaJkPTwho8.mp3', 1, 1, 1619633409, 1619633435),
(110, 7, 1, 15, 'Monster', 'Radio Edit / Bonus Track', '2:58', 'HhuV3D4EbwurlpRTomGXJWfQDnDEfQ7a.mp3', 1, 1, 1619633409, 1619633454),
(111, 8, 1, 1, 'Rise', '', '4:21', '32BifuEDdbr5KgRuLZwxKg3MPneKAnHs.mp3', 1, 1, 1619633485, 1619633485),
(112, 8, 1, 2, 'Sick Of It', '', '3:11', 'E2A7kQfRVzCxlceBPg1xH2stMqDhzPV0.mp3', 1, 1, 1619633485, 1619633485),
(113, 8, 1, 3, 'Good To Be Alive', '', '5:00', '5oE2yMkM1cXNcVJmao2bwY6z-ulwysXs.mp3', 1, 1, 1619633485, 1619633485),
(114, 8, 1, 4, 'Not Gonna Die', '', '3:45', '_Z0PD4UxzU0SxKRJJ6Y5ayI6lT3cHaxp.mp3', 1, 1, 1619633485, 1619633485),
(115, 8, 1, 5, 'Circus For A Psycho', '', '4:32', '0lCfzXwrKy0XFMOS00akIgRWfBRew4xF.mp3', 1, 1, 1619633485, 1619633485),
(116, 8, 1, 6, 'American Noise', '', '4:10', 'EoCG4ZLnwJb42H_UknItfxIlLdHB2ES5.mp3', 1, 1, 1619633485, 1619633485),
(117, 8, 1, 7, 'Madness In Me', '', '4:18', 'kJ58dLA3d56V8C2cIFg2VlSW-PQDHyd4.mp3', 1, 1, 1619633485, 1619633485),
(118, 8, 1, 8, 'Salvation', '', '3:46', '6fir-SJM_sqXL56NRfoODQtH85uVFClJ.mp3', 1, 1, 1619633486, 1619633486),
(119, 8, 1, 9, 'Fire And Fury', '', '3:57', 'ouqJ69F7w0TNm-CZvTkEdziGlgKz2yQi.mp3', 1, 1, 1619633486, 1619633486),
(120, 8, 1, 10, 'My Religion', '', '4:13', 'DXM8fk5l64YIuiet4ssfbES_wytX8Zqz.mp3', 1, 1, 1619633486, 1619633486),
(121, 8, 1, 11, 'Hard To Find', '', '3:48', 'SpRkQg3vMC6EyrDohFqpeLzbHd8QV-A4.mp3', 1, 1, 1619633486, 1619633486),
(122, 8, 1, 12, 'What I Believe', '', '3:21', 'Skb9l8FztN0O4nt32nvHrP_VKHdk0Pc3.mp3', 1, 1, 1619633486, 1619633486),
(123, 8, 1, 13, 'Battle Cry', '', '3:46', 'FOyWTzRicWjSIgjRdneM2LExR85ymu26.mp3', 1, 1, 1619633486, 1619633486),
(124, 8, 1, 14, 'Everything Goes Black', '', '4:27', 'fGSNHokw40_ZSBhwnpxBRZsDSZsf45Tl.mp3', 1, 1, 1619633486, 1619633486),
(125, 8, 1, 15, 'Freakshow', '', '4:39', 'IdG6dBASqlV6ibOX0DnFRMC9ZUikodpn.mp3', 1, 1, 1619633486, 1619633486),
(126, 9, 1, 1, 'Rebirthing', '', '3:54', 'H9sdMp7dSevwMX2fqS5q7nOAxyl9lj7p.mp3', 1, 1, 1619634226, 1619634226),
(127, 9, 1, 2, 'Monster', '', '2:58', 'eEgR32tcsH9NS2BOVQkLz-MKojyNQ8jC.mp3', 1, 1, 1619634226, 1619634226),
(128, 9, 1, 3, 'Awake And Alive', '', '3:30', 'O9LRLAjeIzhHy5vnOoNpzUcLpc2zIpti.mp3', 1, 1, 1619634226, 1619634226),
(129, 9, 1, 4, 'The Last Night', '', '3:31', 'uOanun3mdoPOxoFCT2IhX16mcUVcD7g8.mp3', 1, 1, 1619634226, 1619634226),
(130, 9, 1, 5, 'Whispers In The Dark', '', '3:25', 'nE4at6SWWGj9UD88yofz-Ja63xNPoNAt.mp3', 1, 1, 1619634226, 1619634226),
(131, 9, 1, 6, 'Not Gonna Die', '', '3:46', 'Tcm1rrRUdrzJ4jrik482nlhBMSnvLO2h.mp3', 1, 1, 1619634226, 1619634226),
(132, 9, 1, 7, 'Comatose', '', '3:51', 'JMygIeYZxolDckE8FQFqKIIn9oQ_I2Dp.mp3', 1, 1, 1619634226, 1619634226),
(133, 9, 1, 8, 'Hero', '', '3:07', 'o3Z08cSYxBkgNoNKTrWRiiXHO6YGDGU_.mp3', 1, 1, 1619634226, 1619634226),
(134, 9, 1, 9, 'Sick Of It', '', '3:11', 'sZ2Sj5m8r5EKlAsLs4tJ0YYd0e3FS_j-.mp3', 1, 1, 1619634226, 1619634226),
(135, 9, 1, 10, 'Rise', '', '4:21', 'TLTbGXZBKvHTNhwe-Tli3EyIb1EzU-Ji.mp3', 1, 1, 1619634226, 1619634226),
(136, 10, 1, 1, 'Feel Invincible', '', '3:50', 'ZGzsylILcyxpnPxI1BrANXIZPbqNuj4Z.mp3', 1, 1, 1619634242, 1619634242),
(137, 10, 1, 2, 'Back From the Dead', '', '3:34', 'P8hmd3ClgMARu_XqFl2QCP-mrrV5aOxZ.mp3', 1, 1, 1619634242, 1619634242),
(138, 10, 1, 3, 'Stars', '', '3:46', 'ls7uXOidYQ2UV4cpnA_gwILtt3iL4Vzs.mp3', 1, 1, 1619634242, 1619634242),
(139, 10, 1, 4, 'I Want to Live', '', '3:29', '1_t7PQQqG_VihCEOC1Tg7DYcxubWXZFd.mp3', 1, 1, 1619634242, 1619634242),
(140, 10, 1, 5, 'Undefeated', '', '3:36', 'Jtu820nLqwepjjpgI4wHaGyatUpZ1hsu.mp3', 1, 1, 1619634242, 1619634242),
(141, 10, 1, 6, 'Famous', '', '3:18', '8fRrEU6BZUaPUprqfAT-fKluonVPdOQd.mp3', 1, 1, 1619634242, 1619634242),
(142, 10, 1, 7, 'Lions', '', '3:25', '9vRz-atNgyk59rNpRaLgTImAJnZDXEi_.mp3', 1, 1, 1619634242, 1619634242),
(143, 10, 1, 8, 'Out of Hell', '', '3:34', '529jIy09XJMJJP3dT_WMKoZdvSw_38VG.mp3', 1, 1, 1619634242, 1619634242),
(144, 10, 1, 9, 'Burn it Down', '', '3:17', '1QdoXOPAnBYurcmQPAar--TuZINbnxsA.mp3', 1, 1, 1619634242, 1619634242),
(145, 10, 1, 10, 'Watching for Comets', '', '3:29', 'm5imVE09slXM8752I51e4W3V3JaK05BV.mp3', 1, 1, 1619634242, 1619634242),
(146, 10, 1, 11, 'Saviors of the World', '', '3:46', 'C-ecnyPUvWc2RE6hoM9QaTKazfoprjCb.mp3', 1, 1, 1619634243, 1619634243),
(147, 10, 1, 12, 'The Resistance', '', '3:52', 'SEaZDRYuehkhFZfijBmuwps2f3H_So8S.mp3', 1, 1, 1619634243, 1619634243),
(148, 11, 1, 1, 'Legendary', '', '4:05', 'jxq5tP53XOBGheBmU48H2DNjOUoQGLj7.mp3', 1, 1, 1619634259, 1619634259),
(149, 11, 1, 2, 'You Ain\'t Ready', '', '3:18', 'aPEAcVBbkcxhhUh2SNGm-fuWcWGFgq7_.mp3', 1, 1, 1619634259, 1619634259),
(150, 11, 1, 3, 'Victorious', '', '4:06', 'q4u80_MdPwaKoyWTX7hghSna_oBA6lmX.mp3', 1, 1, 1619634259, 1619634259),
(151, 11, 1, 4, 'This Is the Kingdom', '', '3:28', 'm2n0GooAIWHe_w30mhKBGl937MZwEv-v.mp3', 1, 1, 1619634259, 1619634259),
(152, 11, 1, 5, 'Save Me', '', '3:43', 'X-1cPgwrrMBiktbMujlYRUFs1sZTcQ7c.mp3', 1, 1, 1619634260, 1619634260),
(153, 11, 1, 6, 'Rise Up', '', '3:58', 'Q21191YEWsofR_f0O4YCeOWPhuQEvp98.mp3', 1, 1, 1619634260, 1619634260),
(154, 11, 1, 7, 'Terrify the Dark', '', '3:46', 'BKTvihvae4SKWlRcn_lLusbDNG7XTAG1.mp3', 1, 1, 1619634260, 1619634260),
(155, 11, 1, 8, 'Never Going Back', '', '3:34', 'B0JPDJ-AoBFqXOyWlXbauwQAf70Om5oa.mp3', 1, 1, 1619634260, 1619634260),
(156, 11, 1, 9, 'Reach', '', '3:23', 'Ip8liLUlfHinnV_JV6z7Q588uHtq_3FN.mp3', 1, 1, 1619634260, 1619634260),
(157, 11, 1, 10, 'Anchor', '', '3:37', 'mVUZJh0J7XTz3cVbYd28N9rUROV-t-cz.mp3', 1, 1, 1619634260, 1619634260),
(158, 11, 1, 11, 'Finish Line', '', '3:26', 'SYKn7Doa9ohGw5uc5-V5Oyz0Ak2uvjIx.mp3', 1, 1, 1619634260, 1619634260),
(159, 11, 1, 12, 'Back to Life', '', '4:37', 'X0NzXXqS_4N7Nx0inljfBdpbt7JoNqRv.mp3', 1, 1, 1619634260, 1619634260),
(160, 12, 1, 1, 'Hit The Lights', '', '4:17', 'Jf_5YD7F7ppAMzE3AIh0Cb5ELdZlgzD8.mp3', 1, 1, 1619637283, 1619637283),
(161, 12, 1, 2, 'The Four Horsemen', '', '7:13', 'Qm-7HbqjY-qQhF_Q9DTtgHMF7azjyD4Q.mp3', 1, 1, 1619637283, 1619637283),
(162, 12, 1, 3, 'Motorbreath', '', '3:08', 'Aod7OTrjw2CkrqUVXFfVCZnCsRJoKmC5.mp3', 1, 1, 1619637283, 1619637283),
(163, 12, 1, 4, 'Jump In The Fire', '', '4:42', 'I1UaAytBd8DX4tU1S9r59jR1t6FEqAks.mp3', 1, 1, 1619637283, 1619637283),
(164, 12, 1, 5, '(Anesthesia) Pulling Teeth', '', '4:15', 'SrneNSC2Kod-N--Zg_5Zl7AwoZCNe-gj.mp3', 1, 1, 1619637283, 1619637283),
(165, 12, 1, 6, 'Whiplash', '', '4:11', 'fEXQcVBzWo54d15QUgTiS6RdM9n1KlJo.mp3', 1, 1, 1619637283, 1619637283),
(166, 12, 1, 7, 'Phantom Lord', '', '5:02', 'gZBVIQlfxTNZ1JLm_ia1EQC-cKUTQHiJ.mp3', 1, 1, 1619637284, 1619637284),
(167, 12, 1, 8, 'No Remorse', '', '6:27', 'PBs0-pzLXsop41huldm5vvKqtXd64ojb.mp3', 1, 1, 1619637284, 1619637284),
(168, 12, 1, 9, 'Seek & Destroy', '', '6:55', 'Z36mTEHsdjwNOA7HollbL068rUSVbBh8.mp3', 1, 1, 1619637284, 1619649408),
(169, 12, 1, 10, 'Metal Militia', '', '5:11', '9MIXT4Jt02zzWG1idzbxuXcHtCO4rhpA.mp3', 1, 1, 1619637284, 1619637284),
(170, 12, 1, 11, 'Am I Evil?', '', '7:52', 'KWC5QpWNDVkxjUWmBIyV7Xs5wLHNX8w4.mp3', 1, 1, 1619637284, 1619637284),
(172, 12, 1, 12, 'Blitzkrieg', '', '3:36', 'XoBvU7ryie030tcjwYYvS8QOVEXZXfdt.mp3', 1, 1, 1619647509, 1619647509),
(173, 13, 1, 1, 'Fight Fire With Fire', '', '4:45', 'SIRXraSSJuiznbfppUA5iDwXFD9z7jlz.mp3', 1, 1, 1619648838, 1619648838),
(174, 13, 1, 2, 'Ride The Lightning', '', '6:38', 'IoxLm40zKxi1XTBzMnUZdM77ZJXthQ50.mp3', 1, 1, 1619648839, 1619648839),
(175, 13, 1, 3, 'For Whom The Bell Tolls', '', '5:12', 'ybvTIGcrRspZHfA71y2d1xNwgfJkuFP2.mp3', 1, 1, 1619648839, 1619648839),
(176, 13, 1, 4, 'Fade To Black', '', '6:53', 'MiAxmiz5wlEXBkmaQrR335nNJpOnu1gs.mp3', 1, 1, 1619648839, 1619648839),
(177, 13, 1, 5, 'Trapped Under Ice', '', '4:04', 'ZE08bp2rlgk9X3lgrDJ_iTunG_0iqaFW.mp3', 1, 1, 1619648839, 1619648839),
(178, 13, 1, 6, 'Escape', '', '4:24', 'JzsioQpf1sXqf2PYMUkeUsUpBK7CtXAE.mp3', 1, 1, 1619648839, 1619648839),
(179, 13, 1, 7, 'Creeping Death', '', '6:37', '2LAEeKyK5WbCB4dNIyLPCFA6SOoB3p-k.mp3', 1, 1, 1619648839, 1619648839),
(180, 13, 1, 8, 'The Call Of Ktulu', '', '8:55', 'Hlu5cGpVU5Wy2yuxYhwIoYMYPLLRru3o.mp3', 1, 1, 1619648839, 1619648839),
(181, 14, 1, 1, 'Battery', '', '5:13', 'Z2bFPAPG9TZaVqaKy2geLMB-cu8U-szW.mp3', 1, 1, 1619648881, 1619648881),
(182, 14, 1, 2, 'Master Of Puppets', '', '8:35', 'ZFPR-5jXlVT7qjc2v6n8Lw0u8-DCWpSM.mp3', 1, 1, 1619648881, 1619648881),
(183, 14, 1, 3, 'The Thing That Should Not Be', '', '6:36', 'cp88JU8Bf2OSlHEDv7KqdGxUJaN2mUKc.mp3', 1, 1, 1619648881, 1619648881),
(184, 14, 1, 4, 'Welcome Home (Sanitarium)', '', '6:27', 'ziLZpbNJQcXKL90_guGAxNQb-kHVoi0Q.mp3', 1, 1, 1619648881, 1619648881),
(185, 14, 1, 5, 'Disposable Heroes', '', '8:17', 'r7IfGUsCVrlGow6T03iEx5y98fdG1Omd.mp3', 1, 1, 1619648881, 1619648881),
(186, 14, 1, 6, 'Leper Messiah', '', '5:40', 'lCfO258D-ariKI1OgCBietC3kumqFN7s.mp3', 1, 1, 1619648881, 1619648881),
(187, 14, 1, 7, 'Orion', '', '8:27', 'uSTEpfd3052mnQ6GJh0xyXJvArgKyBPg.mp3', 1, 1, 1619648882, 1619648882),
(188, 14, 1, 8, 'Damage, Inc.', '', '5:32', '6DObsD8qE4zq5RanYlDu550mjM1bwmm-.mp3', 1, 1, 1619648882, 1619648882),
(189, 15, 1, 1, 'Blackened', '', '6:43', 'C2InQ2hrpQvfaymOrx2pomePQr6d-Azx.mp3', 1, 1, 1619648942, 1619648942),
(190, 15, 1, 2, '...And Justice For All', '', '9:46', 'arbQVpX4GQ87h88zo0iASU4N5M5TfZQv.mp3', 1, 1, 1619648942, 1619648942),
(191, 15, 1, 3, 'Eye Of The Beholder', '', '6:26', 'tnaT4lZoGYdxxDBgj4jv1jcTv8zbnBAe.mp3', 1, 1, 1619648942, 1619648942),
(192, 15, 1, 4, 'One', '', '7:26', 'URtZpqwxqUMm4mz91qTXYu5bYcZ4NZdY.mp3', 1, 1, 1619648942, 1619648942),
(193, 15, 1, 5, 'The Shortest Straw', '', '6:35', 'uJXaW-w6-PVn4T5NHDI_830DhjfMSTxM.mp3', 1, 1, 1619648942, 1619648942),
(194, 15, 1, 6, 'Harvester of Sorrow', '', '5:45', 'XtcLmNXPRQldFlBZvc1NP4iS4GP_10BG.mp3', 1, 1, 1619648942, 1619648942),
(195, 15, 1, 7, 'The Frayed Ends of Sanity', '', '7:44', '0HaSRkc0_SVXymTtofdPZow5udHk-deI.mp3', 1, 1, 1619648943, 1619648943),
(196, 15, 1, 8, 'To Live Is To Die', '', '9:49', 'OlSWPy1QhOju3T6o8BWVG9QihttwkBY8.mp3', 1, 1, 1619648943, 1619648943),
(197, 15, 1, 9, 'Dyers Eve', '', '5:16', 'xgHOmc4VnTRUI_vw87UrZ7eiAG7s7cY8.mp3', 1, 1, 1619648943, 1619648943),
(198, 15, 1, 10, 'The Prince', '', '4:27', 'bDsfNQCpM43Taq41JiNVB_Wjl7QR7gGA.mp3', 1, 1, 1619648943, 1619648943),
(199, 16, 1, 1, 'Enter Sandman', '', '5:32', '58HVKcNIo1Mh5YGKDIclIvvoNjSEmXhy.mp3', 1, 1, 1619648981, 1619648981),
(200, 16, 1, 2, 'Sad But True', '', '5:25', 'k3IVrhqW9JP9PFdFCJIv2yUe-cJiR8Rw.mp3', 1, 1, 1619648981, 1619648981),
(201, 16, 1, 3, 'Holier Than Thou', '', '3:48', '9IjsQEAACaVSI3woRv86d4B9RdB8LOM0.mp3', 1, 1, 1619648981, 1619648981),
(202, 16, 1, 4, 'The Unforgiven', '', '6:27', 'I2RvsOT5HaXmrAyW6RS9wMRiRd3X7CGd.mp3', 1, 1, 1619648982, 1619648982),
(203, 16, 1, 5, 'Wherever I May Roam', '', '6:44', '_sTpIajgVZCxKef8AYLvaVYbJdWnuiBc.mp3', 1, 1, 1619648982, 1619648982),
(204, 16, 1, 6, 'Don\'t Tread On Me', '', '4:00', 'z86gQ6lXHNvXZy-XkYvYdgRdF_bThJF2.mp3', 1, 1, 1619648982, 1619648982),
(205, 16, 1, 7, 'Through The Never', '', '4:05', 'qAKi5bjGwdIhSq8B5ar8ajrktHjW0r3N.mp3', 1, 1, 1619648982, 1619648982),
(206, 16, 1, 8, 'Nothing Else Matters', '', '6:29', 'meDLjCg9MF6CwHUF92Dz4OL5soZMiRpQ.mp3', 1, 1, 1619648982, 1619648982),
(207, 16, 1, 9, 'Of Wolf And Man', '', '4:17', 'FilcS11wC77olGufymKbnD5CVR_H-S0W.mp3', 1, 1, 1619648982, 1619648982),
(208, 16, 1, 10, 'The God That Failed', '', '5:09', '_gYYz4o9gLeT1Jj3G4bjDYjDJZpLK1sH.mp3', 1, 1, 1619648982, 1619648982),
(209, 16, 1, 11, 'My Friend Of Misery', '', '6:50', 'ceNac_W3fCTRIPcH1uv78nXGVifZtgdA.mp3', 1, 1, 1619648982, 1619648982),
(210, 16, 1, 12, 'The Struggle Within', '', '3:54', 'bgHMxQI-pk83ftKIPgI60j8FsgJpvG9N.mp3', 1, 1, 1619648982, 1619648982),
(211, 16, 1, 13, 'So What', '', '3:08', 'y5uT4ynvtdLVbldztQVnmkI8wdwEeiQI.mp3', 1, 1, 1619648982, 1619648982),
(212, 17, 1, 1, 'Ain\'t My Bitch', '', '5:04', 'CB_bFyM3aZ_SdBhBfkFeYw-fKbZcCnru.mp3', 1, 1, 1619649021, 1619649021),
(213, 17, 1, 2, '2 X 4', '', '5:28', 'CPNyc7uLp-AI03aDhNL3oqotofz4D0Qt.mp3', 1, 1, 1619649021, 1619649021),
(214, 17, 1, 3, 'The House Jack Built', '', '6:39', 'QUfYsnqsoL96aw1Lv3pqs-lck_PMNIL8.mp3', 1, 1, 1619649021, 1619649021),
(215, 17, 1, 4, 'Until It Sleeps', '', '4:30', 'xeuWugSjR1pokM3iInqHOxpev7B1bdGH.mp3', 1, 1, 1619649022, 1619649022),
(216, 17, 1, 5, 'King Nothing', '', '5:28', 'fdoL0c5PprKjtA_KmzQ0MNj90Wzg82cR.mp3', 1, 1, 1619649022, 1619649022),
(217, 17, 1, 6, 'Hero Of The Day', '', '4:22', 'anpwIEW52c_1ofMyV3MDcQ5BkocqJ3k8.mp3', 1, 1, 1619649022, 1619649022),
(218, 17, 1, 7, 'Bleeding Me', '', '8:18', 'ZeR5md4xw07hnTSkQVmV0it-Qov8wLnX.mp3', 1, 1, 1619649022, 1619649022),
(219, 17, 1, 8, 'Cure', '', '4:54', 'dmlyPmzDtoMMN9a7tlHG3YZHhgXNSLZO.mp3', 1, 1, 1619649022, 1619649022),
(220, 17, 1, 9, 'Poor Twisted Me', '', '4:00', 'iFyM4alk9yz60cTaRgCoIc35ktlL0Dam.mp3', 1, 1, 1619649022, 1619649022),
(221, 17, 1, 10, 'Wasting My Hate', '', '3:58', 'HGUvpvNmK_iyuUhfgxB76MvvB08FEdEw.mp3', 1, 1, 1619649022, 1619649022),
(222, 17, 1, 11, 'Mama Said', '', '5:20', 'Eh5ATmk4yv0-ZjswKIvxeH1NUWydJGsC.mp3', 1, 1, 1619649022, 1619649022),
(223, 17, 1, 12, 'Thorn Within', '', '5:51', 'F0BNNDsaEAvJbvp2Jfz3gonaRCrv0ddZ.mp3', 1, 1, 1619649023, 1619649023),
(224, 17, 1, 13, 'Ronnie', '', '5:18', 'sEW-dxWdKaFMdzJW8adjU06zRZYBT7RL.mp3', 1, 1, 1619649023, 1619649023),
(225, 17, 1, 14, 'The Outlaw Torn', '', '9:50', '5vaXt79rfPSXHkwRTwkn1vt2uRHgq8gn.mp3', 1, 1, 1619649023, 1619649023),
(226, 18, 1, 1, 'Fuel', '', '4:30', 'hjdp9UgRJVZ1O55uHJmAm9fnqZ3JHGdT.mp3', 1, 1, 1619649608, 1619649608),
(227, 18, 1, 2, 'The Memory Remains', '', '4:39', 'KGTElqC0aogCvDCmN_LDiCHYyPGP8dF9.mp3', 1, 1, 1619649608, 1619649608),
(228, 18, 1, 3, 'Devil\'s Dance', '', '5:19', 'c98xExYPIbX9ZhRnaPgdOucpNJQCL0hu.mp3', 1, 1, 1619649608, 1619649608),
(229, 18, 1, 4, 'The Unforgiven II', '', '6:37', '5IRAOzUSFp4gDYf7r3FQlqS2lH3SACDR.mp3', 1, 1, 1619649608, 1619649608),
(230, 18, 1, 5, 'Better Than You', '', '5:22', '8GOCKYEHhLkivO-JrAdb2ncidTLvNgsM.mp3', 1, 1, 1619649608, 1619649608),
(231, 18, 1, 6, 'Slither', '', '5:13', 'KOzjBNUyGtUUvGJYan0UTyR3akWIIJWi.mp3', 1, 1, 1619649609, 1619649609),
(232, 18, 1, 7, 'Carpe Diem Baby', '', '6:12', 'Skr-ng2Wo0LSleAWUSnXBtuOi-I4M_VF.mp3', 1, 1, 1619649609, 1619649609),
(233, 18, 1, 8, 'Bad Seed', '', '4:05', '-He6lRobNzP7Y5fJq8DhEFg95xyF0igT.mp3', 1, 1, 1619649609, 1619649609),
(234, 18, 1, 9, 'Where the Wild Things Are', '', '6:54', '7ctaQTf_WSx_sl9GBwsQJesDtoVGa8AK.mp3', 1, 1, 1619649609, 1619649609),
(235, 18, 1, 10, 'Prince Charming', '', '6:05', 'CSkQqE2W5OKvrjc5UulrIgOb1R5XfHed.mp3', 1, 1, 1619649609, 1619649609),
(236, 18, 1, 11, 'Low Man\'s Lyric', '', '7:37', 'pWp772vOV0QGAwD8M2l46NSVsQpTdJmB.mp3', 1, 1, 1619649609, 1619649609),
(237, 18, 1, 12, 'Attitude', '', '5:16', 'qdsLWv6kn5ZLyKXcdw-kPQNOJgcegrev.mp3', 1, 1, 1619649609, 1619649609),
(238, 18, 1, 13, 'Fixxxer', '', '8:16', 'zxsP4c9eDhip4LZb55kY0VUkVGyEdlyc.mp3', 1, 1, 1619649609, 1619649609),
(239, 19, 1, 1, 'Free Speech for the Dumb', '', '2:35', '0gAVkCNbIfxmT6WNVMI9Nvkpf0DePC68.mp3', 1, 1, 1619650057, 1619650057),
(240, 19, 1, 2, 'It\'s Electric', '', '3:34', 'vffhfAdW5SgS2E_5MyLbNU1Tst72A5cu.mp3', 1, 1, 1619650057, 1619650057),
(241, 19, 1, 3, 'Sabbra Cadabra', '', '6:20', 'h4OsrVBgXoQSLOrodXF1frV9xO9qUIhW.mp3', 1, 1, 1619650057, 1619650057),
(242, 19, 1, 4, 'Turn the Page', '', '6:07', 'pG_qH5uGaFv37X3-1jA6TjTWG8clewJQ.mp3', 1, 1, 1619650057, 1619650057),
(243, 19, 1, 5, 'Die, Die My Darling', '', '2:29', '28mkr3Sf-3RbR2iKxBsu1ELnnOqci1zc.mp3', 1, 1, 1619650057, 1619650057),
(244, 19, 1, 6, 'Loverman', '', '7:53', 'MQYK5kopdLS_WezFlKWF-B92UHO2bYSX.mp3', 1, 1, 1619650057, 1619650057),
(245, 19, 1, 7, 'Mercyful Fate', '', '11:12', 'GMtmlZTzgcSFaMkQuAYhL3Xcidt7vrlw.mp3', 1, 1, 1619650057, 1619650057),
(246, 19, 1, 8, 'Astronomy', '', '6:38', 'gjNKY8n_ETYEOSsma7MBydDXHGOTs4_e.mp3', 1, 1, 1619650059, 1619650059),
(247, 19, 1, 9, 'Whiskey in the Jar', '', '5:05', '5hypYpZ82gRQlINVWsGknOkRk0xVowWX.mp3', 1, 1, 1619650060, 1619650060),
(248, 19, 1, 10, 'Tuesday\'s Gone', '', '9:06', 'Mh_uaDbGsameeAMHU_PPZOU35K2I1YqD.mp3', 1, 1, 1619650060, 1619650060),
(249, 19, 1, 11, 'The More I See', '', '4:49', 'M93GxNWa4O3_gf2AOg5i8IQ9zgW6MNcA.mp3', 1, 1, 1619650060, 1619650060),
(250, 19, 2, 2, 'The Small Hours', '', '6:43', 'L8SJhLNQy5hK6HnzG12fjkffxgCGlNZJ.mp3', 1, 1, 1619650060, 1619650288),
(251, 19, 2, 1, 'Helpless', '', '6:38', 'S-W_JXpNpwE1v-qXOpzAZgsMRLqaIS2-.mp3', 1, 1, 1619650060, 1619650291),
(252, 19, 2, 3, 'The Wait', '', '4:55', 'vo6vekka-Ll7gk887MfBprqIT_6yg0Tm.mp3', 1, 1, 1619650061, 1619650294),
(253, 19, 2, 4, 'Crash Course in Brain Surgery', '', '3:10', 'lPoYL-fySUjFvzvEqsa4VdTo_QBo-XCL.mp3', 1, 1, 1619650061, 1619650296),
(254, 19, 2, 5, 'Last Caress / Green Hell', '', '3:30', 'tf2Yue7tEVQiWkczp4XMCJD52xKfY_TN.mp3', 1, 1, 1619650061, 1619650299),
(255, 19, 2, 6, 'Am I Evil?', '', '7:50', '9EwCTsQZ6OhaCK33U4cpBL6Uxc9sHH7g.mp3', 1, 1, 1619650061, 1619650302),
(256, 19, 2, 7, 'Blitzkrieg', '', '3:37', 'w-6GbFm5owhrVpvHAcotVaKG7tlHWDyR.mp3', 1, 1, 1619650061, 1619650304),
(257, 19, 2, 8, 'Breadfan', '', '5:41', 'BHZZUi4h8G6HSta9Bk5Xxh1JIH9G_ezV.mp3', 1, 1, 1619650061, 1619650307),
(258, 19, 2, 9, 'The Prince', '', '4:26', 'b-v1y5U5Rg2G8UeCZkWXvXR_GVhRT8lt.mp3', 1, 1, 1619650061, 1619650310),
(259, 19, 2, 10, 'Stone Cold Crazy', '', '2:18', 'xx9-N7_5dqGROR6_kylfqtnJ8nAKOc1g.mp3', 1, 1, 1619650061, 1619650314),
(260, 19, 2, 11, 'So What', '', '3:09', 'e0-uKAdBkMUnQDuXaHqxt0ee1LmjwrPZ.mp3', 1, 1, 1619650061, 1619650324),
(261, 19, 2, 12, 'Killing Time', '', '3:04', 'O0TKbWfbTEc71fLyVTH4uWTnqDDrezxP.mp3', 1, 1, 1619650062, 1619650328),
(262, 19, 2, 13, 'Overkill', '', '4:05', '8pFAgQU5FQiFRezIPMw-vjepg6QHXBWg.mp3', 1, 1, 1619650062, 1619650331),
(263, 19, 2, 14, 'Damage Case', '', '3:40', 'Fr0r7n60LY02_XvQZoaSFHEmZkoNeeeo.mp3', 1, 1, 1619650063, 1619650344),
(264, 19, 2, 15, 'Stone Dead Forever', '', '4:52', 'om1vnc3Y2qe58xWC9hISGzx6UZjhXaEK.mp3', 1, 1, 1619650063, 1619650347),
(265, 19, 2, 16, 'Too Late Too Late', '', '3:13', '65YAs6l_q0ZzdWAXdfk6V3sgAA4KNkmb.mp3', 1, 1, 1619650063, 1619650350),
(266, 20, 1, 1, 'Frantic', '', '5:50', 'OpBIZQkec8bwmgq6uPucQX6jsB1y9iXG.mp3', 1, 1, 1619650748, 1619650748),
(267, 20, 1, 2, 'St. Anger', '', '7:21', 'mkkGhAUOTWg5nrTqw67ucJXCmn2cccXe.mp3', 1, 1, 1619650748, 1619650748),
(268, 20, 1, 3, 'Some Kind Of Monster', '', '8:26', 'FoqJJstjEtd0plBS5fcLaS1YQvRPmaHs.mp3', 1, 1, 1619650748, 1619650748),
(269, 20, 1, 4, 'Dirty Window', '', '5:25', '1iDsaZ2no82x6YZdcmKOSNVn1BOB62J3.mp3', 1, 1, 1619650748, 1619650748),
(270, 20, 1, 5, 'Invisible Kid', '', '8:30', 'uph1yitSftGZQdO4qfhRlDtz244lQHzH.mp3', 1, 1, 1619650748, 1619650748),
(271, 20, 1, 6, 'My World', '', '5:46', 'HquJdlEQP9rsCRSqmXfDPhc2_aakDUva.mp3', 1, 1, 1619650749, 1619650749),
(272, 20, 1, 7, 'Shoot Me Again', '', '7:10', 'XDbVtTdUSsqubefrqSL9xHDxBqP-Cks0.mp3', 1, 1, 1619650749, 1619650749),
(273, 20, 1, 8, 'Sweet Amber', '', '5:27', '3_prFMGu9x-6k0frNtPy7aqFxn3L_rDB.mp3', 1, 1, 1619650749, 1619650749),
(274, 20, 1, 9, 'The Unnamed Feeling', '', '7:09', 'mUA7bdtFI4_-whqYyGJwaiHhY7X5LW_x.mp3', 1, 1, 1619650749, 1619650749),
(275, 20, 1, 10, 'Purify', '', '5:14', 'skGphNTUeWPW-qnSnYz61QUjBnEzNw6m.mp3', 1, 1, 1619650749, 1619650749),
(276, 20, 1, 11, 'All Within My Hands', '', '8:48', '3Pk2TMzhiDIImXuFeqJBelTorutXBzCU.mp3', 1, 1, 1619650749, 1619650749),
(277, 21, 1, 1, 'That Was Just Your Life', '', '7:08', 'bXk9MGQYYjdQ-nMcc-Lxp-pAa-jN0EMI.mp3', 1, 1, 1619650786, 1619650786),
(278, 21, 1, 2, 'The End Of The Line', '', '7:52', 'V9lOjLh3b-E6dmolBjY9NrjfxnX_aZPk.mp3', 1, 1, 1619650786, 1619650786),
(279, 21, 1, 3, 'Broken, Beat & Scarred', '', '6:26', 'Iu8ZOexr-5xR0jZmqcDWqbyc1Sh39bbw.mp3', 1, 1, 1619650786, 1619650786),
(280, 21, 1, 4, 'The Day That Never Comes', '', '7:56', 'pTHNRuzFOCl2utJar5fBXhieqa5K60_w.mp3', 1, 1, 1619650787, 1619650787),
(281, 21, 1, 5, 'All Nightmare Long', '', '7:58', 'sSWlA7eli-bwu5edXJCwRJKNpm5mPmzp.mp3', 1, 1, 1619650787, 1619650787),
(282, 21, 1, 6, 'Cyanide', '', '6:40', 'bWHyJmlp5ttNW8bV1FGi8BRGh7fs7hVb.mp3', 1, 1, 1619650787, 1619650787),
(283, 21, 1, 7, 'The Unforgiven III', '', '7:47', 'SUh817fpvNkx64PeuWF9r9fVd3898woC.mp3', 1, 1, 1619650787, 1619650787),
(284, 21, 1, 8, 'The Judas Kiss', '', '8:01', 'G0-VNKwrNiwkVqXgrAea6i4ZwWyqLfRg.mp3', 1, 1, 1619650787, 1619650787),
(285, 21, 1, 9, 'Suicide &amp; Redemption', '', '9:58', 'eSSn1KulGngKreJtqJJ5mhYT7hhTqlnE.mp3', 1, 1, 1619650788, 1619650788),
(286, 21, 1, 10, 'My Apocalypse', '', '5:01', 'LcOrP-7yuEvkMoAdq4QmyaC7qtpXyI76.mp3', 1, 1, 1619650788, 1619650788),
(287, 22, 1, 1, 'Radioactive', '', '3:07', 'C0ovRRbQPXwdEp49nPm9_UHv3jOVeD1Z.mp3', 1, 1, 1619651495, 1619651495),
(288, 22, 1, 2, 'Tiptoe', '', '3:14', 'TienjqPtZRaX9dfVlS6g6X_PjHwP3pr4.mp3', 1, 1, 1619651495, 1619651495),
(289, 22, 1, 3, 'It\'s Time', '', '4:00', 'DLxBiY8_pGTny45v3jWgK0544PwO9M73.mp3', 1, 1, 1619651495, 1619651495),
(290, 22, 1, 4, 'Demons', '', '2:58', 'q-HdzXpl8Luv6zkujMqtY82J4-wbn1Tu.mp3', 1, 1, 1619651495, 1619651495),
(291, 22, 1, 5, 'On Top Of The World', '', '3:12', 'sDvhsgHzCpbjmfMwjnNjsTN2eomgeAxU.mp3', 1, 1, 1619651496, 1619651496),
(292, 22, 1, 6, 'Amsterdam', '', '4:02', 'FV2EzY-dgN705q-DxkcNXMlBe9RRY6QA.mp3', 1, 1, 1619651496, 1619651496),
(293, 22, 1, 7, 'Hear Me', '', '3:55', '2YUPgIZLfxeYU8p8PROeyFYRLB0sV1Iu.mp3', 1, 1, 1619651496, 1619651496),
(294, 22, 1, 8, 'Every Night', '', '3:37', 'H55L-mwDWisCwhDaUhAE4FnvtEshIX39.mp3', 1, 1, 1619651497, 1619651497),
(295, 22, 1, 9, 'Bleeding Out', '', '3:43', '9FoR9o70K5PERCXFd_3us99CrdoYqv4Q.mp3', 1, 1, 1619651497, 1619651497),
(296, 22, 1, 10, 'Underdog', '', '3:30', 'lkIzpxu2_nLL_AI2r5MhtUh2e8YCLZtt.mp3', 1, 1, 1619651497, 1619651497),
(297, 22, 1, 11, 'Nothing Left To Say - Rocks', '', '8:57', 'ALUpFDS4_PPJc472ga7E6LX6SV1_wlhe.mp3', 1, 1, 1619651498, 1619651498),
(298, 22, 1, 12, 'Cha-Ching (Till We Grow Older)', '', '4:10', '0azfAFqNkMYF0D5yOES2oowsfntwXqu-.mp3', 1, 1, 1619651498, 1619651498),
(299, 22, 1, 13, 'Working Man', '', '3:55', 'sOCiDazDCJU2syNatPuILxWClvqdykfT.mp3', 1, 1, 1619651499, 1619651499),
(300, 22, 1, 14, 'My Fault', '', '2:56', 'e-9HsQBPNemhvGXaDp0fgPStqmkfWWeK.mp3', 1, 1, 1619651499, 1619651499),
(301, 22, 1, 15, 'Round And Round', '', '3:18', 'LLrUoYIgG-dBzKy3jggaVN_NiNVQOxkY.mp3', 1, 1, 1619651499, 1619651499),
(302, 22, 1, 16, 'The River', '', '3:25', 'dLKemeps3dxSfMo3yF4AylE8A1bhUxRl.mp3', 1, 1, 1619651499, 1619651499),
(303, 22, 1, 17, 'America', '', '4:34', 'D8QBUmEk6Dys0oL6mFRb3xWlOoqdZyPe.mp3', 1, 1, 1619651500, 1619651500),
(304, 22, 1, 18, 'Selene', '', '4:01', 'fLxEm744kcxQVY0znXRrVMzSepD9jToE.mp3', 1, 1, 1619651500, 1619651500),
(305, 22, 1, 19, 'Cover Up', '', '4:19', 'Q68mJfFIc90TuS6nAHbaE6HPVsTEwgNr.mp3', 1, 1, 1619651500, 1619651500),
(306, 22, 1, 20, 'I Don\'t Mind', '', '3:18', 'B9nmsUERDAzXlJWHmfamqyWwguPfp-6J.mp3', 1, 1, 1619651500, 1619651500),
(307, 23, 1, 1, 'Shots', '', '3:52', 'IcrmAM9t_kl1zB9CAKMPFAe1roiLTRSj.mp3', 1, 1, 1619651548, 1619651548),
(308, 23, 1, 2, 'Gold', '', '3:37', 'JKCUbU8tfgH2wmpkYA1Wg4x88glTCbxn.mp3', 1, 1, 1619651548, 1619651548),
(309, 23, 1, 3, 'Smoke And Mirrors', '', '4:21', 'FEkZqNZsauVZ46SxVDxzXFl9cD5VghAw.mp3', 1, 1, 1619651548, 1619651548),
(310, 23, 1, 4, 'I\'m So Sorry', '', '3:50', 'Nd3w5ufqM5OwSzWnWUnwhRMtH8WvajcC.mp3', 1, 1, 1619651548, 1619651548),
(311, 23, 1, 5, 'I Bet My Life', '', '3:14', 'Q8x0RC6oCK1tc1dPoazRZXZrd6x3Lpsg.mp3', 1, 1, 1619651549, 1619651549),
(312, 23, 1, 6, 'Polaroid', '', '3:51', 'xxa5U2ZYsUnTKE94HNqWWKlidaQwU-IY.mp3', 1, 1, 1619651549, 1619651549),
(313, 23, 1, 7, 'Friction', '', '3:22', 'F3WqNHmP44XhMLZjgf8CGECg8c_uGfK8.mp3', 1, 1, 1619651549, 1619651549),
(314, 23, 1, 8, 'It Comes Back To You', '', '3:37', 'tVMm9MxciBCgEXlJfiJem6qudOUoDEj8.mp3', 1, 1, 1619651549, 1619651549),
(315, 23, 1, 9, 'Dreams', '', '4:19', '9UVaQ4ARIMUezGQz6ZRk2M5cycnMHESL.mp3', 1, 1, 1619651549, 1619651549),
(316, 23, 1, 10, 'Trouble', '', '3:13', 'pXPHicuRNRqiiUwqrMOWcFKbxPL7aYFf.mp3', 1, 1, 1619651550, 1619651550),
(317, 23, 1, 11, 'Summer', '', '3:38', '7GbrrBImxCvifjrIekqJO5kdrly3VVB2.mp3', 1, 1, 1619651550, 1619651550),
(318, 23, 1, 12, 'Hopeless Opus', '', '4:02', '9KgyR-Telna1sV0gkGdRgA72tPmjj0JW.mp3', 1, 1, 1619651550, 1619651550),
(319, 23, 1, 13, 'The Fall', '', '6:03', 'BmWwLqeIIyL-fCyb06TryxjDwFA70y9X.mp3', 1, 1, 1619651550, 1619651550),
(320, 23, 2, 1, 'Thief', '', '3:48', 'weITmgjv2CcEdVB6o_8Ojisq5hxPNIyp.mp3', 1, 1, 1619651550, 1619651607),
(321, 23, 2, 2, 'The Unknown', '', '3:25', 'oktjDN-OgShFLpNqo5jXzfdwG6VIzTkT.mp3', 1, 1, 1619651550, 1619651612),
(322, 23, 2, 3, 'Second Chances', '', '3:38', '9MaX68B1Sn-57EGWnjXeAPMAsQ5JJyCn.mp3', 1, 1, 1619651550, 1619651615),
(323, 23, 2, 4, 'Release', '', '2:29', 'EziDkHDEt9uTyGZK-TeAPg_1-3FjrR4W.mp3', 1, 1, 1619651550, 1619651618),
(324, 23, 2, 5, 'Warriors', '', '2:51', 'FTjYMQh3Kw3wx_WFzHU9rMS0JI1EGujg.mp3', 1, 1, 1619651550, 1619651622),
(325, 23, 2, 6, 'Battle Cry', '', '4:34', 'Mu7ENmGl9fQWThrJw84pYoYUHyAYWAJv.mp3', 1, 1, 1619651551, 1619651625),
(326, 23, 2, 7, 'Monster', '', '4:11', 'AujOf0TcC4pYRIhw03V6rAptcHK-f7Kx.mp3', 1, 1, 1619651551, 1619651627),
(327, 23, 2, 8, 'Who We Are', '', '4:10', 'Kr5lWqME211MuqCUitjvZnMZRcs3pzxr.mp3', 1, 1, 1619651551, 1619651630),
(328, 24, 1, 1, 'I Don\'t Know Why', '', '3:10', 'xvOkeYxXXn0lOiDdR2lYZsaIPXjuHG7J.mp3', 1, 1, 1619651664, 1619651664),
(329, 24, 1, 2, 'Whatever It Takes', '', '3:21', 'FiHWkNN78PEigDmvmhKjSZNXcOq3xHeY.mp3', 1, 1, 1619651665, 1619651665),
(330, 24, 1, 3, 'Believer', '', '3:24', 'rzXbM6Q-pEiBWSRavQg6ROYqwGuyMmw6.mp3', 1, 1, 1619651665, 1619651665),
(331, 24, 1, 4, 'Walking The Wire', '', '3:53', 'ciAk3VpRhiaUkCDAeIpB7qNpKNx1v6MA.mp3', 1, 1, 1619651665, 1619651665),
(332, 24, 1, 5, 'Rise Up', '', '3:52', '0R0879IBnCaYk_7QKkKTDb7enfc6ZstF.mp3', 1, 1, 1619651665, 1619651665),
(333, 24, 1, 6, 'I\'ll Make It Up To You', '', '4:23', 'sjoQ8S2bVlIdY6eJg0bskzGVtiAuoDel.mp3', 1, 1, 1619651665, 1619651665),
(334, 24, 1, 7, 'Yesterday', '', '3:25', 'SfR2tHggY17wI_uLAwUJ2DYOUQuUARrv.mp3', 1, 1, 1619651665, 1619651665),
(335, 24, 1, 8, 'Mouth Of The River', '', '3:42', 'Prciadc5jase75qYrb6hx-rxxWs6UIaf.mp3', 1, 1, 1619651665, 1619651665),
(336, 24, 1, 9, 'Thunder', '', '3:07', '4nRimpu_znX2DfNtTjKL9kOa24yVZgw8.mp3', 1, 1, 1619651665, 1619651665),
(337, 24, 1, 10, 'Start Over', '', '3:06', 'AF9yw0RD3cv9c8TXY8LoZ4mxEZiC7_CJ.mp3', 1, 1, 1619651666, 1619651666),
(338, 24, 1, 11, 'Dancing In The Dark', '', '3:54', '9orZIBNRb46MwJj42gOg3f55TByNgQ1Z.mp3', 1, 1, 1619651666, 1619651666),
(339, 24, 1, 12, 'Levitate', 'Bonus Track', '3:18', 'LjGM6CDbSz8vUlbxRGGJahjSGbj29L3f.mp3', 1, 1, 1619651666, 1619651699),
(340, 24, 1, 13, 'Not Today', 'Bonus Track', '4:21', 'sdKgq2Xl2t22npperImmPyJgRoh9ujpa.mp3', 1, 1, 1619651666, 1619651704),
(341, 24, 1, 14, 'Believer', 'Kaskade Remix / Bonus Track', '3:11', 'tcivgxtdyrZ-ObRtA4pZ9ti0ADazzjgP.mp3', 1, 1, 1619651666, 1619651713),
(342, 24, 1, 15, 'Roots', 'Japan Bonus Track', '2:55', 'vP_wv9h_BS1S7FZc2WYADVcv5CIxHWks.mp3', 1, 1, 1619651666, 1619651721),
(343, 25, 1, 1, 'Natural', '', '3:10', 'CjWwJL1LCmltGrRj25EKYsV7FUqyfbmg.mp3', 1, 1, 1619651757, 1619651757),
(344, 25, 1, 2, 'Boomerang', '', '3:08', 'JDjgoG1m4gfl-QmVeHhmUy9vVRqJbgNv.mp3', 1, 1, 1619651758, 1619651758),
(345, 25, 1, 3, 'Machine', '', '3:02', '3tsfkVqQQnezF6g-fjRZFgx7F-Z7qE5z.mp3', 1, 1, 1619651758, 1619651758),
(346, 25, 1, 4, 'Cool Out', '', '3:38', 'dYAfapvzD0RigfTDMQKZ_61HNJjIrpO3.mp3', 1, 1, 1619651758, 1619651758),
(347, 25, 1, 5, 'Bad Liar', '', '4:21', 'oKTCZ6KT-tz7rQSlqbln8dDLOorvTmAq.mp3', 1, 1, 1619651758, 1619651758),
(348, 25, 1, 6, 'West Coast', '', '3:37', 'B6znJ5Qb56Dx1VHiUzfMqZ50w_6qe2tN.mp3', 1, 1, 1619651758, 1619651758),
(349, 25, 1, 7, 'Zero', '', '3:31', 'XHAYtQG6TDz2DFk-7PXHKGgW550tWQkT.mp3', 1, 1, 1619651758, 1619651758),
(350, 25, 1, 8, 'Bullet in a Gun', '', '3:25', 'FXsF3TLxB2M-SuHbUrTMcqDi4yighTBo.mp3', 1, 1, 1619651758, 1619651758),
(351, 25, 1, 9, 'Digital', '', '3:21', '3B7tr18LO9kKVFSBe_oWYgDIsOv9eX0u.mp3', 1, 1, 1619651758, 1619651758),
(352, 25, 1, 10, 'Only', '', '3:01', 'bGhIkOQSDuwy-RfXyIKoShqm78n41FSW.mp3', 1, 1, 1619651758, 1619651758),
(353, 25, 1, 11, 'Stuck', '', '3:11', 'beNRu5Y7vvRQCseErAP2uTXFuxz2WDd2.mp3', 1, 1, 1619651758, 1619651758),
(354, 25, 1, 12, 'Love', '', '2:46', '2b2hRGp_XpWbvN8cfxxEcFclC-SvrdcU.mp3', 1, 1, 1619651758, 1619651758),
(355, 25, 1, 13, 'Birds', '', '3:39', '9m2VbZk4KWlu96TbiF4I1QD4HvNdTW0g.mp3', 1, 1, 1619651759, 1619651759),
(356, 25, 1, 14, 'Burn Out', '', '4:34', 'zno8-QZnmtvzDWpaZ-bQRozlDAErVTXi.mp3', 1, 1, 1619651759, 1619651759),
(357, 25, 1, 15, 'Real Life', '', '4:08', 'otCdyT5QV6y0cqzIRrosMmF7HFh3j39j.mp3', 1, 1, 1619651759, 1619651759),
(358, 25, 1, 16, 'Born To Be Yours', 'With Kygo', '3:13', 'vm_-jZO-teKriTxyCzJsku2tWaGG2axx.mp3', 1, 1, 1619651759, 1621980467),
(359, 27, 1, 1, 'Ashes', '', '3:44', 'tzCk-luWZ2o532AkvDm2B5MlHSpXhsKY.mp3', 1, 1, 1619708712, 1619708712),
(360, 27, 1, 2, 'The Way Of The Fist', '', '3:59', 'AKPmqxBrgJV7m8D5MFqBptynXKp05vAJ.mp3', 1, 1, 1619708712, 1619708712),
(361, 27, 1, 3, 'Salvation', '', '3:21', 'hlbicd_y11P6epiPvVuswfoQl-cgkzDL.mp3', 1, 1, 1619708712, 1619708712),
(362, 27, 1, 4, 'The Bleeding', '', '4:29', '19hX1cu5xWReHMcmWSi8OyWW7FvZS_0s.mp3', 1, 1, 1619708712, 1619708712),
(363, 27, 1, 5, 'A Place To Die', '', '3:40', 'EF9fDunT2BN36DP6j-Fqif2c2ugVUvCw.mp3', 1, 1, 1619708712, 1619708712),
(364, 27, 1, 6, 'The Devil\'s Own', '', '4:13', 'CsiDJIV9AF7IOkH9ZuD3mcit51Kp0BGn.mp3', 1, 1, 1619708712, 1619708712),
(365, 27, 1, 7, 'White Knuckles', '', '4:10', 'd8jbjEXfUPntYL9sLxA290oyinQS3J1Z.mp3', 1, 1, 1619708712, 1619708712),
(366, 27, 1, 8, 'Can\'t Heal You', '', '3:04', 'CoVDKyvOGzfvuqipFw-aEpcz7LP6JuQc.mp3', 1, 1, 1619708713, 1619708713),
(367, 27, 1, 9, 'Death Before Dishonor', '', '3:54', 'hugGtuXbe2q-e0qL7BRPjwJ5Uufp4QxQ.mp3', 1, 1, 1619708713, 1619708713),
(368, 27, 1, 10, 'Meet The Monster', '', '4:23', 'NiItp1ZRiEVFjpG8A70SgkzfYIDg3c8G.mp3', 1, 1, 1619708713, 1619708713),
(369, 28, 1, 1, 'Dying Breed', '', '2:55', 'nnOZWBixHZ1-6TPOteuhNe_9qgUkGhjw.mp3', 1, 1, 1619708776, 1619708776),
(370, 28, 1, 2, 'Hard To See', '', '3:30', 'rsFrWOEgjKAffup-AohbO-Y9-NU6F6_n.mp3', 1, 1, 1619708776, 1619708776),
(371, 28, 1, 3, 'Bulletproof', '', '3:16', '7CWJFdsBbBs7IqeBCeGXrHIRfoOlB1XP.mp3', 1, 1, 1619708776, 1619708776),
(372, 28, 1, 4, 'No One Gets Left Behind', '', '3:24', 'j3l72REFszHivxOOa1k7hD3VvMniVkgy.mp3', 1, 1, 1619708776, 1619708776),
(373, 28, 1, 5, 'Crossing Over', '', '2:54', 'iY1NdYnsXdVdxue54awjvLw716WXC_Lu.mp3', 1, 1, 1619708776, 1619708776),
(374, 28, 1, 6, 'Burn It Down', '', '3:34', 'OVvJg3jvLYaqHHC2MCJY0pQQ1vWNJT0f.mp3', 1, 1, 1619708776, 1619708776),
(375, 28, 1, 7, 'Far From Home', '', '3:33', 'dOCs3eUC3-EEAwpbfwOaFa5w30V6MJXI.mp3', 1, 1, 1619708776, 1619708776),
(376, 28, 1, 8, 'Falling In Hate', '', '3:00', 'MiASS-vQDX3_7hMCCmtKPSxVToNXPM8L.mp3', 1, 1, 1619708776, 1619708776),
(377, 28, 1, 9, 'My Own Hell', '', '3:35', 'Tm32x_YiJDmJTJiLBGSINT93qbZCrw41.mp3', 1, 1, 1619708776, 1619708776),
(378, 28, 1, 10, 'Walk Away', '', '3:43', 'ibiYvpV2XyibiC_65NL87Z3LATt-IrlN.mp3', 1, 1, 1619708777, 1619708777),
(379, 28, 1, 11, 'Canto 34', '', '4:10', 'ck1AeAINw1nM42mUcCi6-Qsd5DBWON13.mp3', 1, 1, 1619708777, 1619708777),
(380, 28, 1, 12, 'Bad Company', '', '4:23', 'LDLxTq4qiRhhpPvyxyURvOljMPd9EgFV.mp3', 1, 1, 1619708777, 1619708777),
(381, 28, 1, 13, 'War Is The Answer', '', '3:20', 'CcP8W_Xee-qwnjGj1ECoXK8Hh0XE4gld.mp3', 1, 1, 1619708778, 1619708778),
(382, 28, 1, 14, 'Succubus', 'Bonus Track', '3:10', 'awVbuaXrOOtQoKPKLQKNVnjQQhm2Eucs.mp3', 1, 1, 1619708778, 1619708799),
(383, 28, 1, 15, 'Undone', 'Bonus Track', '3:44', 'n60C7I_Bb4KEh3DychFo1qz8nygc8JII.mp3', 1, 1, 1619708778, 1619708809),
(384, 29, 1, 1, 'American Capitalist', '', '3:29', 'wjk9JxDk6NUCoATmEfkSSMUBkHc9j5lK.mp3', 1, 1, 1619708846, 1619708846),
(385, 29, 1, 2, 'The Pride', 'Remix', '3:24', 'bzXGCezPA2hUu4QFMSEQjVKqq38rVj6D.mp3', 1, 1, 1619708846, 1619708878),
(386, 29, 1, 2, 'Under And Over It', '', '3:38', 'LAMb-hG3lXc2ibrDkxuy8nZodk_zn4Tx.mp3', 1, 1, 1619708846, 1619708846),
(387, 29, 1, 3, 'Remember Everything', 'Remix', '4:51', 'X7DuTZ0iqPbCyLGiWsZ4GsnwWm1XEXpO.mp3', 1, 1, 1619708847, 1619708883),
(388, 29, 1, 3, 'The Pride', '', '3:24', 'pPWH-i4MnjnTlQUbmWALJUjvzYrjyObI.mp3', 1, 1, 1619708847, 1619708847),
(389, 29, 1, 4, '100 Ways To Hate', 'Remix', '3:11', 'e02H7M5lB9sWsk5abwrT70l_zgRBGcH4.mp3', 1, 1, 1619708847, 1619708874),
(390, 29, 1, 4, 'Coming Down', '', '4:01', 'Welr_HUxi0Lgu0lhJ8IKRBJ4C3LPi16o.mp3', 1, 1, 1619708847, 1619708847),
(391, 29, 1, 5, 'Menace', '', '3:32', 'GVAvFNxBeSW4iDRSsnUJIPOVJFviEwPB.mp3', 1, 1, 1619708847, 1619708847),
(392, 29, 1, 6, 'Generation Dead', '', '3:43', 'aTtubxqpphdWmPppaJwaEcdju5aMLm_7.mp3', 1, 1, 1619708847, 1619708847),
(393, 29, 1, 7, 'Back For More', '', '3:23', 'hcrN8za0gknMkan1zbM_WiyiPUWDW3NT.mp3', 1, 1, 1619708847, 1619708847),
(394, 29, 1, 8, 'Remember Everything', '', '4:39', 'Gt1kBtP4vjvQAVz4Zt9NaI8leqjnu3_e.mp3', 1, 1, 1619708847, 1619708847),
(395, 29, 1, 9, 'Wicked Ways', '', '3:08', 'b2Idt-FMTao6SgmRh9yBoE3LfLY3gCkH.mp3', 1, 1, 1619708847, 1619708847),
(396, 29, 1, 10, 'I\'ll Fall', '', '3:57', 'fCKFy17GFU2kWR1zuZ9mHaQQwIq5G4IX.mp3', 1, 1, 1619708847, 1619708847),
(397, 29, 1, 11, '100 Ways To Hate', '', '3:21', '54KbWTsuZXaQVFWpiF5cS1LWOK4cU8EZ.mp3', 1, 1, 1619708848, 1619708848),
(398, 30, 2, 1, 'Intro', '', '1:00', 'HrGktLm9IGTvnO_slcetWdRCMvAz9NNn.mp3', 1, 1, 1619708946, 1619818569),
(399, 30, 1, 1, 'Lift Me Up', 'featuring Rob Halford of Judas Priest', '4:07', 'fXmePriVd_f5TqaQZJWrSdRpA4dTPcEb.mp3', 1, 1, 1619708946, 1619818306),
(400, 30, 1, 2, 'Watch You Bleed', '', '3:43', 'bFspgvdmVR_1Sl_46ASF3cee6jg7h71t.mp3', 1, 1, 1619708946, 1619708946),
(401, 30, 1, 3, 'You', '', '3:04', 'fC_naEobLUb25C1NeiAO4UyXtfOZ3sli.mp3', 1, 1, 1619708946, 1619708946),
(402, 30, 1, 4, 'Wrong Side Of Heaven', '', '4:32', 'E1bdZYAG55369KZS8tswpUBOtgA5DzNx.mp3', 1, 1, 1619708946, 1619708946),
(403, 30, 1, 5, 'Burn MF', '', '3:38', '4kdB7gHUoPEZtUVoKojiQvV5ql3gdvw3.mp3', 1, 1, 1619708946, 1619708946),
(404, 30, 1, 6, 'I.M.Sin', '', '3:39', 'ASAHmgbWxTfqT4opJFJZL9SmqKMoWDYu.mp3', 1, 1, 1619708946, 1619708946),
(405, 30, 1, 7, 'Anywhere But Here (featuring Maria Brink)', '', '3:46', 'zRmkWymKoPtKwVYH7YBCh9wYQwohVmt2.mp3', 1, 1, 1619708947, 1619708947),
(406, 30, 1, 8, 'Dot Your Eyes', '', '3:15', 'ybaNirNhEwipB3ttMvXKPO4EJ3xCJW5h.mp3', 1, 1, 1619708947, 1619708947),
(407, 30, 1, 9, 'M.I.N.E (End This Way)', '', '4:06', 'oDkpiqqlJsophmV5Upg57dN66w_Rzab3.mp3', 1, 1, 1619708947, 1619708947),
(408, 30, 1, 10, 'Mama Said Knock You Out', 'Featuring Tech N9ne', '2:48', 'lsT0QGCQNkDD2BZRlRoUYCxAcwPJksqf.mp3', 1, 1, 1619708948, 1621980497),
(409, 30, 1, 11, 'Diary Of A Deadman', '', '4:45', 'rIuGJYomkVuqdI4M5oeYnD5oDuF-N7HM.mp3', 1, 1, 1619708948, 1619708948),
(410, 30, 1, 12, 'I.M.Sin', 'Featuring Max Cavalera', '3:39', 'bxFMxz6_4N11VOgzqsb6pbf1puprKphO.mp3', 1, 1, 1619708948, 1621980523),
(411, 30, 1, 13, 'Anywhere But Here', 'Duet with Maria Brink of In This Moment', '3:46', 'Kl_-hux78w6RMaTEit2EXZHNBWB9iDBn.mp3', 1, 1, 1619708948, 1621980539),
(412, 30, 1, 14, 'Dot Your Eyes', 'Featuring Jamey Jasta', '3:15', '-3_QJY5uPSOPz7AbY-5IKrej21O0F6K8.mp3', 1, 1, 1619708948, 1621980551),
(413, 30, 2, 2, 'Under And Over It', '', '4:10', 'hqreemS8oQkYdXlrOlAlnL-izwgru3vJ.mp3', 1, 1, 1619708948, 1619818460),
(414, 30, 2, 3, 'Burn It Down', '', '4:08', 'ZqUwU9pUeo0moGBd3deK4b-bPuVa4rZb.mp3', 1, 1, 1619708948, 1619818463),
(415, 30, 2, 4, 'American Capitalist', '', '3:34', 'eiRCE2RtAO-2pyPykhXAOQ4HUQE3YXqk.mp3', 1, 1, 1619708949, 1619818466),
(416, 30, 2, 5, 'Hard To See', '', '3:47', '5frjj53b5a7MskNT5LHmBWI596aL5Fdx.mp3', 1, 1, 1619708950, 1619818468),
(417, 30, 2, 6, 'Coming Down', '', '5:07', 'GbT0F_kc1QIgGQ05qKHP6cPRO_roG_5w.mp3', 1, 1, 1619708950, 1619818471),
(418, 30, 2, 7, 'Bad Company', '', '4:57', 'BGv_nyvYl4j-FYwB328j023izr6tvoOe.mp3', 1, 1, 1619708951, 1619818474),
(419, 30, 2, 8, 'White Knuckles', '', '10:01', '6w55DDJQipqnsRFe_8YGW18W7PCpdXVR.mp3', 1, 1, 1619708953, 1619818477),
(420, 30, 2, 9, 'Drum Solo', '', '4:17', 'LqY-X41s0Dfa0f7HT0k8VeYRjSFoGSLc.mp3', 1, 1, 1619708953, 1619818479),
(421, 30, 2, 10, 'Far From Home', '', '2:29', 'o-up1Zlk5qMf1FczoO9izjc61HFFBaUv.mp3', 1, 1, 1619708953, 1619818482),
(422, 30, 2, 11, 'Never Enough', '', '3:42', 'd7bCQaIywSOw22Bzd-CgEpX1g4W2TY-R.mp3', 1, 1, 1619708953, 1619818485),
(423, 30, 2, 12, 'War Is The Answer', '', '5:45', 'O6NwTS_Sm_Tdo13CAXguVKcN4TWu9qND.mp3', 1, 1, 1619708953, 1619818490),
(424, 30, 2, 13, 'Remember Everything', '', '5:15', 'D-kWYHZH1Pk-PB1eQ-Ij1vfbZ-SSYjUs.mp3', 1, 1, 1619708953, 1619818493),
(425, 30, 2, 14, 'No One Gets Left Behind', '', '3:50', 'BMavmVlonN2bfsXJHbfJFELEfOiz_hqC.mp3', 1, 1, 1619708953, 1619818495),
(426, 30, 2, 15, 'The Bleeding', '', '7:17', 'rbaiMYg1rSyD2lINslfW6LUyZpnPYFlI.mp3', 1, 1, 1619708954, 1619818498),
(427, 31, 1, 1, 'Here to Die', '', '3:00', 'S95S9EUkf68Lv7vSejLCEET1Zwb9VrAX.mp3', 1, 1, 1619805841, 1619805841),
(428, 31, 1, 2, 'Weight Beneath My Sin', '', '3:37', '-GR-WuFDOIfcxYds0NEzDRLoIHcVJezG.mp3', 1, 1, 1619805841, 1619805841),
(429, 31, 1, 3, 'Wrecking Ball', '', '3:13', 'ZiS8de8pe35hqGDc2E65I-WCLmpFLdFH.mp3', 1, 1, 1619805841, 1619805841),
(430, 31, 1, 4, 'Battle Born', '', '3:44', 'ZdQk4nT6zSZ8xvNI7LdkQxGGfOzlMhRH.mp3', 1, 1, 1619805841, 1619805841),
(431, 31, 1, 5, 'Cradle to the Grave', '', '3:19', 'wrRjLFeFoglegU6mSmAq0_dMnZ-YsPRD.mp3', 1, 1, 1619805842, 1619805842),
(432, 31, 1, 6, 'Matter of Time', '', '3:16', '44MrjMO_x8zqexoDscRVsyoJ-6eTAbFh.mp3', 1, 1, 1619805842, 1619805842),
(433, 31, 1, 7, 'The Agony of Regret', '', '1:43', 'oPyxUB3h_EIp0gOWmcJ9DqfRill52iw2.mp3', 1, 1, 1619805842, 1619805842),
(434, 31, 1, 8, 'Cold', '', '3:48', 'MLKD2O800Os4AutNiyNPB6eLF89dLCnT.mp3', 1, 1, 1619805842, 1619805842),
(435, 31, 1, 9, 'Let This Go', '', '3:16', '0m-ptR1i49A5Z_5KbbUQm-e7TbVlomSg.mp3', 1, 1, 1619805842, 1619805842),
(436, 31, 1, 10, 'My Heart Lied', '', '3:35', 'ai8G9dVmfAd7P_rW6jATtbLbaCvXO1Ne.mp3', 1, 1, 1619805842, 1619805842),
(437, 31, 1, 11, 'A Day in My Life', '', '3:44', 'b4zV68zWAPdal0GVcpYuebxUntk7IIHj.mp3', 1, 1, 1619805842, 1619805842),
(438, 31, 1, 12, 'House of the Rising Sun', '', '4:07', 'OUIXZYjK3OWIeaGeerYGCFk9QeiLzWvZ.mp3', 1, 1, 1619805842, 1619805842),
(439, 32, 1, 1, 'Got Your Six', '', '2:58', 'gv1gbDAEEJltYlbrYLcOskcWuTMM9OvD.mp3', 1, 1, 1619818129, 1619818129),
(440, 32, 1, 2, 'Jekyll and Hyde', '', '3:27', 'omVFyQUJ8T5_UGUdlsjbryi9H1TxSLHV.mp3', 1, 1, 1619818129, 1619818129),
(441, 32, 1, 3, 'Wash It All Away', '', '3:45', 'H-K3VJL7zg3FD3LaheQ_JuDXY7uH1XaK.mp3', 1, 1, 1619818129, 1619818129),
(442, 32, 1, 4, 'Ain\'t My Last Dance', '', '3:29', 'LZA3aD7gU8kG8aDfOcJPiOsvWP8JA5q5.mp3', 1, 1, 1619818129, 1619818129),
(443, 32, 1, 5, 'My Nemesis', '', '3:36', 'oIGfLTsAu5-LPz-JMBSefaRGYcFKcPUD.mp3', 1, 1, 1619818129, 1619818129),
(444, 32, 1, 6, 'No Sudden Movement', '', '3:21', 'kaBEi53qByo3eiIwhuVAw3wMYNvG1Rqh.mp3', 1, 1, 1619818129, 1619818129),
(445, 32, 1, 7, 'Question Everything', '', '5:06', '4wdMlACvdkgF-ASXR-64wMq4GTxqXhCy.mp3', 1, 1, 1619818129, 1619818129),
(446, 32, 1, 8, 'Hell to Pay', '', '3:09', 'oBoibPlWGI6usLJx0wUtEsKYW8O3w-NS.mp3', 1, 1, 1619818129, 1619818129),
(447, 32, 1, 9, 'Digging My Own Grave', '', '3:47', 'LiHeQ9390MdeU5HXjdpCh8D-9sVyvvfL.mp3', 1, 1, 1619818129, 1619818129),
(448, 32, 1, 10, 'Meet My Maker', '', '3:00', 'mm_c4hixoly6XGf1viHXsTPmRkF7_fqr.mp3', 1, 1, 1619818130, 1619818130),
(449, 32, 1, 11, 'Boots and Blood', '', '2:46', 'q82O9DeaJf8tcBe69LgNC6H5FNGsEurE.mp3', 1, 1, 1619818130, 1619818130),
(450, 32, 1, 12, 'You\'re Not My Kind', '', '3:21', '4oTjqqdZ8pGCzb0lq4xfqgBMEsdBdBuM.mp3', 1, 1, 1619818130, 1619818130),
(451, 32, 1, 13, 'This Is My War', '', '2:55', 'MvmDRxGZWoAOTPmlUPB9N3Lb2ak5LYw0.mp3', 1, 1, 1619818130, 1619818130),
(452, 32, 1, 14, 'I Apologize', '', '4:04', '8zlQUOK1Nrc4Yqf38p54pD9va3OPxKZq.mp3', 1, 1, 1619818130, 1619818130),
(453, 32, 1, 15, 'Jekyll And Hyde', 'Voicemail / Hidden Track', '2:02', 'Hz6XkrNBNUyU-CdDtL7QpYFDZ1gDaUv8.mp3', 1, 1, 1619818130, 1619818157),
(454, 33, 1, 1, 'Trouble', '', '3:12', 'O-PAehW2Ip7L0MYft_-w4_lxvsA2uRss.mp3', 1, 1, 1619818200, 1619818200),
(455, 33, 1, 2, 'Gone Away', '', '4:35', '0ra1jbCCeCDl9KqPTRQNi62ioJiguzDI.mp3', 1, 1, 1619818200, 1619818200),
(456, 33, 1, 3, 'Lift Me Up', '', '4:06', 'xqPp1FO7i9uh6xdUX7Vzos13b63C-8SB.mp3', 1, 1, 1619818200, 1619818200),
(457, 33, 1, 4, 'Wash It All Away', '', '3:45', 'wqbF9gIzIJ-J5s9rdPecHBeFgaRurIUD.mp3', 1, 1, 1619818200, 1619818200),
(458, 33, 1, 5, 'Bad Company', '', '4:23', 'Ko1B4NbkBx_vU9W5NJFZXR0VYPK1sEyY.mp3', 1, 1, 1619818201, 1619818201),
(459, 33, 1, 6, 'Under and Over It', '', '3:38', 'cABDebHd2PGKZJ7HX1ZSI2kft3MvW5UI.mp3', 1, 1, 1619818201, 1619818201),
(460, 33, 1, 7, 'Wrong Side of Heaven', '', '4:31', 'sEKyu_1mvhg-H1VaiIlE-WUH-DzsBTuy.mp3', 1, 1, 1619818202, 1619818202),
(461, 33, 1, 8, 'House of The Rising Sun', '', '4:07', 'wnAgunKFUUlFeb9AvrYSUPrljmk1Mx5l.mp3', 1, 1, 1619818202, 1619818202),
(462, 33, 1, 9, 'I Apologize', '', '4:03', 'UznAnQl2T1-oeJ4VuC9XRWU4wzsrmwtR.mp3', 1, 1, 1619818203, 1619818203);
INSERT INTO `track` (`id`, `album`, `disk`, `number`, `name`, `signature`, `playtime`, `file`, `creator`, `editor`, `created_at`, `updated_at`) VALUES
(463, 33, 1, 10, 'The Bleeding', '', '4:29', 'r06ASv5jU1X_GX-WUqEtpNHhuhUrgEcK.mp3', 1, 1, 1619818203, 1619818203),
(464, 33, 1, 11, 'Jekyll and Hyde', '', '3:27', 'Sf4-fcD3hkHoCQxqQgiyuhi53k6OzkNh.mp3', 1, 1, 1619818203, 1619818203),
(465, 33, 1, 12, 'Remember Everything', '', '4:39', 'ixD3u1rU6OxBdeF13kyB1SswYqhij66N.mp3', 1, 1, 1619818203, 1619818203),
(466, 33, 1, 13, 'Coming Down', '', '4:01', 'zP1MsPTV0gnrFWheP6nbqE0F2bdaycFN.mp3', 1, 1, 1619818203, 1619818203),
(467, 33, 1, 14, 'My Nemesis', '', '3:36', 'ysPnVXLyfAC2j7UzNTqnriblrn0159ft.mp3', 1, 1, 1619818204, 1619818204),
(468, 33, 1, 15, 'Battle Born', '', '3:44', 'QanBorW8W5FCsNLT7qD9ubmZ_p7Xnrdm.mp3', 1, 1, 1619818204, 1619818204),
(469, 33, 1, 16, 'Far From Home', '', '3:33', '_IC29EdH2fQrhjKMfIaC7fHN5adp9MhY.mp3', 1, 1, 1619818204, 1619818204),
(470, 34, 1, 1, 'Trouble', '', '3:12', 'c8xR1G_qd-wRQ8i2jougN0gsZ_hZzg_Y.mp3', 1, 1, 1619818261, 1619818261),
(471, 34, 1, 2, 'Fake', '', '3:31', 'hnEmnzsH9Pl2NRtSxAvUl3qyHeVm9wil.mp3', 1, 1, 1619818261, 1619818261),
(472, 34, 1, 3, 'Top Of The World', '', '2:42', 'qKICS2JchB7WgDXEnSSulBWCarFStkrg.mp3', 1, 1, 1619818261, 1619818261),
(473, 34, 1, 4, 'Sham Pain', '', '3:30', 'iXGKZi-o0JWJCWaoxdd68VZFAPpW_kbe.mp3', 1, 1, 1619818261, 1619818261),
(474, 34, 1, 5, 'Blue On Black', '', '4:35', 'YjnBZ-cUNcEJNzhvomPTXYA5NNKAaTeO.mp3', 1, 1, 1619818261, 1619818261),
(475, 34, 1, 6, 'Fire In The Hole', '', '2:57', 'fohuy5BsyO862YNpn3UhNMPe75qvS5Du.mp3', 1, 1, 1619818261, 1619818261),
(476, 34, 1, 7, 'I Refuse', '', '3:39', 'O2TzTVLmXPIoSvzvWHIbwJNELO6E7J08.mp3', 1, 1, 1619818261, 1619818261),
(477, 34, 1, 8, 'It Doesn\'t Matter', '', '3:46', 'uYTZ8sxlKih4qARAPN28kEd37HG-lMfn.mp3', 1, 1, 1619818261, 1619818261),
(478, 34, 1, 9, 'When The Seasons Change', '', '3:47', 'O0_QrHuyW6drqLKybDX4bGY1ES3RxF1j.mp3', 1, 1, 1619818261, 1619818261),
(479, 34, 1, 10, 'Stuck In My Ways', '', '3:57', 'S2C_EAWZi8InjIFSVqWBRVTDRpZtioU2.mp3', 1, 1, 1619818262, 1619818262),
(480, 34, 1, 11, 'Rock Bottom', '', '2:32', 'xs8QaR6l9duzp9gEnU8IJga2w3enW7oV.mp3', 1, 1, 1619818262, 1619818262),
(481, 34, 1, 12, 'Gone Away', '', '4:35', 'c5955SwJVhzSLIAHonmAptJ9IzqbIUhZ.mp3', 1, 1, 1619818262, 1619818262),
(482, 34, 1, 13, 'Bloody', '', '3:49', '4lj4JWWXffrRFg2J0eRUVaWWArUhb1OZ.mp3', 1, 1, 1619818262, 1619818262),
(483, 34, 1, 14, 'Will The Sun Ever Rise', '', '3:57', '49hWILja1CkYCyg9v7nF-1eBh1tLS1jL.mp3', 1, 1, 1619818262, 1619818262),
(484, 34, 1, 15, 'Bad Seed', '', '3:59', 'bei3kny-X5-wyH7aekAcTVsxKA2YFk8a.mp3', 1, 1, 1619818262, 1619818262),
(485, 34, 1, 16, 'Save Your Breath', '', '3:27', 'LqGIByGuLr5tPiRdm3VOX3nUJiufGqy0.mp3', 1, 1, 1619818263, 1619818263),
(561, 35, 1, 1, 'Два друга', '', '2:32', '2c9AQK5bb8zDG-gO9uChU17Z5NCc6r36.mp3', 1, 1, 1620577634, 1620577634),
(562, 35, 1, 2, 'Сапоги', '', '2:38', 'UCHV4dhdV6l8uLHvGMTzsykHb8U0K3PY.mp3', 1, 1, 1620577635, 1620577635),
(563, 35, 1, 3, 'Лесник', '', '2:30', '0hIuf4x7ydaAwrewRwnWjqGvFnmmOPbk.mp3', 1, 1, 1620577635, 1620577635),
(564, 35, 1, 4, 'Паника в селе', '', '3:13', '5nE0QZfv-Uq6rPowItBHgC0RjjBB1g7a.mp3', 1, 1, 1620577635, 1620577635),
(565, 35, 1, 5, 'Сказка про дракона', '', '2:58', 'FxoUWDQ037m683WrqF43RSiwj5qo9lPA.mp3', 1, 1, 1620577635, 1620577635),
(566, 35, 1, 6, 'Кукольный театр', '', '2:58', 'rWJluR65N7v1xE2HhPpHkjuePls0w3q1.mp3', 1, 1, 1620577635, 1620577635),
(567, 35, 1, 7, 'Отец и маски', '', '3:11', 'HWW2amw6YS7JNUaXhA6QOM4i4lg09ykq.mp3', 1, 1, 1620577635, 1620577635),
(568, 35, 1, 8, 'Вячеслав', '', '2:25', 'Awg1gjV2jlxX1IPY_FaJ-R4ALjVd6g-z.mp3', 1, 1, 1620577635, 1620577635),
(569, 35, 1, 9, 'Добрые тролли', '', '3:36', 'iUzLGJNVOxdwjBMD06rwI-h-3SAJAgbh.mp3', 1, 1, 1620577635, 1620577635),
(570, 35, 1, 10, 'Старинные друзья', '', '4:15', 'WACDKe1ipSD0pivfDRbyikoB5UBljHgr.mp3', 1, 1, 1620577635, 1620577635),
(571, 36, 1, 1, 'Смельчак и ветер', '', '3:01', 'cSCLoinHUziSYW60UAQF83T1vTDkCZmM.mp3', 1, 1, 1620579522, 1620579522),
(572, 36, 1, 2, 'Проказник скоморох', '', '1:52', 'tMIxkdvMTbkH-6yrmMoKMEdf0__NC-In.mp3', 1, 1, 1620579522, 1620579522),
(573, 36, 1, 3, 'Верная жена', '', '2:38', 'D9mO7SXrgjqjy5LswP1zRs0ZCrstKnrc.mp3', 1, 1, 1620579522, 1620579522),
(574, 36, 1, 4, 'Садовник', '', '3:42', 'FKuQ9-f-bUdJtBX6Cf1hq3cLXSSIB6cG.mp3', 1, 1, 1620579522, 1620579522),
(575, 36, 1, 5, 'Блуждают тени', '', '2:12', 'ueiOrUuaHQdsM2HrCXGhnJDvjmqrVx6n.mp3', 1, 1, 1620579522, 1620579522),
(576, 36, 1, 6, 'Внезапная голова', '', '2:25', 'R4aAEo7HdZ-7Nbarsnqt4BiHJEgD0cOF.mp3', 1, 1, 1620579522, 1620579522),
(577, 36, 1, 7, 'Шар голубой', '', '1:15', 'G3NGYeVSK4miBHvbYF7pzC5gq2YBgxu3.mp3', 1, 1, 1620579522, 1620579522),
(578, 36, 1, 8, 'Злодей и шапка', '', '2:16', 'KjmjPAZUkyhuJ27Nt9f0pztg4jK_muGX.mp3', 1, 1, 1620579522, 1620579522),
(579, 36, 1, 9, 'От женщин кругом голова', '', '1:31', 'vMSFpqEDD0KipSv_r8T6VfRPn5wmnn4_.mp3', 1, 1, 1620579522, 1620579522),
(580, 36, 1, 10, 'Рыбак', '', '1:17', 'yMMTACV9WTG8RDiRb07bnblahwWkL7qL.mp3', 1, 1, 1620579523, 1620579523),
(581, 36, 1, 11, 'Мотоцикл', '', '2:37', 'CcZQCQAyWt8_DOjpboqUniQ5aIj2Fpn2.mp3', 1, 1, 1620579523, 1620579523),
(582, 36, 1, 12, 'Холодное тело', '', '2:41', 'Sd72yY1kQ3UoZEUa8DOhnPktrctWBVyJ.mp3', 1, 1, 1620579523, 1620579523),
(583, 36, 1, 13, 'Дурак и молния', '', '1:54', 'cnumHVfZF0GlcdaYqhs4Lwm_Wt3vvd1m.mp3', 1, 1, 1620579523, 1620579523),
(584, 36, 1, 14, 'Леший обиделся', '', '2:53', 'iQRqBc6m0PAj7FBZNlhXuIPjhnJeDBdG.mp3', 1, 1, 1620579523, 1620579523),
(585, 36, 1, 15, 'Два вора и монета', '', '2:16', '5ClW_6mfwMBdina8cTXSMVRjqCA86FQ-.mp3', 1, 1, 1620579523, 1620579523),
(586, 36, 1, 16, 'Любовь и пропеллер', '', '2:55', 'ral22eH3nPnjLnlY_1Ze-EWtmWQkz0IP.mp3', 1, 1, 1620579523, 1620579523),
(587, 36, 1, 17, 'Камнем по голове', '', '2:38', '1ahx3ZPTMuXrzC78gQvcifjKld78yyXT.mp3', 1, 1, 1620579523, 1620579523),
(588, 36, 1, 18, 'С тех пор как он ушел', '', '2:17', 'hhiavorZ7VvSgcJ-im5vEO0APKz_d0T_.mp3', 1, 1, 1620579523, 1620579523),
(589, 36, 1, 19, 'В доме суета', '', '2:30', '8GlJch0Q281Lx8tmdF3-Z4kfHaznZfSS.mp3', 1, 1, 1620579523, 1620579523),
(590, 36, 1, 20, 'Лесные разбойники', '', '3:56', 'A7IgBgWXRk8PmYoS1mTFvKcZ02n3fUkZ.mp3', 1, 1, 1620579523, 1620579523),
(591, 36, 1, 21, 'Мария', '', '4:03', 'o_3pGej0vFT1lZcyhPkxIECmlxZp7ks9.mp3', 1, 1, 1620579523, 1620579523),
(592, 37, 1, 1, 'Дед на свадьбе', '', '4:47', 'FoqkYjPl66x9acKqjVMYG3f19azdo-i_.mp3', 1, 1, 1620579597, 1620579597),
(593, 37, 1, 2, 'Запрет отца', '', '3:31', 'X-sZLo2NZ0RmQpGXS_Rj0jrWxYB4jgwT.mp3', 1, 1, 1620579597, 1620579597),
(594, 37, 1, 3, 'Кузнец', '', '2:58', '4uFHO2XWIuOVTQBR79wShHYS0Ia_CsX8.mp3', 1, 1, 1620579597, 1620579597),
(595, 37, 1, 4, 'Разговор с гоблином', '', '2:30', 's6OUswB9j-B5XOiz0LT-miyCTOhLUORX.mp3', 1, 1, 1620579597, 1620579597),
(596, 37, 1, 5, 'Вор, граф и графиня', '', '2:53', '4WwPtJqS57dvL8VJ77eg9uw1hKDkzXG8.mp3', 1, 1, 1620579597, 1620579597),
(597, 37, 1, 6, 'Что видел малыш', '', '3:26', 'RfSFKWB1KJbDGyVHQDjQkrXHoYdjS1tg.mp3', 1, 1, 1620579598, 1620579598),
(598, 37, 1, 7, 'Невеста палача', '', '4:21', 'OJAdUCG1BxCrucxU3Q3v5jXvJeTXq503.mp3', 1, 1, 1620579598, 1620579598),
(599, 37, 1, 8, 'Мастер приглашает в гости', '', '3:13', 'o9r0zRoPMUU5FMioLd1UTH7qKhY6wEW5.mp3', 1, 1, 1620579598, 1620579598),
(600, 37, 1, 9, 'Бродяга и старик', '', '4:06', 'W5Gx2eOd0KiGg34hzovs2xE0K2VTQli9.mp3', 1, 1, 1620579598, 1620579598),
(601, 37, 1, 10, 'Смерть халдея', '', '3:37', 'F9s3CIv3tijYnQ-Ag8E-2ZQw8DAEoCvX.mp3', 1, 1, 1620579598, 1620579598),
(602, 37, 1, 11, 'Помнят с горечью древляне', '', '3:54', 'RhVZVnScU3sqL670bO5Iw7fMUxvjD8pB.mp3', 1, 1, 1620579598, 1620579598),
(603, 37, 1, 12, 'Про Ивана', '', '2:34', 'pc-Lo6klaoZ2983fynvBy8BUUCRA4B_u.mp3', 1, 1, 1620579598, 1620579598),
(604, 37, 1, 13, 'Воспоминания о былой любви', '', '3:00', 'ndizVCpGjChMIVLCYh3gyQyAWXsPPxhb.mp3', 1, 1, 1620579598, 1620579598),
(607, 38, 1, 1, 'Гимн шута', '', '5:01', 'Djah6J4SY7neA6Tk9zL_LoPetgwWQw97.mp3', 1, 1, 1620581751, 1620581751),
(608, 38, 1, 2, 'Проклятый старый дом', '', '4:17', 'Bp5oWVDnSMjxb51R8A1vgxtHRaTvg-nX.mp3', 1, 1, 1620581751, 1620581751),
(609, 38, 1, 3, 'Тайна хозяйки старинных часов', '', '3:31', '5edR4l3EYfukzpHLBZcRklDy5TbBBqCC.mp3', 1, 1, 1620581751, 1620581751),
(610, 38, 1, 4, 'Кузьма и барин', '', '3:08', '_tsUPUaWxqBmEnt5qlCpJR3FwLy1-2Vo.mp3', 1, 1, 1620581751, 1620581751),
(611, 38, 1, 5, 'Пират', '', '3:55', 'gF8dc2EWS2HTQyYkzg_0TjxyUXCcjN8U.mp3', 1, 1, 1620581751, 1620581751),
(612, 38, 1, 6, 'Скотный двор', '', '2:22', '69KNj57E6pXTRNbMX8j0aYL2fGMRYcxv.mp3', 1, 1, 1620581751, 1620581751),
(613, 38, 1, 7, 'Возвращение колдуна', '', '3:15', 'LtSwEVthl7hegesANIb5JJFINGqj-TGi.mp3', 1, 1, 1620581752, 1620581752),
(614, 38, 1, 8, 'Зловещий кузен', '', '3:12', 'rD0kiUQcs207vJyuSLNlAo4fGD13oxSD.mp3', 1, 1, 1620581752, 1620581752),
(615, 38, 1, 9, 'Ответ', '', '3:47', '-EP6rof1-mW7Z9TbaSqf99Ky59rQ8ZnH.mp3', 1, 1, 1620581752, 1620581752),
(616, 38, 1, 10, 'Рогатый', '', '3:16', '4oQ_pefELT6aVnwFDDrdfCVqIxmroMbW.mp3', 1, 1, 1620581752, 1620581752),
(617, 38, 1, 11, 'Двухголовый отпрыск', '', '1:52', 'MLEYTe8VT6yoplU9jzdyvTC4w9GeRlZT.mp3', 1, 1, 1620581752, 1620581752),
(618, 38, 1, 12, 'Два монаха в одну ночь', '', '2:01', '-SNj3zvokzXrh3y1v7hN6zih3oZQQlGb.mp3', 1, 1, 1620581752, 1620581752),
(619, 38, 1, 13, 'Кто это все придумал', '', '2:57', 'R8iqTYQFp77jAu1a_GoqoxxPDs7mg_PJ.mp3', 1, 1, 1620581752, 1620581752),
(620, 38, 1, 14, 'Пивной череп', '', '3:00', '-JZVGeMKJvaMuXkmDlz9hhcUYkJuWzMn.mp3', 1, 1, 1620581752, 1620581752),
(621, 38, 1, 15, 'Парень и леший', '', '4:10', 'B55h_HAglDD1Tz7kdAiNx_zUkBi0pnut.mp3', 1, 1, 1620581752, 1620581752),
(622, 38, 1, 16, 'Похороны панка', '', '2:19', 'wL1d5F18WKucPfB7Vym7-4CEzezfeKzD.mp3', 1, 1, 1620581753, 1620581753),
(623, 38, 1, 17, 'Воспоминания о былой любви', '', '4:55', 'wYQoPzRSKy0IBFZssLjAr1wrafN1xpQd.mp3', 1, 1, 1620581753, 1620581753),
(624, 39, 1, 1, 'Волосокрад', '', '4:27', 'Rya-MI1ppkEhP6IbTmHUBfpZvcK1W9pU.mp3', 1, 1, 1620581808, 1620581808),
(625, 39, 1, 2, 'Мертвый Анархист', '', '4:08', '_C9ybVhlAIqM6_b6oErHuf702wEVp9FF.mp3', 1, 1, 1620581808, 1620581808),
(626, 39, 1, 3, 'Смешной Совет', '', '4:06', 'KDJ5vOV0Xab_Vpw8-pSgyDnZeRzZxnrv.mp3', 1, 1, 1620581808, 1620581808),
(627, 39, 1, 4, 'Некромант', '', '2:44', 'YpepNdNvyTHpSlt91lE_eHFPOmIoE757.mp3', 1, 1, 1620581808, 1620581808),
(628, 39, 1, 5, 'Защитник Свиней', '', '2:45', 'uk_SJfvVoLcwIMMxHyNmn_RzqlkFdS2c.mp3', 1, 1, 1620581808, 1620581808),
(629, 39, 1, 6, 'Генрих и Смерть', '', '2:25', 'IAbR09cEFFiA18QwSN7nFmcZW0zdkIMc.mp3', 1, 1, 1620581808, 1620581808),
(630, 39, 1, 7, 'Жаль, нет Ружья!', '', '3:40', '7jnTz2HoUHot4TifW5PjpjVu6yU2k0fg.mp3', 1, 1, 1620581808, 1620581808),
(631, 39, 1, 8, 'Представляю Я', '', '2:10', 'ooT22EgQTn9Fd0FnW6UXvHiU1ZlP572m.mp3', 1, 1, 1620581808, 1620581808),
(632, 39, 1, 9, 'Мой Характер', '', '3:51', 'I0AKGe-Ly9wtTsewxslGF3bn1VHhw9UU.mp3', 1, 1, 1620581809, 1620581809),
(633, 39, 1, 10, 'Песенка пьяного деда', '', '2:05', '2K0BfqddBjZI8pCidRKsYRUBD1gRTaCn.mp3', 1, 1, 1620581809, 1620581809),
(634, 39, 1, 11, 'Водяной', '', '2:10', 'gFpHh5CLFNr-GRj6Jy89vJ4YMOOrerKk.mp3', 1, 1, 1620581809, 1620581809),
(635, 39, 1, 12, 'Вдова и Горбун', '', '3:11', '0KvUv5kjS1ZtPP4wXLkHNdQuDuHuFQyD.mp3', 1, 1, 1620581809, 1620581809),
(636, 39, 1, 13, 'Вино хоббитов', '', '4:33', 'TNHF6AVU2nyENa-hHuoxgzdywO3Jn2Rm.mp3', 1, 1, 1620581809, 1620581809),
(637, 39, 1, 14, 'Разборки из-за Баб', '', '3:44', '1PTEsMQUm3kazE9_hWyO43DMvaIscq0f.mp3', 1, 1, 1620581809, 1620581809),
(638, 39, 1, 15, 'Утопленник', '', '4:04', 'j72DRiYMOQjFNAathle-zFYcIXhLn7e7.mp3', 1, 1, 1620581809, 1620581809),
(639, 39, 1, 16, 'Медведь', '', '3:31', '-2L4D-DDqlRUMzZ0GMVXfqz3P9k1ARj8.mp3', 1, 1, 1620581809, 1620581809),
(640, 39, 1, 17, 'Пьянка', '', '2:13', 'RZjKX_owfeKbe0sYB3eFXlE7xt4ZrUTq.mp3', 1, 1, 1620581809, 1620581809),
(641, 40, 1, 1, 'Хардкор по-русски', '', '2:53', 'yUbPkx5XHTkZ1VFlnYqFe30dMpywLCc9.mp3', 1, 1, 1620581844, 1620581844),
(642, 40, 1, 2, 'Волшебный глаз старика Алонса', '', '1:37', 'NBNRlLn0_FfGrGlGXWRcpUXmRQ1pcMpz.mp3', 1, 1, 1620581844, 1620581844),
(643, 40, 1, 3, 'Исповедь вампира', '', '3:35', 'E4hD92xXMylFZRfXr6k4hCL58SWnZz8c.mp3', 1, 1, 1620581844, 1620581844),
(644, 40, 1, 4, 'Месть Гарри', '', '3:08', 'ErEOFC1es9WLvsEBCGzvT1CYWoCGfA_u.mp3', 1, 1, 1620581845, 1620581845),
(645, 40, 1, 5, 'Северный флот', '', '2:11', 'q038H1j2AZwfRKh40lnskkE-9IU-eaGX.mp3', 1, 1, 1620581845, 1620581845),
(646, 40, 1, 6, 'Идол', '', '3:00', 'PvKFhu7MpQ1Tc3B9-W-acbZEXW59-Mre.mp3', 1, 1, 1620581845, 1620581845),
(647, 40, 1, 7, 'Бунт на корабле!', '', '1:52', 'j5wUUat0Sv5IZkPsrU-V5YInEdhnde85.mp3', 1, 1, 1620581845, 1620581845),
(648, 40, 1, 8, 'Хороший пират - Мертвый пират', '', '4:13', '_Eury4HeeV2MUafYK0cftbBeM-NFTR9L.mp3', 1, 1, 1620581845, 1620581845),
(649, 40, 1, 9, 'Рыцарь', '', '2:46', 'P9M8Qo2EWnvjp-ydUxXWZWvFo3HTcYVE.mp3', 1, 1, 1620581845, 1620581845),
(650, 40, 1, 10, 'Звонок', '', '2:00', 'XvYVL8ZFZvZQeTVutFTvlpla58Rx6oMT.mp3', 1, 1, 1620581845, 1620581845),
(651, 40, 1, 11, 'Инквизитор', '', '3:47', '9q02tHOIbwBse4nn5k70bUI4CIxkW1d9.mp3', 1, 1, 1620581845, 1620581845),
(652, 40, 1, 12, 'Задира и солдат', '', '3:39', 'YeVAmvHMVWaZQRKrLnm7MoEjeXQ0CBWq.mp3', 1, 1, 1620581845, 1620581845),
(653, 40, 1, 13, 'Раненый воин', '', '1:42', '8icHbJC6yE1Tx0wR0kL-mDWQ0zn9i1_V.mp3', 1, 1, 1620581845, 1620581845),
(654, 40, 1, 14, 'Муха - маленькая птичка', '', '0:06', '87ZdJWhJkBh2LSOmR_GRhEq8v04-P_R0.mp3', 1, 1, 1620581845, 1620581845),
(655, 40, 1, 15, 'Хозяин леса', '', '3:08', '1n4jlRVfj1CS-tTaH33dK_gEzJ74semP.mp3', 1, 1, 1620581845, 1620581845),
(656, 41, 1, 1, 'Марионетки', '', '3:36', 'LJj7vGBgCqVYgcwUxYBUxkl1G0-L122C.mp3', 1, 1, 1620581886, 1620581886),
(657, 41, 1, 2, 'Маска', '', '4:44', '9IbLsor4j5pDB2uzMR41KvE0N7XjKBAu.mp3', 1, 1, 1620581886, 1620581886),
(658, 41, 1, 3, 'Ром', '', '2:41', '8Q5zsyxZLHx03S2OCbFPKtFCCWAnHo0Y.mp3', 1, 1, 1620581886, 1620581886),
(659, 41, 1, 4, 'Гробовщик', '', '3:55', 'Sez40815eE2nxA1L4Ijt4tegnl6hEkaU.mp3', 1, 1, 1620581886, 1620581886),
(660, 41, 1, 5, 'Дочка вурдалака', '', '4:08', 'yncUlhDVB-d3gCCWTEuf4va4h-WEYUbn.mp3', 1, 1, 1620581886, 1620581886),
(661, 41, 1, 6, 'Свой среди чужих', '', '4:10', 'ivRSl7s4YfftBD1aPz5xYvcT_QhpsAQv.mp3', 1, 1, 1620581886, 1620581886),
(662, 41, 1, 7, 'Отражение', '', '5:33', 'sLLmrRjCaSY-gTJaF5avMgBCkwBab7jW.mp3', 1, 1, 1620581886, 1620581886),
(663, 41, 1, 8, 'Та, что смотрит из пруда', '', '3:11', 'Q82TvSWxdG8eMZmq7MQUPuOzldbUrQkl.mp3', 1, 1, 1620581886, 1620581886),
(664, 41, 1, 9, 'В гостях у соседа', '', '3:47', 'ntXHNqezCUZ_5urxD9tB6Kc5TPdpnbz3.mp3', 1, 1, 1620581886, 1620581886),
(665, 41, 1, 10, 'Хозяин таверны', '', '2:58', 'VSgPEVYEN4WZaaE4sIeW2Ya6z3ltu93X.mp3', 1, 1, 1620581886, 1620581886),
(666, 41, 1, 11, 'Писатель Гудвин', '', '3:05', 'XmyRvsn9Jd1TKlmoWuF82msajOsM1eKk.mp3', 1, 1, 1620581886, 1620581886),
(667, 41, 1, 12, 'Джокер', '', '3:16', 'oqvWcLSBepPvN5wsrGlyjOOwWLaMxQEu.mp3', 1, 1, 1620581886, 1620581886),
(668, 41, 1, 13, 'Пляски на могиле', '', '3:32', 'VxHssELAqnofBZ4zbvvDcAPHOpZr6-hc.mp3', 1, 1, 1620581886, 1620581886),
(669, 41, 1, 14, 'Матерый волк', '', '2:15', '52bOgokckhsfQBSD7PLjPBkbzSunRuR7.mp3', 1, 1, 1620581886, 1620581886),
(670, 41, 1, 15, 'Продавец кошмаров', '', '3:36', '4KpoD7qvOyYcDwr2u-98mPNfxiNeFhqO.mp3', 1, 1, 1620581886, 1620581886),
(671, 41, 1, 16, 'Город мертвецов', '+bonus', '6:34', 'GuquicANDy71IlQbPedXeUApHsyS_L3W.mp3', 1, 1, 1620581887, 1620581900),
(672, 42, 1, 1, 'Внезапная голова', '', '2:26', 'LrqK1OPojSZPKzGh8zkOzKcg_0o7BgEW.mp3', 1, 1, 1620581949, 1620581949),
(673, 42, 1, 2, 'Сказка о Мертвеце', '', '3:58', 'Nuigh1_Az25EK-daotVOOb-cXBG2YGq3.mp3', 1, 1, 1620581949, 1620581949),
(674, 42, 1, 3, 'Королева-Ведьма', '', '4:38', 'GWBTNLBaLBKD4TRHRxG5SNZwEVstmKs5.mp3', 1, 1, 1620581949, 1620581949),
(675, 42, 1, 4, 'В доме суета', '', '2:29', 'l1qoKiJJ08H2I7eKsKjlv_7z6rh4hRLM.mp3', 1, 1, 1620581949, 1620581949),
(676, 42, 1, 5, 'Скупой', '', '3:46', 'LCl7GX_u4Tv8NVKhan8A2L77QB7tgxJq.mp3', 1, 1, 1620581949, 1620581949),
(677, 42, 1, 6, 'Солдат и Колдун', '', '6:39', 'diav1fzmERXYGgwaQcU6VDJhrVbxa92k.mp3', 1, 1, 1620581949, 1620581949),
(678, 42, 1, 7, 'Гробовщик', '', '3:53', 'snd0kHe00Vrw_v6X6ciFk3OhF0H0nVhZ.mp3', 1, 1, 1620581949, 1620581949),
(679, 42, 1, 8, 'В Доме Смерть', '', '2:17', '0NzXpu8aXJRX7SuxRTt34HFwXF1S_zeE.mp3', 1, 1, 1620581949, 1620581949),
(680, 42, 1, 9, 'Солдат и Чёрт', '', '2:01', 'A8ZtMRuy2-s-lkrE0XybPxVJtkZxzGwB.mp3', 1, 1, 1620581949, 1620581949),
(681, 42, 1, 10, 'В Гостях у Соседа', '', '3:47', 'EWg-_KJSwh30oo4f1Ftn9AMzIIZx349w.mp3', 1, 1, 1620581949, 1620581949),
(682, 42, 1, 11, 'Кобылья Голова', '', '3:43', 'zuco_lrSTUl--K7sv0UAY4y4cG7nILoo.mp3', 1, 1, 1620581949, 1620581949),
(683, 42, 1, 12, 'Мёртвый Жених', '', '2:56', 'Gg29P4CbLk1DpNE9Dqi5UZyjbHuk3qHK.mp3', 1, 1, 1620581950, 1620581950),
(684, 42, 1, 13, 'Верная Жена', '', '2:38', 'Wf99lfx20YRG2OIIOZSgY0qGpYA_Kykm.mp3', 1, 1, 1620581950, 1620581950),
(685, 42, 1, 14, 'Чёрт и Мужик', '', '1:04', 'Ir4OOR1YuOp71sH9hf2U8J1T-_LpEe95.mp3', 1, 1, 1620581950, 1620581950),
(686, 42, 1, 15, 'Три Фельдшера', '', '7:22', 'sU57Rt0XwhN7BJL0IDEBdfBgINLY12uH.mp3', 1, 1, 1620581950, 1620581950),
(687, 42, 1, 16, 'Любовь и Пропеллер', '', '2:54', 'nNZhw6koh3JDKgCCvtMQtyiHPj2nmlUM.mp3', 1, 1, 1620581950, 1620581950),
(688, 42, 1, 17, 'Сапоги Колдуна', '', '3:54', 'xCZFTG-GtKOC9FA5Y5TKCp6o1d0K3Erx.mp3', 1, 1, 1620581950, 1620581950),
(689, 42, 1, 18, 'Рассказ о Ведьме', '', '2:45', 'dP349wVzF1weodxjUurXBfv7hXDDEDSp.mp3', 1, 1, 1620581950, 1620581950),
(690, 42, 1, 19, 'Садовник', '', '3:44', '39DwCcKi_wESCrbBJq9nJcP4sDLXRjHZ.mp3', 1, 1, 1620581950, 1620581950),
(691, 42, 1, 20, 'Скрипач в Аду', '', '5:28', 'GiUOb1eN7KpnrULMsjRvwGYgL7l8GgJt.mp3', 1, 1, 1620581951, 1620581951),
(692, 42, 1, 21, 'Проказник Скоморох', '', '1:49', '9ud4klW39zK07vOd_RLgj9htH2DPhaFz.mp3', 1, 1, 1620581951, 1620581951),
(693, 43, 1, 1, 'Полутень клоуна', '', '0:34', 'CDSUyQFs9-w9AwshIYlcB2XSiSKj2874.mp3', 1, 1, 1620581983, 1620581983),
(694, 43, 1, 2, 'Тень клоуна', '', '2:17', 'SiQfQYoKBiwtlcuxyBjHABbVi0Dp6Crr.mp3', 1, 1, 1620581984, 1620581984),
(695, 43, 1, 3, 'Дагон', '', '5:03', 'dV99ODj7L7JBlxRYSn_MwgOiP_G4Exax.mp3', 1, 1, 1620581984, 1620581984),
(696, 43, 1, 4, 'Двое против всех', '', '3:53', 'LJuZx8ScnIuI67JJrpY3sQP7lPBrYN6f.mp3', 1, 1, 1620581984, 1620581984),
(697, 43, 1, 5, 'В Париж - домой', '', '4:55', '5ozLCQkSGoflHtsK27z8LtQOn-SgKP_t.mp3', 1, 1, 1620581984, 1620581984),
(698, 43, 1, 6, 'Ричард Гордон', '', '3:33', 'QeXMM-UZSA7WioVT9xWcZTkpQFJ3f5JH.mp3', 1, 1, 1620581984, 1620581984),
(699, 43, 1, 7, 'Фред', '', '3:20', 'XBOFvhqf-vC1BLhN03Mt70en8rzmx-eT.mp3', 1, 1, 1620581984, 1620581984),
(700, 43, 1, 8, 'Санта Клаус', '', '3:15', 'W0UbH9gx2RqVzHvufjBRHDY-3UQ8A_t9.mp3', 1, 1, 1620581984, 1620581984),
(701, 43, 1, 9, 'Кода', '', '3:54', 'ThgPn8U8miYjELUDtn1gPe40wvjkgw8p.mp3', 1, 1, 1620581984, 1620581984),
(702, 43, 1, 10, 'Полутень Заговор в суде', '', '0:38', 'ftDCSk4aq_so1KeSpBqTtYvpdC87WHKh.mp3', 1, 1, 1620581984, 1620581984),
(703, 43, 1, 11, 'Невидимка', '', '3:53', 'wB37YfnRkx5eA_S2ww5x1_1HkIbREdoV.mp3', 1, 1, 1620581984, 1620581984),
(704, 43, 1, 12, 'A.M.T.V.', '', '3:54', 'oVAnYmipXBLyduYaDXgwhHwQi9-GHk9Y.mp3', 1, 1, 1620581984, 1620581984),
(705, 43, 1, 13, 'Полутень зомби', '', '0:26', 'y4COZvtTGU99mTQ4fxWSybjXO4sfARIh.mp3', 1, 1, 1620581984, 1620581984),
(706, 43, 1, 14, 'Ходит зомби', '', '1:56', 'PqC-rYCGccH3NLhfDy6tdIK3GmTU4U92.mp3', 1, 1, 1620581985, 1620581985),
(707, 43, 1, 15, 'Смешной пистолетик', '', '2:26', 'Rtxy1AOV1nHI35x-DcdEBb5HLex0vxIU.mp3', 1, 1, 1620581985, 1620581985),
(708, 43, 1, 16, 'Вестник', '', '3:40', 'vUPdi4O2fL_hiqwpju-roVlqk2899EyU.mp3', 1, 1, 1620581985, 1620581985),
(709, 43, 1, 17, 'Клеймённый огнём', '', '4:36', 'QZ4ufT6awq5Tdh4KCEJmIDCgO8Bdky7W.mp3', 1, 1, 1620581985, 1620581985),
(710, 43, 1, 18, 'Тринадцатая рана', '', '2:41', 'LhtNazBwk9uLA4ly9677TXkF8f-HGU4c.mp3', 1, 1, 1620581985, 1620581985),
(711, 43, 1, 19, 'Суфлёр', '', '4:10', '7diS0tnA1UozLLPSmnAyfA_7CtAVyo6I.mp3', 1, 1, 1620581985, 1620581985),
(712, 44, 1, 1, 'Послание', '', '1:58', 'SB5HlFk8UK25oymNJz_-u5qeL_q-e4w5.mp3', 1, 1, 1620582024, 1620582024),
(713, 44, 1, 2, 'Театральный демон', '', '3:34', 'MLjcQAWx3Vj47ZxOcGdOqO58IMCKabp0.mp3', 1, 1, 1620582024, 1620582024),
(714, 44, 1, 3, 'Киногерой', '', '3:35', 'AiomFozlhxc8PcAg5l0Fk7etc4HL59bf.mp3', 1, 1, 1620582024, 1620582024),
(715, 44, 1, 4, 'Фокусник', '', '3:33', '7vmZbGnsSFUc-y_CNTEE8mQ3a4aF5TDC.mp3', 1, 1, 1620582024, 1620582024),
(716, 44, 1, 5, 'Танец злобного гения', '', '3:56', 'DjuXleWqa-WTmZogwf7lehXOPgUHCOn2.mp3', 1, 1, 1620582024, 1620582024),
(717, 44, 1, 6, 'Энди Кауфман', '', '2:33', 'ufQwX7_AE4jFEVtBzyFk9b9PPGjz7Qob.mp3', 1, 1, 1620582024, 1620582024),
(718, 44, 1, 7, 'Мадам Жоржетт', '', '6:08', 'ArNVPrPCG9d_eaIEKXgq1FsreJ13UBLZ.mp3', 1, 1, 1620582024, 1620582024),
(719, 44, 1, 8, 'Бунтарь', '', '4:13', 'qaTGv6Vg_vsByICHrAlIi6yjZejaUanb.mp3', 1, 1, 1620582025, 1620582025),
(720, 44, 1, 9, 'Тёмный учитель', '', '4:36', 'CEJfFhjJInTIYwj-WGusEnv0YSXOJ_fs.mp3', 1, 1, 1620582025, 1620582025),
(721, 44, 1, 10, 'Король вечного сна', '', '5:03', 'gLGym9C_Hff32aZIT-7ZstOjb3mFUCAx.mp3', 1, 1, 1620582025, 1620582025),
(722, 44, 1, 11, 'Бал лицемеров', '', '3:06', 'a_GlY3aJ-4rymXtzfZnLLCI1Re6zg_QE.mp3', 1, 1, 1620582026, 1620582026),
(723, 44, 1, 12, 'Защитники', '', '3:22', 'PLmuL1SJC8QKrJpUiFfpruhLVXWjge4P.mp3', 1, 1, 1620582026, 1620582026),
(724, 45, 1, 1, 'Добрые Люди (Хор Нищих)', '', '5:16', 'iAS8WnqVyNvYN6vbFxQPuMIWjcQNf4PJ.mp3', 1, 1, 1620582054, 1620582054),
(725, 45, 1, 2, 'Баллада о Бедном Цирюльнике (Ария Бродяги)', '', '3:19', 'fm8py1reGCLX6b8Q4RyAA34rieFDBaxs.mp3', 1, 1, 1620582054, 1620582054),
(726, 45, 1, 3, 'Каторжник (Ария Тодда)', '', '3:23', '9SYgC-HjXRK6L2DKxnP9tVhxl_x95OxM.mp3', 1, 1, 1620582054, 1620582054),
(727, 45, 1, 4, 'Пирожки От Ловетт (Хор Нищих и Бродяг)', '', '3:55', 'TR8MpfeMEGj_lTeeQOdyE0Y-9e97RrnF.mp3', 1, 1, 1620582054, 1620582054),
(728, 45, 1, 5, 'Праздник Крови (Ария Судьи)', '', '3:00', 'xjQXD6MMxTgD8DQhkNT9WaEg4_J7wpRf.mp3', 1, 1, 1620582054, 1620582054),
(729, 45, 1, 6, 'Машина Смерти (Ария Ловетт и Мясника)', '', '3:38', 'wHQILBenCK2IWLB036ErVlLJ7ein0QQZ.mp3', 1, 1, 1620582054, 1620582054),
(730, 45, 1, 7, 'Смертный Приговор (Ария Тодда и Мясника)', '', '3:32', 'WaOov1CbPsqn9KZrjDk3-ZewYCskKD7j.mp3', 1, 1, 1620582054, 1620582054),
(731, 45, 1, 8, 'Признание Ловетт (Ария Ловетт)', '', '3:41', '76Qp721FR6B8rHavKbnRqnPysEXNw_VA.mp3', 1, 1, 1620582054, 1620582054),
(732, 45, 1, 9, 'Первая Кровь (Ария Священника и Тодда)', '', '3:51', 'TywWLY25KkWxDoca5SVsTIXq2UXrhyrd.mp3', 1, 1, 1620582054, 1620582054),
(733, 45, 1, 10, 'Новая Пирожковая (Ария Благородной Толпы)', '', '2:12', 'H2X94v7vnXdw6CQAe8dxXZ_xzA4gzSpo.mp3', 1, 1, 1620582054, 1620582054),
(734, 45, 1, 11, 'Счастье  (Ария Тодда)', '', '3:25', '6MEYW9S73NExDXLHi6GwLp_DsS_TtYPP.mp3', 1, 1, 1620582054, 1620582054),
(735, 46, 1, 1, 'Смерть На Балу (Ария Солиста и Тодда)', '', '4:41', 'RTSDhgIYYJW3YwjmmtwSUpBfK4GuDEia.mp3', 1, 1, 1620582093, 1620582093),
(736, 46, 1, 2, 'Маленький Остров (Ария Ловетт)', '', '2:50', 'iCYAoQcqCbj80DE-gvDlBOTuR86ho8OH.mp3', 1, 1, 1620582093, 1620582093),
(737, 46, 1, 3, 'Неупокоенный (Ария Тодда)', '', '2:46', 'yjkKR9xC9pqY-y_eQ_gNAn-mr6huke8J.mp3', 1, 1, 1620582093, 1620582093),
(738, 46, 1, 4, 'Выход Судьи (Ария Судьи)', '', '4:33', 'XokvHOzLpDHoP17L3Tgn_KnXFqDlX4DZ.mp3', 1, 1, 1620582093, 1620582093),
(739, 46, 1, 5, 'Христова Невеста (Дуэт Элизы и Тодда)', '', '3:51', 'Ros9SRg5dGwb-aLzb7vPQkJ2bXGGZxqk.mp3', 1, 1, 1620582093, 1620582093),
(740, 46, 1, 6, 'Священник Больше Ничего Не Скажет (Ария Тодда)', '', '4:24', 'XuuJrgNSCHHGkgUIJU3vPl5QzQ_24fJA.mp3', 1, 1, 1620582094, 1620582094),
(741, 46, 1, 7, 'Небесный Суд (Дуэт Судьи и Тодда)', '', '4:37', 'M9BieQsC_M4epm2LQnrBZT0G2ik7OiFl.mp3', 1, 1, 1620582094, 1620582094),
(742, 46, 1, 8, 'Почему Ты Жива  (Ария Тодда)', '', '3:04', 'z-p5r9FeeiTlHxnnXy6jIQWg-aoIJp1q.mp3', 1, 1, 1620582094, 1620582094),
(743, 46, 1, 9, 'Смерть Ловетт (Ария Ловетт)', '', '1:34', 'wLxCAGhFyTcvtNAcMGd910uAxlqx47qA.mp3', 1, 1, 1620582094, 1620582094),
(744, 46, 1, 10, 'На Краю (Последния ария Тодда)', '', '4:05', 'CgC4YIahEbgyKNPdgQyhsrY9beXo_Cg6.mp3', 1, 1, 1620582094, 1620582094),
(762, 47, 1, 1, 'Кукла колдуна', '', '3:22', 'kCCPwKURd0Bn32KJ6OajwBKVvTGljX-c.mp3', 1, 1, 1620634719, 1620634719),
(763, 47, 1, 2, 'Наблюдатель', '', '4:43', 'on_UulbCl5Pua35ELygxAjAnCiJE0Lnb.mp3', 1, 1, 1620634719, 1620634719),
(764, 47, 1, 3, 'Бедняжка', '', '4:08', '1bmnYpfL6UgWT_9nhcMEb4EQA2II2Ero.mp3', 1, 1, 1620634719, 1620634719),
(765, 47, 1, 4, 'Прыгну со скалы', '', '3:11', 'TDhVqfvaLpkHDxs75ICplICVV4zK4l_l.mp3', 1, 1, 1620634720, 1620634720),
(766, 47, 1, 5, 'Девушка и Граф', '', '4:31', 'pGNTUgSFRKR0VHc9UrPpaMM0zMirRh3S.mp3', 1, 1, 1620634720, 1620634720),
(767, 47, 1, 6, 'Песня мушкетеров', '', '3:47', 'b67GkHCEOGNrFAA12WwkHfblBkuXLITr.mp3', 1, 1, 1620634720, 1620634720),
(768, 47, 1, 7, 'Тяни!', '', '2:54', 'TPnmELVZ6ytw4n3Ou4ZvzoCPg0SpZIYC.mp3', 1, 1, 1620634720, 1620634720),
(769, 47, 1, 8, 'Утренний рассвет', '', '2:27', 'yUcr1IAHoRxOOPfHfUUBksr_uEARWxep.mp3', 1, 1, 1620634720, 1620634720),
(770, 47, 1, 9, 'Сосиска', '', '2:10', 'Hw6mpodm71yEsmbvnu_B8SbEF9_jv44R.mp3', 1, 1, 1620634720, 1620634720),
(771, 47, 1, 10, 'Карапуз', '', '2:32', '3d0O2joN86MCU6lkDYpACWrQ9nmLYBap.mp3', 1, 1, 1620634720, 1620634720),
(772, 47, 1, 11, 'Спятил отец', '', '3:28', '_luHKgbC6uTv5qyT074rYTs8Kuq81RFV.mp3', 1, 1, 1620634720, 1620634720),
(773, 47, 1, 12, 'Ведьма и Осел', '', '2:55', '9_DBN-N9fkD_JNXeQbL2QM2Rq9Kz4dMq.mp3', 1, 1, 1620634720, 1620634720),
(774, 47, 1, 13, 'Екатерина', '', '2:11', 'gnfiWzTnakxN7FlXWqfBDckoLgrEo9iu.mp3', 1, 1, 1620634720, 1620634720),
(775, 47, 1, 14, 'Прерванная любовь, или Арбузная корка', '', '2:56', '9unQ_w26MOraxszqnS9XMKv1zcOWPE-r.mp3', 1, 1, 1620634720, 1620634720),
(776, 47, 1, 15, 'Мотоцикл', '', '2:08', 'X2LMPugNroJDtbDuf3H1BXd4QDFJQur1.mp3', 1, 1, 1620634720, 1620634720),
(777, 47, 1, 16, 'Голые коки', '', '2:37', 'd4d8EPzZNb991f1cOdbcBDGMN-sZwYpm.mp3', 1, 1, 1620634720, 1620634720),
(778, 47, 1, 17, 'Забытые ботинки', '', '2:46', 'mXr0Zxc6CqWT06yd9LoiQ9K2c1Hs1f3V.mp3', 1, 1, 1620634721, 1620634721),
(779, 48, 1, 1, 'Wollt Ihr Das Bett In Flammen Sehen?', '', '5:17', 'CfhgA_qyDOpbqz9Zz-E2zLwlWGRSPhI_.mp3', 1, 1, 1621103006, 1621103006),
(780, 48, 1, 2, 'Der Meister', '', '4:11', 'oc657fzPH33xt6xfqDBY9yo0ZLN9iIIm.mp3', 1, 1, 1621103006, 1621103006),
(781, 48, 1, 3, 'Weißes Fleisch', '', '3:36', 'CmOdVOAGW8-sCtrgFwyqmLE3d6krKYso.mp3', 1, 1, 1621103007, 1621103007),
(782, 48, 1, 4, 'Asche Zu Asche', '', '3:52', 'PE6Teoijxam6oCnPLfgGGr5q6IdKUiJi.mp3', 1, 1, 1621103007, 1621103007),
(783, 48, 1, 5, 'Seemann', '', '4:48', 'PX_W9rbC-trY4qYEhjawJs6HMVt_iz4X.mp3', 1, 1, 1621103007, 1621103007),
(784, 48, 1, 6, 'Du Riechst So Gut', '', '4:49', 'XFPZD-EamNkkRfAB4zD_L5zVBgW_aCC8.mp3', 1, 1, 1621103007, 1621103007),
(785, 48, 1, 7, 'Das Alte Leid', '', '5:45', 'xxTzA_mVXLGxpzTyXAoFWGeXfbJ7j68b.mp3', 1, 1, 1621103007, 1621103007),
(786, 48, 1, 8, 'Heirate Mich', '', '4:45', 'F-JvHX8oy81VxvVpjL5F-ALhlxHlVbIx.mp3', 1, 1, 1621103007, 1621103007),
(787, 48, 1, 9, 'Herzeleid', '', '3:43', 'Sr3CzyfHHGBkNAKoXxAbrkkU-MeuLrtH.mp3', 1, 1, 1621103007, 1621103007),
(788, 48, 1, 10, 'Laichzeit', '', '4:23', 'Fy8A2Up_MCUqMDSiW_h5xHmqg57sbxMq.mp3', 1, 1, 1621103007, 1621103007),
(789, 48, 1, 11, 'Rammstein', '', '4:25', 'Vfpg5roL_NxEoljvM52cD8Ii0iIuyRD9.mp3', 1, 1, 1621103007, 1621103007),
(791, 49, 1, 1, 'Sehnsucht', '', '4:06', '9OKb85Fz9KMo-7Kg6DVKUIRaNIG2kRI5.mp3', 1, 1, 1621103063, 1621103063),
(792, 49, 1, 2, 'Engel', '', '4:26', 'jwhSNugpgsAeOspZZlc9eAZ4nZo1D_fZ.mp3', 1, 1, 1621103063, 1621103063),
(795, 49, 1, 3, 'Tier', '', '3:48', 'HxQAvBsOiRvsupzalljSZQIMMp0onSDI.mp3', 1, 1, 1621103063, 1621103063),
(796, 49, 1, 4, 'Bestrafe Mich', '', '3:38', 'rSnucJ_oMkVn7w0YXxoXijHXVFozrVq0.mp3', 1, 1, 1621103063, 1621103063),
(798, 49, 1, 5, 'Du Hast', '', '3:56', 'W-AxxtTUipgqbaFh8BMiqECQx1xD8utT.mp3', 1, 1, 1621103063, 1621103063),
(801, 49, 1, 6, 'Bück Dich', '', '3:23', 'AgQYNss-l00wt3DKzH1VMfiyHGlA9r3-.mp3', 1, 1, 1621103064, 1621103064),
(802, 49, 1, 7, 'Spiel Mit Mir', '', '4:47', 'rg3VfzXA0o8y6cwr927AreqDq-WhAMM5.mp3', 1, 1, 1621103064, 1621103064),
(803, 49, 1, 8, 'Klavier', '', '4:24', 'borfFreC--peRCdwduiGeDz8yNKbghKn.mp3', 1, 1, 1621103064, 1621103064),
(804, 49, 1, 9, 'Alter Mann', '', '4:24', 'g6Hs3qQca_Oqe3Hujjr2d4nRxSSoZtRB.mp3', 1, 1, 1621103064, 1621103064),
(805, 49, 1, 10, 'Eifersucht', '', '3:37', 'OgYFvqxPPGifEE6ibb6cTxF7gGS_zNQT.mp3', 1, 1, 1621103064, 1621103064),
(806, 49, 1, 11, 'Küss Mich (Fellfrosch)', '', '3:32', 'mVhZqwGb9QBPrlxklW6esIZdqy8FTnIC.mp3', 1, 1, 1621103064, 1621103064),
(807, 49, 1, 12, 'Stripped', 'Bonus Track', '4:45', 'jP6fj3lngeVQLiTeCTev9k7oITK9gMLe.mp3', 1, 1, 1621103064, 1621103193),
(808, 50, 1, 1, 'Mein Herz Brennt', '', '4:40', '-JBPTHiInRbGvaX3YW6r7nzriWtHepQ1.mp3', 1, 1, 1621103607, 1621103607),
(809, 50, 1, 2, 'Links 2-3-4', '', '3:37', 'ZQauh07wH-XpKTJC58uoAUEAft43UbBK.mp3', 1, 1, 1621103607, 1621103607),
(810, 50, 1, 3, 'Sonne', '', '4:33', '2bUHuMdbeNdn4qWCLQyMk6iQO5iyn8XM.mp3', 1, 1, 1621103607, 1621103607),
(811, 50, 1, 4, 'Ich Will', '', '3:38', 'Vw3YpRsOOaREZjkZ_Yu_UisxQ-2Lh8MV.mp3', 1, 1, 1621103607, 1621103607),
(812, 50, 1, 5, 'Feuer Frei!', '', '3:12', 'pMsIP3nPNtV-UUuQkb05mC1n2Ve4oOmB.mp3', 1, 1, 1621103607, 1621103607),
(813, 50, 1, 6, 'Mutter', '', '4:33', 'qBwQKpuqKTNho0tcw81XilaUqV5XG1-A.mp3', 1, 1, 1621103607, 1621103607),
(814, 50, 1, 7, 'Spieluhr', '', '4:46', 'uZjjx2K5tC4zSQ3grPOVkrErcsw8J_iC.mp3', 1, 1, 1621103607, 1621103607),
(815, 50, 1, 8, 'Zwitter', '', '4:18', 'a01-GAoi6rZc7NznTlkUfoTqe7gJRCb8.mp3', 1, 1, 1621103607, 1621103607),
(816, 50, 1, 9, 'Rein Raus', '', '3:10', '-UxC_aZjtXvU_r-OSqBjw4tFXgieOKrx.mp3', 1, 1, 1621103607, 1621103607),
(817, 50, 1, 10, 'Adios', '', '3:50', 'FBq8tVUxhjH_56IW2ugQ4aMnUqWUcCyw.mp3', 1, 1, 1621103607, 1621103607),
(818, 50, 1, 11, 'Nebel', '', '4:55', 'eK6Lsiv0KAuBx6MCHUlBUSmtdCKDdLt3.mp3', 1, 1, 1621103608, 1621103608),
(819, 51, 1, 0, 'Hidden Intro *', '', '0:36', '162R0XmbOdPBiepG_8jY0X54wdKKTams.mp3', 1, 1, 1621103804, 1621103804),
(820, 51, 1, 1, 'Reise, Reise', '', '4:12', 'y_YZhublxcuJeFmrQcG1TBy_fsgURKrt.mp3', 1, 1, 1621103804, 1621103804),
(821, 51, 1, 2, 'Mein Teil', '', '4:32', 'yvEuSuBRrXfHuUjG1XduYm7zbflY86pC.mp3', 1, 1, 1621103804, 1621103804),
(822, 51, 1, 3, 'Dalai Lama', '', '5:39', 'uMQupAhnZ5ufR9ZMLyyhP0SKq3EyUdzr.mp3', 1, 1, 1621103804, 1621103804),
(823, 51, 1, 4, 'Keine Lust', '', '3:43', 'QhSjT81UtwX6CeDN3i-bvpbtZQO_JE3f.mp3', 1, 1, 1621103804, 1621103804),
(824, 51, 1, 5, 'Los', '', '4:25', 'AW1IvExute-c7qVt36cq-2qJW9a5owZ6.mp3', 1, 1, 1621103804, 1621103804),
(825, 51, 1, 6, 'Amerika', '', '3:47', 'rhM7XahuTkUXcjXPTVin6xHlIiHRJNh2.mp3', 1, 1, 1621103804, 1621103804),
(826, 51, 1, 7, 'Moskau', '', '4:16', '_NTQQlhI_ycU2ZJ2MM9rztxJAiN_cJ9R.mp3', 1, 1, 1621103805, 1621103805),
(827, 51, 1, 8, 'Morgenstern', '', '4:00', 'tQHKeseXojhFt7y82syfKbLayIRSAD0U.mp3', 1, 1, 1621103805, 1621103805),
(828, 51, 1, 9, 'Stein Um Stein', '', '3:56', 'EtD1ltozC44qxX7rMer-Y96SQ75R3Sgz.mp3', 1, 1, 1621103805, 1621103805),
(829, 51, 1, 10, 'Ohne Dich', '', '4:32', 'g_mrmCxgHgmuL7DjcbygCPTo2cqWmSDi.mp3', 1, 1, 1621103805, 1621103805),
(830, 51, 1, 11, 'Amour', '', '4:54', 'po47GHF4qWf17n_KZgop2u2d-g_-uhPw.mp3', 1, 1, 1621103805, 1621103805),
(831, 51, 1, 12, 'Mein Teil (You Are What You Eat Edit) *', '', '4:07', 'Ln-ATSc5MRNKysD-mCxpk-EsLOY0KCn8.mp3', 1, 1, 1621103805, 1621103805),
(832, 51, 1, 13, 'Amerika *', 'Digital Hardcore Mix', '3:50', 'Wipy3md1n8r-82TWu-5czAkfopTpdTLG.mp3', 1, 1, 1621103805, 1621980591),
(833, 52, 1, 1, 'Benzin', '', '3:46', 'cVfEzw8JEklE0CI5OWXK5cG02fVJUJ9C.mp3', 1, 1, 1621103842, 1621103842),
(834, 52, 1, 2, 'Mann Gegen Mann', '', '3:51', 'D0Krst7Nt2E9HIjJNm7PFblqmAxKl6Oq.mp3', 1, 1, 1621103842, 1621103842),
(835, 52, 1, 3, 'Rosenrot', '', '3:55', 'hvhdE7vJFifAparIJ06k2SfNo1BhjsiI.mp3', 1, 1, 1621103842, 1621103842),
(836, 52, 1, 4, 'Spring', '', '5:25', 'xKdOCwg4q8gXDdGch3WMFNsGc14AzNKM.mp3', 1, 1, 1621103842, 1621103842),
(837, 52, 1, 5, 'Wo Bist Du?', '', '3:55', 'EgSJNHgEnwCRiytZc-9e0jrJx_qaHRZD.mp3', 1, 1, 1621103842, 1621103842),
(838, 52, 1, 6, 'Stirb Nicht Vor Mir (Don\'t Die Before I Do)', '', '4:05', 'eouW9SzWcITfyrGgTFHCiX9PIDrAq9_i.mp3', 1, 1, 1621103842, 1621103842),
(839, 52, 1, 7, 'Zerstören', '', '5:29', 'l24q6xXdeFl8KjYIj0mPmT_oKAl8Ez-q.mp3', 1, 1, 1621103842, 1621103842),
(840, 52, 1, 8, 'Hilf Mir', '', '4:44', 'nGnEDaRJHJy-xTahcrGWjjP7LkEOFIcV.mp3', 1, 1, 1621103842, 1621103842),
(841, 52, 1, 9, 'Te Quiero Puta!', '', '3:56', 'Hrp47FKP5nwEyM9wPRGtPrj1eXAeBCUV.mp3', 1, 1, 1621103843, 1621103843),
(842, 52, 1, 10, 'Feuer Und Wasser', '', '5:18', 'prZnnpwu9y6l-o-keM2XrRVNJQrnSfHU.mp3', 1, 1, 1621103843, 1621103843),
(843, 52, 1, 11, 'Ein Lied', '', '3:44', 'eZwetyfAUasg-t9K07_5R6ckziBO-gVp.mp3', 1, 1, 1621103843, 1621103843),
(844, 53, 1, 1, 'Rammlied', '', '5:19', '-_OixCgIJdBll7EtFUycWQj6b4GaGUnY.mp3', 1, 1, 1621103893, 1621103893),
(845, 53, 1, 2, 'Ich Tu Dir Weh', '', '5:02', 'O_fPbfd1w3kCC4FB0x6aBFZ0yJZ3Wt0i.mp3', 1, 1, 1621103893, 1621103893),
(846, 53, 1, 3, 'Waidmanns Heil', '', '3:33', 'y8ONjBFPkTVTgZ00S_mUyPpTLQjhgwV1.mp3', 1, 1, 1621103893, 1621103893),
(847, 53, 1, 4, 'Haifisch', '', '3:45', 'cl9orBEd9pZ_ExqJ5m8d36jTvzyzd3rt.mp3', 1, 1, 1621103893, 1621103893),
(848, 53, 1, 5, 'B********', '', '4:14', 'HkAJhSKS-wwX7usngBKnUd456KfRo8HC.mp3', 1, 1, 1621103893, 1621103893),
(849, 53, 1, 6, 'Frühling In Paris', '', '4:45', 'c7TtGei4cS1xpRJGYAC1HxFhO_qV0hxa.mp3', 1, 1, 1621103893, 1621103893),
(850, 53, 1, 7, 'Wiener Blut', '', '3:52', 'EsM2R3_D1plcE1IsnmEpkiuLl7pj5XCm.mp3', 1, 1, 1621103894, 1621103894),
(851, 53, 1, 8, 'Pussy', '', '3:59', 'iVsL1ie-1y7SfLn4CFs4qaYCpit-qKIL.mp3', 1, 1, 1621103894, 1621103894),
(852, 53, 1, 9, 'Liebe Ist Für Alle Da', '', '3:28', 'H487YdhVK-O6f6ydVBudpTosxuZK7Nkc.mp3', 1, 1, 1621103894, 1621103894),
(853, 53, 1, 10, 'Mehr', '', '4:11', 'kHh6rdV15SAOpA7S7uJu3LFW8UCmMVkw.mp3', 1, 1, 1621103894, 1621103894),
(854, 53, 1, 11, 'Roter Sand', '', '3:59', '-C-vlkDAgosMBrH4XqQHc44C-dzFmoys.mp3', 1, 1, 1621103894, 1621103894),
(855, 53, 2, 1, 'Führe Mich *', '', '4:33', 'bbKOTtoq2js_2NRIEinBJ1l49AmEFAoX.mp3', 1, 1, 1621103894, 1621104063),
(856, 53, 2, 2, 'Donaukinder *', '', '5:18', 'oC5cvZHm3ggqZHwzcHRpEYlmKRtoYmvm.mp3', 1, 1, 1621103894, 1621104066),
(857, 53, 2, 3, 'Halt *', '', '4:21', 'lGWoZ2q1wKpNWnYDGM0B3GoF0SqKdUwj.mp3', 1, 1, 1621103894, 1621104068),
(858, 53, 2, 4, 'Roter Sand *', 'Orchestral Version', '4:08', '5ybsijawgBto-03zF4NDg6gN8rTdJvAi.mp3', 1, 1, 1621103894, 1621980608),
(859, 53, 2, 5, 'Liese *', '', '3:56', 'lPGYMhrSQPuzEMDRfUftPhVHtjJFWJue.mp3', 1, 1, 1621103895, 1621104073),
(860, 54, 1, 1, 'Deutschland', '', '5:23', 'EDExY9kRkuAtVDpHZcXrJ6IBA_XSs9mD.mp3', 1, 1, 1621103939, 1621103939),
(861, 54, 1, 2, 'Radio', '', '4:37', '-KAp8UcejVcsDjCh8D2dgb1DpLQhCEpU.mp3', 1, 1, 1621103939, 1621103939),
(862, 54, 1, 3, 'Zeig Dich', '', '4:16', '5hArWxghVAw_2sW6X_OBVjJL4YOIGiWh.mp3', 1, 1, 1621103939, 1621103939),
(863, 54, 1, 4, 'Ausländer', '', '3:52', 'IZf3i5yajG5YIXppugxtkU_fHKtQOJad.mp3', 1, 1, 1621103939, 1621103939),
(864, 54, 1, 5, 'Sex', '', '3:57', 'sEZ5F2JQUe6eZu1TRaTwp8-aV-VNeigP.mp3', 1, 1, 1621103939, 1621103939),
(865, 54, 1, 6, 'Puppe', '', '4:34', 'tckfoBYNPi9NInPsxsF26ynxNlJZMZMn.mp3', 1, 1, 1621103940, 1621103940),
(866, 54, 1, 7, 'Was Ich Liebe', '', '4:29', '8Ib4Ff4FVHBJ11-U6TIYjnaJvYDeY5Ze.mp3', 1, 1, 1621103940, 1621103940),
(867, 54, 1, 8, 'Diamant', '', '2:34', 'Iq96ZSWBQES2R664rgdoVENwZLgkJhtP.mp3', 1, 1, 1621103940, 1621103940),
(868, 54, 1, 9, 'Weit Weg', '', '4:21', 'p5sktI-1iK45xx4T2oiucaweUEyWJ1ub.mp3', 1, 1, 1621103940, 1621103940),
(869, 54, 1, 10, 'Tattoo', '', '4:12', 'svTa6HdNdh_jvxtEckEzO4jQP8ONim-i.mp3', 1, 1, 1621103940, 1621103940),
(870, 54, 1, 11, 'Hallomann', '', '4:12', 'Diq2N5HY5_95VDfnZ-iYCDDfzTG650c8.mp3', 1, 1, 1621103940, 1621103940),
(871, 55, 1, 1, 'Жертва талого льда', '', '6:01', 'NmdMbFij9tbNkiK-ENWaYm3rGm0O7IOb.mp3', 1, 1, 1621976158, 1621976158),
(872, 55, 1, 2, 'Холодные зимы', '', '1:31', 'T4dLOn91VhD3JKNE_uvlCD5SjeJSL95z.mp3', 1, 1, 1621976158, 1621976158),
(873, 55, 1, 3, 'Мне сказали слово', '', '3:08', 'nMeAgyqDYCgMG8puYfmbZbNaEsJGobe2.mp3', 1, 1, 1621976158, 1621976158),
(874, 55, 1, 4, 'Под сурдинку', '', '3:27', '8BjQKr53_hxZH5eKBuC10GwDqnGofSIF.mp3', 1, 1, 1621976158, 1621976158),
(875, 55, 1, 5, 'Гроза', '', '3:44', 'kGFubGlGLMPqPqkMx-maazGslfEe3LIN.mp3', 1, 1, 1621976158, 1621976158),
(876, 55, 1, 6, 'Война', '', '2:31', 'BSC_YZjsUiagCGkp4w7K5XkI2OwQWXJx.mp3', 1, 1, 1621976158, 1621976158),
(877, 55, 1, 7, 'Пыльная быль', '', '5:20', 'VJlq4MaVmK1p7GvabHprzHdYTvuXM57N.mp3', 1, 1, 1621976158, 1621976158),
(878, 55, 1, 8, 'Серебряные реки', '', '2:53', 'cJ8guHnYYJbiVqWh_Vs1AmNJISLOMUKm.mp3', 1, 1, 1621976159, 1621976159),
(879, 55, 1, 9, 'Твое разбитое пенсне', '', '1:23', 'JTwKT9aAu_ZwevYEN7tLTVUk6Bj1DgGm.mp3', 1, 1, 1621976159, 1621976159),
(880, 55, 1, 10, 'Сказочный леший', '', '1:42', 'QXvmKCLPROBcMo4V7Vc0Apa1aDPrKRNp.mp3', 1, 1, 1621976159, 1621976159),
(881, 55, 1, 11, 'Санкт-петербургское небо', '', '2:30', 'GOCY_4zM7RVChlzeywthI133Ec1dEh5R.mp3', 1, 1, 1621976159, 1621976159),
(882, 55, 1, 12, 'Звери', '', '2:36', 'DRokc6csjebq-RLA4taGzvCC79y2CCWN.mp3', 1, 1, 1621976159, 1621976159),
(883, 55, 1, 13, 'Рыба без трусов', '', '3:05', '_6emqkwki_cPCQX2Hz2kIcgAKSRbjoBB.mp3', 1, 1, 1621976159, 1621976159),
(884, 56, 1, 1, 'Будь моей тенью', '', '5:44', 'qsdZ24ziAkZTMD-SzFdvzDDL68o7I2so.mp3', 1, 1, 1621976241, 1621976241),
(885, 56, 1, 2, 'Любовь идет по проводам', '', '4:26', 'A1ATTL7XWsUFTZhv7i_Rs2RYyrwSRuNe.mp3', 1, 1, 1621976241, 1621976241),
(886, 56, 1, 3, 'Черный цвет солнца', '', '7:50', 'tOwWbfRyyxvcGQyvzJqcwr3SHF2dgXdC.mp3', 1, 1, 1621976241, 1621976241),
(887, 56, 1, 4, 'Самовар', '', '5:33', 'TwfiV_IIL85Krabh76H0ap89ROW1l_Vo.mp3', 1, 1, 1621976241, 1621976241),
(888, 56, 1, 5, 'Жертва талого льда', '', '5:48', 'PlAdLichFwQ8WJiXIqZ0V38-TKFNhLSr.mp3', 1, 1, 1621976241, 1621976241),
(889, 56, 1, 6, 'Что ты будешь делать', '', '5:12', 'nVE6IyhHFtU6aEGs44QKI1Cg3uprC2Cc.mp3', 1, 1, 1621976242, 1621976242),
(890, 56, 1, 7, 'Рыба без трусов', '', '3:12', 'fZnyxdttmeZOl3zVL-8lk9SPQgi8Xu6n.mp3', 1, 1, 1621976242, 1621976242),
(891, 56, 1, 8, 'Сказка', '', '5:38', 'XEUS0TOP9iYzgNuPz1NBU8tgZr6yWoUT.mp3', 1, 1, 1621976242, 1621976242),
(892, 56, 1, 9, 'Нечего делать внутри', '', '3:28', 'x_RNQOo82jgpHNVqBvnW2iH_aHoL1bzd.mp3', 1, 1, 1621976242, 1621976242),
(893, 56, 1, 10, 'Иди через лес', '', '6:32', 'C05xviHgz3taOz8HR4DfjB5w1A1mhBik.mp3', 1, 1, 1621976242, 1621976242),
(894, 57, 1, 1, 'Молитва', '', '0:32', 'edXfxmx3Kk3RHJmtpin4OX1AznJr6is6.mp3', 1, 1, 1621976308, 1621976308),
(895, 57, 1, 2, 'Я не хочу домой', '', '3:49', 'YNpfizurcyO1KNYwt4OPMNpnzG6XQ4hB.mp3', 1, 1, 1621976308, 1621976308),
(896, 57, 1, 3, 'Бонни и Клайд', '', '2:41', 'HM94H5cyZoP6NbbvY0kMsUiN9dnZgzYy.mp3', 1, 1, 1621976308, 1621976308),
(897, 57, 1, 4, 'Три цвета', '', '4:40', '5-DoBLQYuwa23GnvGIGMLnqtj7aBlEuI.mp3', 1, 1, 1621976308, 1621976308),
(898, 57, 1, 5, 'Невский проспект', '', '5:13', 's3DPxoKlJRv0gSRdA4mQQ2p50rli5cqz.mp3', 1, 1, 1621976308, 1621976308),
(899, 57, 1, 6, 'Спи в заброшенном доме', '', '4:17', 'uMfH1vv88pF_veGqdEKYlMSmRGRWYPNh.mp3', 1, 1, 1621976308, 1621976308),
(900, 57, 1, 7, 'Прирожденный убийца', '', '3:21', 'Rxs4OT_FR7XdWSKj7NrZdXGcw8YX4BPq.mp3', 1, 1, 1621976308, 1621976308),
(901, 57, 1, 8, 'Частушки', '', '4:44', 'yX6x3MlGg7TgHQidCmPI23NYPwNE8Tqu.mp3', 1, 1, 1621976308, 1621976308),
(902, 57, 1, 9, 'Моя любовь', '', '3:37', 'GdrUMvyS2SiJQi-lhNRQkiyvXbWvW8_q.mp3', 1, 1, 1621976308, 1621976308),
(903, 57, 1, 10, 'Англо-русский словарь', '', '4:36', 'We2mnSoXqUwit_zoq5MIUpMmOz-_z9Ax.mp3', 1, 1, 1621976308, 1621976308),
(904, 57, 1, 11, 'Скоро будет солнечно', '', '4:42', '16MWU9GqFsKuXEkupukR8lcoXr6nN8yG.mp3', 1, 1, 1621976309, 1621976309),
(905, 57, 1, 12, 'За стеной', '', '1:28', '8rP-E2dbnfg9DH1pijFE5Qp0JoM5h2kd.mp3', 1, 1, 1621976309, 1621976309),
(906, 58, 1, 1, 'Весь этот бред', '', '3:07', 'goEIeaWDcvxjopQj5alpNnK8U0EKyUQv.mp3', 1, 1, 1621976362, 1621976362),
(907, 58, 1, 2, 'Достань гранату', '', '4:11', 'lfvauX6JU9fEDmEvC8qsy1gUFMA2TrTk.mp3', 1, 1, 1621976362, 1621976362),
(908, 58, 1, 3, 'Орбит без сахара', '', '2:18', 'mxmYbjUBn04dH5-rcgXU6xIuyjmfWvNJ.mp3', 1, 1, 1621976362, 1621976362),
(909, 58, 1, 4, 'Приходи', '', '4:03', 'Yvr3R3EjJFZuabVbnZ2ezo_hrkr_Jj7I.mp3', 1, 1, 1621976362, 1621976362),
(910, 58, 1, 5, 'Свет горел всю ночь', '', '2:31', 'n1RY-FkItGmOpaDZTk37HN2sDWU09pGk.mp3', 1, 1, 1621976362, 1621976362),
(911, 58, 1, 6, 'Люся сидит дома', '', '3:57', 'flhZgK_vCHL_LqgVvW-Dtmv23cpH6jpb.mp3', 1, 1, 1621976362, 1621976362),
(912, 58, 1, 7, 'Бог устал нас любить', '', '2:32', '5k0jAJ3Jga4r_u66ERRtWI0KgDNoiHYc.mp3', 1, 1, 1621976362, 1621976362),
(913, 58, 1, 8, 'Катись, колесо!', '', '2:47', 'NyT4tTZfhWMTw_004eSOfIV_nLtSzyLV.mp3', 1, 1, 1621976362, 1621976362),
(914, 58, 1, 9, 'Выхода нет', '', '3:48', 'hqJzJGj-mIG85OJ-C5i30NqN593x8aYT.mp3', 1, 1, 1621976362, 1621976362),
(915, 58, 1, 10, 'Коктейли третьей мировой', '', '2:52', 'N0usbYKcjAMZ5aJ_UfyeseiX-D6KbF7x.mp3', 1, 1, 1621976362, 1621976362),
(916, 58, 1, 11, 'Джим', '', '2:47', 'ltIet1T9Gx-DyVWGT1lYUCsDqi7Xd-LO.mp3', 1, 1, 1621976363, 1621976363),
(917, 58, 1, 12, 'Мария и Хуана', '', '8:04', '_fxlLsmn01wqO8e80CXgZC-GUAmV3QwD.mp3', 1, 1, 1621976363, 1621976363),
(918, 58, 1, 13, 'Подводная лодка', '', '3:44', 'oCBGl1uX7NzCCW46BDm57KvTwMEa7Vk9.mp3', 1, 1, 1621976363, 1621976363),
(919, 59, 1, 1, 'Альтависта', '', '6:06', 'BQyJtA48DZA1_XLJxcZjG-ebx4jAgWuQ.mp3', 1, 1, 1621976562, 1621976562),
(920, 59, 1, 2, 'Молоко и Мёд', '', '4:39', 'RDZsYXI2w7MLaBP_hlyVZRdfPaV26J05.mp3', 1, 1, 1621976562, 1621976562),
(921, 59, 1, 3, 'Пил-Курил', '', '4:54', 'CK6Z0D5RVtOA56z7g_lA9-GVxrDfpUT4.mp3', 1, 1, 1621976562, 1621976562),
(922, 59, 1, 4, 'Терпсихора', '', '2:47', 'jStR0WGcOrdO7GX9VOsXc2L3m9DO9f24.mp3', 1, 1, 1621976562, 1621976562),
(923, 59, 1, 5, 'Далеко Домой', '', '3:57', 'J5EosZT2EAHExX-iRiXAeYg_DR-3LbS7.mp3', 1, 1, 1621976562, 1621976562),
(924, 59, 1, 6, 'Абсент', '', '1:55', 'NGg8zrB5CrHcmBduI_FTOmPBR-2MBys_.mp3', 1, 1, 1621976562, 1621976562),
(925, 59, 1, 7, 'Добрых Дел Мастер', '', '4:55', 'zixlQgRL5h-Bhbl1Zt4wphKa5gJ7E5it.mp3', 1, 1, 1621976562, 1621976562),
(926, 59, 1, 8, 'Мотоциклетная Цепь', '', '4:15', 'TB-XiK3aACtCsHnIzpjrWu5_x7dM4D0V.mp3', 1, 1, 1621976562, 1621976562),
(927, 59, 1, 9, 'Сумасшедший Автобус', '', '3:50', '3h7N9zr2cU6Su30Wu08zfhn7VhOSxQ3u.mp3', 1, 1, 1621976562, 1621976562),
(928, 59, 1, 10, 'Алкоголь', '', '5:25', 'tPiv_rsgnzeAFpuz57AQQSj0M39QfxZu.mp3', 1, 1, 1621976562, 1621976562),
(929, 59, 1, 11, 'Встретимся Завтра', '', '4:27', 'clgxOXBtpOH4RVYaVrhLjP7oSEElss2q.mp3', 1, 1, 1621976563, 1621976563),
(930, 60, 1, 1, 'Линия жизни', '', '3:02', 'XPFUra_yZgtFc7VeEg8SIAgrVmD6ZM-c.mp3', 1, 1, 1621976605, 1621976605),
(931, 60, 1, 2, 'Звезда рок-н-ролла', '', '4:12', 'R0kbA18J-wJuYb-B7u9C1ADNIfroHu9c.mp3', 1, 1, 1621976605, 1621976605),
(932, 60, 1, 3, 'Всего хорошего', '', '3:01', 'ja_GPdNTMdcE8qSKIGUMfWwv0SigCvA6.mp3', 1, 1, 1621976605, 1621976605),
(933, 60, 1, 4, 'Моё сердце', '', '4:10', 'gUsTsFtZtN1Vy5A6wnM2pd7JejucFj8R.mp3', 1, 1, 1621976605, 1621976605),
(934, 60, 1, 5, 'Рики-Тики-Тави', '', '2:00', 'eElSfgCfFsm5Y8reYLJoRPYIxXebH29d.mp3', 1, 1, 1621976605, 1621976605),
(935, 60, 1, 6, 'SOS!', '', '4:29', 'vhWpHGxZcE3mvGSbYuMoJwh4-xsAWmjH.mp3', 1, 1, 1621976605, 1621976605),
(936, 60, 1, 7, 'Феллини', '', '4:47', 'sMa6Gfmqb0bqMYuCTkQHaugQhe_PXttq.mp3', 1, 1, 1621976605, 1621976605),
(937, 60, 1, 8, 'Остаёмся зимовать', '', '3:40', 'NyoZbgiKjyqNZJdj2vOQJU7VkwYCi62P.mp3', 1, 1, 1621976606, 1621976606),
(938, 60, 1, 9, 'Тебе это снится', '', '4:59', 'xQc6zd4pmUGk2zjRTUB_06daiyrT7yKH.mp3', 1, 1, 1621976606, 1621976606),
(939, 60, 1, 10, 'Совсем другой', '', '2:11', 'BDA5_R1-RRp5OGAAn7cScgQ0DN27nstm.mp3', 1, 1, 1621976606, 1621976606),
(940, 60, 1, 11, 'Пластмассовая жизнь', '', '2:28', 'hMblJeS3xTKleRoKQhR6xSMkRsT6FeKg.mp3', 1, 1, 1621976606, 1621976606),
(941, 60, 1, 12, 'Пой мне ещё', '', '3:58', 'agAc6lDKS46H8LEdjRJbL0wULoif7ydr.mp3', 1, 1, 1621976606, 1621976606),
(942, 60, 1, 13, 'Ленинград-Amsterdam', '', '2:37', 'WOKYsKFVOvXpo5Qlr6eTJjX5g1pzrxoT.mp3', 1, 1, 1621976606, 1621976606),
(943, 60, 1, 14, 'Fine', '', '0:35', 'iyN_AWx4zCNvVyzX39i5bsvLFr4JlWUm.mp3', 1, 1, 1621976606, 1621976606),
(944, 61, 1, 1, 'Новые люди', '', '3:47', '_23XAmLYmhKZjD9lR59OVUf_11Y5Lh6c.mp3', 1, 1, 1621976641, 1621976641),
(945, 61, 1, 2, 'Время, назад!', '', '4:13', 'e5Vea24Z890MGl4cZp41XLKjqZfzSTC5.mp3', 1, 1, 1621976641, 1621976641),
(946, 61, 1, 3, 'Гандбол', '', '2:36', 'dO2Q3oDB1xnZDC4bBuefFT30f9BNJnwK.mp3', 1, 1, 1621976641, 1621976641),
(947, 61, 1, 4, 'Сломано все', '', '4:17', '74CIvilaJ3ffPuQKL-OuB99VZprgzNc9.mp3', 1, 1, 1621976641, 1621976641),
(948, 61, 1, 5, 'Девятиэтажный дом', '', '4:31', 'i9sbW-srMGde9zGbEiRy5juraZ3nUqiY.mp3', 1, 1, 1621976641, 1621976641),
(949, 61, 1, 6, 'Блокада', '', '3:23', 'XY0s_ukoGYEzYzpZveSsiVffU0Gj_7wr.mp3', 1, 1, 1621976642, 1621976642),
(950, 61, 1, 7, 'Валдай', '', '4:29', 'Sk3IDedKQundzoxgvmoeqSr_Toy2isPK.mp3', 1, 1, 1621976642, 1621976642),
(951, 61, 1, 8, 'Йог спокоен', '', '2:58', 'ei9s52SC6fKtcV2gn81y3tt1npUCw1Mj.mp3', 1, 1, 1621976642, 1621976642),
(952, 61, 1, 9, 'Северо-Запад', '', '3:55', 'HnIqiYkr0TJQ8ZuaOOzuk3um_th9t-HL.mp3', 1, 1, 1621976642, 1621976642),
(953, 61, 1, 10, 'РЭП', '', '3:15', 'RxtpdyWU_RkFnQjYrYOCzuoLlcR54zEd.mp3', 1, 1, 1621976642, 1621976642),
(954, 61, 1, 11, 'Альтависта', '', '4:08', 'TqitU_GBDdVaLXXZFCzeCE5_EBCli47g.mp3', 1, 1, 1621976642, 1621976642),
(955, 62, 1, 1, 'Океан', '', '0:36', '6Seht0vzzpxCjiEeL7Y-LuKildwWJT9Y.mp3', 1, 1, 1621976710, 1621976710),
(956, 62, 1, 2, 'Семь Восьмых', '', '4:22', 'F_xYljI-VT6NvrYhpqdAnBB9kygWgtY0.mp3', 1, 1, 1621976710, 1621976710),
(957, 62, 1, 3, 'Шато Марго', '', '3:55', 'bPpGayGNjmf7y3WVTXLnBY2nuS2AbREj.mp3', 1, 1, 1621976710, 1621976710),
(958, 62, 1, 4, 'Мы сидели и курили', '', '3:18', 'ZjtS1mDWnquTlCUZdBvSeDRwdPHLz3fj.mp3', 1, 1, 1621976710, 1621976710),
(959, 62, 1, 5, 'Сиануквиль', '', '2:32', '4RKMMK_CYggeO6oHdu1Ch6QEu_qL8vJw.mp3', 1, 1, 1621976710, 1621976710),
(960, 62, 1, 6, 'Человек и Дерево', '', '2:17', 'XFUC6_h-JrzEhUx06WDxHZW4b1ApBEyA.mp3', 1, 1, 1621976710, 1621976710),
(961, 62, 1, 7, 'Лабиринт', '', '4:49', 'j2Srdvb3QKwMChGYVJVF7ZwJC2w5wSzJ.mp3', 1, 1, 1621976710, 1621976710),
(962, 62, 1, 8, 'Шаги', '', '1:28', 'zgXZkVTjbRC9mRcs-bLwa0fzQG2vZjqA.mp3', 1, 1, 1621976711, 1621976711),
(963, 62, 1, 9, 'Бериллий', '', '3:31', 'BkCE68QJ5_Bq-ulTsH1QPkuC_EgpMTjr.mp3', 1, 1, 1621976711, 1621976711),
(964, 62, 1, 10, 'Паровоз', '', '0:53', 'rsHjpmJjaA4o-Q5fRf-4_BoJBaTzfdik.mp3', 1, 1, 1621976711, 1621976711),
(965, 62, 1, 11, 'Люди на ладони', '', '2:00', 'fenY_UNK4GItO_lMW0_f2EZwxtOhAYa8.mp3', 1, 1, 1621976711, 1621976711),
(966, 62, 1, 12, 'Урок географии', '', '4:58', '_hVtXGLV4T4BkW7aVQw4VYWyUoRS0uy-.mp3', 1, 1, 1621976711, 1621976711),
(967, 62, 1, 13, 'Все включено', '', '3:20', 'Po_mNUF5qe65727t917NtziP7X3R87EH.mp3', 1, 1, 1621976711, 1621976711),
(968, 62, 1, 14, 'Голос за кадром', '', '1:08', 'IwA_INpT1EJw2KCWYfYmnEVp83Ky3j5u.mp3', 1, 1, 1621976711, 1621976711),
(969, 62, 1, 15, 'Романс', '', '3:26', '4cpnYQXbGY1PJ5v8Q2KhCq913nrvJraT.mp3', 1, 1, 1621976711, 1621976711),
(970, 63, 1, 1, 'Мелькнула чья-то тень', '', '3:16', 'X2uTuPFgQcVIjXvoPXTYmIbikupWL758.mp3', 1, 1, 1621976750, 1621976750),
(971, 63, 1, 2, 'Скажи', '', '3:09', 'dbDt7EpXxYdhcyNCCUCYVUDYETE8yEtH.mp3', 1, 1, 1621976750, 1621976750),
(972, 63, 1, 3, 'Матч', '', '2:47', 'RcdPKkDFzcEU0Ic6De-7yGMjt3TgNXve.mp3', 1, 1, 1621976750, 1621976750),
(973, 63, 1, 4, 'На счастье!', '', '2:40', 'yQvVd3PEXKCfOP3fzKhhbdiuJm4iJI5S.mp3', 1, 1, 1621976750, 1621976750),
(974, 63, 1, 5, 'Волна', '', '3:27', 'U8Ps-WTU_jhtmmZwrl1Iwm_ganMQ7-fE.mp3', 1, 1, 1621976750, 1621976750),
(975, 63, 1, 6, 'Лепесток', '', '3:37', 'lSlxOHND5UpLis3z7FuiCN38tq7xTpFK.mp3', 1, 1, 1621976750, 1621976750),
(976, 63, 1, 7, 'Император', '', '1:14', 'VVn_KVM2XwpX6M79FI8eNTxmASiA-oMd.mp3', 1, 1, 1621976750, 1621976750),
(977, 63, 1, 8, 'Бетховен', '', '2:40', 'hiK3S16QMr2ZLrrSly1lyCKeKczSD9Zt.mp3', 1, 1, 1621976750, 1621976750),
(978, 63, 1, 9, 'Маяк', '', '3:47', 'u1Jrei34vtQLs1aymx2AFiP6QrmAYaLl.mp3', 1, 1, 1621976750, 1621976750),
(979, 63, 1, 10, 'Праздник', '', '2:17', 'w4jkgYefcE0xqgK0Y7dtbtw-7fODx5pR.mp3', 1, 1, 1621976750, 1621976750),
(980, 63, 1, 11, 'Сухари и сушки', '', '5:29', 'IPsSfkkHxtq9KQpIKuKhF8ujIKErzYIb.mp3', 1, 1, 1621976750, 1621976750),
(981, 63, 1, 12, 'Мобильный', '', '3:22', 'orOsvhSNIyBwP28jm_NOaOZPcBy8Jfus.mp3', 1, 1, 1621976751, 1621976751),
(982, 63, 1, 13, 'Колокол', '', '3:35', 'MMyZrDOz78ZsH4ZSyyhpBj-N03JLdaRQ.mp3', 1, 1, 1621976751, 1621976751),
(983, 63, 1, 14, 'Пробки', '', '4:01', '0k_H_ncrFroyhEQHCTJ_OO-7R0SpVT-S.mp3', 1, 1, 1621976751, 1621976751),
(984, 63, 1, 15, 'Мамма Миа', '', '2:59', 'dJnHPpL9hTXiPCjTykR1weXnvvZzuHgt.mp3', 1, 1, 1621976751, 1621976751),
(985, 63, 1, 16, 'Прочь из моей головы', '', '3:17', '7ytsRGxR-t786b5O6wIbBWIR4JbhmQpF.mp3', 1, 1, 1621976751, 1621976751),
(986, 63, 1, 17, 'Сын', '', '1:50', 'eAkxizt0bDi7ka09htG75LIrY3lZ1e2c.mp3', 1, 1, 1621976752, 1621976752),
(987, 64, 1, 1, 'Настройка звука', '', '2:40', 'qc0IAjwl1xi6kiPTBF3HbA2umFRTYGpG.mp3', 1, 1, 1621976814, 1621976814),
(988, 64, 1, 2, 'Дыши легко', '', '3:54', '26MivpNS69iJMS5Mtn9Hi7OKmi9Jj6N3.mp3', 1, 1, 1621976814, 1621976814),
(989, 64, 1, 3, 'Добро пожаловать!', '', '4:11', 'JI4YK78Utb9Y1E7XC62NCLxsWMCfol48.mp3', 1, 1, 1621976814, 1621976814),
(990, 64, 1, 4, 'Больше никакого рок-н-ролла', '', '4:13', 'kDwvXpjzUezf_eBjFv8uJBnunEqYrRmS.mp3', 1, 1, 1621976814, 1621976814),
(991, 64, 1, 5, 'Вниз головой', '', '3:06', 'XO1Lt--YsI4ZYMuENoSzkgUglhBBPy4K.mp3', 1, 1, 1621976814, 1621976814),
(992, 64, 1, 6, 'Чердак', '', '4:08', 't5waU5FcrI8tjf2LBndtDxgdXgPQKo53.mp3', 1, 1, 1621976814, 1621976814),
(993, 64, 1, 7, 'Зеленая песня', '', '3:30', 'meOkRov8CaEMDSQ1teDCQ6BZUsbRrVBf.mp3', 1, 1, 1621976814, 1621976814),
(994, 64, 1, 8, 'Камень', '', '4:59', '4uYiFmKSNclkjphhy_tZtuoZKWMnhEJY.mp3', 1, 1, 1621976814, 1621976814),
(995, 64, 1, 9, '3007', '', '2:11', 'lrgtuDJ9JLY_XxWk_DvQkwGAkJWcNby8.mp3', 1, 1, 1621976814, 1621976814),
(996, 64, 1, 10, 'Без тормозов', '', '3:14', '3-W_yA1qVhTEE1pyYxPONHEro5uVW58h.mp3', 1, 1, 1621976815, 1621976815);
INSERT INTO `track` (`id`, `album`, `disk`, `number`, `name`, `signature`, `playtime`, `file`, `creator`, `editor`, `created_at`, `updated_at`) VALUES
(997, 64, 1, 11, 'Корабль ждет!', '', '2:45', 'rPYKgyeKxeWkCpsXhZHDhzp6mqgtYhIq.mp3', 1, 1, 1621976815, 1621976815),
(998, 64, 1, 12, 'Человек не спал', '', '2:53', '-0xaUdv2Ai1OxwcTShQa-7wrNM6NFx5K.mp3', 1, 1, 1621976815, 1621976815),
(999, 64, 1, 13, 'Ковчег', '', '3:33', 'Dm0h0x1c145M-hWWtYN_SK3nty7g4GIJ.mp3', 1, 1, 1621976815, 1621976815),
(1000, 64, 1, 14, 'Выпусти меня отсюда', '', '3:11', 'IGLcXDvfEKaDjz_C4DLfiPBuDJ3ASeSA.mp3', 1, 1, 1621976815, 1621976815),
(1001, 64, 1, 15, 'Письмо', '', '2:29', '14WtpC73nolqqC7zIUIZXh_oIVeYqMW_.mp3', 1, 1, 1621976815, 1621976815),
(1002, 64, 1, 16, 'Все так странно', '', '2:04', 'C79CiDRX5MiRnxTILLu7vI1bJM9NNqor.mp3', 1, 1, 1621976815, 1621976815),
(1003, 64, 1, 17, 'Вальс', '', '3:07', 'PbD_KqoUzSMYN-oC8JndGOIONn7J5tqV.mp3', 1, 1, 1621976815, 1621976815),
(1004, 64, 1, 18, 'До встречи!', '', '4:23', 'PgusXNw3f_-znOexsVMWfxa8Ma_SdyRK.mp3', 1, 1, 1621976815, 1621976815),
(1005, 65, 1, 1, 'Увертюра', '', '1:44', 'mbNbUlHvmTeU8yo6BS3_fui0fqLyaS0l.mp3', 1, 1, 1621976883, 1621976883),
(1006, 65, 1, 2, 'Летела жизнь', '', '2:31', 'SLnDfp-opKVUxVaJK6EA4aZKiedYiZ6P.mp3', 1, 1, 1621976883, 1621976883),
(1007, 65, 1, 3, 'Черная волга', '', '2:47', 'wMmHGrKu1EcdBKoF5y3pfA4gcDx5Jvsn.mp3', 1, 1, 1621976883, 1621976883),
(1008, 65, 1, 4, 'Лестница', '', '2:19', 'QP91AUP_XikALUUhrnIzDnnivUMAHb5x.mp3', 1, 1, 1621976883, 1621976883),
(1009, 65, 1, 5, 'Страшная тайна', '', '2:24', 'oudbxjRni2M0uiuIvB6WrL2YTWDq2J0k.mp3', 1, 1, 1621976883, 1621976883),
(1010, 65, 1, 6, 'Петербургская свадьба', '', '4:20', 'lWwNH8con248cOxsbTuoA0lWRKidUgB_.mp3', 1, 1, 1621976883, 1621976883),
(1011, 65, 1, 7, 'Дочь самурая', '', '3:37', 'nbla6B-KiXAZf2XJgQUs9Qebc9_cZyIS.mp3', 1, 1, 1621976883, 1621976883),
(1012, 65, 1, 8, 'Фибоначчи', '', '3:28', 'HcHttO5nCTnRn-Alu7dhD1BDlz-yQLjW.mp3', 1, 1, 1621976883, 1621976883),
(1013, 65, 1, 9, 'В мире иллюзий', '', '2:59', 'Ohvr4HjlvGz41bUZcRvVHMp-skGEjBXi.mp3', 1, 1, 1621976883, 1621976883),
(1014, 65, 1, 10, 'Праздник', '', '2:40', 'zPcnbG1jZDHIB_14D3ZXq2OCDAEOUJNT.mp3', 1, 1, 1621976884, 1621976884),
(1015, 65, 1, 11, 'Ковш', '', '3:01', 'fUioG8CQ87mBRCb6y5WD72ImfwMd74Eg.mp3', 1, 1, 1621976884, 1621976884),
(1016, 65, 1, 12, 'Солнце взойдет', '', '3:35', 'DZVY1d9Tlk2Cy6H1HujfBBI7S-Y9R2CC.mp3', 1, 1, 1621976884, 1621976884),
(1017, 65, 1, 13, 'Чудак', '', '2:29', 'zYmAROkaK40Tc3s6OeeeeSnXZFV3hFSO.mp3', 1, 1, 1621976884, 1621976884),
(1018, 65, 1, 14, 'Волшебное слово', '', '4:25', 'dvzRXYjGIXhFreqIVl1diMBDXQK1c9Un.mp3', 1, 1, 1621976884, 1621976884),
(1019, 66, 1, 1, 'Всадник', '', '2:50', 'jjyUR6-fIruGvnIf2ihDPzXukfNJHYVL.mp3', 1, 1, 1621976964, 1621976964),
(1020, 66, 1, 2, 'Ай лов ю!', '', '3:21', 'ReXlfvyavnsT2NppRni-WP7LbvPHS4Ov.mp3', 1, 1, 1621976964, 1621976964),
(1021, 66, 1, 3, 'Старый дом', '', '2:39', 'lWLVK2PZpnFA5V4riQE-E-UyHTB4XiOR.mp3', 1, 1, 1621976964, 1621976964),
(1022, 66, 1, 4, 'Мороз по коже', '', '3:05', 'S2l3lorRDEW3A4kPU-S4jbvy5WFfnsKX.mp3', 1, 1, 1621976964, 1621976964),
(1023, 66, 1, 5, 'Мысль', '', '3:52', '_Rgv-Ryx5CLOHPArcDxZ_kEYMAO7ib-Z.mp3', 1, 1, 1621976964, 1621976964),
(1024, 66, 1, 6, 'Есть кто-нибудь живой', '', '3:10', '1bVxf62lrNKGt74y5QvuMAZ0PKEMP70j.mp3', 1, 1, 1621976964, 1621976964),
(1025, 66, 1, 7, 'Рай в шалаше', '', '3:14', 'o_aulmsLImwrfNoU2yzuDT4Ycrb_6Z28.mp3', 1, 1, 1621976964, 1621976964),
(1026, 66, 1, 8, 'Всё наоборот', '', '1:23', 'nlW2JdDs07zcPUCh-tGfPDTb9ZmZNo9R.mp3', 1, 1, 1621976964, 1621976964),
(1027, 66, 1, 9, 'Помолчим немного', '', '3:42', 'Hx908uGHD0dbv3OCeoSTljlqEg8uwa2T.mp3', 1, 1, 1621976964, 1621976964),
(1028, 66, 1, 10, 'Пусть играет музыка!', '', '3:14', '8Wq77ww1BJgmS2t1N0XHBaDjdNZFT8eh.mp3', 1, 1, 1621976964, 1621976964),
(1029, 66, 1, 11, 'Горизонт событий', '', '2:36', '5v9bgT35flVQ2Ms8lYg5rqiVl9impITe.mp3', 1, 1, 1621976964, 1621976964),
(1030, 66, 1, 12, 'Среди зимы', '', '2:43', 'vgoxdLyGiTX6aUmjmqN475KoJ-vutHLZ.mp3', 1, 1, 1621976965, 1621976965),
(1031, 66, 1, 13, 'Дверной глазок', '', '5:24', 'PEE0oxZw5oiNfIznIQWop5j7G-dXPCcq.mp3', 1, 1, 1621976965, 1621976965),
(1032, 66, 1, 14, 'Подводная песня', '', '3:28', '2M3ErxB_jEZ2gOutIEbWEXlwsXPIVNhc.mp3', 1, 1, 1621976965, 1621976965),
(1033, 67, 1, 1, 'Красота', '', '2:59', 'ylfPuRiJ2Y0zu9vEDu1uOkNQ7Vrn8lEF.mp3', 1, 1, 1621977006, 1621977006),
(1034, 67, 1, 2, 'Оркестр', '', '4:12', 'D8rFjtdv7aLMSn7f80FAafv2JLTP1Ag3.mp3', 1, 1, 1621977006, 1621977006),
(1035, 67, 1, 3, 'Песня на одном аккорде', '', '4:11', 'm1xh8xL0yXSfBnaZc6H-tPOt6PX1kCAb.mp3', 1, 1, 1621977006, 1621977006),
(1036, 67, 1, 4, 'Два плюс один', '', '2:37', 'NaixIcli6VO_niLpF-FBX7N__mN0pruS.mp3', 1, 1, 1621977006, 1621977006),
(1037, 67, 1, 5, 'Полная Луна', '', '3:38', 'HN_LOa4-jrUtyWwO1c-BQNV1MHwX65kv.mp3', 1, 1, 1621977006, 1621977006),
(1038, 67, 1, 6, 'Танцуй!', '', '4:11', 'Oy1p8RABndlQW6EB5VgZw9OeXQ9QtPfK.mp3', 1, 1, 1621977007, 1621977007),
(1039, 67, 1, 7, 'Симфония', '', '2:54', 'Wvqu8atrNZ3WLl0RsDVIpACkVQiTPQyZ.mp3', 1, 1, 1621977007, 1621977007),
(1040, 67, 1, 8, 'Нефть', '', '2:15', 'FVdVhpVZZyfesvRFlLl-8fAKblYAVA88.mp3', 1, 1, 1621977007, 1621977007),
(1041, 67, 1, 9, 'Пожар', '', '2:53', 'sGHLpW_FKmv_ZiGVdst7Tnj3mpQx6ug3.mp3', 1, 1, 1621977007, 1621977007),
(1042, 67, 1, 10, 'Шахматы', '', '5:53', 'dJP2PKeDSYIEEtT-pEULipiMBY7geZjh.mp3', 1, 1, 1621977007, 1621977007),
(1043, 67, 1, 11, 'Исчезаем в темноте', '', '4:05', 'aIfe1LiNh_84fUWNuAS4dCLoHfeMCxer.mp3', 1, 1, 1621977007, 1621977007),
(1044, 68, 1, 1, 'Медный грош', '', '1:25', 'fDc2IU0opP_iQ3M9vPkz2xRQ2LjM32SL.mp3', 1, 1, 1621977090, 1621977090),
(1045, 68, 1, 2, 'Пирамиды', '', '4:21', '9ujHEg2f38kJ8ZMI3OhQBdsw5TqE_QhO.mp3', 1, 1, 1621977091, 1621977091),
(1046, 68, 1, 3, 'Нам, мудрецам', '', '4:57', 'SzUpkGj6Rr2z0NUinWrC-n_Pw1HGld28.mp3', 1, 1, 1621977091, 1621977091),
(1047, 68, 1, 4, 'Храм', '', '2:45', 'lDewYnG-ce5rtt81pdAMjV5hyjfnvlIz.mp3', 1, 1, 1621977091, 1621977091),
(1048, 68, 1, 5, 'Окраины', '', '6:00', '4xumrmbiLNNPAIskPVimhRIAvYTVJ0HS.mp3', 1, 1, 1621977091, 1621977091),
(1049, 68, 1, 6, 'Кит', '', '3:14', '8QI0x2aoHJZqlpo4fNh_nOH-vEFl5lXA.mp3', 1, 1, 1621977091, 1621977091),
(1050, 68, 1, 7, 'Она была так прекрасна', '', '2:47', 'DU-xR93YwxrLvveRJtLtgraYmEEDb4ct.mp3', 1, 1, 1621977091, 1621977091),
(1051, 68, 1, 8, 'Джа играет джаз', '', '3:53', 'H-M70pseVdKHLULbBsEN9r4OL--JSE4G.mp3', 1, 1, 1621977091, 1621977091),
(1052, 68, 1, 9, 'Реквием', '', '3:22', 'qf3OTYSNZP9UdJ4iApFTk4rRwTSD5UuO.mp3', 1, 1, 1621977091, 1621977091),
(1053, 68, 1, 10, 'Земля уходит из-под ног', '', '3:50', 'LgosEgp7aZTBZGoyZye8EQwu9EjuegPy.mp3', 1, 1, 1621977091, 1621977091),
(1054, 68, 1, 11, 'Тревога', '', '3:21', 'hLd0eH0tBVy7TITDMuytLeOQgibHRe9L.mp3', 1, 1, 1621977091, 1621977091),
(1055, 68, 1, 12, 'Небесный хор', '', '4:14', '3nYXaY73Eo_8OBOBf4lVEloQaxaihEzf.mp3', 1, 1, 1621977091, 1621977091),
(1056, 68, 1, 13, 'Путь на восток', '', '3:09', 'yKQUHK2V3vlpw571A5jiYHCFWwVx8BW7.mp3', 1, 1, 1621977091, 1621977091),
(1057, 68, 1, 14, 'День за днём', '', '3:40', 'hKew3c7vbEP9mc0r_wUR4McDYJoe6zn6.mp3', 1, 1, 1621977091, 1621977091),
(1058, 68, 1, 15, 'Череп и кости', '', '2:56', '6IokeGIixGNu8zznNkUPJx2wPYhSanuL.mp3', 1, 1, 1621977091, 1621977091),
(1059, 69, 1, 1, 'Встречная полоса', '', '4:28', 'vIuK0p0oP84Jr8-JVEFCDduThd_dHRsJ.mp3', 1, 1, 1621977121, 1621977121),
(1060, 69, 1, 2, 'На утро', '', '4:04', 'nyPOoRRfcWVQrksgkSqgZDPMBN793SgG.mp3', 1, 1, 1621977122, 1621977122),
(1061, 69, 1, 3, 'Чей-то ребёнок', '', '3:10', '8vvKrt2LnNmXHwYowIV9Srpa33ikjWye.mp3', 1, 1, 1621977122, 1621977122),
(1062, 69, 1, 4, 'Испанская инквизиция', '', '2:26', 'dQUjMfgh5EUGwsouAEkEB8icElvq7D39.mp3', 1, 1, 1621977122, 1621977122),
(1063, 69, 1, 5, 'Тепло родного дома', '', '3:53', 'wCb4aO71DWazto3D-aFI8kbc9RSv8rUv.mp3', 1, 1, 1621977122, 1621977122),
(1064, 69, 1, 6, 'Булгаковский марш', '', '0:28', 'bvTevZaOTsKHgs5otEA4qkeIgE6xn1Er.mp3', 1, 1, 1621977122, 1621977122),
(1065, 69, 1, 7, 'Шпионы', '', '1:47', 'xLmQnf9w3xVh36G8ddQULyUVYOQuahZ_.mp3', 1, 1, 1621977122, 1621977122),
(1066, 69, 1, 8, 'Шаман', '', '5:31', 'XdC2VrJpHZ1ICMKo6YdOYouoP24h0wEG.mp3', 1, 1, 1621977122, 1621977122),
(1067, 69, 1, 9, 'Когда пройдёт 100 лет', '', '3:25', 'm9ewg1iROw4LHkEtz38y3AYvO1Aoabvg.mp3', 1, 1, 1621977122, 1621977122),
(1068, 69, 1, 10, 'Волк', '', '3:46', 'QuvIbYlNbuF7a1b4fyHWaf7yGHNxAxw6.mp3', 1, 1, 1621977122, 1621977122),
(1069, 69, 1, 11, 'Яблоко', '', '3:08', 'sN_Eq28QywmSrmECXO5j3AThPTDOqUXF.mp3', 1, 1, 1621977122, 1621977122),
(1070, 70, 1, 1, 'Воздушный шар', '', '3:27', 'wzrweKVRHZ6-Fwv8lfye7EIYbi-8_-51.mp3', 1, 1, 1621977157, 1621977157),
(1071, 70, 1, 2, 'Тайком', '', '3:45', '8XHXQdVi-Z4m5RYL_ZziGHAqQSymVsdk.mp3', 1, 1, 1621977157, 1621977157),
(1072, 70, 1, 3, 'Атом', '', '4:57', 'nYMIl78vdt0CLpGqWzTWaqOCtgOkx6DM.mp3', 1, 1, 1621977157, 1621977157),
(1073, 70, 1, 4, 'Гимн', '', '6:11', 'JfYXuQG1AjF76FwY5o_Swv-P_L6ScLxa.mp3', 1, 1, 1621977157, 1621977157),
(1074, 70, 1, 5, 'Волшебная скрипка', '', '3:12', 'yWwg3-Nyy-QnI0EIXpiXFC98z-2iSu8H.mp3', 1, 1, 1621977157, 1621977157),
(1075, 70, 1, 6, 'Важная вещь', '', '2:32', '0VxYFgj21VVq-sDniq4ZWGjB7aGhLNnb.mp3', 1, 1, 1621977158, 1621977158),
(1076, 70, 1, 7, 'Шар воздушный', '', '2:26', '3LDUM97sgcVXdyMgiKL3Tncj97dyBrUG.mp3', 1, 1, 1621977158, 1621977158),
(1077, 71, 1, 1, 'Voices', '', '3:12', 'WIR6j0IpjmCxOI_1Ou5CftAQORn2dvrD.mp3', 1, 1, 1621978700, 1621978700),
(1078, 71, 1, 2, 'The Game', '', '3:47', 'fyKVD64HO2izcqybEo6W1RA3w3P4j1J6.mp3', 1, 1, 1621978700, 1621978700),
(1079, 71, 1, 3, 'Stupify', '', '4:34', 'r1C-iNjmACyQhZCRnmIz-I2J9XK_qTti.mp3', 1, 1, 1621978700, 1621978700),
(1080, 71, 1, 4, 'Down With The Sickness', '', '4:39', 'zgYD7i3iVfrkNMFmnmYH_QoyAdbD1X4r.mp3', 1, 1, 1621978700, 1621978700),
(1081, 71, 1, 5, 'Violence Fetish', '', '3:24', '3Zomu3wqmWpiY8P2N0iwxSWf_KduE3-e.mp3', 1, 1, 1621978700, 1621978700),
(1082, 71, 1, 6, 'Fear', '', '3:47', '4lq8Omf49Hv6bCnOwJduQH-GpSZu7bz0.mp3', 1, 1, 1621978700, 1621978700),
(1083, 71, 1, 7, 'Numb', '', '3:45', 'eytfgtyhwmF3Ftw-8Y126n4eo2ao9OzE.mp3', 1, 1, 1621978700, 1621978700),
(1084, 71, 1, 8, 'Want', '', '3:53', 'ZmHZZ5-yS_r-fq1Laoz51LnpJ21nSlsf.mp3', 1, 1, 1621978700, 1621978700),
(1085, 71, 1, 9, 'Conflict', '', '4:35', 'rurz4by9654d22pOGiHf17fCMm1kcsUf.mp3', 1, 1, 1621978700, 1621978700),
(1086, 71, 1, 10, 'Shout 2000', '', '4:18', '9Q4ucFoYz6KsEwq2cizCtBaTE3C_RxhK.mp3', 1, 1, 1621978700, 1621978700),
(1087, 71, 1, 11, 'Droppin\' Plates', '', '3:49', 'H2C542h6GSOMreHpF_uZu031w0X2kO69.mp3', 1, 1, 1621978700, 1621978700),
(1088, 71, 1, 12, 'Meaning Of Life', '', '4:03', 'iJtjbukiq4jFTWtRXUJaZ126HiLUr5sZ.mp3', 1, 1, 1621978700, 1621978700),
(1089, 72, 1, 1, 'Prayer', '', '3:41', 'HahTLC9-zhQedtfX8uTRf5998G6xm8Gx.mp3', 1, 1, 1621978730, 1621978730),
(1090, 72, 1, 2, 'Liberate', '', '3:30', 'OPF235p_y9d45ZeFbxfwa8RaG99ROmHu.mp3', 1, 1, 1621978730, 1621978730),
(1091, 72, 1, 3, 'Awaken', '', '4:29', 'V85Cxps7SUz1vi8QiEHR8on-BwfGwoUt.mp3', 1, 1, 1621978731, 1621978731),
(1092, 72, 1, 4, 'Believe', '', '4:28', 'S73u4pYsGpm275m9Oh6oyQDOTBs7gAss.mp3', 1, 1, 1621978731, 1621978731),
(1093, 72, 1, 5, 'Remember', '', '4:11', 'UG5Xj_3l4iIX9dLrQVOlfy5yHfFwAw9G.mp3', 1, 1, 1621978731, 1621978731),
(1094, 72, 1, 6, 'Intoxication', '', '3:14', 'BcAZlSt5YsA57Tudxeyx39wpTkqkgRto.mp3', 1, 1, 1621978731, 1621978731),
(1095, 72, 1, 7, 'Rise', '', '3:57', 'StJSPeO9yyBA9w8LrJN9dGzdCqhvxOL1.mp3', 1, 1, 1621978731, 1621978731),
(1096, 72, 1, 8, 'Mistress', '', '3:47', '6qcTzZT5ihndskScDrPVL9Birn8Pykcr.mp3', 1, 1, 1621978731, 1621978731),
(1097, 72, 1, 9, 'Breathe', '', '4:21', 'vwEsM0IyiBFMJq5_Zk_FDM1FkZU01y9a.mp3', 1, 1, 1621978731, 1621978731),
(1098, 72, 1, 10, 'Bound', '', '3:53', 'BMjwxXQoWnwu91Qa6gN5yIvewNmUqLld.mp3', 1, 1, 1621978731, 1621978731),
(1099, 72, 1, 11, 'Devour', '', '3:53', 'PKUio7WIDrJUB8Kc-FBbN0mXsk4hbiSY.mp3', 1, 1, 1621978731, 1621978731),
(1100, 72, 1, 12, 'Darkness', '', '3:57', 'cpFsvt7wk7HH9Z9JYn5aGWyuLmjmdRnj.mp3', 1, 1, 1621978731, 1621978731),
(1101, 73, 1, 1, 'Ten Thousand Fists', '', '3:33', 'htdcK9yzy46f_FlKTtHqI96anfu9-pQP.mp3', 1, 1, 1621978761, 1621978761),
(1102, 73, 1, 2, 'Just Stop', '', '3:46', 'U-ZMmHti84FQUrEx-MMs7fnyN9OyvP2B.mp3', 1, 1, 1621978761, 1621978761),
(1103, 73, 1, 3, 'Guarded', '', '3:23', 'RhJPxE_AmJKBdamL2s_OBBI8CVcBTVbp.mp3', 1, 1, 1621978761, 1621978761),
(1104, 73, 1, 4, 'Deify', '', '4:18', 'kasFiGiJ3HBGn4aOrxUncaDUEgl1jDGS.mp3', 1, 1, 1621978761, 1621978761),
(1105, 73, 1, 5, 'Stricken', '', '4:07', 'k1FE6GiJI9hFsw1GSstTudH2zzbqNFYd.mp3', 1, 1, 1621978761, 1621978761),
(1106, 73, 1, 6, 'I\'m Alive', '', '4:42', '-lx1s5vK6aBXz2pvn_n6pkWGPllxRDqN.mp3', 1, 1, 1621978762, 1621978762),
(1107, 73, 1, 7, 'Sons Of Plunder', '', '3:51', 'TgSrUKsYhnUEBXYWj6qUb_zq4r_sYc79.mp3', 1, 1, 1621978762, 1621978762),
(1108, 73, 1, 8, 'Overburdened', '', '5:59', 'PCssmTYFvHO1nPO67UGJwH8xqo_nQrEa.mp3', 1, 1, 1621978762, 1621978762),
(1109, 73, 1, 9, 'Decadence', '', '3:27', 'j-xS2Lq67YNgkUQDWWkv1q0fKpo7-zA0.mp3', 1, 1, 1621978762, 1621978762),
(1110, 73, 1, 10, 'Forgiven', '', '4:15', '2gu4xToZuThQqDyhz8nbdD7tdpHQ-U6N.mp3', 1, 1, 1621978762, 1621978762),
(1111, 73, 1, 11, 'Land Of Confusion', '', '4:50', '7dox24E_vOmt2Hl7CQlEaBWS779iNSQl.mp3', 1, 1, 1621978763, 1621978763),
(1112, 73, 1, 12, 'Sacred Lie', '', '3:08', '6TLC9yaRBcOZsXEjNRw0nB9_rqk9ocvo.mp3', 1, 1, 1621978763, 1621978763),
(1113, 73, 1, 13, 'Pain Redefined', '', '4:10', '_UXU3zKYTwqY7H0uRyHBj9grK6m7GRFL.mp3', 1, 1, 1621978763, 1621978763),
(1114, 73, 1, 14, 'Avarice', '', '2:57', 'LtFr858yHMLtjNOBDZByLiUT38AWA7vS.mp3', 1, 1, 1621978763, 1621978763),
(1115, 74, 1, 1, 'Indestructible', '', '4:38', 'EB48UXipkOv_fand5sbWv_4dznONSskQ.mp3', 1, 1, 1621978905, 1621978905),
(1116, 74, 1, 2, 'Inside The Fire', '', '3:52', 'r6K8BXBFjthjF7VR2oTRwZoPIfcmaYQ0.mp3', 1, 1, 1621978905, 1621978905),
(1117, 74, 1, 3, 'Deceiver', '', '3:49', 'RB1YWnCxQatTjf4FkJui9etmxkAnXIfd.mp3', 1, 1, 1621978905, 1621978905),
(1118, 74, 1, 4, 'The Night', '', '4:44', 'ypBaQuGsSCqYJ3JEwtB6jrHQSKZ6BUXL.mp3', 1, 1, 1621978905, 1621978905),
(1119, 74, 1, 5, 'Perfect Insanity', '', '3:55', 'M350endSKojZ8M4yAaoZZWDi-2ZajTJg.mp3', 1, 1, 1621978905, 1621978905),
(1120, 74, 1, 6, 'Haunted', '', '4:41', 'SF6RC4bqbX4JC4eAf1lizX8tBSoej-0k.mp3', 1, 1, 1621978905, 1621978905),
(1121, 74, 1, 7, 'Enough', '', '4:20', 'SCZaDKHkTmLBVm0tULlsEukZdg9wgdRm.mp3', 1, 1, 1621978906, 1621978906),
(1122, 74, 1, 8, 'The Curse', '', '3:22', 'v0esOulOT3VvhsYv3fP4e10pFc6HJOfy.mp3', 1, 1, 1621978906, 1621978906),
(1123, 74, 1, 9, 'Torn', '', '4:09', '4hmPD17juIwlnTT0zrnlSYjxUY1_Xv79.mp3', 1, 1, 1621978906, 1621978906),
(1124, 74, 1, 10, 'Criminal', '', '4:13', 'xVzEXUs8LrL6Ap3QRGVgdVEw9yXhMy5j.mp3', 1, 1, 1621978906, 1621978906),
(1125, 74, 1, 11, 'Divide', '', '3:35', 'BxQfuHf6AYO5jwtoC8WggocS4SpiihBi.mp3', 1, 1, 1621978906, 1621978906),
(1126, 74, 1, 12, 'Fa&#231;ade', '', '3:47', '_sCrsCWwNdpnTqwN9GIcK3O4mvY3oNd5.mp3', 1, 1, 1621978906, 1621978906),
(1127, 75, 1, 1, 'Remnants', '', '2:44', 'adwKwsB5E-xQdEUY_rkgCFZ_n4qnnkq9.mp3', 1, 1, 1621980121, 1621980121),
(1128, 75, 1, 2, 'Asylum', '', '4:36', 'NxTUOSIiZCUEHIFLm19HMvgQNB4j3Nkc.mp3', 1, 1, 1621980121, 1621980121),
(1129, 75, 1, 3, 'The Infection', '', '4:09', 'w2Vtcdr8CIUFRO7WeWkEi0cHE22XHmXf.mp3', 1, 1, 1621980121, 1621980121),
(1130, 75, 1, 4, 'Warrior', '', '3:25', '2jrWGPWZb14_ylURLeWYvfvR9E1aQMEl.mp3', 1, 1, 1621980121, 1621980121),
(1131, 75, 1, 5, 'Another Way To Die', '', '4:13', 'WrVU_zXOzzuMwpp7BMDigi69JZ1F8jf_.mp3', 1, 1, 1621980121, 1621980121),
(1132, 75, 1, 6, 'Never Again', '', '3:34', 'MyJ6n0umuE0xwduRqtDV-Of1QQ_ckn_R.mp3', 1, 1, 1621980121, 1621980121),
(1133, 75, 1, 7, 'The Animal', '', '4:14', 'ppIJSPAdHCKb7E-bam4excej8UDcqQfa.mp3', 1, 1, 1621980121, 1621980121),
(1134, 75, 1, 8, 'Crucified', '', '4:37', 'VrXgWw6eWmZrlbGMz6KbYK9XDgd-eLgJ.mp3', 1, 1, 1621980122, 1621980122),
(1135, 75, 1, 9, 'Serpentine', '', '4:10', '6opJ0_P2IkJ02wan2Zh33bZC0VxR1nDg.mp3', 1, 1, 1621980122, 1621980122),
(1136, 75, 1, 10, 'My Child', '', '3:18', 'CHCcFaWFdG2w-AXvjm5TCmj0JASnlSjT.mp3', 1, 1, 1621980122, 1621980122),
(1137, 75, 1, 11, 'Sacrifice', '', '4:00', '8AiBqbbErWHH0YymTeH385Z1JmJ5lliT.mp3', 1, 1, 1621980122, 1621980122),
(1138, 75, 1, 12, 'Innocence', '', '4:31', 'B8KAd4c_eG6r4wmMhG1hxHJtLZr38DPs.mp3', 1, 1, 1621980122, 1621980122),
(1139, 75, 1, 13, 'Ishfwilf', '', '5:26', 'Me__XKZLhuKu9ZfoSb-2iJxsKzZROVeg.mp3', 1, 1, 1621980122, 1621980122),
(1140, 75, 1, 14, 'Leave It Alone', '', '4:07', 'IfXgz9EDWzaAoa7kv-8Aq7-WJbMiQOc3.mp3', 1, 1, 1621980122, 1621980122),
(1141, 75, 1, 17, 'Living After Midnight', '', '4:18', 'zyk_rtO-huo8NPCn7IfEqSDiomIPMDOp.mp3', 1, 1, 1621980122, 1621980122),
(1142, 76, 1, 1, 'Hell', '', '4:16', 'pERG1k7mG9xM0SKa5mmhZU_CRvjjmY1b.mp3', 1, 1, 1621980154, 1621980154),
(1143, 76, 1, 2, 'A Welcome Burden', '', '3:32', 'kFpkWRXNcttgwPV1p_xriIYg0hY_QBDZ.mp3', 1, 1, 1621980154, 1621980154),
(1144, 76, 1, 3, 'This Moment', '', '3:06', 'H9i_0gMcxOuWfHytvf-lWCbblvqvE9sd.mp3', 1, 1, 1621980154, 1621980154),
(1145, 76, 1, 4, 'Old Friend', '', '3:36', 'EiEwylDkCtEdAptJKexs13zlUAuW3wyU.mp3', 1, 1, 1621980154, 1621980154),
(1146, 76, 1, 5, 'Monster', '', '4:04', 'qntMj1dx6e6NbQiNdxj8tCzOm_AWYK1f.mp3', 1, 1, 1621980154, 1621980154),
(1147, 76, 1, 6, 'Run', '', '3:13', 'MN-1vkx1tMybb1IFZaoq0xp3oCKAE4Db.mp3', 1, 1, 1621980154, 1621980154),
(1148, 76, 1, 7, 'Leave It Alone', '', '4:07', 'ynqDwnA0xJsQX9EVQ2WK9CzFTDMf0gWs.mp3', 1, 1, 1621980154, 1621980154),
(1149, 76, 1, 8, 'Two Worlds', '', '3:31', 'cUYjWCYb0nEtomK7xzBFrhsB0MjdaPPq.mp3', 1, 1, 1621980155, 1621980155),
(1150, 76, 1, 9, 'God Of The Mind', '', '3:05', 'vTVQZ_21QZbqJOBPkgOK6AGLqk82YGNH.mp3', 1, 1, 1621980155, 1621980155),
(1151, 76, 1, 10, 'Sickened', '', '3:59', 'ksOA31I1fhbhoFs9XkcxxLXHoqOApGtE.mp3', 1, 1, 1621980155, 1621980155),
(1152, 76, 1, 11, 'Mine', '', '5:04', 'cFtTr2STF5FKZ82uXoOppEwGvLBhfERY.mp3', 1, 1, 1621980155, 1621980155),
(1153, 76, 1, 12, 'Parasite', '', '3:24', 'lbdpXEQSJnMTmwPj91qNWhZLg6hXMHQm.mp3', 1, 1, 1621980155, 1621980155),
(1154, 76, 1, 13, 'Dehumanized', '', '3:32', 'E4L8umj_nt0v7_LU9xeC6c-VyncVdtXa.mp3', 1, 1, 1621980155, 1621980155),
(1155, 76, 1, 14, '3', '', '4:02', 'YbVgupfxvSgmqSYxNFceLdYgFMbuJjCk.mp3', 1, 1, 1621980155, 1621980155),
(1156, 76, 1, 15, 'Midlife Crisis', '', '4:04', 'sPfRVoUVMHEWTVdJ5xK4btR0milJbM0R.mp3', 1, 1, 1621980155, 1621980155),
(1157, 76, 1, 16, 'Living After Midnight', '', '4:25', 'iRLMLJVHPbu7G1uf6s77fYzbBql2A1SG.mp3', 1, 1, 1621980156, 1621980156),
(1158, 77, 1, 1, 'The Eye Of The Storm', '', '1:20', '_ngymGUOAh_Ieulw9TjZ33IaN7B2VoA3.mp3', 1, 1, 1621980211, 1621980211),
(1159, 77, 1, 2, 'Immortalized', '', '4:18', '8Q2Ln0vScamd2ZuOtITMjaCEZyG73QCT.mp3', 1, 1, 1621980211, 1621980211),
(1160, 77, 1, 3, 'The Vengeful One', '', '4:12', 'YvwwlgL7Q0llxnBcMBaZFbQ-fWpz-ZgD.mp3', 1, 1, 1621980211, 1621980211),
(1161, 77, 1, 4, 'Open Your Eyes', '', '3:56', 'y6lGuPnWstvIgtnkZFbwlxBdZxoVlD9J.mp3', 1, 1, 1621980211, 1621980211),
(1162, 77, 1, 5, 'The Light', '', '4:16', '0XX3DotzF-UjBYV83syST-FS4hO3dIQA.mp3', 1, 1, 1621980211, 1621980211),
(1163, 77, 1, 6, 'What Are You Waiting For', '', '4:04', 'gjgAkYyWvLh_fv9Bd6U4VjIwC9u1Tg6n.mp3', 1, 1, 1621980212, 1621980212),
(1164, 77, 1, 7, 'You\'re Mine', '', '4:55', 'AEuTBk2BYvWZGqgRXeEb8tKy2U247TWN.mp3', 1, 1, 1621980212, 1621980212),
(1165, 77, 1, 8, 'Who', '', '4:45', 'ADflO1Kb8xIW0ZRGLUMH2WyIM_0KFiRT.mp3', 1, 1, 1621980212, 1621980212),
(1166, 77, 1, 9, 'Save Our Last Goodbye', '', '5:04', 'An96r1LyXAYgm1XstuW1AVcJ8wi-Vwm4.mp3', 1, 1, 1621980212, 1621980212),
(1167, 77, 1, 10, 'Fire It Up', '', '4:06', 'sILSZklvEmfx7UMlDaVziBlhEAkgqWFl.mp3', 1, 1, 1621980212, 1621980212),
(1168, 77, 1, 11, 'The Sound Of Silence', '', '4:06', 'rxBaLQWoEf-OCxw82fjwC0DZ2tIRBvRZ.mp3', 1, 1, 1621980212, 1621980212),
(1169, 77, 1, 12, 'Never Wrong', '', '3:33', 'jlOvNwhhSAfYdK-kB1isV2AEc4zo2ILN.mp3', 1, 1, 1621980212, 1621980212),
(1170, 77, 1, 13, 'Who Taught You How To Hate', '', '4:57', 'yp1r2UtqMrBvrWbuJOqAwUsMWkL96EHE.mp3', 1, 1, 1621980213, 1621980213),
(1171, 77, 1, 14, 'Tyrant', 'Bonus Track', '3:47', 'O3avFf1hXR-dK_Qfl36AkBUCHnHKeM-f.mp3', 1, 1, 1621980213, 1621980230),
(1172, 77, 1, 15, 'Legion Of Monsters', 'Bonus Track', '4:34', 'tVgPdI7YbD7D6WsCmY6CIa_wB6ZzVk_H.mp3', 1, 1, 1621980213, 1621980244),
(1173, 77, 1, 16, 'The Brave And The Bold', 'Bonus Track', '4:33', 'IyrE1JHJiJTrGXzjtRuqZtFXgkX97W0-.mp3', 1, 1, 1621980213, 1621980250),
(1174, 78, 1, 1, 'Are You Ready', '', '4:22', 'QLKuafe3kpObMUMW4L6u_wOvURx2x0pO.mp3', 1, 1, 1621980290, 1621980290),
(1175, 78, 1, 2, 'No More', '', '3:53', '1_ipgWLGWt650JAoKDX5LpYZ9GBZtTo4.mp3', 1, 1, 1621980290, 1621980290),
(1176, 78, 1, 3, 'A Reason to Fight', '', '4:44', '4_kMaoYLGIfI1U-3PUMIKP1O5RFnyPtS.mp3', 1, 1, 1621980290, 1621980290),
(1177, 78, 1, 4, 'In Another Time', '', '4:11', 'Sm8sabSCKlVu37-WRJuJRBxsOIFcoFDm.mp3', 1, 1, 1621980290, 1621980290),
(1178, 78, 1, 5, 'Stronger on Your Own', '', '4:01', 'LFDywfuSST_nFYNNAfj3x7_Z_3JbXjDB.mp3', 1, 1, 1621980290, 1621980290),
(1179, 78, 1, 6, 'Hold On to Memories', '', '5:04', '55ba4Sbd9jKeZuEw05LRKCeu4lc2ufOS.mp3', 1, 1, 1621980290, 1621980290),
(1180, 78, 1, 7, 'Saviour of Nothing', '', '4:12', 'tcwsNcEs4lwKXfupaKxEyqHb0ZdTQ71p.mp3', 1, 1, 1621980290, 1621980290),
(1181, 78, 1, 8, 'Watch You Burn', '', '4:20', 'CKtBWHsBgah5W6HyQnq4qvo2ifg0fQ3N.mp3', 1, 1, 1621980290, 1621980290),
(1182, 78, 1, 9, 'The Best Ones Lie', '', '4:03', '08H8Qcns8_cNG0fVIO9Rv8_N6YZVOqN3.mp3', 1, 1, 1621980291, 1621980291),
(1183, 78, 1, 10, 'Already Gone', '', '4:29', 'ltL8a5-uFIJuCQ7M-RfNiWdH0RgsPi63.mp3', 1, 1, 1621980291, 1621980291),
(1184, 78, 1, 12, 'This Venom', '', '4:19', '-xMZBuDVAxRVAxB9sjjx6cZCuP2bQkRA.mp3', 1, 1, 1621980291, 1621980291),
(1186, 78, 1, 14, 'Uninvited Guest', '', '3:55', 'qD7kNQixM-gzTyD2nm_H13_ygUGOxCZ-.mp3', 1, 1, 1621980291, 1621980291),
(1187, 78, 1, 13, 'Are You Ready', 'Sam de Jong Remix', NULL, NULL, 1, 1, 1621980382, 1621980382),
(1188, 79, 1, 1, 'Blew', '', '2:54', 'SAwQfwuwMGaNXuoRvgjfksQUd5yAtnbW.mp3', 1, 1, 1621982492, 1621982492),
(1189, 79, 1, 2, 'Floyd The Barber', '', '2:18', 'OCSsf4iXbCAj8JG_8abc_m74vqy5ABDO.mp3', 1, 1, 1621982492, 1621982492),
(1190, 79, 1, 3, 'About A Girl', '', '2:48', 'kn2FDAW6uOrSQl2CznTAjkECuD9JXS03.mp3', 1, 1, 1621982492, 1621982492),
(1191, 79, 1, 4, 'School', '', '2:42', 'ntKisL54mpw516IIaVB_Vg7j3oacQTtC.mp3', 1, 1, 1621982492, 1621982492),
(1192, 79, 1, 5, 'Love Buzz', '', '3:35', 'cqTB4uilF2Fk_BEwf-x0g4EmhdgPFbzj.mp3', 1, 1, 1621982492, 1621982492),
(1193, 79, 1, 6, 'Paper Cuts', '', '4:06', 'GCtLyBUV05rUkmN68oG6VRFA8p4Jmbxl.mp3', 1, 1, 1621982492, 1621982492),
(1194, 79, 1, 7, 'Negative Creep', '', '2:56', 'HmhixUTXPmR1A28tVgkR1qYxeSfxsfR9.mp3', 1, 1, 1621982492, 1621982492),
(1195, 79, 1, 8, 'Scoff', '', '4:10', 'pcf0KQ91FOsYrwYoGvSsH4it9CZES7-t.mp3', 1, 1, 1621982492, 1621982492),
(1196, 79, 1, 9, 'Swap Meet', '', '3:03', 'xUM-ad5QzWKv5zPHgN0txflcGerYgHY-.mp3', 1, 1, 1621982492, 1621982492),
(1197, 79, 1, 10, 'Mr. Moustache', '', '3:24', '8hXIvf8O7KzxV7gBwg5F-mQw00h7cjeZ.mp3', 1, 1, 1621982492, 1621982492),
(1198, 79, 1, 11, 'Sifting', '', '5:22', 'P4IVLee6c67m5HAQj0_dZ2QwhaTAQdQw.mp3', 1, 1, 1621982492, 1621982492),
(1199, 79, 1, 12, 'Big Cheese', '', '3:42', 'ANBNQIyUFO6ybQFuhrpVJ9OHiK4YRSVB.mp3', 1, 1, 1621982492, 1621982492),
(1200, 79, 1, 13, 'Downer', '', '1:43', 'ZGEB6_EESmsalC4OE0gX5czWyiZ_s5U9.mp3', 1, 1, 1621982492, 1621982492),
(1201, 80, 1, 1, 'Smells Like Teen Spirit', '', '5:02', '6q1IyPJnQpk-njC4UgSfo9TO9GYzRVdE.mp3', 1, 1, 1621982527, 1621982527),
(1202, 80, 1, 2, 'In Bloom', '', '4:15', 'ZgfGfRosO5EQiBVixC7wtUbIlstFgUK_.mp3', 1, 1, 1621982527, 1621982527),
(1203, 80, 1, 3, 'Come As You Are', '', '3:39', 'WySqTDsNoRp8Nj_JXpRAHRdwFVkLSVzh.mp3', 1, 1, 1621982527, 1621982527),
(1204, 80, 1, 4, 'Breed', '', '3:04', 'ujAxZbOFsEj1Fg69JNVhD-w2UaMkZePo.mp3', 1, 1, 1621982527, 1621982527),
(1205, 80, 1, 5, 'Lithium', '', '4:17', 'FX67KfUyE-0EDv4M0WSunsL8VpUtcvwt.mp3', 1, 1, 1621982528, 1621982528),
(1206, 80, 1, 6, 'Polly', '', '2:57', '1ucbqbhk9_vdAwo072p0TlNlfFpPjoW8.mp3', 1, 1, 1621982528, 1621982528),
(1207, 80, 1, 7, 'Territorial Pissings', '', '2:23', 'DFC_ilzYTIJJS6C3TZ6-1tCcnlBjjd8K.mp3', 1, 1, 1621982528, 1621982528),
(1208, 80, 1, 8, 'Drain You', '', '3:44', '0AA2T5OaRq26kuLIzk3GbC9eqdFJlLIe.mp3', 1, 1, 1621982528, 1621982528),
(1209, 80, 1, 9, 'Lounge Act', '', '2:37', 'cP4jay9T3LeP9V0bfmWUu9RP0A6C1ljN.mp3', 1, 1, 1621982528, 1621982528),
(1210, 80, 1, 10, 'Stay Away', '', '3:33', 'VBfUVpeV5X3Bc8Zw0BZAsGUsMc-Wwuzg.mp3', 1, 1, 1621982528, 1621982528),
(1211, 80, 1, 11, 'On A Plain', '', '3:16', 'MpSBj6JxHpNKB_izARiFS1YOMv_Mqva5.mp3', 1, 1, 1621982528, 1621982528),
(1212, 80, 1, 12, 'Something In The Way', '', '20:35', 'PVT7MZOJUXRU_aSfbbTRANY065HEGmwu.mp3', 1, 1, 1621982528, 1621982528),
(1213, 81, 1, 1, 'Serve The Servants', '', '3:37', 'Sz0Nu6SxyFk04RT5_yoL0OdRgNy53IBr.mp3', 1, 1, 1621982560, 1621982560),
(1214, 81, 1, 2, 'Scentless Apprentice', '', '3:48', 'G4sM9aTbIoWSq5f07OXPSLRhyi4YA4OM.mp3', 1, 1, 1621982560, 1621982560),
(1215, 81, 1, 3, 'Heart-Shaped Box', '', '4:41', '9ww7PAST-jF9iyPMMsTqdnOzelmLRvTb.mp3', 1, 1, 1621982560, 1621982560),
(1216, 81, 1, 4, 'Rape Me', '', '2:50', 'PrAccS0P5-K2Zv2Xigbfm4RmK_HOFc56.mp3', 1, 1, 1621982560, 1621982560),
(1217, 81, 1, 5, 'Frances Farmer Will Have Her Revenge On Seattle', '', '4:10', 'DAFKhvZoaj0-lsTK-SouLKc7NJ7iCSxx.mp3', 1, 1, 1621982560, 1621982560),
(1218, 81, 1, 6, 'Dumb', '', '2:32', 'uMovaZyHKPj8RQL1g_kkvGPXN0lu7tZB.mp3', 1, 1, 1621982560, 1621982560),
(1219, 81, 1, 7, 'Very Ape', '', '1:56', 'xF4DV03U7FXrG_khFA7VRbrCsfIdtQkA.mp3', 1, 1, 1621982560, 1621982560),
(1220, 81, 1, 8, 'Milk It', '', '3:55', 'PMtOuipkmtFG0NCHv2wnmglZC5Mih38D.mp3', 1, 1, 1621982560, 1621982560),
(1221, 81, 1, 9, 'Pennyroyal Tea', '', '3:39', 'gBNTc0h9XWdd5XMLnqpiLKXqvABoid1U.mp3', 1, 1, 1621982560, 1621982560),
(1222, 81, 1, 10, 'Radio Friendly Unit Shifter', '', '4:52', '3PGwf6gA0AEg1gZ57WSCRo8pRxjQCwaP.mp3', 1, 1, 1621982560, 1621982560),
(1223, 81, 1, 11, 'Tourette\'s', '', '1:35', 'Paf0PoIrfcZscJeOJDu_f-mCRXPi8Ae_.mp3', 1, 1, 1621982560, 1621982560),
(1224, 81, 1, 12, 'All Apologies', '', '3:53', 'PFMz_NlxnJBTWAUNh-Z-vAHDzqRpuk01.mp3', 1, 1, 1621982560, 1621982560),
(1225, 82, 1, 1, 'Primo Victoria', '', '4:11', 'Y4LVrWxUt2lDKRDIQfEGhRoLrnXp62nF.mp3', 1, 1, 1621982612, 1621982612),
(1226, 82, 1, 2, 'Reign Of Terror', '', '3:52', 'U4FpJLN2JZyRrlAPQArrCTsY1Vv9h4zq.mp3', 1, 1, 1621982612, 1621982612),
(1227, 82, 1, 3, 'Panzer Battalion', '', '5:10', 'yB_80SnhSzguKMAYKhHPjqJO3qKPV0cm.mp3', 1, 1, 1621982612, 1621982612),
(1228, 82, 1, 4, 'Wolfpack', '', '5:56', '6pWtX4YPwf2UOB0bY0PbEUxgX1bFXFqu.mp3', 1, 1, 1621982612, 1621982612),
(1229, 82, 1, 5, 'Counterstrike', '', '3:48', 's6kJFyKiuLQTEq5mukrfTpfEOocA3yD_.mp3', 1, 1, 1621982612, 1621982612),
(1230, 82, 1, 6, 'Stalingrad', '', '5:18', 'DXPKtYeg5ecqeYuFE5dA003BCRQ5pgIK.mp3', 1, 1, 1621982612, 1621982612),
(1231, 82, 1, 7, 'Into The Fire', '', '3:26', 'Toy3HNfSim1v2vyCqZjfjwEJOKbAdmSz.mp3', 1, 1, 1621982612, 1621982612),
(1232, 82, 1, 8, 'Purple Heart', '', '5:08', 'h8xNDFFtWD8kPMXksJ9WOR4HGz-5L_Dd.mp3', 1, 1, 1621982612, 1621982612),
(1233, 82, 1, 9, 'Metal Machine', '', '4:23', 'j9_zrsFEnBfrnKVQfLcpf2gnhrksCLE_.mp3', 1, 1, 1621982613, 1621982613),
(1234, 83, 1, 1, 'Attero Dominatus', '', '3:43', 'mDvBmjrum4-nwVjYiwPwqXmvnl-am_an.mp3', 1, 1, 1621982653, 1621982653),
(1235, 83, 1, 2, 'Nuclear Attack', '', '4:12', 'WJEq9fdkuGimOJH9aF2m92_BE4f_CnFT.mp3', 1, 1, 1621982653, 1621982653),
(1236, 83, 1, 3, 'Rise Of Evil', '', '8:21', 'C9Y3zPSHNibZmykqxzGbiE0gMLht7Qg3.mp3', 1, 1, 1621982653, 1621982653),
(1237, 83, 1, 4, 'In The Name Of God', '', '4:09', 'aa2a1G9MnjfAhmcjY8G2q4zIUJgq_Vwz.mp3', 1, 1, 1621982653, 1621982653),
(1238, 83, 1, 5, 'We Burn', '', '2:57', '1zMHYsZQu8f0Hszh2zomaDJRKP6YA9eY.mp3', 1, 1, 1621982654, 1621982654),
(1239, 83, 1, 6, 'Angels Calling', '', '5:59', 'mOyT9e80N4xIjozUCsNqDtC1g_AeBPFH.mp3', 1, 1, 1621982654, 1621982654),
(1240, 83, 1, 7, 'Back In Control', '', '3:17', 'jeAWd91pHcUN8YWosNgEG-vI19BqmqBm.mp3', 1, 1, 1621982654, 1621982654),
(1241, 83, 1, 8, 'Light In The Black', '', '4:54', 'i8OFWPY8aP4uAv39NF6ac6obS7se8BK1.mp3', 1, 1, 1621982654, 1621982654),
(1242, 83, 1, 9, 'Metal Crue', '', '3:45', 'SqaI0NF1j6S2HGsFxOPRwa5lCcgAb25S.mp3', 1, 1, 1621982654, 1621982654),
(1243, 84, 1, 1, 'Hellrider', '', '3:42', 'xP5NJEujihTizxVIre-QlGSeye8uefl_.mp3', 1, 1, 1621982692, 1621982692),
(1244, 84, 1, 2, 'Thunder Gods', '', '3:48', '7_z6qhEB0cYsIXCr1m2oNvObEPOnhd3m.mp3', 1, 1, 1621982692, 1621982692),
(1245, 84, 1, 3, 'Metalizer', '', '4:07', 'tjHHC0gLzsDeNAxqa7LWDnfpEJzPF7DZ.mp3', 1, 1, 1621982692, 1621982692),
(1246, 84, 1, 4, 'Shadows', '', '3:29', 'QXgng4-LrYFWYZCGVJmUTCWVRh53ksBj.mp3', 1, 1, 1621982692, 1621982692),
(1247, 84, 1, 5, 'Burn Your Crosses', '', '5:09', 'GGZGSNkEknWOjxnxzFbawNg6zdJcfwbZ.mp3', 1, 1, 1621982692, 1621982692),
(1248, 84, 1, 6, '7734', '', '3:42', 'JNJjsf7D-xyp4kDdAFR-nCnjfsPAb1Lf.mp3', 1, 1, 1621982692, 1621982692),
(1249, 84, 1, 7, 'Endless Nights', '', '4:52', 'o004tzPkkfgbXCU8_ZifTFPLZstdlCbN.mp3', 1, 1, 1621982692, 1621982692),
(1250, 84, 1, 8, 'Hail To The King', '', '3:39', 'k37eSXwxu7joYuVcCc4mLgzcnzs9GDOh.mp3', 1, 1, 1621982693, 1621982693),
(1251, 84, 1, 9, 'Thunderstorm', '', '3:09', 'f7U3rNBmi_EAkq1gHJ4ubYlE_orIlAV5.mp3', 1, 1, 1621982693, 1621982693),
(1252, 84, 1, 10, 'Speeder', '', '3:46', 'CLYTYLWqQl9585ozmfNcx75VbIGbjmQc.mp3', 1, 1, 1621982693, 1621982693),
(1253, 84, 1, 11, 'Masters Of The World', '', '4:02', 'Qhc1hbbDQJpKqtyyOVSUNu9T5b-EyZ5B.mp3', 1, 1, 1621982693, 1621982693),
(1254, 84, 1, 12, 'Jawbreaker', 'Judas Priest Cover', '3:23', '_Mq_61Ii9fG1aZjVws9WOc0mvScAYOzP.mp3', 1, 1, 1621982693, 1621982741),
(1255, 84, 2, 1, 'Introduction', '', '0:56', 'H6a7h2S5m4YeRpmltvvGVmBmMvTdyKlt.mp3', 1, 1, 1621982693, 1621982760),
(1256, 84, 2, 2, 'Hellrider', '', '3:49', 'HFVDNh9HNFpufixPkJs8nWQP1-9tDk_1.mp3', 1, 1, 1621982694, 1621982762),
(1257, 84, 2, 3, 'Endless Nights', '', '4:50', 'bh77k-tAvgkNdSSrh244vT3FAtNc5DNl.mp3', 1, 1, 1621982694, 1621982764),
(1258, 84, 2, 4, 'Metalizer', '', '4:26', '-oD3ij3s5K8hDmrXxYoxJQdR8wncD7d2.mp3', 1, 1, 1621982694, 1621982767),
(1259, 84, 2, 5, 'Burn Your Crosses', '', '5:23', 'PVJKO9lLiJ4qEMI3VpAemnKSY4ybAs_3.mp3', 1, 1, 1621982694, 1621982768),
(1260, 84, 2, 6, 'The Hammer Has Fallen', '', '5:50', 'SIbNgFCfe1f1XIZae7S31SzYsO-7AjtY.mp3', 1, 1, 1621982694, 1621982770),
(1261, 84, 2, 7, 'Hail To The King', '', '4:09', 'cRyKhbByFSWVncv0OO_W_PVmm4vGCNH3.mp3', 1, 1, 1621982694, 1621982772),
(1262, 84, 2, 8, 'Shadows', '', '3:33', 'PfYAm7tclw3MVz_Pxn5UFi9gkUQyKzbj.mp3', 1, 1, 1621982694, 1621982774),
(1263, 84, 2, 9, 'Thunderstorm', '', '3:10', 'SnCN0ECMMJiUmd2gHjvXWDH86i8ZJ0i9.mp3', 1, 1, 1621982694, 1621982776),
(1264, 84, 2, 10, 'Master Of The World', '', '4:01', '5qnQRsqvogw5TvWKcgQpcfg5K4w8bgVD.mp3', 1, 1, 1621982694, 1621982778),
(1265, 84, 2, 11, 'Guten Nacht', '', '1:53', 'fWxE1v7yXcCFD396gn30vjphFzR2au0D.mp3', 1, 1, 1621982694, 1621982780),
(1266, 84, 2, 12, 'Birds Of War', 'Previously Unreleased', '4:53', 'pjCgyZj9MZYMSmEPyk4v9DTdb1-byJlZ.mp3', 1, 1, 1621982694, 1621982815),
(1267, 85, 1, 1, 'Sun Tzu Says', '', '0:24', 'vPtITOIW8jZm5XyOoWSanX_wjBDQvmhJ.mp3', 1, 1, 1621982861, 1621982861),
(1268, 85, 1, 2, 'Ghost Division', '', '3:51', 'T_OcUv5VDaVKor-vC1v_6d3Jp9giKSd3.mp3', 1, 1, 1621982861, 1621982861),
(1269, 85, 1, 3, 'The Art Of War', '', '5:09', '6KbnsOvROM3hc4J6rerUxE1g4a3_537N.mp3', 1, 1, 1621982861, 1621982861),
(1270, 85, 1, 4, '40:1', '', '4:11', 'vSYXWKsT4G8WhvxsAT5U9HCq6zIQJw7C.mp3', 1, 1, 1621982861, 1621982861),
(1271, 85, 1, 5, 'Unbreakable', '', '5:58', 'Gdj-IbfqXYicUlClQgFPoWObCZJIdBRG.mp3', 1, 1, 1621982861, 1621982861),
(1272, 85, 1, 6, 'The Nature Of Warfare', '', '1:19', '7BTojousEO5rVp5RQQafRPpWf87SV6Uo.mp3', 1, 1, 1621982861, 1621982861),
(1273, 85, 1, 7, 'Cliffs Of Gallipoli', '', '5:52', 'QIPZMVX_WLppzUTqAq4UJLMtqHBoKRrW.mp3', 1, 1, 1621982861, 1621982861),
(1274, 85, 1, 8, 'Talvisota', '', '3:32', 'iMm_BbxFEEmrFmDpy0U5lOVL4HaZmTKS.mp3', 1, 1, 1621982861, 1621982861),
(1275, 85, 1, 9, 'Panzerkampf', '', '5:16', 'CD-reC_jA1NL4LUcuvQSL35IdZddzT7c.mp3', 1, 1, 1621982861, 1621982861),
(1276, 85, 1, 10, 'Union (Slopes Of St. Benedict)', '', '4:05', 'Kt5Bmc5RoVvALAbltlAu1K1Xkn2nGDYW.mp3', 1, 1, 1621982861, 1621982861),
(1277, 85, 1, 11, 'The Price Of A Mile', '', '5:56', 'sI-JsKi0ie8wMgr0e-TswYLSabtT2veB.mp3', 1, 1, 1621982862, 1621982862),
(1278, 85, 1, 12, 'Firestorm', '', '3:26', '0LMdr9_D_pbjTaT-yM6RLqXsRfLxO48X.mp3', 1, 1, 1621982862, 1621982862),
(1279, 85, 1, 13, 'A Secret', '', '0:38', '9KQ6f4u_HvDrJiq7U8cPDAvpv-OXFNXQ.mp3', 1, 1, 1621982862, 1621982862),
(1280, 86, 1, 1, 'Coat Of Arms', '', '3:35', 'gZslFrj01fTb7mDmGWSHO5EVnwzRkf1r.mp3', 1, 1, 1621982923, 1621982923),
(1281, 86, 1, 2, 'Midway', '', '2:29', 'pHLOcc8RfN8AVRUCIwqHCXGk02YJrPkH.mp3', 1, 1, 1621982923, 1621982923),
(1282, 86, 1, 3, 'Uprising', '', '4:56', 'opk-X74ms83I-Hf4HyD78MxXExUDUoNJ.mp3', 1, 1, 1621982923, 1621982923),
(1283, 86, 1, 4, 'Screaming Eagles', '', '4:08', 'DRpId5GlcElDsaW_QjT5QZNaHAlzoCvm.mp3', 1, 1, 1621982923, 1621982923),
(1284, 86, 1, 5, 'The Final Solution', '', '4:57', 'Bum2IyUDZgnxHGlfxqA3QBfTixmnKp2o.mp3', 1, 1, 1621982923, 1621982923),
(1285, 86, 1, 6, 'Aces In Exile', '', '4:23', 'u61Uin3QyC0KcWRx6W9MAx9LG6ZjqnXd.mp3', 1, 1, 1621982924, 1621982924),
(1286, 86, 1, 7, 'Saboteurs', '', '3:16', 'aAxoCicectw3zVdYWWfixOxBt7lALm-b.mp3', 1, 1, 1621982924, 1621982924),
(1287, 86, 1, 8, 'Wehrmacht', '', '4:14', 'OIXC7k5R90Yo_MKssYAIxiFYKe8p6jGN.mp3', 1, 1, 1621982924, 1621982924),
(1288, 86, 1, 9, 'White Death', '', '4:10', 'TiuyegtLuarf_swV80EPY9iaMlc3IcJl.mp3', 1, 1, 1621982924, 1621982924),
(1289, 86, 1, 10, 'Metal Ripper', '', '3:53', 'dIGIv3dshRWw76LrE_fyspHYNvI1mn1P.mp3', 1, 1, 1621982924, 1621982924),
(1290, 86, 1, 11, 'Coat Of Arms', 'Instrumental', '3:35', 'OMPzLs4pRYrA5Aa_K5qVy3MTf-2AgoXS.mp3', 1, 1, 1621982924, 1621982938),
(1291, 86, 1, 12, 'Metal Ripper', 'Instrumental', '3:47', 'P_pZMFKd9w-hpaqMrCHHP-MUeZw4xvOX.mp3', 1, 1, 1621982924, 1621982948),
(1292, 87, 1, 1, 'Dominium Maris Baltici', '', '0:29', '__ZIEZhf6GrhWPnMpT4bZ-OjpnujgU7s.mp3', 1, 1, 1621983002, 1621983002),
(1293, 87, 1, 2, 'The Lion From The North', '', '4:43', 'AJF_rQ6HvZVpptYR_nb0tgRPf0Jqoe97.mp3', 1, 1, 1621983002, 1621983002),
(1294, 87, 1, 3, 'Gott Mit Uns', '', '3:16', 'mnQ9cuIpQN2lO5UK8WsDvALxe9cMYtlh.mp3', 1, 1, 1621983002, 1621983002),
(1295, 87, 1, 4, 'A Lifetime Of War', '', '5:45', 'gQEFypf6melN8QXeO8ireqivDQ5ZTz--.mp3', 1, 1, 1621983002, 1621983002),
(1296, 87, 1, 5, '1 6 4 8', '', '3:55', 'a9uoFzy3WYU4FaT7nmkV4bYjcGlIVuik.mp3', 1, 1, 1621983002, 1621983002),
(1297, 87, 1, 6, 'The Carolean\'s Prayer', '', '6:14', 'ezulX5RHP55DjqgOLTmN5ES2y6FRguxc.mp3', 1, 1, 1621983002, 1621983002),
(1298, 87, 1, 7, 'Carolus Rex', 'English Version', '4:54', 'YRbz8_bWHzNNXtRkPBQZVMs_aGmjxegv.mp3', 1, 1, 1621983002, 1621983021),
(1299, 87, 1, 8, 'Killing Ground', '', '4:25', 'mpK0XFB5koj5qIFg9gOdIxYcajU-IfTU.mp3', 1, 1, 1621983002, 1621983002),
(1300, 87, 1, 9, 'Poltava', '', '4:04', 'IZvz7OQvkRPhDHLcjPZdfWRBAg6gU8WR.mp3', 1, 1, 1621983002, 1621983002),
(1301, 87, 1, 10, 'Long Live The King', '', '4:10', '1bZYSNIHoHuB5afMMXmdN4TP02PE59Oy.mp3', 1, 1, 1621983002, 1621983002),
(1302, 87, 1, 11, 'Ruina Imperii', '', '3:21', 'glYz-pgjuh39umJeqHtFsFmfVzqPx_4a.mp3', 1, 1, 1621983002, 1621983002),
(1303, 87, 1, 12, 'Twilight Of The Thundergod', '', '3:59', 'dX353AJDtnTdcW0BzH9kdfMbEQGk4ba1.mp3', 1, 1, 1621983002, 1621983002),
(1304, 87, 1, 13, 'In The Army Now', '', '3:59', 'qsGKzdHyLDzIPpHzjhDcoJxZTduAWg0H.mp3', 1, 1, 1621983003, 1621983003),
(1305, 87, 1, 14, 'Feuer Frei', '', '3:12', 'm3B0mMnzmvq-y8YxRviPXN63d-FpCP8P.mp3', 1, 1, 1621983003, 1621983003),
(1306, 87, 2, 1, 'Dominium Maris Baltici', '', '0:29', '1CKk5evuAZlKpDbqkHTb4sVElD5p9Dk1.mp3', 1, 1, 1621983003, 1621983059),
(1307, 87, 2, 2, 'Lejonet Fran Norden', '', '4:43', 'k49WKfoZb2IzUomlI26nlfFIvPO9Qth9.mp3', 1, 1, 1621983003, 1621983061),
(1308, 87, 2, 3, 'Gott Mit Uns', '', '3:16', 'cvXhi1LRtPZkRBmCL4jWNCS6ygomikGD.mp3', 1, 1, 1621983003, 1621983064),
(1309, 87, 2, 4, 'En Livstid I Krig', '', '5:44', '0e1loyMKWiqVtIqXDX_EnH6SqVy9SMGa.mp3', 1, 1, 1621983003, 1621983066),
(1310, 87, 2, 5, '1 6 4 8', '', '3:56', 'Hml485um_M_-ZgK8pEU5URNqqdTHLHhD.mp3', 1, 1, 1621983003, 1621983068),
(1311, 87, 2, 6, 'Karolinens Bon', '', '6:14', '8Ac5L-OuwcYgqaQNYY1XiY4jH6u4S9_h.mp3', 1, 1, 1621983003, 1621983070),
(1312, 87, 2, 7, 'Carolus Rex', 'Swedish Version', '4:54', 'yHOAif3Xs88GxXST2hOhn48ECR__jlbn.mp3', 1, 1, 1621983003, 1621983099),
(1313, 87, 2, 8, 'Ett Slag Fargat Rott', '', '4:25', '7hky-yF2mxjzKvLyfKTKIEyyOWlybrx0.mp3', 1, 1, 1621983003, 1621983073),
(1314, 87, 2, 9, 'Poltava', '', '4:03', '8I_YxAyjuHX2Yj8uWBmHkoZ-bUjRErQH.mp3', 1, 1, 1621983003, 1621983075),
(1315, 87, 2, 10, 'Konungens Likfard', '', '4:10', '5EURKE6eSMxyNFA9MPdcOYTuVE4Pe-KA.mp3', 1, 1, 1621983004, 1621983077),
(1316, 87, 2, 11, 'Ruina Imperii', '', '3:21', 'v8znRWd6ThsO0dr0lnvWRf-bZFf7SY9N.mp3', 1, 1, 1621983004, 1621983079),
(1317, 88, 1, 1, 'Night Witches', '', '3:01', 'gbFzN7giSnEWuQtVEUPkwN8VMXUwRQKG.mp3', 1, 1, 1621983138, 1621983138),
(1318, 88, 1, 2, 'No Bullets Fly', '', '3:38', 'IV7K-mPXDN8vmcsWgU1vZh4ru-0fewTz.mp3', 1, 1, 1621983138, 1621983138),
(1319, 88, 1, 3, 'Smoking Snakes', '', '3:15', 'yTkaXSDv60p5mEfIzUENasPGELU4j9Hp.mp3', 1, 1, 1621983138, 1621983138),
(1320, 88, 1, 4, 'Inmate 4859', '', '4:26', '97NxzGjbt3G01rq53A6LaCMv5pecDGgF.mp3', 1, 1, 1621983138, 1621983138),
(1321, 88, 1, 5, 'To Hell And Back', '', '3:27', '4ZEgk7cgoox4e_gVPDhbq9nSvpxT8Ocx.mp3', 1, 1, 1621983138, 1621983138),
(1322, 88, 1, 6, 'The Ballad Of Bull', '', '3:53', 'DP741BKuJhug3mev83tPRUjT7tyKpNnc.mp3', 1, 1, 1621983138, 1621983138),
(1323, 88, 1, 7, 'Resist And Bite', '', '3:27', 'cPCyo1zVSEiRR5_fYKxILQQlyvQXK3yH.mp3', 1, 1, 1621983138, 1621983138),
(1324, 88, 1, 8, 'Soldier Of 3 Armies', '', '3:38', 'w2PulWKBOzc9jnxbFf-aZzEK05egrxb_.mp3', 1, 1, 1621983138, 1621983138),
(1325, 88, 1, 9, 'Far From The Fame', '', '3:47', 'eRmeIYKEKkTUFFsm_gKq-qCkyTweXDEk.mp3', 1, 1, 1621983138, 1621983138),
(1326, 88, 1, 10, 'Hearts Of Iron', '', '4:28', 'nts3BdCRrkSUBypTBgHRBQErS0SQubce.mp3', 1, 1, 1621983138, 1621983138),
(1327, 88, 2, 1, '7734', '', '3:33', 'UM28ut_CbR4_2IQcWRE4l6QBq-RSmikt.mp3', 1, 1, 1621983138, 1621983153),
(1328, 88, 2, 2, 'Man Of War', '', '3:48', 'WbLB7J2QSqFO7yNrV88dV0OZ58myA9xX.mp3', 1, 1, 1621983138, 1621983155),
(1329, 88, 2, 3, 'For Whom The Bell Tolls', '', '5:23', 'PCXrsIyckwrRaYgCqgs_1kIQUbEAOffJ.mp3', 1, 1, 1621983138, 1621983157),
(1330, 88, 2, 4, 'En Hjaltes Vag', '', '4:27', '7JNcbNu1SuEZ2XhuRGsnPO9qDynLzM2r.mp3', 1, 1, 1621983138, 1621983158),
(1331, 88, 2, 5, 'Out Of Control', '', '3:37', 'QmMrKo2FUdIjjPb8B4DMo8LsaW2gcdYv.mp3', 1, 1, 1621983139, 1621983161),
(1332, 89, 1, 1, 'Alerion', '', '2:15', 'NG6p-QaLEYv-JGWX38gF9Bbe0fYw_EmX.mp3', 1, 1, 1621983308, 1621983308),
(1333, 89, 1, 2, 'Final Episode (Let\'s Change The Channel)', '', '4:02', '_mSiEJdf7dWPdystSeeUBUyk2-wZA92z.mp3', 1, 1, 1621983308, 1621983308),
(1334, 89, 1, 3, 'A Candlelit Dinner With Inamorta', '', '4:04', 'qiBHnRaT1eG_v_juZfnEgkWtcn7bJ-My.mp3', 1, 1, 1621983308, 1621983308),
(1335, 89, 1, 4, 'Nobody Don\'t Dance No More', '', '4:00', 'iNLguGSzcrb046DuxKvG7F3cU66LPn5n.mp3', 1, 1, 1621983308, 1621983308),
(1336, 89, 1, 5, 'Hey There Mr. Brooks', '', '4:10', '3usLNzGL32FOGlkljcMz75Oqb_2xOuKw.mp3', 1, 1, 1621983308, 1621983308),
(1337, 89, 1, 6, 'Hiatus', '', '1:45', 'hqoErahZDlVacqvlKYN99rAcSVmxAhDV.mp3', 1, 1, 1621983308, 1621983308),
(1338, 89, 1, 7, 'If You Can\'t Ride Two Horses At Once...You Should Get Out Of The Circus', '', '3:46', 'pyYzoDp5JXB4gmcTAJByH7k85v6f6TPn.mp3', 1, 1, 1621983308, 1621983308),
(1339, 89, 1, 8, 'A Single Moment Of Sincerity', '', '3:51', 'Fm_Mdi8P3AUl4QQODdCMVtZS_Lppg11p.mp3', 1, 1, 1621983308, 1621983308),
(1340, 89, 1, 9, 'Not The American Average', '', '4:39', 'uLBFqtwNqRNLYTcOnq78V6yiTs1GVuLh.mp3', 1, 1, 1621983309, 1621983309),
(1341, 89, 1, 10, 'I Used To Have A Best Friend (But Then He Gave Me An STD)', '', '4:06', '-z8h8-rufEWa7N3JAFRZkAof4I_kkZkU.mp3', 1, 1, 1621983309, 1621983309),
(1342, 89, 1, 11, 'A Prophecy', '', '3:34', 'JfrAXxVN4A6cW1EM_AiE1M3u6ApFx1MU.mp3', 1, 1, 1621983309, 1621983309),
(1343, 89, 1, 12, 'I Was Once, Possibly, Maybe, Perhaps A Cowboy King', '', '3:41', 'scVN3ylz1wjFcKIcQMSRXOfbOxPswswR.mp3', 1, 1, 1621983309, 1621983309),
(1344, 89, 1, 13, 'When Everyday\'s The Weekend', '', '4:23', 'LTR3WCWGejeP-yL3fSu6EhmTUHUdQCBq.mp3', 1, 1, 1621983309, 1621983309),
(1345, 90, 1, 1, 'Welcome', '', '1:49', 'qCLHngffXRTYXc3uB6RG7Pa11U9sxRYq.mp3', 1, 1, 1621983357, 1621983357),
(1346, 90, 1, 2, 'Dear Insanity', '', '3:10', 'soOgo2TzFyepd3vOKPi-P8TGFq2wqvTe.mp3', 1, 1, 1621983357, 1621983357),
(1347, 90, 1, 3, 'Closure', '', '3:58', 'Hf9JuBnQrvZu4auLro5rVpRc32oe_oZL.mp3', 1, 1, 1621983357, 1621983357),
(1348, 90, 1, 4, 'A Lesson Never Learned', '', '3:55', 'pMCfhzwtH71sXLRtPKDVKp-X3IhsmUQi.mp3', 1, 1, 1621983357, 1621983357),
(1349, 90, 1, 5, 'To The Stage', '', '3:31', 'oSQ8LBDHWYQQtpFz_0XFcJoj9odKtGJR.mp3', 1, 1, 1621983357, 1621983357),
(1350, 90, 1, 6, 'Dedication', '', '1:03', 'lXha4UYzRGlQifyFS9ejZhdd1sWqLKaJ.mp3', 1, 1, 1621983357, 1621983357),
(1351, 90, 1, 7, 'Someone, Somewhere', '', '3:37', 'T2tTec3B3GT8FYB3NOfvkv6Own8gIvEe.mp3', 1, 1, 1621983358, 1621983358),
(1352, 90, 1, 8, 'Breathless', '', '4:10', 'wFV5jY7sdStXQhapCSFRxV7MrJE9VnCb.mp3', 1, 1, 1621983358, 1621983358),
(1353, 90, 1, 9, 'The Match', '', '4:16', 'EagPdmowv-ZErikJOrEB_-apoQFsPFRB.mp3', 1, 1, 1621983358, 1621983358),
(1354, 90, 1, 10, 'Another Bottle Down', '', '3:34', 'KvdK-6mS8DbMYhFLsGxonN_VsKooIcbP.mp3', 1, 1, 1621983358, 1621983358),
(1355, 90, 1, 11, 'Reckless &amp; Relentless', '', '4:08', 'lO5Ys88ToDPUypqCCUVuo70gyZ6OvFTO.mp3', 1, 1, 1621983358, 1621983358),
(1356, 90, 1, 12, 'Morte Et Dabo', '', '5:15', 'Q8ucWZPAyPDBDi6BIIzquAGxcmhDS79n.mp3', 1, 1, 1621983358, 1621983358),
(1357, 90, 1, 13, 'The Final Episode (Let\'s Change The Channel)', 'Borgore Remix', '4:12', '6Obw3eA9iw1IwOzDZUUi3mtQVP248b9x.mp3', 1, 1, 1621983358, 1621983382),
(1358, 90, 1, 14, 'A Candlelit Dinner With Inamorta', 'Run DMT Remix', '4:14', 'QdgUSltjmE87dPIelhP-bQ_UKxcCrol2.mp3', 1, 1, 1621983358, 1621983400),
(1359, 90, 1, 15, 'A Prophecy', 'Big Chocolate Electro Remix', '4:17', 'McPbMs8KQu5DtYOai8-BTTUVzWajrYan.mp3', 1, 1, 1621983358, 1621983407),
(1360, 91, 1, 1, 'Don\'t Pray For Me', '', '4:40', 'HZd7EDsU8ZEC6XoV6VQlbR8jEkrzK76z.mp3', 1, 1, 1621983497, 1621983497),
(1361, 91, 1, 2, 'Killing You', '', '3:12', 'QGzu045AKT9oanQYOSgDOEcDBepXrr5t.mp3', 1, 1, 1621983497, 1621983497),
(1362, 91, 1, 3, 'The Death Of Me', '', '4:19', 'y0jt_aFYp5WxgOqqDnmrmX0LCqwaebA_.mp3', 1, 1, 1621983497, 1621983497),
(1363, 91, 1, 4, 'Run Free', '', '4:11', 'GeG95KR9nVlGboAxCH23cHGmRV43rAIk.mp3', 1, 1, 1621983497, 1621983497),
(1364, 91, 1, 5, 'Break Down The Walls', '', '3:31', 'EcbyAYhGMHHB_aUrik-QfUTZtJ_B2Lz5.mp3', 1, 1, 1621983497, 1621983497),
(1365, 91, 1, 6, 'Poison', '', '3:47', 'F3r88QkuYdOtHycqDsrdvhtlR12M-NJx.mp3', 1, 1, 1621983497, 1621983497),
(1366, 91, 1, 7, 'Believe', '', '4:31', '1tHfxAKol-rBielzoSM8oqhh8LQlgQnE.mp3', 1, 1, 1621983498, 1621983498),
(1367, 91, 1, 8, 'Creature', '', '3:14', 'iW2T4D5SAy8m3znjRF9xpwmcQ2gGLADO.mp3', 1, 1, 1621983498, 1621983498),
(1368, 91, 1, 9, 'White Line Fever', '', '3:44', '5wnQupRA-LU5E7FQw3gCNnrskVJ38stg.mp3', 1, 1, 1621983498, 1621983498),
(1369, 91, 1, 10, 'Moving On', '', '4:03', 'fCmDhuMxZmEyc5XDYCp4JshTUCwYqgIr.mp3', 1, 1, 1621983498, 1621983498),
(1370, 91, 1, 11, 'The Road', '', '3:27', '4J7-4F2Vw1x09L6YcN76FRdtBjWjgBzb.mp3', 1, 1, 1621983498, 1621983498),
(1371, 91, 1, 12, 'Until The End', '', '4:31', 'wn9qFGfLM2yke3W0LsveAeYRFUESt36A.mp3', 1, 1, 1621983499, 1621983499),
(1372, 92, 1, 1, 'Alone In A Room', '', '4:06', 'mgC0zks1ybwXYRhyxJ4jduLhbYC3xn-j.mp3', 1, 1, 1621983525, 1621983525),
(1373, 92, 1, 2, 'Into The Fire', '', '3:57', 'zmfM74-Eg1M7tR_KG3Am-gpOzZP3IiO1.mp3', 1, 1, 1621983525, 1621983525),
(1374, 92, 1, 3, 'Hopelessly Hopeful', '', '3:14', 'JDyLZ9s69anauNKiPp8WjUD8X3y_qZrX.mp3', 1, 1, 1621983525, 1621983525),
(1375, 92, 1, 4, 'Where Did It Go?', '', '3:14', 'PGAere24ya3mwaAKMcdhZ4mgBtlD7wZW.mp3', 1, 1, 1621983525, 1621983525),
(1376, 92, 1, 5, 'Rise Up', '', '3:07', '2vOtipF-8Pm0gasa7FWvDJJ-Kz01Gw2w.mp3', 1, 1, 1621983526, 1621983526),
(1377, 92, 1, 6, 'When The Lights Come On', '', '3:23', 'IyhuPkick7rjLKfXboJBc3myibRGtZ1G.mp3', 1, 1, 1621983526, 1621983526),
(1378, 92, 1, 7, 'Under Denver', '', '4:06', 'qIyZ4Ed3rJbeL95a_s3Au9-4MECh36L8.mp3', 1, 1, 1621983526, 1621983526),
(1379, 92, 1, 8, 'Vultures', '', '3:29', 'AQhq5dWUTUD7yK55Gs-Ovk2ksmvl-xeK.mp3', 1, 1, 1621983526, 1621983526),
(1380, 92, 1, 9, 'Eve', '', '3:59', 'Y7DtxkBSdwbc6eQ952ye195vJlQJ7MSo.mp3', 1, 1, 1621983526, 1621983526),
(1381, 92, 1, 10, 'I Am One', '', '3:33', 'GyUi_H2GbMo8oTIotzwWry6bPn_XibJ3.mp3', 1, 1, 1621983526, 1621983526),
(1382, 92, 1, 11, 'Empire', '', '4:17', 'XxJ1yIp72Fh7p5R94N2W4_VG8VYwqlvz.mp3', 1, 1, 1621983526, 1621983526),
(1383, 92, 1, 12, 'Room 138', '', '3:44', '4mtSkjrjJrWV79D9GgtXil2plG8Z5hvq.mp3', 1, 1, 1621983526, 1621983526),
(1384, 93, 1, 1, 'Implicit Demand For Proof', '', '4:53', 'fU-7T3hdha1msuda_Iai1jAz5zRI1SKb.mp3', 1, 1, 1621983577, 1621983577),
(1385, 93, 1, 2, 'Fall Away', '', '3:02', 'iR5e0h1wjbGqxgkljsxzeWXioClaeu0l.mp3', 1, 1, 1621983577, 1621983577),
(1386, 93, 1, 3, 'The Pantaloon', '', '3:34', 'pVMmVe4TG3TkSeK7VBl90VPjBNa0Ee-E.mp3', 1, 1, 1621983577, 1621983577),
(1387, 93, 1, 4, 'Addict With A Pen', '', '4:47', 'woqLzp53jCZppRlkjzyy02uoANUKjBa-.mp3', 1, 1, 1621983577, 1621983577),
(1388, 93, 1, 5, 'Friend, Please', '', '4:14', 'KtSRYRN3h5KhuilXqp11QgPs4jRkqTSL.mp3', 1, 1, 1621983577, 1621983577),
(1389, 93, 1, 6, 'March to The Sea', '', '5:33', '8sWKhQlxsfCS3F6FpXz_79dQ8QOGxNf7.mp3', 1, 1, 1621983577, 1621983577),
(1390, 93, 1, 7, 'Johnny Boy', '', '4:40', 'yPp-0_4oGGhwNVZowJwdqXUt7xnIMFzc.mp3', 1, 1, 1621983577, 1621983577),
(1391, 93, 1, 8, 'Oh, Ms. Believer', '', '3:38', '-Ck9DvbF6SgDwPIOc8C2sYzVbMKOY4cJ.mp3', 1, 1, 1621983577, 1621983577),
(1392, 93, 1, 9, 'Air Catcher', '', '4:15', 'LNgeAYcvnl63xHzheo_tRs8AOcE1qO0V.mp3', 1, 1, 1621983578, 1621983578),
(1393, 93, 1, 10, 'Trapdoor', '', '4:38', 'fKnvsrTDQ5cO36ZZWd-jErGuiNh7KCvP.mp3', 1, 1, 1621983578, 1621983578),
(1394, 93, 1, 11, 'A Car, A Torch, A Death', '', '4:34', 'suk-2Sw9tpjjWFjHXYYyGSHodgK_d157.mp3', 1, 1, 1621983578, 1621983578),
(1395, 93, 1, 12, 'Taxi Cab', '', '4:46', 'lUleDbVYSsuOCrmYb9_O9Fdo-lILG-jA.mp3', 1, 1, 1621983578, 1621983578),
(1396, 93, 1, 13, 'Before You Start Your Day', '', '3:54', 'R3kEMsC9cE09HWgwP8EW4eRmc9QpSXi0.mp3', 1, 1, 1621983579, 1621983579),
(1397, 93, 1, 14, 'Isle of Flightless Birds', '', '5:46', 'cppCequLJlmj7fiOCgTPkRfNXAAuaf5E.mp3', 1, 1, 1621983579, 1621983579),
(1446, 94, 1, 1, 'Guns For Hands', '', '4:33', '0umdJDAfCcM-kwx9Zohc24rcTW6B6y_T.mp3', 1, 1, 1621984072, 1621984104),
(1447, 94, 1, 2, 'Holding on to You', '', '4:22', 'C3E3Rkh3ckEIJJFxfM5iFMwN1r_NJEQ2.mp3', 1, 1, 1621984072, 1621984108),
(1448, 94, 1, 3, 'Ode to Sleep', '', '5:07', '6eFOdHHd93TWmz6AFw6BT8WRSHzTYnzw.mp3', 1, 1, 1621984072, 1621984110),
(1449, 94, 1, 4, 'Slowtown', '', '4:53', 'ONkiL5GGsHlmoiMSD5gYYFcSsgqUvmtS.mp3', 1, 1, 1621984072, 1621984113),
(1450, 94, 1, 5, 'Car Radio', '', '4:44', '9J-VkWiNJnHoQYfraDcKqZQmfYKqJB-E.mp3', 1, 1, 1621984072, 1621984116),
(1451, 94, 1, 6, 'Forest', '', '4:05', 'HDHWX23wTVFoBFDJ67lluVeUmrFD39aH.mp3', 1, 1, 1621984072, 1621984120),
(1452, 94, 1, 7, 'Glowing Eyes', '', '4:22', 'Atgj77X3QsvJydQYsaSh_og-0qFEiw6p.mp3', 1, 1, 1621984072, 1621984124),
(1453, 94, 1, 8, 'Kitchen Sink', '', '5:30', '2q-VcSQnsAQqlf9U4P_al1q7L4kPPN8f.mp3', 1, 1, 1621984072, 1621984138),
(1454, 94, 1, 9, 'Anathema', '', '3:56', 'qP_CvJVH8CqvPe2yoRjbpZj0OkkpAZpE.mp3', 1, 1, 1621984072, 1621984141),
(1455, 94, 1, 10, 'Lovely', '', '4:17', 'QlcCkXXrjt9FYb2TFKJ504tx2RF5BcmC.mp3', 1, 1, 1621984072, 1621984145),
(1456, 94, 1, 11, 'Ruby', '', '4:27', 'yuz7N7LiGjEk-KaGoRzOt_Cfe_8XxFig.mp3', 1, 1, 1621984072, 1621984147),
(1457, 94, 1, 12, 'Trees', '', '4:16', 'MetDh2ca72H2WdBBUhloX6ihjjMZMzL2.mp3', 1, 1, 1621984072, 1621984151),
(1458, 94, 1, 13, 'Be Concerned', '', '4:04', 'fyzUH1_Sjdjx4pQwRYUQE81JvKZrxo4h.mp3', 1, 1, 1621984072, 1621984153),
(1459, 94, 1, 14, 'Clear', '', '3:39', 'Yaetzo7lqnNnSl1Ju6c3DpxXVuNbg6GF.mp3', 1, 1, 1621984073, 1621984157),
(1460, 94, 1, 15, 'House of Gold', '', '2:43', 'DYP0pRxgZ550fod68Rul3S0dHSC1hgKK.mp3', 1, 1, 1621984073, 1621984161),
(1461, 94, 1, 16, 'Two', '', '3:04', 's2q65aYI-WDl80OGCVcwmcZ3l7NjOFGV.mp3', 1, 1, 1621984073, 1621984164),
(1462, 95, 1, 1, 'Ode To Sleep', '', '5:08', 'hriuPQiN_47DgRAEZxr28pkwTqfqpLst.mp3', 1, 1, 1621984232, 1621984232),
(1463, 95, 1, 2, 'Holding On To You', '', '4:24', '2P65cHXtCLdhICtUySr-Uv0NrgIomDb-.mp3', 1, 1, 1621984232, 1621984232),
(1464, 95, 1, 3, 'Migraine', '', '3:59', 'KG43EDiA18NSZYxXzuK3HgpYNzMfhQk0.mp3', 1, 1, 1621984232, 1621984232),
(1465, 95, 1, 4, 'House of Gold', '', '2:44', 'Nogfc6yZerHPrlMgxfeb23ipxzOhwxCH.mp3', 1, 1, 1621984232, 1621984232),
(1466, 95, 1, 5, 'Car Radio', '', '4:28', 'Zk5l4PCeBkaAemkuctGsU5rz_j5jXZ7L.mp3', 1, 1, 1621984233, 1621984233),
(1467, 95, 1, 6, 'Semi-Automatic', '', '4:14', '0Bb7a8zaXe11JrNE4DkF_bfBVqQ7Qn_f.mp3', 1, 1, 1621984233, 1621984233),
(1468, 95, 1, 7, 'Screen', '', '3:49', 'o2CBr-J5r2EFAwaMunxYtY47reAYZGxr.mp3', 1, 1, 1621984233, 1621984233),
(1469, 95, 1, 8, 'The Run And Go', '', '3:49', '3q-olnrLRiRBXLxfmV3FBJ3MthJ59253.mp3', 1, 1, 1621984233, 1621984233),
(1470, 95, 1, 9, 'Fake You Out', '', '3:51', 'qIp5apogXhk7nDAKrl2aZ4veqNNgPz9M.mp3', 1, 1, 1621984233, 1621984233),
(1471, 95, 1, 10, 'Guns For Hands', '', '4:33', '-goLbryLPjM9Ldur3JoeczupmYO6nXPL.mp3', 1, 1, 1621984233, 1621984233),
(1472, 95, 1, 11, 'Trees', '', '4:27', 'uzzq1YWv2bCCh8nvsdCVy-LT_ddfl3bL.mp3', 1, 1, 1621984233, 1621984233),
(1473, 95, 1, 12, 'Truce', '', '2:23', 'D5fI9gGRSD6wXFsv1RTIvVDnUEVbi-bE.mp3', 1, 1, 1621984233, 1621984233),
(1474, 95, 1, 13, 'Glowing Eyes', '', '4:26', 'BjdxDwBMUVGjINQN-LuUom7RwLY7Y7TB.mp3', 1, 1, 1621984233, 1621984233),
(1475, 95, 1, 14, 'Kitchen Sink', '', '5:34', 'ybG-041h2Jq55EaTh4Ms7sIcr-Hzw7MN.mp3', 1, 1, 1621984233, 1621984233),
(1476, 95, 1, 15, 'Lovely', '', '4:19', 'H84-Q1XnELcaCm4WRmGUIDjHFWSHO16K.mp3', 1, 1, 1621984233, 1621984233),
(1477, 95, 1, 16, 'Forest', '', '4:06', 'DFymbf4Ltw66bGsunvk9A4Vfh8C1Yk1I.mp3', 1, 1, 1621984233, 1621984233);
INSERT INTO `track` (`id`, `album`, `disk`, `number`, `name`, `signature`, `playtime`, `file`, `creator`, `editor`, `created_at`, `updated_at`) VALUES
(1478, 96, 1, 1, 'Heavydirtysoul', '', '3:55', '2xWkQD6m-O3UtPfrG-U5zoSKCBJ2NfUs.mp3', 1, 1, 1621984266, 1621984266),
(1479, 96, 1, 2, 'Stressed Out', '', '3:22', 'ZOdVE8hfpsXxP4ruqiVpihovZyy67MXl.mp3', 1, 1, 1621984266, 1621984266),
(1480, 96, 1, 3, 'Ride', '', '3:35', '-m47j9Q9Zm0ZEIxJhh4W-Ncu98MTqQ4c.mp3', 1, 1, 1621984266, 1621984266),
(1481, 96, 1, 4, 'Fairly Local', '', '3:27', 'Kzo6rp1R78-Af1PnrEKbKI1KsBggyeac.mp3', 1, 1, 1621984266, 1621984266),
(1482, 96, 1, 5, 'Tear In My Heart', '', '3:09', 'zZP8xrG2YnkQy0PE7J9ErUJw9FBW5Y_Z.mp3', 1, 1, 1621984266, 1621984266),
(1483, 96, 1, 6, 'Lane Boy', '', '4:13', 'wE_mDYSN8cJm2QV7VpJJrZq2rAS6QMhj.mp3', 1, 1, 1621984267, 1621984267),
(1484, 96, 1, 7, 'The Judge', '', '4:58', 'ubOnlC8NKOXFFf1pv8XLaTyD05OM__gB.mp3', 1, 1, 1621984267, 1621984267),
(1485, 96, 1, 8, 'Doubt', '', '3:12', 'ufEXiE7w0cVAn_k7rSJWWULDCnE1uxRX.mp3', 1, 1, 1621984267, 1621984267),
(1486, 96, 1, 9, 'Polarize', '', '3:47', 'nip_F2gEn6EHJEbe-L5AeORgLlvTyyTk.mp3', 1, 1, 1621984267, 1621984267),
(1487, 96, 1, 10, 'We Don\'t Believe What\'s On TV', '', '2:57', 'zZ0hpK7Tl_4VIhH8g-xSCScIfcKK__F3.mp3', 1, 1, 1621984267, 1621984267),
(1488, 96, 1, 11, 'Message Man', '', '4:00', 'QXyenkD4Fz2-xA__EBPba42GKXV6bBGS.mp3', 1, 1, 1621984267, 1621984267),
(1489, 96, 1, 12, 'Hometown', '', '3:55', '3ze0162uBcxJg24M7svMcuhKBqBYQjcB.mp3', 1, 1, 1621984267, 1621984267),
(1490, 96, 1, 13, 'Not Today', '', '3:58', '2WHO3f_AcngaQNsbaM6re3cZfOwY7s7f.mp3', 1, 1, 1621984267, 1621984267),
(1491, 96, 1, 14, 'Goner', '', '3:57', 't934Oq4qe8SFAzrqvj3Cuv9mZDQUHXk6.mp3', 1, 1, 1621984267, 1621984267),
(1492, 97, 1, 1, 'Jumpsuit', '', '3:59', 'tbkxqaHgFeEKZXDqtltz7s9MGGrmqyRA.mp3', 1, 1, 1621984300, 1621984300),
(1493, 97, 1, 2, 'Levitate', '', '2:26', 'Q70jgAzh88HeG1lHepWIIJmQVj3L-EQ7.mp3', 1, 1, 1621984300, 1621984300),
(1494, 97, 1, 3, 'Morph', '', '4:20', 'VYRWLqSzGTTIuMO4XF_QOJdZJ74RqpLM.mp3', 1, 1, 1621984300, 1621984300),
(1495, 97, 1, 4, 'My Blood', '', '3:50', 'DOyGET0PqFt7iCt_9Nzma4PGEg0Pmg2K.mp3', 1, 1, 1621984300, 1621984300),
(1496, 97, 1, 5, 'Chlorine', '', '5:25', 'I3m66epZxUh3AeMnFTqOs51N9ooHyRRz.mp3', 1, 1, 1621984300, 1621984300),
(1497, 97, 1, 6, 'Smithereens', '', '2:58', 'ibKaINyehVcQWs7xmVeWti5DPBAlE_AM.mp3', 1, 1, 1621984301, 1621984301),
(1498, 97, 1, 7, 'Neon Gravestones', '', '4:01', 'u-m9D9EDI5kdRI7vOS8iP9roWj9RHfOh.mp3', 1, 1, 1621984301, 1621984301),
(1499, 97, 1, 8, 'The Hype', '', '4:26', 'eBQxuV4fAfPS1YTHtgUZVCUtAKN6PMIr.mp3', 1, 1, 1621984301, 1621984301),
(1500, 97, 1, 9, 'Nico And The Niners', '', '3:46', 'PgUWS8neNKxiKazYVpCM1Yq90AWVB1OT.mp3', 1, 1, 1621984301, 1621984301),
(1501, 97, 1, 10, 'Cut My Lip', '', '4:43', '3BfR_2UcOCfa1VZw4_oPnmfpdUMYRIfF.mp3', 1, 1, 1621984301, 1621984301),
(1502, 97, 1, 11, 'Bandito', '', '5:32', '41WIuCOcuQ0XZUaP2TbyhMEOhmvV1PnC.mp3', 1, 1, 1621984301, 1621984301),
(1503, 97, 1, 12, 'Pet Cheetah', '', '3:19', 'nZcTNLuqBnb9IFGW8HSg4YV9Z2tnshsr.mp3', 1, 1, 1621984301, 1621984301),
(1504, 97, 1, 13, 'Legend', '', '2:53', 'Yy8oSP6orkaadiHw3rR7q6inD1-kSOnU.mp3', 1, 1, 1621984301, 1621984301),
(1505, 97, 1, 14, 'Leave the City', '', '4:41', 'JEqQpAcnHHkYW0ykIKgX6XAnkWztFs2V.mp3', 1, 1, 1621984301, 1621984301),
(1506, 98, 1, 1, 'Burn', '', '4:28', 'oiR1OevwILTKApGuknKzqDqyRYx3UzqK.mp3', 1, 1, 1621984354, 1621984354),
(1507, 98, 1, 2, 'Just Like You', '', '3:08', 'bdhjP_oMJq2RWgRELhDBb2WcjbH_wxFf.mp3', 1, 1, 1621984354, 1621984354),
(1508, 98, 1, 3, 'I Hate Everything About You', '', '3:51', 'cCCVGMmdv2QC88xE5UyrI5zJOCwI7B9P.mp3', 1, 1, 1621984354, 1621984354),
(1509, 98, 1, 4, 'Home', '', '4:22', 'W8wemMESFkdVA1ARePWre_89-KZvOIDb.mp3', 1, 1, 1621984354, 1621984354),
(1510, 98, 1, 5, 'Scared', '', '3:13', 'kY28LIfGTdfW8De4KF-whOczj91KTCBG.mp3', 1, 1, 1621984354, 1621984354),
(1511, 98, 1, 6, 'Let You Down', '', '3:47', 'DxAWCZEdWYJX4Iv4lH9jPEIohj-xrKcx.mp3', 1, 1, 1621984354, 1621984354),
(1512, 98, 1, 7, 'Now Or Never', '', '3:01', 'A16TGgqfGy09w8iRNTUjd4T3nrfFn830.mp3', 1, 1, 1621984354, 1621984354),
(1513, 98, 1, 8, 'Born Like This', '', '3:33', 'tSOoECJa3uUibj_3dMqBNMdVI4wZxT-U.mp3', 1, 1, 1621984354, 1621984354),
(1514, 98, 1, 9, 'Drown', '', '3:29', 'naVgQPeKEvoxuo2UQS5Z4oNYOqu-Dgva.mp3', 1, 1, 1621984354, 1621984354),
(1515, 98, 1, 10, 'Wake Up', '', '3:26', 'STsffzUrsxmJRJOZ1XcXa4saRZUU24FW.mp3', 1, 1, 1621984354, 1621984354),
(1516, 98, 1, 11, 'Take Me Under', '', '4:20', 'oaBro6nq3BtVxvi-8Tfz_dJ97tya7L5b.mp3', 1, 1, 1621984354, 1621984354),
(1517, 98, 1, 12, 'Overrated', '', '3:33', 'b-zdDBGWaWowiB1TfSV4LmKdulTbLDvd.mp3', 1, 1, 1621984354, 1621984354),
(1518, 98, 1, 13, 'Are You Ready', 'Bonus Track', '2:46', 'tnHM32BvAdL5Kq5tuv9FMcOpF3d6xvSQ.mp3', 1, 1, 1621984354, 1621984369),
(1519, 99, 1, 1, 'It\'s All Over', '', '4:09', 'dzTH-WNtMcTmlg1My7O4vcP3zXWT4DsQ.mp3', 1, 1, 1621984406, 1621984406),
(1520, 99, 1, 2, 'Pain', '', '3:23', 'Qiq5-CEOI3dKIkjwmApEKVZAtSAMhYhd.mp3', 1, 1, 1621984406, 1621984406),
(1521, 99, 1, 3, 'Animal I Have Become', '', '3:51', 'KdLZY1T37a35HBLBzc2MacsW3tZmIwD_.mp3', 1, 1, 1621984407, 1621984407),
(1522, 99, 1, 4, 'Never Too Late', '', '3:29', 'IA3fhhp0h9bMdZoqXk0OVkDn30ysJCp_.mp3', 1, 1, 1621984407, 1621984407),
(1523, 99, 1, 5, 'On My Own', '', '3:06', '8ZZcoOG_CG77ilQZkMtCwuNw_KKt1V8J.mp3', 1, 1, 1621984407, 1621984407),
(1524, 99, 1, 6, 'Riot', '', '3:28', 'dv_snxnnWIiUf-Y5XmqmE7NhUHKSCcnk.mp3', 1, 1, 1621984407, 1621984407),
(1525, 99, 1, 7, 'Get Out Alive', '', '4:23', 'LYbUTD70lsKgVXHUSGjQP3YHbNQGuTgL.mp3', 1, 1, 1621984407, 1621984407),
(1526, 99, 1, 8, 'Let It Die', '', '3:09', 'h_kZy0i3r8HLXQtkfhQbj7ILLoQCVy61.mp3', 1, 1, 1621984407, 1621984407),
(1527, 99, 1, 9, 'Over and Over', '', '3:12', 'kOnmUc26ZBzfr7sILy5PQQSzfRk-qnqP.mp3', 1, 1, 1621984407, 1621984407),
(1528, 99, 1, 10, 'Time of Dying', '', '3:09', 'WaUA5WGmWfROCPFlCw4Lc_83hZF6DLeE.mp3', 1, 1, 1621984407, 1621984407),
(1529, 99, 1, 11, 'Gone Forever', '', '3:41', 'V1PAn6Phib03rbiibEbUQ0zumE7aIhO0.mp3', 1, 1, 1621984407, 1621984407),
(1530, 99, 1, 12, 'One X', '', '4:47', 'KIKXpJ0pCM3BP6NpZLuYT3hx5iVjSXTe.mp3', 1, 1, 1621984407, 1621984407),
(1531, 99, 1, 13, 'Running Away', '', '4:03', 'cNEiiXLpAzGXjDlIQGllc9ENKv9GdX4Z.mp3', 1, 1, 1621984407, 1621984407),
(1532, 100, 1, 1, 'Bitter Taste', '', '4:01', 'Ohwz4GxH-eBuvZqs85pvJqzZhTf-Y5Br.mp3', 1, 1, 1621984451, 1621984451),
(1533, 100, 1, 2, 'Break', '', '3:13', 'SqIA7IZD0Y_znJOfknCmzg8L-NyehZuI.mp3', 1, 1, 1621984451, 1621984451),
(1534, 100, 1, 3, 'World So Cold', '', '4:03', 'BHkr-PzDMY5jYyfu1MCe3oGXg8kKlev5.mp3', 1, 1, 1621984451, 1621984451),
(1535, 100, 1, 4, 'Lost In You', '', '3:53', 'qqumvPjDaplM4btu9PgzM7_YBnd5PcOV.mp3', 1, 1, 1621984451, 1621984451),
(1536, 100, 1, 5, 'The Good Life', '', '2:53', 'SUQ9cb-P1JP5ugWG5gTyhotLD3_tvlWk.mp3', 1, 1, 1621984451, 1621984451),
(1537, 100, 1, 6, 'No More', '', '3:46', 'xaeFE_qAqyJfH1LvfJbgulKsBdMzYtTp.mp3', 1, 1, 1621984451, 1621984451),
(1538, 100, 1, 7, 'Last To Know', '', '3:28', 'ewIEK6YNJ5yXYZMPBiVwg7H6PBxXXnoX.mp3', 1, 1, 1621984451, 1621984451),
(1539, 100, 1, 8, 'Someone Who Cares', '', '4:52', 'LmDVj9M0URmT3cILmKSdMIbWmKiQhJ_H.mp3', 1, 1, 1621984451, 1621984451),
(1540, 100, 1, 9, 'Bully', '', '3:39', 'wb_Y1vXcdhuH-kriC8QtenmREUWMatUv.mp3', 1, 1, 1621984451, 1621984451),
(1541, 100, 1, 10, 'Without You', '', '3:34', 'y-beJD09oih0oeZvAihqI6gv-kuDtnL-.mp3', 1, 1, 1621984451, 1621984451),
(1542, 100, 1, 11, 'Goin\' Down', '', '3:06', 'RtVLzaDdov9eX0oRaXI4Ra54pFvNtGHv.mp3', 1, 1, 1621984452, 1621984452),
(1543, 100, 1, 12, 'Life Starts Now', '', '3:08', 'Ma7yiajRT7C77FQSe6BRQG0ZX4Ktm8rB.mp3', 1, 1, 1621984452, 1621984452),
(1544, 100, 2, 1, 'I Hate Everything About You', '', '3:52', 'Gkj7UA8T74y1RtXfljoPBrWT-pYmLvGN.mp3', 1, 1, 1621984452, 1621984475),
(1545, 100, 2, 2, 'Just Like You', '', '3:07', 'xxAH82Oxh7SFyvFw8ik_sgMI0NxEpAZF.mp3', 1, 1, 1621984452, 1621984477),
(1546, 100, 2, 3, 'Home', '', '4:21', '_oOumwMAeNAlccJBZxQOERv6hR00vAu8.mp3', 1, 1, 1621984452, 1621984479),
(1547, 100, 2, 4, 'Animal I Have Become', 'Main Version', '3:51', '2yALwTY44_mUcDCms5H7-AQc4nguQx0T.mp3', 1, 1, 1621984452, 1621984485),
(1548, 100, 2, 5, 'Pain', 'Main Version', '3:23', 'e-c106JTkXnK7ToqEYZDVGIsR7EqTKuO.mp3', 1, 1, 1621984452, 1621984491),
(1549, 100, 2, 6, 'Never Too Late', 'Main Version', '3:29', 'PwAf3-YBwj_WA-uTht6l8W7UQIRTpkGi.mp3', 1, 1, 1621984452, 1621984499),
(1550, 100, 2, 7, 'Riot', 'Main Version', '3:28', 'f1OL3A67YpTLD9i3zfMRg-dLZknle7UU.mp3', 1, 1, 1621984452, 1621984505),
(1551, 101, 1, 1, 'Sign Of The Times', '', '3:11', '0NyCL3dhqI95JXn3hMCPXq6oGTq4dVmt.mp3', 1, 1, 1621984865, 1621984865),
(1552, 101, 1, 2, 'Chalk Outline', '', '3:02', 'An2H6XMxcmwX5YNwm-jUxM-a8tVCIDzf.mp3', 1, 1, 1621984865, 1621984865),
(1553, 101, 1, 3, 'The High Road', '', '3:14', '_pywvLRX0v61Dgry4jGGWsktMSZQ-TJZ.mp3', 1, 1, 1621984865, 1621984865),
(1554, 101, 1, 4, 'Operate', '', '3:23', 'BjN1nUnax3nrk8R9OnxaRHWsz1jp2V6o.mp3', 1, 1, 1621984865, 1621984865),
(1555, 101, 1, 5, 'Anonymous', '', '3:14', 'zwWwg1jWmINz2QPFwop-x0LLSUtyBQoz.mp3', 1, 1, 1621984865, 1621984865),
(1556, 101, 1, 6, 'Misery Loves My Company', '', '2:42', 'AYxOKuAs09ZkSy-vmCWfBoErn_23JJUI.mp3', 1, 1, 1621984865, 1621984865),
(1557, 101, 1, 7, 'Give In To Me', 'Michael Jackson Cover', '3:19', 'IWTBMQkT5mGdGn6Pp3stMseCr37VxZV-.mp3', 1, 1, 1621984865, 1621984882),
(1558, 101, 1, 8, 'Happiness', '', '2:54', 'aKr7kA060L0bCT2nuGN7nJPo7CAYcIM-.mp3', 1, 1, 1621984865, 1621984865),
(1559, 101, 1, 9, 'Give Me A Reason', '', '4:04', 'ewG8FaCaTrolMO4iYY8_2avJQo0V09ZZ.mp3', 1, 1, 1621984866, 1621984866),
(1560, 101, 1, 10, 'Time That Remains', '', '3:12', 'yFSXs-t7H2NQm9G77e9aYmuYd9GC6xeh.mp3', 1, 1, 1621984866, 1621984866),
(1561, 101, 1, 11, 'Expectations', '', '2:43', 'Fqszo6LNbnq8rcYM1F14Li42GnjSKI8w.mp3', 1, 1, 1621984866, 1621984866),
(1562, 101, 1, 12, 'Broken Glass', '', '3:21', 'OBKrhNP-TYb_WdD4VC70ZBOQ67rUx7T8.mp3', 1, 1, 1621984866, 1621984866),
(1563, 101, 1, 13, 'Unbreakable Heart', '', '3:26', 'DRVtdyZAJWyu_4MyREs4jB7noxk3Ueue.mp3', 1, 1, 1621984866, 1621984866),
(1564, 102, 1, 1, 'Human Race', '', '4:09', 'dafjICiaPnHNzElL5vio1x4Yfjwu9G3I.mp3', 1, 1, 1621984913, 1621984913),
(1565, 102, 1, 2, 'Painkiller', '', '2:59', 'K2ucwuiYxrq6q7DZzYy5zLor5_tCy6Rr.mp3', 1, 1, 1621984913, 1621984913),
(1566, 102, 1, 3, 'Fallen Angel', '', '3:06', 'rmW00vAiFKe3KTOwXMIjpltExcki09O6.mp3', 1, 1, 1621984913, 1621984913),
(1567, 102, 1, 4, 'Landmine', '', '3:26', 'ax_tNHkUHEZjAlZsPrNANPT0c1kDTlk1.mp3', 1, 1, 1621984913, 1621984913),
(1568, 102, 1, 5, 'Tell Me Why', '', '3:31', 'W7mV7J0Gge82fzj7Eu34ve42UBWLBbVG.mp3', 1, 1, 1621984913, 1621984913),
(1569, 102, 1, 6, 'I Am Machine', '', '3:21', 'JAuGmCBgalTBLfpPUyNbSYoFl5LkJZW-.mp3', 1, 1, 1621984913, 1621984913),
(1570, 102, 1, 7, 'So What', '', '2:58', 'vZ6e9fDbi7dfB0CHjazdQAQMsKOFx84F.mp3', 1, 1, 1621984913, 1621984913),
(1571, 102, 1, 8, 'Car Crash', '', '2:51', '0JNbCaZpQMv1CH7H1NKszS6tgxHFcaKL.mp3', 1, 1, 1621984913, 1621984913),
(1572, 102, 1, 9, 'Nothing\'s Fair In Love And War', '', '3:45', 'yIE8gjyOwadol8mepsF5Yy215bMji-cR.mp3', 1, 1, 1621984913, 1621984913),
(1573, 102, 1, 10, 'One Too Many', '', '2:41', 'wUYiPEMKhIl6K9MqccfoAQtDOdz0MMxI.mp3', 1, 1, 1621984913, 1621984913),
(1574, 102, 1, 11, 'The End Is Not The Answer', '', '2:53', '62xb9EdLH1nt8lYzKeyOas0Yc0jkLr52.mp3', 1, 1, 1621984913, 1621984913),
(1575, 102, 1, 12, 'The Real You', '', '3:56', 'lmxzbqmvYc5q_bttrvXbA62DccXAGhzy.mp3', 1, 1, 1621984913, 1621984913),
(1576, 103, 1, 1, 'Right Left Wrong', '', '3:57', 'scaVJPEYmmWYHaaeFa-CelaUxIFVmJDo.mp3', 1, 1, 1621984941, 1621984941),
(1577, 103, 1, 2, 'The Mountain', '', '3:18', 'KHa4JAa1u_Zs39tUZ1sdR2izF7f31SsW.mp3', 1, 1, 1621984941, 1621984941),
(1578, 103, 1, 3, 'I Am An Outsider', '', '2:42', 'Z2Ktf4yawxAoWIOyQhtwVLMJZuz-ml7I.mp3', 1, 1, 1621984941, 1621984941),
(1579, 103, 1, 4, 'Infra-Red', '', '3:51', 'wnHB38-7HwCzlFHybVZhhnANzrEeNK22.mp3', 1, 1, 1621984941, 1621984941),
(1580, 103, 1, 5, 'Nothing To Lose But You', '', '2:52', 'GnsiXrL-ofj_nnApf1FBMtAkWyg8PoqK.mp3', 1, 1, 1621984941, 1621984941),
(1581, 103, 1, 6, 'Me Against You', '', '3:29', 'f3G1X0dvJb2v-Jcv9xNHkMp2QHV8heLn.mp3', 1, 1, 1621984941, 1621984941),
(1582, 103, 1, 7, 'Love Me Or Leave Me', '', '3:04', 'n9EdJhvxlV-xxLrcpFBcYUikaPDJTIZk.mp3', 1, 1, 1621984941, 1621984941),
(1583, 103, 1, 8, 'Strange Days', '', '3:11', '_T_Akqx7yplkBO8heiI-dXY2rEP1QeWl.mp3', 1, 1, 1621984941, 1621984941),
(1584, 103, 1, 9, 'Villain I\'m Not', '', '2:56', 'wnUXzp4qFEduGVfOUBMmvCr9XDK65AbX.mp3', 1, 1, 1621984941, 1621984941),
(1585, 103, 1, 10, 'Chasing The First Time', '', '2:56', 'Y1TDolOJ6EGJmuocemDWfbmU8m3-CXy2.mp3', 1, 1, 1621984941, 1621984941),
(1586, 103, 1, 11, 'The New Real', '', '3:01', 'bTl73JR30vYeUCxoEYNgzq110vYn4a7X.mp3', 1, 1, 1621984941, 1621984941),
(1587, 103, 1, 12, 'The Abyss', '', '4:10', 'iTjKXomGaEHiiCkevpOTRywB8M7rXXu6.mp3', 1, 1, 1621984942, 1621984942),
(1588, 104, 1, 1, 'Intro', '', '2:21', '0jqFeUOP7Iu_7zK6OYXJ8abO3e9wFjX0.mp3', 1, 1, 1621984986, 1621984986),
(1589, 104, 1, 2, 'Her Voice Resides', '', '4:18', '5eZ1dckmeyVnwCaLE-CkV_eWT4-MsG78.mp3', 1, 1, 1621984987, 1621984987),
(1590, 104, 1, 3, '4 Words (To Choke Upon)', '', '3:44', '3qBIDwZzjF__7iR1qEFa9x_FRH3CNaWe.mp3', 1, 1, 1621984987, 1621984987),
(1591, 104, 1, 4, 'Tears Don\'t Fall', '', '5:48', 'XGyUNkhOJbv396Yo10dQH-nubsFnMgpN.mp3', 1, 1, 1621984987, 1621984987),
(1592, 104, 1, 5, 'Suffocating Under Words Of Sorrow (What Can I Do)', '', '3:36', 'G1WyTb1RkQiY-FYLcw7ZuzjBGanx4kY7.mp3', 1, 1, 1621984987, 1621984987),
(1593, 104, 1, 6, 'Hit The Floor', '', '3:30', '48XKCmdYD7zwWqoR26UWNbGjNCpUHAq_.mp3', 1, 1, 1621984987, 1621984987),
(1594, 104, 1, 7, 'All These Things I Hate (Revolve Around Me)', '', '3:46', 'E7rrIG__PKnowoxxE9g8NMG3Os1OMxwJ.mp3', 1, 1, 1621984987, 1621984987),
(1595, 104, 1, 8, 'Room 409', '', '4:01', 'kdDAGIEWfg9JWWnNT_4-_KGkXRF5gjUc.mp3', 1, 1, 1621984987, 1621984987),
(1596, 104, 1, 9, 'The Poison', '', '3:40', 'M58FAjcZf50bNa3NPjQiT1dFvzK0Jwlv.mp3', 1, 1, 1621984987, 1621984987),
(1597, 104, 1, 10, '10 Years Today', '', '3:56', 'fDDbXyWbCL-NCPDpVRq1iaFv8dXZDQqv.mp3', 1, 1, 1621984987, 1621984987),
(1598, 104, 1, 11, 'Cries In Vain', '', '3:56', '65M8SV6v1gzHX2lTfvlFpGXEHvpZfe4Q.mp3', 1, 1, 1621984988, 1621984988),
(1599, 104, 1, 12, 'Spit You Out', '', '4:08', '2hpm4j5wjJn0-wC99fCRHhlonLFperlO.mp3', 1, 1, 1621984988, 1621984988),
(1600, 104, 1, 13, 'The End', '', '6:47', 'fXO6ViHBcqZ0Tz9j4I1ex2WDBoDzt_Wb.mp3', 1, 1, 1621984988, 1621984988),
(1601, 104, 1, 14, '7 Days', '', '3:24', 'obmc2W1RURd8WlAjX6ZafmKDvZJ0BOtE.mp3', 1, 1, 1621984988, 1621984988),
(1602, 104, 1, 15, 'My Fist, Your Mouth, Her Scars', '', '3:51', 'rVLTozJ1h4Y7xYqLecMaOAw0qjuImNE9.mp3', 1, 1, 1621984988, 1621984988),
(1605, 105, 1, 1, 'Scream Aim Fire', '', '4:27', '84P8NgaI4mm4CJaNo8aoSBXj8kEs9Vjp.mp3', 1, 1, 1621985129, 1621985129),
(1606, 105, 1, 2, 'Crazy Train', 'Ozzy Osbourne Cover', '4:50', 'uCNKZhArKond_DLILrVj5VGrGRtKtj9N.mp3', 1, 1, 1621985129, 1621985140),
(1607, 105, 1, 2, 'Eye Of The Storm', '', '4:03', 'mNuuVr6W-PJyojQX8QzLicdsXfNboFP3.mp3', 1, 1, 1621985129, 1621985129),
(1608, 105, 1, 3, 'Hearts Burst Into Fire', '', '4:58', 'vaPzwjdMPS3UNFfpaSpB16JbUNYGM5OP.mp3', 1, 1, 1621985129, 1621985129),
(1609, 105, 1, 4, 'Waking The Demon', '', '4:08', 'g4DfS2WKR5-ey4Sz8goFq-CsmZwTCB9w.mp3', 1, 1, 1621985129, 1621985129),
(1610, 105, 1, 5, 'Disappear', '', '4:05', 'Jhf9ASr-uqJBKIyULA0ndpqtD-4mpv9o.mp3', 1, 1, 1621985129, 1621985129),
(1611, 105, 1, 6, 'Deliver Us From Evil', '', '5:58', '0XtBUoc-5bCNMM8NhuRy248kX3MWDuOe.mp3', 1, 1, 1621985129, 1621985129),
(1612, 105, 1, 7, 'Take It Out On Me', '', '5:52', 'HYzq9-STxFf0iZf6iU8B1b5-op0ZiaBd.mp3', 1, 1, 1621985130, 1621985130),
(1613, 105, 1, 8, 'Say Goodnight', '', '4:43', 'PwmuVheKSrGMlTSSSLlesyU7a2uIR9vK.mp3', 1, 1, 1621985130, 1621985130),
(1614, 105, 1, 9, 'End Of Days', '', '4:18', 'PODxRjE5MLHBVJY46tUq0K2-crQCVh_8.mp3', 1, 1, 1621985130, 1621985130),
(1615, 105, 1, 10, 'Last To Know', '', '3:16', 'Ad8Q_aHuwWZV6Zc5aI1FhQL8t8fidu9-.mp3', 1, 1, 1621985130, 1621985130),
(1616, 105, 1, 11, 'Forever And Always', '', '6:50', 'mbVdH4Rlcjlc70k7L4bbZx6iwFvHaJ_3.mp3', 1, 1, 1621985130, 1621985130),
(1617, 105, 1, 12, 'Road to Nowhere', '', '4:20', 'Z_WoIxG5B3CwU47ObY1LyKJJWRAD5Su5.mp3', 1, 1, 1621985130, 1621985130),
(1618, 105, 1, 13, 'Watching Us Die Tonight', '', '3:54', 'Ae5oj40PzUskNJQgNq6J0Gz8JbJpLn8N.mp3', 1, 1, 1621985130, 1621985130),
(1619, 105, 1, 14, 'One Good Reason Why', '', '4:05', 'dtyIyDjPjnbOK-Xoz77Ty--7BpQd025X.mp3', 1, 1, 1621985130, 1621985130),
(1620, 105, 1, 15, 'Ashes Of The Innocent', '', '4:15', 'RaEIy39zvk3ZeFefpiMYYtoD2T5rjDDp.mp3', 1, 1, 1621985130, 1621985130),
(1621, 106, 1, 1, 'Your Betrayal', '', '4:52', 'jkbR5LYxo6UhjKhJt799sKpu1WAEVCOS.mp3', 1, 1, 1621985179, 1621985179),
(1622, 106, 1, 2, 'Fever', '', '3:57', 'CdqWLnosnJs2WuyZ0gpne6C9yCVTG7v3.mp3', 1, 1, 1621985179, 1621985179),
(1623, 106, 1, 3, 'The Last Fight', '', '4:19', 'XdDc2z9MnA6SUF4eOmnkI3--XRFJ6QS7.mp3', 1, 1, 1621985179, 1621985179),
(1624, 106, 1, 4, 'A Place Where You Belong', '', '5:07', '35WQoxXBbuUh0ZX_WHW-X4di6hxg4Pf6.mp3', 1, 1, 1621985179, 1621985179),
(1625, 106, 1, 5, 'Pleasure And Pain', '', '3:53', '9QdfiBEJ4obmNuJ5tF6jvh91rWEmmy0u.mp3', 1, 1, 1621985179, 1621985179),
(1626, 106, 1, 6, 'Alone', '', '5:56', 'feiMJuflFcyJryqJIUCPf9P2l2O_sIa1.mp3', 1, 1, 1621985180, 1621985180),
(1627, 106, 1, 7, 'Breaking Out, Breaking Down', '', '4:04', 'XWTdSQGHgjTUdysDDx3AFt_layaCJFnn.mp3', 1, 1, 1621985180, 1621985180),
(1628, 106, 1, 8, 'Bittersweet Memories', '', '5:09', '9fmYhpGzgRxDkjCyE3jRQlyDdW3FdMFf.mp3', 1, 1, 1621985180, 1621985180),
(1629, 106, 1, 9, 'Dignity', '', '4:29', 'gJI6e2AZ-4vkrnYolyX0yK4rPHJj5psz.mp3', 1, 1, 1621985180, 1621985180),
(1630, 106, 1, 10, 'Begging For Mercy', '', '3:56', 'ZVZnnPjouTfyLWgfnkK6ZKQhuBD0_zdt.mp3', 1, 1, 1621985180, 1621985180),
(1631, 106, 1, 11, 'Pretty On The Outside', '', '3:56', 'HgUPGlfE_QcV6Jp_FiUp2diI64xNXUcv.mp3', 1, 1, 1621985180, 1621985180),
(1632, 107, 1, 1, 'Breaking Point', '', '3:43', 'leCzFGIvk2dqpFIIPcQgmfZ65nMhZv-t.mp3', 1, 1, 1621985221, 1621985221),
(1633, 107, 1, 2, 'Truth Hurts', '', '3:37', 'pDMZBGFhKGer-42Q2EPtQ8XdgvsoWP5L.mp3', 1, 1, 1621985221, 1621985221),
(1634, 107, 1, 3, 'Temper Temper', '', '3:09', 'FHtzfBa2uXV7HXXBe-C65ACObCzgqLEi.mp3', 1, 1, 1621985221, 1621985221),
(1635, 107, 1, 4, 'P.O.W.', '', '3:54', '3kky58qb0MAhzUxk3iyU4JmF5-Cy4Zer.mp3', 1, 1, 1621985221, 1621985221),
(1636, 107, 1, 5, 'Dirty Little Secret', '', '4:55', 'hS8Vh_6f8kSitwf4gPqrdhFuP5ddTOWb.mp3', 1, 1, 1621985221, 1621985221),
(1637, 107, 1, 6, 'Leech', '', '4:00', 'CTEbceh3DOA8yf_xdYNxqq4_tkZq01vl.mp3', 1, 1, 1621985221, 1621985221),
(1638, 107, 1, 7, 'Dead To The World', '', '5:16', 'gi9FWb99S9k4euJZjIp3bftQDCDJzPXB.mp3', 1, 1, 1621985221, 1621985221),
(1639, 107, 1, 8, 'Riot', '', '2:49', '1G3qfN5YEMrdHbufFNGWoQbEeXzpiM93.mp3', 1, 1, 1621985221, 1621985221),
(1640, 107, 1, 9, 'Saints &amp; Sinners', '', '3:29', 'gAB0w7aZXjFQ6B3u0raZlj9giBfnFHMj.mp3', 1, 1, 1621985221, 1621985221),
(1641, 107, 1, 10, 'Tears Don\'t Fall (Part 2)', '', '5:39', 'ocQgl0pGTApnUgIpt7PDD8eZqF1ySXuU.mp3', 1, 1, 1621985221, 1621985221),
(1642, 107, 1, 11, 'Livin\' Life (On The Edge Of A Knife)', '', '4:02', 'dmfDbldF2pbGUKvqQa0oaCVPKiNbWCSQ.mp3', 1, 1, 1621985221, 1621985221),
(1643, 107, 1, 12, 'Not Invincible', '', '3:26', 'yghukR-BJdgYdcsDQpaR1CB-0o4kfVwu.mp3', 1, 1, 1621985221, 1621985221),
(1644, 107, 1, 13, 'Whole Lotta Rosie', 'Live At BBC Radio 1', '4:10', 'Rad-xod8z3UvQzPzkYQQW47ehP7gCLm4.mp3', 1, 1, 1621985221, 1621985268),
(1645, 107, 1, 14, 'Scream Aim Fire', 'Live At BBC Radio 1', '5:05', '6LudPgQqYwU8AiRSLJoXGrcuHW1OqiJQ.mp3', 1, 1, 1621985222, 1621985274),
(1646, 107, 1, 15, 'Playing With Fire', '', '2:51', 'FVTlWHMhey9oxlXIaC-GKWd6xtFinpRU.mp3', 1, 1, 1621985222, 1621985222),
(1647, 108, 1, 1, 'V', '', '1:27', 'UM6vV_qb_znmZ1-4uvnxgAmLAMsAxRz3.mp3', 1, 1, 1621985317, 1621985317),
(1648, 108, 1, 2, 'No Way Out', '', '3:54', 'K6m9_5VEhwOdMIvrHc0YGLyhU-K0NzU_.mp3', 1, 1, 1621985317, 1621985317),
(1649, 108, 1, 3, 'Army of Noise', '', '4:18', 'HqSg5YbvZ35LoWF1EyBnVD2bnb6CiRwI.mp3', 1, 1, 1621985317, 1621985317),
(1650, 108, 1, 4, 'Worthless', '', '3:18', 'My91fjgQCjpMQ5wHEZCnaaWz_c1bg_0A.mp3', 1, 1, 1621985317, 1621985317),
(1651, 108, 1, 5, 'You Want a Battle? (Here\'s a War)', '', '4:15', 'kjseZ3i3b7_q5xajLidVDFTIDIyOJJMg.mp3', 1, 1, 1621985317, 1621985317),
(1652, 108, 1, 6, 'Broken', '', '3:40', 'AWEX3PAQi3H4Z31BuGT_vu9JsbdKWa0l.mp3', 1, 1, 1621985318, 1621985318),
(1653, 108, 1, 7, 'Venom', '', '3:55', 'zPu1h2lBtXIebLww8t1QIQPHFcWVu8Wq.mp3', 1, 1, 1621985318, 1621985318),
(1654, 108, 1, 8, 'The Harder the Heart (The Harder It Breaks)', '', '4:00', 'uZkST57k9clzWi7UXhynd8fGAvlrxljP.mp3', 1, 1, 1621985318, 1621985318),
(1655, 108, 1, 9, 'Skin', '', '3:59', '80-jI25eARqwwG9syukWPSXqOqiP24kW.mp3', 1, 1, 1621985318, 1621985318),
(1656, 108, 1, 10, 'Hell or High Water', '', '4:37', 'vnnna-5JiK1VWskzNKHZq7K1HCujdCFQ.mp3', 1, 1, 1621985318, 1621985318),
(1657, 108, 1, 11, 'Pariah', '', '3:46', '1M5auXgDDReUZtJBJBYkODFa93F33R7y.mp3', 1, 1, 1621985318, 1621985318),
(1658, 108, 1, 12, 'Playing God', '', '3:52', 'gX3Hx74gAMJbePtoJrlRRoXi8oOsRwfa.mp3', 1, 1, 1621985318, 1621985318),
(1659, 108, 1, 13, 'Run for Your Life', '', '3:35', 'pWPsXtmFkiGnluC06w11Nr33qK980YNr.mp3', 1, 1, 1621985318, 1621985318),
(1660, 108, 1, 14, 'In Loving Memory', '', '4:03', '3Y0dXW2eY8KnriD2ox7sKJwjsCQehzYa.mp3', 1, 1, 1621985318, 1621985318),
(1661, 108, 1, 15, 'Raising Hell', '', '4:36', 'g1TsmtIF8Q9CUPEbMPz-d7vBKJl8T2B_.mp3', 1, 1, 1621985318, 1621985318),
(1662, 109, 1, 1, 'Leap Of Faith', '', '3:19', 'v3HYT2jwlnMc5jJ2GTEJA19HkKfPG1q-.mp3', 1, 1, 1621985358, 1621985358),
(1663, 109, 1, 2, 'Over It', '', '3:48', '33aseftI4iCJPdw_axQRjFIOtEiRIN2s.mp3', 1, 1, 1621985358, 1621985358),
(1664, 109, 1, 3, 'Letting You Go', '', '3:44', 'V5IaVSsfN6GK0wZoEvloR8f6D7Fsz9Wv.mp3', 1, 1, 1621985358, 1621985358),
(1665, 109, 1, 4, 'Not Dead Yet', '', '3:22', 'QTzTEumCIa49wNG4yr9eDBA6WQPYHIOX.mp3', 1, 1, 1621985359, 1621985359),
(1666, 109, 1, 5, 'The Very Last Time', '', '3:57', 'g4EaB8Tkl-Fd9Ikx7-3rDir27EJ1nii7.mp3', 1, 1, 1621985359, 1621985359),
(1667, 109, 1, 6, 'Piece Of Me', '', '3:26', 'oMCIQ86nmVQSKPENo7v0u1bA3dNFQTLs.mp3', 1, 1, 1621985359, 1621985359),
(1668, 109, 1, 7, 'Under Again', '', '4:11', '210ZaKp-6_A39vEvDKscQ4-Do1aeJXcZ.mp3', 1, 1, 1621985359, 1621985359),
(1669, 109, 1, 8, 'Gravity', '', '4:01', 'P-4OzK1GEwhvRSbr3dKFEvBVe_jxmMEK.mp3', 1, 1, 1621985359, 1621985359),
(1670, 109, 1, 9, 'Coma', '', '3:34', '8T84lbXeloawVlGoVOmK6yb1vemxu6tk.mp3', 1, 1, 1621985359, 1621985359),
(1671, 109, 1, 10, 'Don\'t Need You', '', '4:50', 'g2dUeduaSWN7-9Uh1qGu99Njf6qVpyU1.mp3', 1, 1, 1621985359, 1621985359),
(1672, 109, 1, 11, 'Breathe Underwater', '', '3:41', 'qjfnRUuEKe4yfLW0UeAkCnXEI5f1vKGJ.mp3', 1, 1, 1621985359, 1621985359),
(1673, 109, 1, 12, 'Breaking Out', '', '3:27', 'uN0cRzAxb89UDKVO_2Yy0ByALeqViT3_.mp3', 1, 1, 1621985359, 1621985359),
(1674, 109, 1, 13, 'Crawling', '', '3:54', 'SABXZhKQPjMwhNKneeJXmC21PVvrRAWz.mp3', 1, 1, 1621985359, 1621985359),
(1675, 109, 1, 14, 'Radioactive', '', '3:13', 'bznX1XSJGjpuq-MwoB3JmNaxJVoreuLb.mp3', 1, 1, 1621985359, 1621985359),
(1676, 110, 1, 1, 'Mr. Sinister', '', '4:39', 'bvB-vexWpdhA_JImv-Q9LDarRMyEzaUc.mp3', 1, 1, 1621985781, 1621985781),
(1677, 110, 1, 2, 'We Came To Take Your Souls', '', '4:01', 'brmHpeKzlEnFoayRBfzukQzjtXgYaU_3.mp3', 1, 1, 1621985782, 1621985782),
(1678, 110, 1, 3, 'Kiss Of The Cobra King', '', '4:32', 'rznmZM_tKC3WdBv8UYp1MtiYt4qz4n82.mp3', 1, 1, 1621985782, 1621985782),
(1679, 110, 1, 4, 'Black Mass Hysteria', '', '4:12', '_RBcCQApnHbTlKkgq44ut4dnP3zYkaR6.mp3', 1, 1, 1621985782, 1621985782),
(1680, 110, 1, 5, 'Demons &amp; Diamonds', '', '3:39', 'dq6mtojnxCXWusrs5C6iCqd857UsPHUg.mp3', 1, 1, 1621985782, 1621985782),
(1681, 110, 1, 6, 'Montecore', '', '5:19', 'KAns4SXa2MGy_tJ-HqKU9HOMzBnHTg4p.mp3', 1, 1, 1621985782, 1621985782),
(1682, 110, 1, 7, 'The Evil Made Me Do It', '', '3:39', 'lMdZpaf9wWqhDp3deIe7eaoXbCO2em0M.mp3', 1, 1, 1621985782, 1621985782),
(1683, 110, 1, 8, 'Lucifer In Starlight', '', '4:50', 'A6cRBSOj4MrE_VS71W8oFzpTJ2iy08V4.mp3', 1, 1, 1621985782, 1621985782),
(1684, 110, 1, 9, 'Son Of The Morning Star', '', '5:12', 'cmsyIwLEjyZPrqEmBj-btVPCke_wmTJm.mp3', 1, 1, 1621985782, 1621985782),
(1685, 111, 1, 1, 'Lupus Daemonis', 'Intro', '1:17', 'Pi2q_T1Sc_3TO6QCLOuT1jO-Rf_ihBZq.mp3', 1, 1, 1621985851, 1621985864),
(1686, 111, 1, 2, 'We Take It From The Living', '', '4:04', 'ZN8wwGTLIsP6gZsja0qLkeBA5gq8EF3z.mp3', 1, 1, 1621985851, 1621985851),
(1687, 111, 1, 3, 'Prayer In The Dark', '', '4:20', 'Lyan_qKw3KmZspsdAyoISfNjBEND6wZz.mp3', 1, 1, 1621985851, 1621985851),
(1688, 111, 1, 4, 'Saturday Satan', '', '5:16', 'oxwq79mk5eJFvTdLUJMEkIA9NxkL8Otp.mp3', 1, 1, 1621985851, 1621985851),
(1689, 111, 1, 5, 'In Blood We Trust', '', '3:03', 'WFyNbUAWKVquWvU4KFNaAiwNM_RY1YAq.mp3', 1, 1, 1621985851, 1621985851),
(1690, 111, 1, 6, 'Behind The Leathermask', '', '4:34', 'JfeaiWRd5OdfpaCx4-O6DPNOVbvGFjVE.mp3', 1, 1, 1621985851, 1621985851),
(1691, 111, 1, 7, 'Vampires Don\'t Die', '', '3:09', 'dL-Uh4v-8LDYrJIoZAhIKwFs_dx7C_xW.mp3', 1, 1, 1621985851, 1621985851),
(1692, 111, 1, 8, 'When The Moon Shines Red', '', '4:25', 'sbyqyL0MJrh69B8veaso0XsVMJb2V1Dq.mp3', 1, 1, 1621985852, 1621985852),
(1693, 111, 1, 9, 'Mother Mary Is A Bird Of Prey', '', '3:15', 'pfeRTiME93X5Gg850W6-e-SJA4Y56I-N.mp3', 1, 1, 1621985852, 1621985852),
(1694, 111, 1, 10, 'Tiger Of Sabrod', '', '3:53', 'EwRw-YKBldv8KzDRH6wMo8QF6WCgh8fe.mp3', 1, 1, 1621985852, 1621985852),
(1695, 111, 1, 11, 'Lupus Dei', '', '6:08', 'SYereqFG1FpG0doImHQzDfe30NJRxOtu.mp3', 1, 1, 1621985852, 1621985852),
(1696, 112, 1, 1, 'Opening : Prelude To Purgatory', '', '1:14', 'zZsLnBV1KmVyNeiF0LuvFfpXzKH7MpxU.mp3', 1, 1, 1621985916, 1621985916),
(1697, 112, 1, 2, 'Raise Your Fist, Evangelist', '', '4:00', 'lGJwUeu3v-DvumP0vYda7uC3H9iHKEGj.mp3', 1, 1, 1621985916, 1621985916),
(1698, 112, 1, 3, 'Moscow After Dark', '', '3:15', '4MZXZeWBWsGAqIwIuBvsxqOKi5npKxoo.mp3', 1, 1, 1621985916, 1621985916),
(1699, 112, 1, 4, 'Panic In The Pentagram', '', '5:15', '8Mo9eVXEyblSBkqtFvv8NprWV9hfzfig.mp3', 1, 1, 1621985916, 1621985916),
(1700, 112, 1, 5, 'Catholic In The Morning... Satanist At Night', '', '3:58', '1O4bH3W8Fx5R3jQlup0LQB0c9UH84qto.mp3', 1, 1, 1621985916, 1621985916),
(1701, 112, 1, 6, 'Seven Deadly Saints', '', '3:36', '0pV2YqIAsyx76bR_1vKaQoXNEKn28bjH.mp3', 1, 1, 1621985916, 1621985916),
(1702, 112, 1, 7, 'Werewolves Of Armenia', '', '3:55', '-hCjnLKhzACK09HmrMEubsp4-ya9xklD.mp3', 1, 1, 1621985916, 1621985916),
(1703, 112, 1, 8, 'We Take The Church By Storm', '', '3:55', 'S72Lm2u_OWF_Y6edRdDZn-NnRqXFcHZt.mp3', 1, 1, 1621985916, 1621985916),
(1704, 112, 1, 9, 'Resurrection By Erection', '', '3:51', 'yBonPBqgGWeZPzDzh1U8lOClCAdH-1Mg.mp3', 1, 1, 1621985916, 1621985916),
(1705, 112, 1, 10, 'Midnight Messiah', '', '4:13', 'ts6NTe51zVr_Pd5-cQCyxnyQqXXkEm6c.mp3', 1, 1, 1621985916, 1621985916),
(1706, 112, 1, 11, 'St. Satan\'s Day', '', '4:31', 'zaIre6wYMVEj5PJhCGYzWdbxSs9M7WLu.mp3', 1, 1, 1621985917, 1621985917),
(1707, 112, 1, 12, 'Wolves Against The World', '', '6:05', 'Gr0LpE1tpb1zDw6c1G6ZrT7B-S_HSi5S.mp3', 1, 1, 1621985917, 1621985917),
(1708, 113, 1, 1, 'Agnus Dei', '', '0:49', 'E78dDgMTbBxFsblCVMhtyP5ix5QeBh0j.mp3', 1, 1, 1621985949, 1621985949),
(1709, 113, 1, 2, 'Sanctified With Dynamite', '', '4:24', 'Z3O0WRtlwLYkkWLicFQdAgv2hGG8GyEB.mp3', 1, 1, 1621985949, 1621985949),
(1710, 113, 1, 3, 'We Drink Your Blood', '', '3:43', '74Rf2__c1yp9tfpjVwrRVlFcZ6BPkjlk.mp3', 1, 1, 1621985949, 1621985949),
(1711, 113, 1, 4, 'Murder At Midnight', '', '4:46', 'i3xE9X195F2qSby3hEW_v0y5oQPcj-T1.mp3', 1, 1, 1621985949, 1621985949),
(1712, 113, 1, 5, 'All We Need Is Blood', '', '3:35', 'pwlysQ0HbArgaoyhDEyF6SesM7P3Wt8R.mp3', 1, 1, 1621985950, 1621985950),
(1713, 113, 1, 6, 'Dead Boys Don\'t Cry', '', '3:24', 'Z9ynTIK4aQqzCKNWnmkyxBVGplFYvJ04.mp3', 1, 1, 1621985950, 1621985950),
(1714, 113, 1, 7, 'Son Of A Wolf', '', '3:58', 'T8MWW-v4gNDxjVsrZSnp1HHNoK0Y3kmr.mp3', 1, 1, 1621985950, 1621985950),
(1715, 113, 1, 8, 'Night Of The Werewolves', '', '4:29', 'UjAmfaWxwQACnFj6bcdmDtYDaNBxdMmo.mp3', 1, 1, 1621985950, 1621985950),
(1716, 113, 1, 9, 'Phantom Of The Funeral', '', '3:08', 'Hp9vogo5eLWgGAS1g5hD90E1Qne-jgf9.mp3', 1, 1, 1621985950, 1621985950),
(1717, 113, 1, 10, 'Die, Die, Crucified', '', '2:59', 'bANCtfgmiEeXGxa_YwWokKcgpYS0tUmc.mp3', 1, 1, 1621985950, 1621985950),
(1718, 113, 1, 11, 'Ira Sancti [When The Saints Are Going Wild]', '', '6:25', 'DKaTusmJmjGtvzopuBSjtHoluI6jl23F.mp3', 1, 1, 1621985950, 1621985950),
(1719, 114, 1, 1, 'Amen &amp; Attack', '', '3:55', '39UjSd9RPLDVO-vGEAdsV-_K0cgrOQPM.mp3', 1, 1, 1621985988, 1621985988),
(1720, 114, 1, 2, 'Secrets Of The Sacristy', '', '4:08', 'g5V0U63VkZtxmSie_AyhM_1-8LOTlxT3.mp3', 1, 1, 1621985988, 1621985988),
(1721, 114, 1, 3, 'Coleus Sanctus', '', '3:45', 'XwZ6bsS1txYdpQg0Kk_z6MpprC_1-W4i.mp3', 1, 1, 1621985988, 1621985988),
(1722, 114, 1, 4, 'Sacred &amp; Wild', '', '3:41', 'u0BtzoTeYEL8s5DT6BYOyHc7URhIcWge.mp3', 1, 1, 1621985989, 1621985989),
(1723, 114, 1, 5, 'Kreuzfeuer', '', '3:48', 'ksC_tDNG1-wFjyFpbyo1_iQHoI73eaGg.mp3', 1, 1, 1621985989, 1621985989),
(1724, 114, 1, 6, 'Cardinal Sin', '', '3:47', '6A5cAi5tYcA-juP0sfKZhPcLNaaBKQBo.mp3', 1, 1, 1621985989, 1621985989),
(1725, 114, 1, 7, 'In The Name Of God [Deus Vult]', '', '3:16', '7aVBJqQ43wwhkxUjsX_rN6RSq2UwcgU1.mp3', 1, 1, 1621985989, 1621985989),
(1726, 114, 1, 8, 'Nochnoi Dozor', '', '3:46', 'quvwf5LsOK4QJMs9gYGz1F6qRyYr_4ds.mp3', 1, 1, 1621985989, 1621985989),
(1727, 114, 1, 9, 'Lust For Blood', '', '3:55', 'E0LnO2Z6Drntyrq9LpuZcGCzixvJGGGT.mp3', 1, 1, 1621985989, 1621985989),
(1728, 114, 1, 10, 'Extatum Et Oratum', '', '3:56', 'JnQ9KOb5sHVbumV7ZmxDeIumXJ83eCs9.mp3', 1, 1, 1621985989, 1621985989),
(1729, 114, 1, 11, 'Last Of The Living Dead', '', '7:43', 'xQkxTQ75SuyzbZAezwxTNtUC2Nop78-5.mp3', 1, 1, 1621985989, 1621985989),
(1730, 115, 1, 1, 'Blessed &amp; Possessed', '', '4:42', 'i2nPEI6Ikwus88fJKJOC16RLWJ4A2_An.mp3', 1, 1, 1621986036, 1621986036),
(1731, 115, 1, 2, 'Dead Until Dark', '', '3:50', '78KSP_FVeRGuXKRdUssKr5iPXYKL2eoF.mp3', 1, 1, 1621986036, 1621986036),
(1732, 115, 1, 3, 'Army Of The Night', '', '3:22', 'KOwO9q8hDs22cjLOp-pBJADIwclSPUS6.mp3', 1, 1, 1621986036, 1621986036),
(1733, 115, 1, 4, 'Armata Strigoi', '', '4:00', '-NavFbpM1G9CMSc777b-mLF3D7RvMjZA.mp3', 1, 1, 1621986036, 1621986036),
(1734, 115, 1, 5, 'We Are The Wild', '', '3:41', 'HO67H9FPx9tOh9rJGLo99DnWec7EKTCD.mp3', 1, 1, 1621986036, 1621986036),
(1735, 115, 1, 6, 'Higher Than Heaven', '', '3:31', 'vp7yCWqGXnfLyEuuAxWhfzWWZ7p0VWXw.mp3', 1, 1, 1621986036, 1621986036),
(1736, 115, 1, 7, 'Christ &amp; Combat', '', '3:40', 'asOY9jqhhmQ2G0idCsUaoqPUwtZNynuw.mp3', 1, 1, 1621986036, 1621986036),
(1737, 115, 1, 8, 'Sanctus Dominus', '', '3:23', 'o4cVgBnMW6zYj5L5aBjAEldf2qQLkmxG.mp3', 1, 1, 1621986036, 1621986036),
(1738, 115, 1, 9, 'Sacramental Sister', '', '4:37', 'N0Pb8xQ5c2TQ7jCooP9a1geOlc8a5mZ3.mp3', 1, 1, 1621986036, 1621986036),
(1739, 115, 1, 10, 'All You Can Bleed', '', '3:44', 'bB7l0WnKpWx-paFOzYz9slBtv3jg0ol8.mp3', 1, 1, 1621986036, 1621986036),
(1740, 115, 1, 11, 'Let There Be Night', '', '7:19', 'Z3Ul30h7MGpSgyK4c8FC82j463_KUuXt.mp3', 1, 1, 1621986036, 1621986036),
(1741, 116, 1, 1, 'Fire &amp; Forgive', '', '4:31', 'M3Zkkrso1_osev_CCu9dW-gU_X7SZN2Y.mp3', 1, 1, 1621986074, 1621986074),
(1742, 116, 1, 2, 'Demons Are a Girl\'s Best Friend', '', '3:38', '5xtalhczjad_lu8TbMADpQKa9xkMAVdx.mp3', 1, 1, 1621986074, 1621986074),
(1743, 116, 1, 3, 'Killers With the Cross', '', '4:10', 'fpq_wu_dZiFtcHyG9EXSgJWfL70BLojg.mp3', 1, 1, 1621986074, 1621986074),
(1744, 116, 1, 4, 'Incense and Iron', '', '3:58', 'Oj4ZJM5ApL_-7C7N5UbKycV80uyfLPJB.mp3', 1, 1, 1621986074, 1621986074),
(1745, 116, 1, 5, 'Where the Wild Wolves Have Gone', '', '4:14', 'PH24y4WoAZ_yM7UQYUMa42ZvyrGPUCpP.mp3', 1, 1, 1621986074, 1621986074),
(1746, 116, 1, 6, 'Stossgebet', '', '3:54', 'gRkpflpt3X6SM_1aouCv_-tdZYvxx2fm.mp3', 1, 1, 1621986074, 1621986074),
(1747, 116, 1, 7, 'Nightside of Siberia', '', '3:53', 'CjR8ufPqAWiRvEck_q_JbRqkht3QOxsP.mp3', 1, 1, 1621986074, 1621986074),
(1748, 116, 1, 8, 'The Sacrament of Sin', '', '3:27', 'uWVJZMIh_RkJzcYvqJAbsqbtZFpxgGz5.mp3', 1, 1, 1621986074, 1621986074),
(1749, 116, 1, 9, 'Venom of Venus', '', '3:29', 'X6F_Fe7kN_bB2D1bMuHZyVIwIKm-QcwW.mp3', 1, 1, 1621986074, 1621986074),
(1750, 116, 1, 10, 'Nighttime Rebel', '', '4:04', 'sgoxL2WG7X9OE2BcHysHegKvIBzSLX09.mp3', 1, 1, 1621986074, 1621986074),
(1751, 116, 1, 11, 'Fist by Fist (Sacralize of Strike)', '', '3:30', 'l2L9m5Cy3sTwgZFTbNxKx0jwaLNAjc_L.mp3', 1, 1, 1621986074, 1621986074),
(1752, 116, 1, 12, 'Midnight Madonna', '', '3:34', 'mVnQWoy7N1BKJTW1H0XIDNYQfAKXayUw.mp3', 1, 1, 1621986074, 1621986074),
(1753, 117, 1, 1, 'Touch Of Evil', '', '5:40', 'sHMFX2THW7S-J8FKGWdCD7ru08mZ3Bkt.mp3', 1, 1, 1621986109, 1621986109),
(1754, 117, 1, 2, 'Conquistadores', '', '4:45', 'kWxG5FHQjvp7OXpjVtor-TAu4SA3E0H6.mp3', 1, 1, 1621986109, 1621986109),
(1755, 117, 1, 3, 'Edge Of Thorns', '', '6:00', 'hCSuCq0gaR0dxI8UVm1X7h98dOxFRWGH.mp3', 1, 1, 1621986109, 1621986109),
(1756, 117, 1, 4, 'Power And Glory', '', '4:55', 'i-T_Wvzl_K0CylSqrCryIfvKjNRxeUDj.mp3', 1, 1, 1621986109, 1621986109),
(1757, 117, 1, 5, 'Out In The Fields', '', '4:16', 'MnvMFIiuf21iylkYsOD8BN4nO5WyT_32.mp3', 1, 1, 1621986109, 1621986109),
(1758, 117, 1, 6, 'Shot In The Dark', '', '4:11', 'p-2a7gkKXI74PoEHPii0hZMRrvCo8BXk.mp3', 1, 1, 1621986109, 1621986109),
(1759, 117, 1, 7, 'Gods Of War Arise', '', '5:54', 'agiTKphZgN4hkO3ypiXwF_5Iraou6fD0.mp3', 1, 1, 1621986109, 1621986109),
(1760, 117, 1, 8, 'The Evil That Men Do', '', '4:31', 'mhKTdQKWQG7hwdVwOa-15JcwxhFb-iP8.mp3', 1, 1, 1621986109, 1621986109),
(1761, 117, 1, 9, 'Headless Cross', '', '6:10', '3kM5RejIH4h-TSoD23OroswE1BSQ8sQk.mp3', 1, 1, 1621986110, 1621986110),
(1762, 117, 1, 10, 'Night Crawler', '', '5:42', 'jCMqwkinZFEvmjIRJF-LKVV39xNhF3Ie.mp3', 1, 1, 1621986110, 1621986110),
(1763, 118, 1, 1, '742617000027', '', '0:36', 'MqVcIZn_euKrvuO3k_2KBkc_3GJJIU0B.mp3', 1, 1, 1621986168, 1621986168),
(1764, 118, 1, 2, '(sic)', '', '3:20', 'iHCHXVsVwa1uV6lDRL0sKweRE-IXE6xD.mp3', 1, 1, 1621986168, 1621986168),
(1765, 118, 1, 3, 'Eyeless', '', '3:56', '6CRkce3TePMxQm01l_JrnsbZBDY6gJ6w.mp3', 1, 1, 1621986168, 1621986168),
(1766, 118, 1, 4, 'Wait And Bleed', '', '2:28', 'xgLTbkjOpsqzgPr_LdT8CwmHeNURuqhG.mp3', 1, 1, 1621986168, 1621986168),
(1767, 118, 1, 5, 'Surfacing', '', '3:38', '2bM_qmrIlSP3dsLJdFb2YJswH7t3c6Hs.mp3', 1, 1, 1621986168, 1621986168),
(1768, 118, 1, 6, 'Spit It Out', '', '2:40', 'rqEYFC0x6-tKIXktfmUWRSlYfztBwZO6.mp3', 1, 1, 1621986168, 1621986168),
(1769, 118, 1, 7, 'Tattered &amp; Torn', '', '2:54', 'OMYY6l10nEOk4Vlqu1fPbD8-NKRuOhNp.mp3', 1, 1, 1621986168, 1621986168),
(1770, 118, 1, 8, 'Me Inside', '', '2:40', 'm87K-BmRCEjx8qnoIUfOQIkMrB3J_W-K.mp3', 1, 1, 1621986168, 1621986168),
(1771, 118, 1, 9, 'Liberate', '', '3:07', 'F-yz7HvvULHBTKf15Z_Nt5mDQUrEr6gL.mp3', 1, 1, 1621986168, 1621986168),
(1772, 118, 1, 10, 'Prosthetics', '', '4:58', 'JrtBbURGc4YW7Y37AwyBJx-vujisXb40.mp3', 1, 1, 1621986169, 1621986169),
(1773, 118, 1, 11, 'No Life', '', '2:47', 'xGwAFLBRJ7yl2YWFyzJOCpkifl0UXInB.mp3', 1, 1, 1621986169, 1621986169),
(1774, 118, 1, 12, 'Diluted', '', '3:23', 'm8Gk97bGX8ZOlIVV6TxjdCJlxl8Vyd_s.mp3', 1, 1, 1621986169, 1621986169),
(1775, 118, 1, 13, 'Only One', '', '2:26', 'OYx_u7Ta5BdH6uotLWkZIBuQ46yzbreY.mp3', 1, 1, 1621986169, 1621986169),
(1776, 118, 1, 14, 'Scissors', '', '8:25', 'po43xgeaQHchXS-32q2FapdssxgCD9Qm.mp3', 1, 1, 1621986169, 1621986169),
(1777, 118, 1, 15, 'Get This', 'Bonus Track', '2:03', 'sxQYGVCwfdwgIADZezosMlHVSM1NjgbN.mp3', 1, 1, 1621986169, 1621986183),
(1778, 118, 1, 16, 'Spit It Out', 'Hyper Version, Bonus Track', '2:25', 'iIW252rzdnkaRBr9Divel6a-1QXjU1Iv.mp3', 1, 1, 1621986169, 1621986195),
(1779, 118, 1, 17, 'Wait And Bleed', 'Terry Date Mix, Bonus Track', '2:31', 'fd3mMTolhjl2RCFykzV3Xgi5BH8NmuJo.mp3', 1, 1, 1621986169, 1621986206),
(1780, 118, 1, 18, 'Interloper', 'Demo, Bonus Track', '2:19', '-X98dgkovnDrVqdLwFYBkklWDKLLPSM6.mp3', 1, 1, 1621986169, 1621986220),
(1781, 118, 1, 19, 'Despise', 'Demo, Bonus Track', '3:41', 'wgFIbOraagePJ_ucUhfAdOjL1kyU3qaU.mp3', 1, 1, 1621986169, 1621986230),
(1782, 119, 1, 1, '(515)', '', '1:00', '7pF-C7JzW-yQ4OT5QdTCjaVn90eLj28V.mp3', 1, 1, 1621986269, 1621986269),
(1783, 119, 1, 2, 'People = Shit', '', '3:36', '8ULaf2KsElFYsCKqMqqWXQHqyPr1z8pE.mp3', 1, 1, 1621986269, 1621986269),
(1784, 119, 1, 3, 'Disasterpiece', '', '5:08', 'sdxt6PC5jKBcWFesxRqMTve08vNbyBv9.mp3', 1, 1, 1621986270, 1621986270),
(1785, 119, 1, 4, 'My Plague', '', '3:40', 'eCa3BvVH9iDaEpAj27S8vdqVFH1O_3XL.mp3', 1, 1, 1621986270, 1621986270),
(1786, 119, 1, 5, 'Everything Ends', '', '4:14', '9jqn9QJo5Ino12V5EI_pMXGzz6UVitNx.mp3', 1, 1, 1621986270, 1621986270),
(1787, 119, 1, 6, 'The Heretic Anthem', '', '4:14', 'RmPIqF4-IQjqHXtphSvqB36Oyn-Xw4VR.mp3', 1, 1, 1621986270, 1621986270),
(1788, 119, 1, 7, 'Gently', '', '4:54', 'RToLOMfwJYs_HEtxhQv_v9Eo1io2KM9b.mp3', 1, 1, 1621986270, 1621986270),
(1789, 119, 1, 8, 'Left Behind', '', '4:02', '5iwF7p77Ub9qdQgfQ3E0VdHqUFR3QcwJ.mp3', 1, 1, 1621986270, 1621986270),
(1790, 119, 1, 9, 'The Shape', '', '3:38', 'NtpxxiX6VuMrn2azBR9Hs_rFHFsRILaX.mp3', 1, 1, 1621986270, 1621986270),
(1791, 119, 1, 10, 'I Am Hated', '', '2:38', 'zMnxkiQ1MUZs0mLmYb9PdgVXjx3VsA5V.mp3', 1, 1, 1621986270, 1621986270),
(1792, 119, 1, 11, 'Skin Ticket', '', '6:41', 'NWyQty7OMfwYns-XtPPFFtw6OLlQHGFy.mp3', 1, 1, 1621986270, 1621986270),
(1793, 119, 1, 12, 'New Abortion', '', '3:37', 'Qs0aMQ-X2bR0jjN_YkTtTwZJi4xBbYkz.mp3', 1, 1, 1621986270, 1621986270),
(1794, 119, 1, 13, 'Metabolic', '', '4:00', 'xHIqui6WVgk3ePwWTmzYeqfcvjW1vmPx.mp3', 1, 1, 1621986270, 1621986270),
(1795, 119, 1, 14, 'Iowa', '', '15:05', 'c6MNw83erSXq67KrHy8PVt98nU0EPZxN.mp3', 1, 1, 1621986271, 1621986271),
(1796, 120, 1, 1, 'Don\'t Get Close', '', '3:48', 'UZ0J0IEfPJeEIq6wgLm7ZXiVH8Yle3ah.mp3', 1, 1, 1621986325, 1621986325),
(1797, 120, 1, 1, 'Prelude 3.0', '', '3:57', 'yd3jjGi5Ba_2kd_NvZAanycvlfTe5Ahk.mp3', 1, 1, 1621986325, 1621986325),
(1798, 120, 1, 2, 'Scream', '', '4:32', 'VMF5vYWKqykZyL9_D9eLSFsr_JQvY6LN.mp3', 1, 1, 1621986325, 1621986325),
(1799, 120, 1, 2, 'The Blister Exists', '', '5:20', '1Jg6LIh1xs_dq_hVsApLjg0Witfcxzfc.mp3', 1, 1, 1621986325, 1621986325),
(1800, 120, 1, 3, 'Three Nil', '', '4:48', '28TeId_EBIs-4CFzgGDCYYFJJv_QejUR.mp3', 1, 1, 1621986325, 1621986325),
(1801, 120, 1, 3, 'Vermilion', 'Terry Date Mix', '5:26', 'BAd2DpZ8ZVLHn4MUZRgQfdsTtfzjswuv.mp3', 1, 1, 1621986325, 1621986344),
(1802, 120, 1, 4, 'Danger - Keep Away', 'Full-Length Version', '7:56', 'g2Mwo4-dQ-XEr8oGPLj6hSTLFLkJxUrk.mp3', 1, 1, 1621986325, 1621986352),
(1803, 120, 1, 4, 'Duality', '', '4:13', 'khArUdxXZZtv48oZAJjm1-tjO0CgXz01.mp3', 1, 1, 1621986325, 1621986325),
(1804, 120, 1, 5, 'Opium Of The People', '', '3:14', '7stklY7HZkEogIh5wIl324RopcAG3lTT.mp3', 1, 1, 1621986325, 1621986325),
(1805, 120, 1, 6, 'Circle', '', '4:22', 'rFhJYKqRdoTSqmzF_fce6GdMBNTOU06U.mp3', 1, 1, 1621986325, 1621986325),
(1806, 120, 1, 7, 'Welcome', '', '3:15', 'ZRX7V9_th39ZoQlunnOUZ3OGbbhJQ1jP.mp3', 1, 1, 1621986326, 1621986326),
(1807, 120, 1, 8, 'Vermilion', '', '5:17', 'Hc2hnV3M4RiLA2pWTdqxONMOygPGAnPS.mp3', 1, 1, 1621986326, 1621986326),
(1808, 120, 1, 9, 'Pulse Of The Maggots', '', '4:20', '0HTh-E3G_xmmMFEP7Nv73OP8ZLHN3WXJ.mp3', 1, 1, 1621986326, 1621986326),
(1809, 120, 1, 10, 'Before I Forget', '', '4:39', 'FOfqJuJ7LE6ZaNt9V_Zrh3nBwOgJOo8_.mp3', 1, 1, 1621986326, 1621986326),
(1810, 120, 1, 11, 'Vermilion Pt. 2', '', '3:44', 'BV9Dk_KR5bbMio1LTsg6F9LY3CxNfuON.mp3', 1, 1, 1621986326, 1621986326),
(1811, 120, 1, 12, 'The Nameless', '', '4:28', 'ftXdHVYdUDCrme9yZN76XxVQnnYjlWxb.mp3', 1, 1, 1621986326, 1621986326),
(1812, 120, 1, 13, 'The Virus Of Life', '', '5:25', '3e3KeDCK-_pqIwty9ffXkxd9CXvXOhdY.mp3', 1, 1, 1621986326, 1621986326),
(1813, 120, 1, 14, 'Danger - Keep Away', '', '3:14', 's0xppfSegwYyaQRVCektVg-KAmXPJdTC.mp3', 1, 1, 1621986326, 1621986326),
(1814, 121, 1, 1, '.execute.', '', '1:49', 'BjtT7P6NUTBQZY9LFfNzo2gqnLDk_cSY.mp3', 1, 1, 1621986397, 1621986397),
(1815, 121, 1, 2, 'Gematria (The Killing Name)', '', '6:02', 'UP68i_GJOUt_ob8GDj9B564RGUz83157.mp3', 1, 1, 1621986397, 1621986397),
(1816, 121, 1, 3, 'Sulfur', '', '4:38', 'y0mqlcJ6nsbr0dVE61IsnWfB8ff7tDrH.mp3', 1, 1, 1621986397, 1621986397),
(1817, 121, 1, 4, 'Psychosocial', '', '4:44', 'D2pQXWaDaKf3uNRT6ev8QlGr2vG32agc.mp3', 1, 1, 1621986397, 1621986397),
(1818, 121, 1, 5, 'Dead Memories', '', '4:29', 'tWFCGlDyELKHOL07t-CzYXAmaTQHPZyS.mp3', 1, 1, 1621986398, 1621986398),
(1819, 121, 1, 6, 'Vendetta', '', '5:16', 'VgHlYxHu5sC_ZhLLvs76z1pKvDADMHoF.mp3', 1, 1, 1621986398, 1621986398),
(1820, 121, 1, 7, 'Butcher\'s Hook', '', '4:15', 'XDb6FG6SGcyL3TZvSDCmMZfnXrQYkSx7.mp3', 1, 1, 1621986398, 1621986398),
(1821, 121, 1, 8, 'Gehenna', '', '6:54', '0Gaj_BYdN5EQ92d1QNYB4-hDcBRKIUfR.mp3', 1, 1, 1621986398, 1621986398),
(1822, 121, 1, 9, 'This Cold Black', '', '4:41', 'Ub1FZ-hk6CHRkK1dsO0SuC__zhPHsFAo.mp3', 1, 1, 1621986398, 1621986398),
(1823, 121, 1, 10, 'Wherein Lies Continue', '', '5:37', 'IY3VV4pEoHl8bZbrcKY7szHqVvZuYl90.mp3', 1, 1, 1621986398, 1621986398),
(1824, 121, 1, 11, 'Snuff', '', '4:37', 'F5QpvIxvBK01ae51oQ2hW2-NeXMzxy_R.mp3', 1, 1, 1621986398, 1621986398),
(1825, 121, 1, 12, 'All Hope Is Gone', '', '4:48', 'oOTpZNNt41S_Hku5xoGWd-VXNfRhaGg8.mp3', 1, 1, 1621986398, 1621986398),
(1826, 121, 1, 13, 'Child Of Burning Time', 'Bonus Track', '5:10', 'UBAlUmFRZTwhMjKClzqFYPZZNeiXOZNQ.mp3', 1, 1, 1621986399, 1621986412),
(1827, 121, 1, 14, 'Vermilion Pt.2', 'Bloodstone Mix, Bonus Track', '3:40', 'hp5uL7lbtSJBRBd9KCM8vzjfzB0cMmYN.mp3', 1, 1, 1621986399, 1621986421),
(1828, 121, 1, 15, '\'Til We Die', 'Bonus Track', '5:46', 'WtyW9e_h0LjphNmnqGk1xt4WBd8HYnZB.mp3', 1, 1, 1621986399, 1621986426),
(1829, 122, 1, 1, 'XIX', '', '3:10', '5R0wTN_880dbDOMlbXY2XRWMsci9S9no.mp3', 1, 1, 1621986504, 1621986504),
(1830, 122, 1, 2, 'Sarcastrophe', '', '5:06', 'cWnags9iWn2jfPuRL-GkYoT2eMbV12uq.mp3', 1, 1, 1621986504, 1621986504),
(1831, 122, 1, 3, 'AOV', '', '5:33', 'Yz2sC-wAa-dtftN0sKqhJynKWd-VOYOT.mp3', 1, 1, 1621986504, 1621986504),
(1832, 122, 1, 4, 'The Devil In I', '', '5:43', 'flFVOx3Z6ViaTXdnXCerj7a50U34hE93.mp3', 1, 1, 1621986504, 1621986504),
(1833, 122, 1, 5, 'Killpop', '', '3:45', '3b3AS24tEa9UCItR7Jo__8XfqypEpEfn.mp3', 1, 1, 1621986504, 1621986504),
(1834, 122, 1, 6, 'Skeptic', '', '4:47', 'Th13GdXhEwMlG4ZEYt6jCbLbqzQNnHAK.mp3', 1, 1, 1621986504, 1621986504),
(1835, 122, 1, 8, 'Goodbye', '', '4:35', 'PUZpviKEk8fh81dH_dFcUcU9Okie0XK2.mp3', 1, 1, 1621986505, 1621986505),
(1836, 122, 1, 9, 'Nomadic', '', '4:18', 'cZrsdZURIuacOxLdLFvivowcEE3e93o-.mp3', 1, 1, 1621986505, 1621986505),
(1837, 122, 1, 10, 'The One That Kills The Least', '', '4:12', 'L-yC57n-ouU544TP67QLmDjQYlIfoc1A.mp3', 1, 1, 1621986505, 1621986505),
(1838, 122, 1, 11, 'Custer', '', '4:15', 'vH7QUXkBibRpG409BQyCQg6E-YmM83Y3.mp3', 1, 1, 1621986505, 1621986505),
(1839, 122, 1, 12, 'Be Prepared For Hell', '', '1:58', 'i-5dea94RjsBUBqlQ_87ImBqEcVcae_T.mp3', 1, 1, 1621986505, 1621986505),
(1840, 122, 1, 13, 'The Negative One', '', '5:25', '2tfvndab4VYu9hVLeBF6jmtBuf2LRGsx.mp3', 1, 1, 1621986505, 1621986505),
(1841, 122, 1, 14, 'If Rain Is What You Want', '', '6:21', '24p18GhpZs61uDrUs5dz8P_MXyzZtpIz.mp3', 1, 1, 1621986505, 1621986505),
(1842, 122, 2, 1, 'Override', '', '5:37', 'qiQrY1gh1dbXreo7cqNRJTADr3Bxp_yl.mp3', 1, 1, 1621986505, 1621986520),
(1843, 122, 2, 2, 'The Burden', '', '5:23', '3bNf9gNcINVkmbCdTPK9zlFHZTpEz_em.mp3', 1, 1, 1621986505, 1621986523),
(1844, 122, 2, 3, '-Silent-', '', '2:00', '2FeV2qc2LdbbkxN3o3Q_D-F2U-R7cCWx.mp3', 1, 1, 1621986506, 1621986525),
(1845, 122, 2, 4, '-Talk-', '', '6:20', 'c70N136xMjinFPhp6IG0r3g8zJhXsv3q.mp3', 1, 1, 1621986506, 1621986527),
(1846, 122, 2, 5, '-Funny-', '', '1:29', 'qS1Qx5Ur8k0trsdz3W_fxeY5sGrCOZEr.mp3', 1, 1, 1621986506, 1621986529),
(1847, 122, 2, 7, 'Lech', '', '4:50', 'hQH1NldB9BKfic3KRNf4URc7TaALRDbB.mp3', 1, 1, 1621986506, 1621986531),
(1848, 123, 1, 1, 'Insert Coin', '', '1:39', 'GJguBlOruhFyxu44nmXHedDXaXcKJ_KE.mp3', 1, 1, 1621986588, 1621986588),
(1849, 123, 1, 2, 'Unsainted', '', '4:21', 'JntQyOPJfsK1v4cKgQlmDH6dZy9EOlAC.mp3', 1, 1, 1621986588, 1621986588),
(1850, 123, 1, 3, 'Birth Of The Cruel', '', '4:36', 'sJMbf1hcRddw_kTDCEyY8Yue-VntvCQH.mp3', 1, 1, 1621986588, 1621986588),
(1851, 123, 1, 4, 'Death Because Of Death', '', '1:21', 't8eGzCSitSzXLQJPJdrEsImFCj5OmjMD.mp3', 1, 1, 1621986588, 1621986588),
(1852, 123, 1, 5, 'Nero Forte', '', '5:15', 'cH5b1c6f3A3wFLT8q6HvkFcNzNhzytB9.mp3', 1, 1, 1621986588, 1621986588),
(1853, 123, 1, 6, 'Critical Darling', '', '6:26', '65LM1_rywTtWHeLpLONRw8E9Bwq07X5-.mp3', 1, 1, 1621986588, 1621986588),
(1854, 123, 1, 7, 'A Liar\'s Funeral', '', '5:27', 'URFDY7OH3euxjc46KrtSwZZic4SsHekW.mp3', 1, 1, 1621986588, 1621986588),
(1855, 123, 1, 8, 'Red Flag', '', '4:12', 'ofQXBwWJNwWZiorS9Gny1iaiX0al6KF-.mp3', 1, 1, 1621986588, 1621986588),
(1856, 123, 1, 9, 'What\'s Next', '', '0:54', 'rSlY1MvEeVvV2qR-L1wkULS-7Wqnls1z.mp3', 1, 1, 1621986588, 1621986588),
(1857, 123, 1, 10, 'Spiders', '', '4:04', 'xiWCurFFjSnojJTVjEGkIi5jng_86A3Z.mp3', 1, 1, 1621986588, 1621986588),
(1858, 123, 1, 11, 'Orphan', '', '6:02', 'p58ylW_ADFGIQ6ZaZ6rmSKUcNo63sxof.mp3', 1, 1, 1621986588, 1621986588),
(1859, 123, 1, 12, 'My Pain', '', '6:48', 'z3Z3QcUWHpjs_QaKNKXprRhLcHcUVfH_.mp3', 1, 1, 1621986588, 1621986588),
(1860, 123, 1, 13, 'Not Long For This World', '', '6:36', 'v9nVMb5P7yPmkCaoScixNDyu0H1f9Izs.mp3', 1, 1, 1621986590, 1621986590),
(1861, 123, 1, 14, 'Solway Firth', '', '5:56', 'YBACHc-UYDDpfUJAF4nc4N7z6A_G81Ff.mp3', 1, 1, 1621986590, 1621986590),
(1862, 124, 1, 1, 'Good', '', '2:34', 'SijlnSu2i981HtDBMpXNWXwBbt4qOYqL.mp3', 1, 1, 1622910016, 1622910016),
(1863, 124, 1, 2, 'The Saddest Song', '', '2:53', 'n0iwoqdPxzI7FxmLVxJl3uFFixgoB8Gz.mp3', 1, 1, 1622910016, 1622910016),
(1864, 124, 1, 3, 'Claire', '', '3:09', '2d68Cn0MWmunwvXECqxyYeG3bym6RTd0.mp3', 1, 1, 1622910016, 1622910016),
(1865, 124, 1, 4, 'Have A Lucky Day', '', '3:30', 'aPb0k4wBm_h_HM9puhJL4Svm6kFQHJ37.mp3', 1, 1, 1622910017, 1622910017),
(1866, 124, 1, 5, 'You Speak My Language', '', '3:26', 'HmukmDZvGYdBUc082D5P4VOqJ84J35jl.mp3', 1, 1, 1622910017, 1622910017),
(1867, 124, 1, 6, 'You Look Like Rain', '', '3:40', 'q6hbO_dgTsE8yHgwM8rUbcP2U3TsVrhl.mp3', 1, 1, 1622910017, 1622910017),
(1868, 124, 1, 7, 'Do Not Go Quietly Unto Your Grave', '', '3:20', 'jRBdFqr_cnzuh3aQEODjlZSbpPyqHp_y.mp3', 1, 1, 1622910017, 1622910017),
(1869, 124, 1, 8, 'Lisa', '', '0:51', 'S8dbg9zQbgMHgMp-dttJtVdgeK1_Zmyl.mp3', 1, 1, 1622910017, 1622910017),
(1870, 124, 1, 9, 'The Only One', '', '2:44', 'fKtmNq-NtL8CIgQh59Qw-gb6krwKft2q.mp3', 1, 1, 1622910017, 1622910017),
(1871, 124, 1, 10, 'Test-Tube Baby/Shoot\'m Down', '', '3:10', 'PuXjqbBqt6NuFfqDNFINFptk8xuq60d9.mp3', 1, 1, 1622910017, 1622910017),
(1872, 124, 1, 11, 'The Other Side', '', '3:54', 't2tgOVdeo2At8z3fpg9lIVuFdm4YMYbM.mp3', 1, 1, 1622910017, 1622910017),
(1873, 124, 1, 12, 'I Know You (Part L)', '', '2:17', 'dotI0zhJd_Gp-jW8rMeyv91xh4gK46b6.mp3', 1, 1, 1622910017, 1622910017),
(1874, 124, 1, 13, 'I Know You (Part Ll)', '', '2:47', 'EOay8kqUE2tofKjWBc0Z2SUvPpW1Al9R.mp3', 1, 1, 1622910017, 1622910017),
(1875, 125, 1, 1, 'Dawna', '', '0:44', 'IxqYx7jhtFiRFUKMijU2Kg7DLeRXgTVC.mp3', 1, 1, 1622910215, 1622910215),
(1876, 125, 1, 2, 'Buena', '', '3:20', 'bSZ5tAnYfpsk918fjI74c5N5pxHtMNIg.mp3', 1, 1, 1622910215, 1622910215),
(1877, 125, 1, 3, 'I\'m Free Now', '', '3:25', 'qxEwNyFvPKaLUPc4AUUy78OnQtTBpjME.mp3', 1, 1, 1622910215, 1622910215),
(1878, 125, 1, 4, 'All Wrong', '', '3:41', 'ba-e3gbIWvgMPdoMYmoZG1_nMerrbqsX.mp3', 1, 1, 1622910215, 1622910215),
(1879, 125, 1, 5, 'Candy', '', '3:15', 'oFUt_CcdHe7hX5JFcfRK3vxcKf26SBc2.mp3', 1, 1, 1622910215, 1622910215),
(1880, 125, 1, 6, 'A Head With Wings', '', '3:40', '4W11f5ct-4TYWSYOZH_eULFXWjs-etmX.mp3', 1, 1, 1622910215, 1622910215),
(1881, 125, 1, 7, 'In Spite Of Me', '', '2:35', 'DjOZzl2FkkVMn86IMNRJ-5ha7S0vPPxc.mp3', 1, 1, 1622910215, 1622910215),
(1882, 125, 1, 8, 'Thursday', '', '3:26', 'BLCfjh0YFebR_OpjjS1QeVTPqloHyKjs.mp3', 1, 1, 1622910215, 1622910215),
(1883, 125, 1, 9, 'Cure For Pain', '', '3:14', 'eafLoRwb7f0644pXys8eOE1-rCRRuKUe.mp3', 1, 1, 1622910215, 1622910215),
(1884, 125, 1, 10, 'Mary Won\'t You Call My Name?', '', '2:29', 'QOlybpOu4OgeBo6JSdGhhMGQ7euhspZY.mp3', 1, 1, 1622910216, 1622910216),
(1885, 125, 1, 11, 'Let\'s Take A Trip Together', '', '3:00', 'naQbBcX4A3RjflPQf-8Uo8IivtvZaKew.mp3', 1, 1, 1622910216, 1622910216),
(1886, 125, 1, 12, 'Sheila', '', '2:49', 'LpYbz4oN_0ntA9fPqL4pJ4Dnhj01-bB1.mp3', 1, 1, 1622910216, 1622910216),
(1887, 125, 1, 13, 'Miles Davis\' Funeral', '', '1:41', 'ABSpecCAZRbzGrp7fVUBlDlKLqsaNpTl.mp3', 1, 1, 1622910216, 1622910216),
(1888, 126, 1, 1, 'Honey White', '', '3:07', 'nIDyMcvKJKARNLM3EROWjmkEqQweLv2J.mp3', 1, 1, 1622910249, 1622910249),
(1889, 126, 1, 2, 'Scratch', '', '3:14', '_By9Ixj19kqOU9KIIiAdIH0rctekPxWi.mp3', 1, 1, 1622910249, 1622910249),
(1890, 126, 1, 3, 'Radar', '', '3:29', 'Eh0b9nSLNUeCJZzPXYm-wvdRhVawZ2Eb.mp3', 1, 1, 1622910250, 1622910250),
(1891, 126, 1, 4, 'Whisper', '', '3:29', 'J8QMRmmT5a57aUtXlO86gILtKVEzP8Xl.mp3', 1, 1, 1622910250, 1622910250),
(1892, 126, 1, 5, 'Yes', '', '2:01', '9IPNgwb7Y1Dp8aU4qh1KhAzC7UyU0Hx3.mp3', 1, 1, 1622910250, 1622910250),
(1893, 126, 1, 6, 'All Your Way', '', '3:04', '2HzKG_I4tAMlDUamZvwEVsKSgjcwO53Y.mp3', 1, 1, 1622910250, 1622910250),
(1894, 126, 1, 7, 'Super Sex', '', '3:54', 'yCsgsD7Bi2SC72mHI2KqXckKXVBjOtOZ.mp3', 1, 1, 1622910250, 1622910250),
(1895, 126, 1, 8, 'I Had My Chance', '', '3:05', 'acmu_d3xt64Dbpdy2z1Y1zWTq4puox0F.mp3', 1, 1, 1622910250, 1622910250),
(1896, 126, 1, 9, 'The Jury', '', '2:08', 'kV4XNKw85JwhVLdmErOR5Fq6gwanZ8Wj.mp3', 1, 1, 1622910250, 1622910250),
(1897, 126, 1, 10, 'Sharks', '', '2:23', 'CeP2muHzaCuIZzACsYGgnORanoYjlqyH.mp3', 1, 1, 1622910250, 1622910250),
(1898, 126, 1, 11, 'Free Love', '', '4:15', 'pdgJiIdUIr_YVjdjNDbYZ3kmXfhoFTfo.mp3', 1, 1, 1622910250, 1622910250),
(1899, 126, 1, 12, 'Gone For Good', '', '2:54', 'ono2ePwsH-Q3oGUZsqDurg9qjk_7Horl.mp3', 1, 1, 1622910250, 1622910250),
(1900, 127, 1, 1, 'Lilah (Instr.)', '', '1:00', 'mtd16-nGlNG10UwSqnzBTUJlSv18Phsh.mp3', 1, 1, 1622910313, 1622910313),
(1901, 127, 1, 2, 'Potion', '', '2:01', '03uS8rvkrMii3o0O_Nf1R6WNk2uJDzGf.mp3', 1, 1, 1622910313, 1622910313);
INSERT INTO `track` (`id`, `album`, `disk`, `number`, `name`, `signature`, `playtime`, `file`, `creator`, `editor`, `created_at`, `updated_at`) VALUES
(1902, 127, 1, 3, 'I Know You (Pt. III)', '', '3:32', 'Xa1EkztvPC4CcETZ5-sL5RdSDxfoZrOy.mp3', 1, 1, 1622910313, 1622910313),
(1903, 127, 1, 4, 'Early To Bed', '', '2:58', '88L9yVNeEfqQkxy7MSVu9Uzt5bhmShDK.mp3', 1, 1, 1622910313, 1622910313),
(1904, 127, 1, 5, 'Wishing Well', '', '3:32', 'QfSFNY8d8fCelFjcFLfB79LDbxBEjezb.mp3', 1, 1, 1622910313, 1622910313),
(1905, 127, 1, 6, 'Like Swimming', '', '4:01', 'Y7y98iWu_Np4rOzzBO40AvtOJdnAtCZr.mp3', 1, 1, 1622910313, 1622910313),
(1906, 127, 1, 7, 'Murder For The Money', '', '3:34', 'bybKnmGmcKgbgh3XT6RM6tPC9NGAqvJE.mp3', 1, 1, 1622910313, 1622910313),
(1907, 127, 1, 8, 'French Fries w/ Pepper', '', '2:53', 'V5kW6SCUBZpZXz4H8Z0LzSmaGGRtMXF-.mp3', 1, 1, 1622910313, 1622910313),
(1908, 127, 1, 9, 'Empty Box', '', '3:54', '0TA8BGVAohfNJuHPnIzJuVo_AL5QnX9C.mp3', 1, 1, 1622910313, 1622910313),
(1909, 127, 1, 10, 'Eleven O\' Clock', '', '3:19', 'hjcsxJuT3XnAOPE92ApGLw7HCugks7rB.mp3', 1, 1, 1622910313, 1622910313),
(1910, 127, 1, 11, 'Hanging On A Curtain', '', '3:48', 'cdhkp71ueFAPHuAGS3bHfhgi0nSAEPz5.mp3', 1, 1, 1622910313, 1622910313),
(1911, 127, 1, 12, 'Swing It Low', '', '3:16', 'F0vcEpYjXz7To2gkq4DsnuONePCjeUN8.mp3', 1, 1, 1622910314, 1622910314),
(1912, 128, 1, 1, 'Night', '', '4:49', 'hFA_CJelHQdzyHCKh8xKwu-e6Yhwwa31.mp3', 1, 1, 1622910347, 1622910347),
(1913, 128, 1, 2, 'So Many Ways', '', '4:02', 'XldQxf4dL6vqBZpiX1yIWKFrPA0MTz8m.mp3', 1, 1, 1622910347, 1622910347),
(1914, 128, 1, 3, 'Souvenir', '', '4:41', 'FqqZOk7uLvBqwCHLpO9xyLULPJ93btQq.mp3', 1, 1, 1622910347, 1622910347),
(1915, 128, 1, 4, 'Top Floor, Bottom Buzzer', '', '5:44', '_Tvje_bTGOotVK2jxh8q__70FzNgMgeZ.mp3', 1, 1, 1622910347, 1622910347),
(1916, 128, 1, 5, 'Like A Mirror', '', '5:26', 'Ozy2rE6kbifixIJOnQLJbEExRs6Ba31f.mp3', 1, 1, 1622910348, 1622910348),
(1917, 128, 1, 6, 'Good Woman Is Hard To Find', '', '4:14', 'jQfLnukB8SqWRplx1InUV2aPM1bPuV9T.mp3', 1, 1, 1622910348, 1622910348),
(1918, 128, 1, 7, 'Rope On Fire', '', '5:37', 'KwUjD6iav6YPLDYce8jaOxLwsa_CMVh0.mp3', 1, 1, 1622910348, 1622910348),
(1919, 128, 1, 8, 'I\'m Yours, You\'re Mine', '', '3:47', 'vgT0eW9uYPn14TUtU-K3scDpXWeELrc5.mp3', 1, 1, 1622910348, 1622910348),
(1920, 128, 1, 9, 'Way We Met', '', '3:00', 'H2fPYRKJFq5QiYN5Vr6_nNF5e5cm9fc8.mp3', 1, 1, 1622910348, 1622910348),
(1921, 128, 1, 10, 'Slow Numbers', '', '3:58', 'ZedBu6msCDjAk59LeCl70qG3bPar5EnV.mp3', 1, 1, 1622910348, 1622910348),
(1922, 128, 1, 11, 'Take Me With You', '', '4:54', 'i1ysUvfPZQgOn7ckkRAwaEzjeYj33MUX.mp3', 1, 1, 1622910348, 1622910348);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 3,
  `status` int(11) NOT NULL DEFAULT 3,
  `access` int(11) NOT NULL DEFAULT 1,
  `password_hash` varchar(255) NOT NULL,
  `auth_key` varchar(255) NOT NULL,
  `email_confirm_token` varchar(255) NOT NULL,
  `last_visit` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `type`, `status`, `access`, `password_hash`, `auth_key`, `email_confirm_token`, `last_visit`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin@ya.ru', 1, 1, 3, '$2y$13$eJGRjPU1kq4OYzvKFTKtre4FtROg1jmY1lNFnultSV2Xq.vCnLZO2', '1UE5evo9GH-4UqDq5JlEkx64fTfHcgl9', 'NA_kPTG712l2YHuRplAD7flhHH1ZCRAC', 1622911229, 1618769350, 1621459842),
(2, 'Moder', 'Moder@ya.ru', 2, 1, 3, '$2y$13$Vfbwn.f3Mc19/v9W1a7qZetkzMcnDjJezuEGz27HCyWml4ydmbzSG', 'xH5YOu8ygvmLjQoqrj8H9XYyvYAI_QzB', '4-wnQtx7NYUxsSncUFqVk-bRSagGYXAz', 1622488482, 1618769363, 1622488482),
(3, 'User', 'User@ya.ru', 3, 1, 1, '$2y$13$KpeufpNl0dCK6LhHwzHfR.vIalQFDkZQ7x1StcFqhMoWrf8UQkACy', 'OR-wdduLNLEj4faDLeRfeO-BI6OZfN-D', 'jn8RIpDJg1KDIqy184N3WOadrxF25Mgi', 1622552380, 1618769400, 1618845393),
(4, 'Guest', 'Guest@ya.ru', 4, 2, 1, '$2y$13$iyxdjqMK/APsXSA1ymGjk.ZcdFJ21BYtUt8PiV1p/yawFSzwCcEkO', 'yPNvmA19uLamag54RXpxDyjAvNmSBcf8', 'EN3tY_qRDd8oBqvW-YCSwjWH7nWeR5sj', 1618769417, 1618769417, 1618769417);

-- --------------------------------------------------------

--
-- Структура таблицы `user_status`
--

CREATE TABLE `user_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_status`
--

INSERT INTO `user_status` (`id`, `name`) VALUES
(1, 'active'),
(2, 'inactive'),
(3, 'not_confirmed');

-- --------------------------------------------------------

--
-- Структура таблицы `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_type`
--

INSERT INTO `user_type` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'moder'),
(3, 'user'),
(4, 'guest');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `access_status`
--
ALTER TABLE `access_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album_ibfk_1` (`artist`),
  ADD KEY `creator` (`creator`),
  ADD KEY `editor` (`editor`);

--
-- Индексы таблицы `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator` (`creator`),
  ADD KEY `editor` (`editor`);

--
-- Индексы таблицы `content_type`
--
ALTER TABLE `content_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator` (`creator`),
  ADD KEY `editor` (`editor`);

--
-- Индексы таблицы `genre_content`
--
ALTER TABLE `genre_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genre` (`genre`),
  ADD KEY `type` (`type`),
  ADD KEY `creator` (`creator`),
  ADD KEY `editor` (`editor`);

--
-- Индексы таблицы `heart`
--
ALTER TABLE `heart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`),
  ADD KEY `creator` (`creator`);

--
-- Индексы таблицы `heart_status`
--
ALTER TABLE `heart_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator` (`creator`),
  ADD KEY `access` (`access`);

--
-- Индексы таблицы `playlist_content`
--
ALTER TABLE `playlist_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `playlist` (`playlist`),
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `social`
--
ALTER TABLE `social`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator` (`creator`),
  ADD KEY `editor` (`editor`);

--
-- Индексы таблицы `social_content`
--
ALTER TABLE `social_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social` (`social`),
  ADD KEY `artist` (`artist`),
  ADD KEY `creator` (`creator`),
  ADD KEY `editor` (`editor`);

--
-- Индексы таблицы `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album` (`album`),
  ADD KEY `creator` (`creator`),
  ADD KEY `editor` (`editor`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`),
  ADD KEY `access` (`access`);

--
-- Индексы таблицы `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `access_status`
--
ALTER TABLE `access_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `album`
--
ALTER TABLE `album`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT для таблицы `artist`
--
ALTER TABLE `artist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `content_type`
--
ALTER TABLE `content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `genre_content`
--
ALTER TABLE `genre_content`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `heart`
--
ALTER TABLE `heart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `heart_status`
--
ALTER TABLE `heart_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `playlist_content`
--
ALTER TABLE `playlist_content`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `social`
--
ALTER TABLE `social`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `social_content`
--
ALTER TABLE `social_content`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT для таблицы `track`
--
ALTER TABLE `track`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1923;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `user_status`
--
ALTER TABLE `user_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`artist`) REFERENCES `artist` (`id`),
  ADD CONSTRAINT `album_ibfk_2` FOREIGN KEY (`creator`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `album_ibfk_3` FOREIGN KEY (`editor`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `artist`
--
ALTER TABLE `artist`
  ADD CONSTRAINT `artist_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `artist_ibfk_2` FOREIGN KEY (`editor`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `genre`
--
ALTER TABLE `genre`
  ADD CONSTRAINT `genre_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `genre_ibfk_2` FOREIGN KEY (`editor`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `genre_content`
--
ALTER TABLE `genre_content`
  ADD CONSTRAINT `genre_content_ibfk_1` FOREIGN KEY (`genre`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `genre_content_ibfk_2` FOREIGN KEY (`type`) REFERENCES `content_type` (`id`),
  ADD CONSTRAINT `genre_content_ibfk_3` FOREIGN KEY (`creator`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `genre_content_ibfk_4` FOREIGN KEY (`editor`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `heart`
--
ALTER TABLE `heart`
  ADD CONSTRAINT `heart_ibfk_1` FOREIGN KEY (`type`) REFERENCES `content_type` (`id`),
  ADD CONSTRAINT `heart_ibfk_2` FOREIGN KEY (`status`) REFERENCES `heart_status` (`id`),
  ADD CONSTRAINT `heart_ibfk_3` FOREIGN KEY (`creator`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`access`) REFERENCES `access_status` (`id`),
  ADD CONSTRAINT `playlist_ibfk_2` FOREIGN KEY (`creator`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `playlist_content`
--
ALTER TABLE `playlist_content`
  ADD CONSTRAINT `playlist_content_ibfk_1` FOREIGN KEY (`type`) REFERENCES `content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `social`
--
ALTER TABLE `social`
  ADD CONSTRAINT `social_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `social_ibfk_2` FOREIGN KEY (`editor`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `social_content`
--
ALTER TABLE `social_content`
  ADD CONSTRAINT `social_content_ibfk_1` FOREIGN KEY (`social`) REFERENCES `social` (`id`),
  ADD CONSTRAINT `social_content_ibfk_2` FOREIGN KEY (`artist`) REFERENCES `artist` (`id`),
  ADD CONSTRAINT `social_content_ibfk_3` FOREIGN KEY (`creator`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `social_content_ibfk_4` FOREIGN KEY (`editor`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`album`) REFERENCES `album` (`id`),
  ADD CONSTRAINT `track_ibfk_2` FOREIGN KEY (`creator`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `track_ibfk_3` FOREIGN KEY (`editor`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`type`) REFERENCES `user_type` (`id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`status`) REFERENCES `user_status` (`id`),
  ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`access`) REFERENCES `access_status` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
