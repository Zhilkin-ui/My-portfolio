-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 28 2023 г., 18:55
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tortotoro`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cooking_status`
--

CREATE TABLE `cooking_status` (
  `cooking_status_id` int(11) NOT NULL,
  `cooking_status_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `cooking_status`
--

INSERT INTO `cooking_status` (`cooking_status_id`, `cooking_status_name`) VALUES
(1, 'Готовится'),
(2, 'Готов');

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`) VALUES
(1, 'Золотое яблоко'),
(2, 'Золотая морковь'),
(3, 'Стейк из свинины'),
(4, 'Стейк из говядины');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_payed_status_id` int(11) NOT NULL,
  `fk_cooking_status_id` int(11) NOT NULL,
  `fk_worker_id` int(11) NOT NULL,
  `fk_menu_id` varchar(40) NOT NULL,
  `comment` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `order_time`, `fk_payed_status_id`, `fk_cooking_status_id`, `fk_worker_id`, `fk_menu_id`, `comment`) VALUES
(1, '0000-00-00 00:00:00', 0, 0, 0, '0', ''),
(2, '0000-00-00 00:00:00', 0, 0, 0, '0', ''),
(3, '0000-00-00 00:00:00', 0, 0, 0, '0', ''),
(4, '2023-05-23 17:51:57', 0, 0, 0, '0', ''),
(5, '2023-05-24 07:10:15', 0, 0, 0, '0', ''),
(6, '2023-05-25 15:58:49', 0, 0, 9, '0', ''),
(7, '2023-05-25 16:22:03', 0, 0, 9, '3', ''),
(8, '2023-05-25 16:22:11', 0, 0, 9, '4', ''),
(9, '2023-05-25 17:59:37', 1, 1, 9, '0', ''),
(10, '2023-05-25 18:03:07', 1, 1, 9, '1', ''),
(11, '2023-05-26 15:18:54', 0, 0, 9, '4', 'wetwerft'),
(12, '2023-05-26 16:18:32', 0, 0, 9, '4', 'ewfwef'),
(13, '2023-05-26 16:23:29', 1, 1, 9, '4', 'rtyh'),
(14, '2023-05-26 16:24:00', 2, 1, 9, '4', 'wad'),
(15, '2023-05-26 17:41:30', 2, 1, 25, '4', 'какиш'),
(16, '2023-05-28 15:54:16', 2, 1, 9, '1,2,3,4,', 'квп');

-- --------------------------------------------------------

--
-- Структура таблицы `payed_status`
--

CREATE TABLE `payed_status` (
  `payed_status_id` int(11) NOT NULL,
  `payed_status_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `payed_status`
--

INSERT INTO `payed_status` (`payed_status_id`, `payed_status_name`) VALUES
(1, 'Отменён'),
(2, 'Принят'),
(3, 'Оплачен');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Повар'),
(2, 'Официант'),
(3, 'Администратор');

-- --------------------------------------------------------

--
-- Структура таблицы `turns`
--

