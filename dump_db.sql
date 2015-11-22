-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 23 2015 г., 00:00
-- Версия сервера: 5.6.25
-- Версия PHP: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `car_base`
--

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `user_id`, `post_id`, `name`, `created_at`, `updated_at`) VALUES
(7, 3, 10, '116847bea9a2ebadba0020420a2039cd.jpg', '2015-11-22 22:27:17', '2015-11-22 22:27:17'),
(10, 3, 10, '394f80cb3801d14d02a11757b433a146.jpg', '2015-11-22 22:29:34', '2015-11-22 22:29:34'),
(15, 3, 18, 'f1be1b26e4fce5ed6e6ee0fec1d65a3e.jpg', '2015-11-22 22:36:26', '2015-11-22 22:36:26'),
(16, 3, 18, '720a63b359ee0f0c31f995e6f9956e84.jpg', '2015-11-22 22:36:26', '2015-11-22 22:36:26'),
(17, 3, 9, '20d7cde69c202e46a96913c7256afd28.jpg', '2015-11-22 22:45:11', '2015-11-22 22:45:11'),
(18, 4, 19, 'c26869670a65128412f26670246c7d14.JPG', '2015-11-22 22:47:41', '2015-11-22 22:47:41'),
(19, 4, 19, '7b996c029b8227811d4b1039031e8b8f.jpg', '2015-11-22 22:47:42', '2015-11-22 22:47:42');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_11_22_181308_create_posts_table', 1),
('2015_11_22_221543_create_images_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `price` double(8,2) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `description`, `price`, `published_at`, `published`, `created_at`, `updated_at`) VALUES
(1, 2, 'BMW x3', 'люксовый компактный кроссовер немецкой компании BMW. X3 первого поколения разработан и выпускался совместно с компанией Magna Steyr на заводе в Граце, Австрия. Второе поколение кроссовера было представлено в июле 2010 года, производство автомобиля началось 1 сентября 2010 года. По состоянию на июль 2010 года во всём мире было продано порядка 600 000 экземпляров BMW X3.', 53200.00, '2015-11-21 22:00:00', 1, '2015-11-22 17:19:17', '2015-11-22 18:27:12'),
(2, 1, 'Audi TT', 'Разработка Audi TT началась в сентябре 1994 года в Audi Design Center в Калифорнии. Впервые TT была показана в качестве концепт-кара на Франкфуртском автосалоне в 1995. Заниматься дизайном было поручено Джею Мейсу (англ. J Mays), Фримену Томасу (англ. Freeman Thomas) и Мартину Смиту (англ. Martin Smith), разработавшим успешный дизайн интерьера. Адаптация под ранее не использовавшуюся бесшовную лазерную сварку для 1-го поколения TT задержала выпуск автомобиля.', 60000.00, '2015-11-21 22:00:00', 1, '2015-11-22 18:18:45', '2015-11-22 18:18:45'),
(4, 1, 'Nissan QASHQAI ', 'Nissan Qashqai (также известен как Nissan Dualis в Японии и Австралии и Nissan Rogue в США) — компактный кроссовер, запущенный в массовое производство в конце декабря 2006 года.', 450000.00, '2015-11-21 22:00:00', 0, '2015-11-22 19:16:45', '2015-11-22 19:16:45'),
(6, 1, 'BMW x4', 'Новый автомобиль с улучшенным кузовом.', 30000.00, '2015-11-21 22:00:00', 1, '2015-11-22 19:18:36', '2015-11-22 19:19:15'),
(7, 3, 'BMW E34', 'BMW E34 — модификация кузова BMW пятой серии, который выпускался с 1988 по 1996 год включительно. Всего было выпущено 1,333,412 автомобилей, из них 124,656 универсалов. Автомобиль был выдержан в стиле традиционного BMW, но в то же время содержал в себе современные технологии. Он был также оснащён автоматическим контролем устойчивости (ASC) или тяги (ASC + T).', 15000.00, '2015-11-21 22:00:00', 0, '2015-11-22 19:33:05', '2015-11-22 19:33:05'),
(8, 3, 'BMW E60', 'BMW E60 — модификация кузова BMW «пятой» серии, который выпускался с 2003 года по 2010 год. Предшественником данного кузова был BMW E39. В 2007 году произошёл рестайлинг,появился электронный селектор автомата,новые фары,бампера,кнопка старта двигателя. Также добавились 3.0-литровые дизельные двигатели-286 л.с.,235 л.с. Базовой в семействе являлась модель 520i. Её 4-х цилиндровый двигатель объемом 2,0 литра выдаёт 156 л.с. Автомобиль был доступен в двух кузовах: седан (E60) и универсал (E61). На версию M5 устанавливался двигатель S85B50 (V10) объёмом 5 литров и выдающий 507 л.с., что позволяет автомобилю разгоняться от 0 до 100 км/ч за 4,7 секунды, а до 200 км/ч — за 15 секунд. Максимальная скорость ограничивается электроникой на уровне 250 км/ч. Без ограничителя машина способна разогнаться до 320 км/ч. Последняя машина сошла с конвейера в 2009 году. В декабре 2009 года цех производства e60 был закрыт на переоборудование для производства новой модели F10.', 25004.00, '2015-11-21 22:00:00', 1, '2015-11-22 19:33:52', '2015-11-22 19:33:52'),
(9, 3, 'BMW M5', 'BMW M5 — доработанная подразделением BMW M версия автомобиля BMW пятой серии. Первое поколение было представлено в 1981 году.', 12000.00, '2015-11-22 22:00:00', 1, '2015-11-22 19:34:19', '2015-11-22 22:45:10'),
(10, 3, 'BMW X5 (E53)', 'BMW X5 — среднеразмерный кроссовер от немецкого автопроизводителя BMW. Автомобиль был представлен в 1999 году на автосалоне в Детройте. Буква «Х» означает, что автомобиль имеет полный привод, а цифра «5» — что базой послужила 5-я серия (BMW E39), однако X5 короче E39, но при этом выше и шире. Кузов Е53 напоминает BMW E46 Touring. Машина приспособлена для езды по всем типам дорожного покрытия, этим она обязана большому клиренсу и постоянному приводу на все колёса.', 16000.00, '2015-11-22 22:00:00', 1, '2015-11-22 19:34:47', '2015-11-22 22:29:34'),
(18, 3, 'BMW E87', 'Автомобиль выпускается с 2004 года. Последним автомобилем такого класса этого немецкого производителя был BMW 3 Compact (E36/5, E46/5). Машина имеет много общих решений с другими моделями. Так, передняя подвеска стойки МакФерсон от «пятёрки» E60, а задняя многорычажная от «трёшки» E90.\r\n\r\nМодель позиционируется в зависимости от комплектации как пяти или четырёхместный автомобиль. Центральная часть приборной панели слегка повёрнута в сторону водителя, а вместо ключа зажигания — брелок и кнопка «Start» над ним.\r\n\r\nМашина выпускается в четырёх кузовах: с 3-х и 5-дверные хетчбэки (E81, E87) (сняты с производства), купе (E82) и кабриолет (E88).', 53000.00, '2015-11-22 22:00:00', 1, '2015-11-22 22:31:36', '2015-11-22 22:36:26'),
(19, 4, 'BMW M3', 'BMW M3 — высокотехнологичная спортивная версия компактных автомобилей BMW 3 серии от BMW M GmbH. Модели M3 сделаны на базе E30, E36, E46, E90/E92/E93 и F80 3-ей серии. Основные отличия от «стандартных» автомобилей 3 серии включают более мощный двигатель, улучшенная подвеска, более агрессивный и аэродинамичный кузов, множественные акценты как в интерьере так и в экстерьере на принадлежность к линейке «M»/Motorsport.', 35000.00, '2015-11-22 22:00:00', 1, '2015-11-22 22:47:41', '2015-11-22 22:48:27');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Иван', 'mail2@mail.ru', '$2y$10$vxPL9iIQOatxGKzUUxu9OelaQJMD.C3M/hmo1Frn6Hzl5G1vRd9/S', 'Et2poeYBVh8yxJwAKphDPtJ2iOZ9S6yBTGQfXXqXGjRgaggNBUZfvAN9acJd', '2015-11-22 17:35:14', '2015-11-22 19:19:32'),
(2, 'Сергей', 'mail1@mail.ru', '$2y$10$GLAtudC4CTe.uG8WKFHc9ubNOVG6l0uAKWtLc6vuQ4zCnsxuoLmxW', 'DtvLtIt1YttFEiyMfYNhKoijZcXndEAGhwUp1swWdQTpRFqDWl04iJ5gBGa5', '2015-11-22 17:37:21', '2015-11-22 22:26:39'),
(3, 'Петро', 'mail@mail.ru', '$2y$10$rB4Vra8pAeUo.GvZ8XCmRen6vdVvMKdsr.Not0uPPiqx0j5vnelce', 'aUtiA8n4W6ewFjIUjKRurz90SpNiut4zERx50OWlZFWTT09t2VdpD1Edjm9k', '2015-11-22 17:47:52', '2015-11-22 22:45:37'),
(4, 'Антон', 'mail3@mail.ru', '$2y$10$E801bgZWrzfeQBSIw3TS3.ARTMZwLxpBJeC0mIs7n6uyKWPdkhx/W', 'jml8IU4PVkfsyjVXhG5wWLJmpcnPUGiNw1IQIv1GUw9XoY5pMdpjprhS9Lal', '2015-11-22 22:46:28', '2015-11-22 22:50:04');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
