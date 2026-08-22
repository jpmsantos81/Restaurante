-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/08/2026 às 21:53
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `saborotage`
--
CREATE DATABASE IF NOT EXISTS `saborotage` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `saborotage`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `garcons`
--

CREATE TABLE `garcons` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `idGarcom` int(11) NOT NULL,
  `idPrato` int(11) NOT NULL,
  `idMesa` int(11) NOT NULL,
  `pedidoEm` timestamp NOT NULL DEFAULT current_timestamp(),
  `prontoEm` timestamp NULL DEFAULT NULL,
  `entregueEm` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pratos`
--

CREATE TABLE `pratos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `vendidos` int(11) NOT NULL DEFAULT 0,
  `imagem` varchar(50) NOT NULL,
  `dinheiroGanho` decimal(10,2) NOT NULL DEFAULT 0.00,
  `categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pratos`
--

INSERT INTO `pratos` (`id`, `nome`, `preco`, `vendidos`, `imagem`, `dinheiroGanho`, `categoria`) VALUES
(1, 'Hambúrguer Clássico', 6.70, 0, 'imgs/hamburger.jpg', 0.00, 'Hambúrgueres'),
(2, 'Cheeseburger', 7.50, 0, 'imgs/chesseburger.jpg', 0.00, 'Hambúrgueres'),
(3, 'X-Salada', 23.50, 0, 'imgs/x-salada.jpg', 0.00, 'Hambúrgueres'),
(4, 'X-Bacon', 26.50, 0, 'imgs/x-bacon.jpg', 0.00, 'Hambúrgueres'),
(5, 'X-Tudo', 32.00, 0, 'imgs/x-tudo.jpg', 0.00, 'Hambúrgueres'),
(6, 'Batata Frita', 15.00, 0, 'imgs/batata-frita.jpg', 0.00, 'Porções'),
(7, 'Batata com Cheddar', 20.00, 0, 'imgs/batata-cheddar.jpg', 0.00, 'Porções'),
(8, 'Anéis de Cebola', 18.00, 0, 'imgs/aneis-cebola.jpg', 0.00, 'Porções'),
(9, 'Pizza de Calabresa', 42.00, 0, 'imgs/pizza-calabresa.jpg', 0.00, 'Pizzas'),
(10, 'Pizza de Mussarela', 40.00, 0, 'imgs/pizza-mussarela.jpg', 0.00, 'Pizzas'),
(11, 'Pizza de Frango', 42.00, 0, 'imgs/pizza-frango.jpg', 0.00, 'Pizzas'),
(12, 'Pizza Portuguesa', 45.00, 0, 'imgs/pizza-portuguesa.jpg', 0.00, 'Pizzas'),
(13, 'Hot Dog', 15.00, 0, 'imgs/hot-dog.jpg', 0.00, 'Hot Dogs'),
(14, 'Hot Dog Especial', 20.00, 0, 'imgs/hot-dog-especial.jpg', 0.00, 'Hot Dogs'),
(15, 'Frango Grelhado', 28.00, 0, 'imgs/frango-grelhado.jpg', 0.00, 'Pratos'),
(16, 'Parmegiana de Frango', 32.00, 0, 'imgs/parmegiana-frango.jpg', 0.00, 'Pratos'),
(17, 'Lasanha à Bolonhesa', 30.00, 0, 'imgs/lasanha-bolonhesa.jpg', 0.00, 'Pratos'),
(18, 'Salada Caesar', 24.00, 0, 'imgs/salada-caesar.jpg', 0.00, 'Pratos'),
(19, 'Pudim', 10.00, 0, 'imgs/pudim.jpg', 0.00, 'Sobremesas'),
(20, 'Brownie com Sorvete', 16.00, 19, 'imgs/brownie-sorvete.jpg', 304.00, 'Sobremesas');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `garcons`
--
ALTER TABLE `garcons`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero` (`numero`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idGarcom` (`idGarcom`),
  ADD KEY `idMesa` (`idMesa`),
  ADD KEY `idPrato` (`idPrato`);

--
-- Índices de tabela `pratos`
--
ALTER TABLE `pratos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `garcons`
--
ALTER TABLE `garcons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pratos`
--
ALTER TABLE `pratos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idGarcom`) REFERENCES `garcons` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`idMesa`) REFERENCES `mesas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`idPrato`) REFERENCES `pratos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
