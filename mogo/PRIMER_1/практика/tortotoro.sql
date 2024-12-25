-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 19 2024 г., 19:06
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

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
  `cooking_status_id` int NOT NULL,
  `cooking_status_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `menu_id` int NOT NULL,
  `menu_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`) VALUES
(1, 'беспонтовый пирожок '),
(2, 'Тортик'),
(3, 'кекс blue watа'),
(4, 'безе');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_payed_status_id` int NOT NULL,
  `fk_cooking_status_id` int NOT NULL,
  `fk_worker_id` int NOT NULL,
  `fk_menu_id` varchar(40) NOT NULL,
  `comment` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
(16, '2023-05-28 15:54:16', 2, 1, 9, '1,2,3,4,', 'квп'),
(17, '2024-05-19 14:26:15', 2, 2, 47, '1,', '');

-- --------------------------------------------------------

--
-- Структура таблицы `payed_status`
--

CREATE TABLE `payed_status` (
  `payed_status_id` int NOT NULL,
  `payed_status_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `role_id` int NOT NULL,
  `role_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `turn_id` int NOT NULL,
  `date` date NOT NULL,
  `fk_turn_time_id` time NOT NULL,
  `workers` varchar(120) NOT NULL,
  `fk_turn_status_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `turn_status_id` int NOT NULL,
  `turn_status_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `turn_time_id` int NOT NULL,
  `turn_time_name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL
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
  `id` int NOT NULL,
  `login` varchar(90) NOT NULL,
  `password` varchar(90) NOT NULL,
  `fname` varchar(90) NOT NULL,
  `lname` varchar(90) NOT NULL,
  `mname` varchar(90) NOT NULL,
  `fk_role_id` int NOT NULL,
  `avatar` varchar(90) NOT NULL,
  `fk_worker_status_id` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `workers`
--

INSERT INTO `workers` (`id`, `login`, `password`, `fname`, `lname`, `mname`, `fk_role_id`, `avatar`, `fk_worker_status_id`) VALUES
(42, 'abobav3', '$1$rasmusle$VZYxbyO2etP/EbUmOD8Cn0', 'abobav3', 'abobav3', 'abobav3', 1, 'img/42_avatar.', 1),
(43, 'лщдф', '$1$rasmusle$dYLFoPR7FS1FBPiB2Vyuq0', 'лщдф', 'лщдф', 'лщдф', 1, 'img/43_avatar.', 1),
(44, '452516', '$1$rasmusle$.mR.YgZHYScQGszhNSBfG0', '452516', '452516', '452516', 1, 'img/44_avatar.', 1),
(45, 'admi', '123', 'admin', 'admin', 'admin', 3, 'img/45_avatar.', 1),
(46, 'cook', '123', 'cook', 'cook', 'cook', 1, 'img/46_avatar.', 1),
(47, 'waiter', '123', 'waiter', 'waiter', 'waiter', 2, 'img/47_avatar.', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `worker_status`
--

CREATE TABLE `worker_status` (
  `worker_status_id` int NOT NULL,
  `worker_status_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  MODIFY `cooking_status_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `payed_status`
--
ALTER TABLE `payed_status`
  MODIFY `payed_status_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `turns`
--
ALTER TABLE `turns`
  MODIFY `turn_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `turn_status`
--
ALTER TABLE `turn_status`
  MODIFY `turn_status_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `turn_time`
--
ALTER TABLE `turn_time`
  MODIFY `turn_time_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `workers`
--
ALTER TABLE `workers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `worker_status`
--
ALTER TABLE `worker_status`
  MODIFY `worker_status_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