CREATE TABLE `turns` (
  `turn_id` int(16) NOT NULL,
  `date` date NOT NULL,
  `fk_turn_time_id` time NOT NULL,
  `workers` varchar(120) NOT NULL,
  `fk_turn_status_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `turns`
--

INSERT INTO `turns` (`turn_id`, `date`, `fk_turn_time_id`, `workers`, `fk_turn_status_id`) VALUES
(1, '2023-05-11', '09:00:00', 'on', '1'),
(2, '2023-06-02', '18:00:00', 'on', '2'),
(3, '0000-00-00', '09:00:00', 'on', '1'),
(4, '2023-05-10', '09:00:00', 'on', '2'),
(5, '2023-05-03', '18:00:00', '', '1'),
(6, '2023-05-11', '00:00:00', 'on', '1'),
(7, '2023-05-31', '00:00:00', 'on', '2'),
(8, '2023-05-26', '00:00:00', 'on', '1'),
(9, '2023-06-10', '18:00:00', '17,18,19,', '2'),
(10, '2023-05-17', '18:00:00', '', '1'),
(11, '2023-06-04', '18:00:00', 'Array', '1'),
(12, '2023-05-10', '18:00:00', '3,', '1'),
(13, '2023-09-13', '09:00:00', '0,1,2,', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `turn_status`
--

CREATE TABLE `turn_status` (
  `turn_status_id` int(16) NOT NULL,
  `turn_status_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `turn_status`
--

INSERT INTO `turn_status` (`turn_status_id`, `turn_status_name`) VALUES
(1, 'Закрыта'),
(2, 'Открыта');

-- --------------------------------------------------------

--
-- Структура таблицы `turn_time`
--

CREATE TABLE `turn_time` (
  `turn_time_id` int(16) NOT NULL,
  `turn_time_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `turn_time`
--

INSERT INTO `turn_time` (`turn_time_id`, `turn_time_name`) VALUES
(1, 'Понедельник, Вторник, Среда'),
(2, 'Четверг, Пятница, Суббота');

-- --------------------------------------------------------

--
-- Структура таблицы `workers`
--

CREATE TABLE `workers` (
  `id` int(16) NOT NULL,
  `login` varchar(90) NOT NULL,
  `password` varchar(90) NOT NULL,
  `fname` varchar(90) NOT NULL,
  `lname` varchar(90) NOT NULL,
  `mname` varchar(90) NOT NULL,
  `fk_role_id` int(11) NOT NULL,
  `avatar` varchar(90) NOT NULL,
  `fk_worker_status_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `workers`
--

INSERT INTO `workers` (`id`, `login`, `password`, `fname`, `lname`, `mname`, `fk_role_id`, `avatar`, `fk_worker_status_id`) VALUES
(1, '', '$1$rasmusle$Lh7EJjJyg.NQdWZOklket0', '12312312313131231231231231313', '', '', 0, '', 0),
(2, '', '$1$rasmusle$Lh7EJjJyg.NQdWZOklket0', '12312312313131231231231231313', '', '', 0, '', 1),
(3, '', '$1$rasmusle$Lh7EJjJyg.NQdWZOklket0', '12312312313131231231231231313', '', '', 0, '', 1),
(4, '[value-2]', '[value-3]', '[value-4]', '[value-5]', '[value-6]', 0, '[value-8]', 0),
(5, 'login', 'password', 'fname', 'lname', 'mname', 0, 'avatar', 0),
(6, 'sdfgh', '$1$rasmusle$pE4y4uTpaMr1iNB1o8Uf11', 'fdgj', 'fdgj', 'fgdj', 0, '', 0),
(7, 'sdfggggggggggggg', '$1$rasmusle$pE4y4uTpaMr1iNB1o8Uf11', 'fdgj', 'fdgj', 'fgdj', 0, '', 0),
(8, 'serh', '$1$rasmusle$6GQw2/nTDOZnV0YqDqnk81', 'rthrthrth', 'rthrt', 'htrhtrh', 0, '', 0),
(9, '123', '$1$rasmusle$M8sS6IfRNcE9Svd/3LE0j/', '123', '123', '123', 0, '', 0),
(10, '321', '$1$rasmusle$Lh7EJjJyg.NQdWZOklket0', 'lox', 'los', '321', 0, '', 0),
(11, 'дщ', '$1$rasmusle$QfX9rKNU91f0mHlxy2Dr/1', 'кайф', 'кайфов', 'кайфович', 0, 'image.png', 0),
(12, 'ret', '$1$rasmusle$vGFG1lhSSs30pJsEb.8X31', 'rt', '', '', 0, 'бд (6).jpg', 0),
(13, 'wew', '$1$rasmusle$00NVUNcVlXiGg2V7ALL2v0', 'we', 'we', '', 0, 'бд.jpg', 0),
(14, 'dsfg', '$1$rasmusle$Lh7EJjJyg.NQdWZOklket0', '', '', 'dsf', 0, 'бд.jpg', 0),
(15, '123456awfawawdf', '$1$rasmusle$Lh7EJjJyg.NQdWZOklket0', 'awefawdfawfaw', 'fawfawfawfawfaw', 'retertert', 0, 'диаграмма деятельности.jpg', 0),
(16, 'пп', '$1$rasmusle$Lh7EJjJyg.NQdWZOklket0', 'пп', 'пп', 'пп', 0, 'img/16_avatar.jpg', 0),
(17, 'kiera', '$1$rasmusle$KHEGL.979yW7VSByh8hC61', 'kira', 'kira', 'kira', 0, '', 0),
(18, 'jkjkjkjk', '$1$rasmusle$X074dT9I.i8uV8nxHwugc1', 'jkjkjk', 'jkjkjk', 'jkjkjkj', 0, 'img/_avatar.', 0),
(19, 'werwerwer', '$1$rasmusle$X/Fav9KIWodlUPnlwz6Jk0', 'rwer', '', 'werwrwe', 0, 'img/avatar.', 0),
(20, 'ertert', '$1$rasmusle$Lh7EJjJyg.NQdWZOklket0', '', '', 'ertete', 0, 'img/_avatar.', 0),
(21, 'wadawd', '$1$rasmusle$Lh7EJjJyg.NQdWZOklket0', '', '', '', 0, 'img/_avatar.', 0),
(22, 'awdwad', '$1$rasmusle$/6w14N2Cbpfs1FxhGIUgX1', 'adadada', 'dadadad', 'wadwadawd', 0, 'img/_avatar.', 0),
(23, 'dadad', '$1$rasmusle$Lh7EJjJyg.NQdWZOklket0', 'dad', 'adad', 'awedwa', 0, 'img/23_avatar.jpg', 0),
(24, 'kira', '$1$rasmusle$ojzuvispPFqJx64fahuRt0', 'kira', 'lox', 'kira', 0, 'бд (6).jpg', 0),
(25, 'aboba', '$1$rasmusle$D8cPNmbNElMY/gMZwefAh/', 'aboba', 'abobva', 'aboba', 0, '', 0),
(26, 'aboba123', '$1$rasmusle$DaKtbSjgRbt1YgvXmW8tB0', 'aboba123', 'aboba123', 'aboba123', 0, '$img/_avatar.', 0),
(27, 'aboba1234', '$1$rasmusle$.cDmQzZWEVjqe0lzu.d7.0', 'aboba1234', 'aboba1234', 'aboba1234', 0, 'img/_avatar.', 0),
(28, 'ik,ujhmyg', '$1$rasmusle$bs4yMadjN69s5dQauzNQc0', 'gfnxfg', 'mnfdgn', 'fgnf', 0, 'img/_avatar.jpg', 0),
(29, 'rtyhmffgh', '$1$rasmusle$gMB1olaU0hp6qGHxQAp1./', 'fsgm', 'fgmf', 'mfm', 0, 'img/_avatar.jpg', 0),
(30, 'уцкерук', '$1$rasmusle$Lh7EJjJyg.NQdWZOklket0', 'рукр', '', '', 0, 'img/_avatar.jpg', 0),
(31, 'wer', '$1$rasmusle$5fhIliEMgvTMiZlzYvhNk1', 'wer', 'wer', 'wer', 0, 'img/1_avatar.jpg', 0),
(32, 'awd', '$1$rasmusle$24r.pSkUM/EnXjNMca28L.', '', 'awd', 'awdawd', 0, 'img/1_avatar.jpg', 0),
(33, 'aserftse', '$1$rasmusle$48tj8HCAclbQsfc5TgZvb.', 'sefs', 'fsef', 'sef', 0, 'img/32_avatar.jpg', 0),
(34, 'erhererggh', '$1$rasmusle$Fn.FZ7zYmLtK9CSm58RyW/', 'erger', 'gegerg', 'egege', 0, 'img/34_avatar.png', 0),
(35, ';lkjhgf', '$1$rasmusle$Uop1p6Cu81vNMFtHOPPKw1', 'kjhgf', 'kjhg', 'kjhgf', 0, 'img/35_avatar.jpg', 0),
(36, 'CblPOeb', '$1$rasmusle$H4SRBicgkH7UCdZBsFKvv/', 'CblPOeb', 'CblPOeb', 'CblPOeb', 0, 'img/36_avatar.jpg', 0),
(37, 'cblpoeb@gmail.com', '$1$rasmusle$afDqCQc5UIpJjbHjQr3T8.', 'cblpoeb@gmail.com', 'cblpoeb@gmail.com', 'cblpoeb@gmail.com', 0, 'img/37_avatar.png', 0),
(38, 'kaka', '$1$rasmusle$AcnpqrXQuh0Oar01JYj6o.', 'kaka', 'kaka', 'kaka', 0, 'img/38_avatar.jpg', 0),
(39, 'wertfw', '$1$rasmusle$mdPBIvL6HUL3uFg4d5dWp.', 'fwerf', 'ewfwef', 'wef', 0, 'img/39_avatar.', 0),
(40, 'abobav2', '$1$rasmusle$PvABZYc/DKxNkEnVojduJ0', 'abobav2', 'abobav2', 'abobav2', 0, 'img/40_avatar.', 0),
(41, 'ыфвауыфыва', '$1$rasmusle$nxaKBahGk7nAKmIn2I0eT1', 'ваываыва', 'ываываы', 'аыаыва', 0, 'img/41_avatar.', 0),
(42, 'abobav3', '$1$rasmusle$VZYxbyO2etP/EbUmOD8Cn0', 'abobav3', 'abobav3', 'abobav3', 1, 'img/42_avatar.', 1),
(43, 'лщдф', '$1$rasmusle$dYLFoPR7FS1FBPiB2Vyuq0', 'лщдф', 'лщдф', 'лщдф', 1, 'img/43_avatar.', 1),
(44, '452516', '$1$rasmusle$.mR.YgZHYScQGszhNSBfG0', '452516', '452516', '452516', 1, 'img/44_avatar.', 1),
(45, 'admi', '$1$rasmusle$5/Q3BavAhB/ze03htaTLf/', 'admin', 'admin', 'admin', 3, 'img/45_avatar.', 1),
(46, 'cook', '$1$rasmusle$.B9.SVHsMTy6icNgMszPd.', 'cook', 'cook', 'cook', 1, 'img/46_avatar.', 1),
(47, 'waiter', '$1$rasmusle$rhglLc2UpJbmua16bfyJn1', 'waiter', 'waiter', 'waiter', 2, 'img/47_avatar.', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `worker_status`
--

CREATE TABLE `worker_status` (
  `worker_status_id` int(11) NOT NULL,
  `worker_status_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `worker_status`
--

INSERT INTO `worker_status` (`worker_status_id`, `worker_status_name`) VALUES
(1, 'Работает'),
(2, 'Уволен');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cooking_status`
--
ALTER TABLE `cooking_status`
  ADD PRIMARY KEY (`cooking_status_id`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `payed_status`
--
ALTER TABLE `payed_status`
  ADD PRIMARY KEY (`payed_status_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Индексы таблицы `turns`
--
ALTER TABLE `turns`
  ADD PRIMARY KEY (`turn_id`);

--
-- Индексы таблицы `turn_status`
--
ALTER TABLE `turn_status`
  ADD PRIMARY KEY (`turn_status_id`);

--
-- Индексы таблицы `turn_time`
--
ALTER TABLE `turn_time`
  ADD PRIMARY KEY (`turn_time_id`);

--
-- Индексы таблицы `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `worker_status`
--
ALTER TABLE `worker_status`
  ADD PRIMARY KEY (`worker_status_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cooking_status`
--
ALTER TABLE `cooking_status`
  MODIFY `cooking_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `payed_status`
--
ALTER TABLE `payed_status`
  MODIFY `payed_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `turns`
--
ALTER TABLE `turns`
  MODIFY `turn_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `turn_status`
--
ALTER TABLE `turn_status`
  MODIFY `turn_status_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `turn_time`
--
ALTER TABLE `turn_time`
  MODIFY `turn_time_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `workers`
--
ALTER TABLE `workers`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `worker_status`
--
ALTER TABLE `worker_status`
  MODIFY `worker_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
