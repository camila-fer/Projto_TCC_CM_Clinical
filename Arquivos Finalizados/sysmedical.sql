-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Maio-2021 às 23:43
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sysmedical`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimentos`
--

CREATE TABLE `atendimentos` (
  `id` int(11) NOT NULL,
  `descricao` varchar(60) NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `atendimentos`
--

INSERT INTO `atendimentos` (`id`, `descricao`, `valor`) VALUES
(1, 'Consulta Pediatra', '160.00'),
(2, 'Consulta Ortopedista', '180.00'),
(3, 'Exame de Sangue', '60.00'),
(4, 'Cirúrgia Estética', '2800.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `nome` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`id`, `nome`) VALUES
(1, 'MÃ©dico'),
(2, 'FarmÃ¡ceutico'),
(3, 'Faxineira'),
(4, 'Tesoureiro'),
(5, 'Enfermeira'),
(6, 'Balconista'),
(7, 'Caixa'),
(8, 'Recepcionista');

-- --------------------------------------------------------

--
-- Estrutura da tabela `chamadas`
--

CREATE TABLE `chamadas` (
  `id` int(11) NOT NULL,
  `paciente` varchar(40) NOT NULL,
  `consultorio` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `chamadas`
--

INSERT INTO `chamadas` (`id`, `paciente`, `consultorio`, `status`) VALUES
(1, 'Hugo Vasconcelos', '102', 'Aguardando');

-- --------------------------------------------------------

--
-- Estrutura da tabela `consultas`
--

CREATE TABLE `consultas` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `paciente` int(11) NOT NULL,
  `tipo_atendimento` int(11) NOT NULL,
  `medico` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `pgto_confirmado` varchar(5) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `atestado` int(11) DEFAULT NULL,
  `prescricao` varchar(10) DEFAULT NULL,
  `receita` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `consultas`
--

INSERT INTO `consultas` (`id`, `data`, `hora`, `paciente`, `tipo_atendimento`, `medico`, `valor`, `pgto_confirmado`, `status`, `atestado`, `prescricao`, `receita`) VALUES
(1, '2020-03-25', '12:00:00', 2, 4, 1, '2800.00', 'NÃ£o', NULL, NULL, NULL, NULL),
(2, '2020-03-25', '14:00:00', 2, 2, 1, '180.00', 'Sim', 'Consultando', NULL, NULL, NULL),
(3, '2020-03-25', '16:00:00', 1, 1, 1, '160.00', 'NÃ£o', NULL, NULL, NULL, NULL),
(4, '2020-03-25', '13:00:00', 1, 1, 2, '160.00', 'Sim', 'Aguardando', NULL, NULL, NULL),
(5, '2020-03-25', '11:00:00', 1, 3, 2, '60.00', 'Sim', 'Finalizada', 3, 'Sim', 'Sim'),
(6, '2020-03-26', '11:00:00', 2, 4, 2, '2800.00', 'Sim', 'Aguardando', NULL, NULL, NULL),
(7, '2020-03-26', '13:00:00', 1, 1, 2, '160.00', 'NÃ£o', NULL, NULL, NULL, NULL),
(8, '2020-03-26', '11:00:00', 2, 4, 1, '2800.00', 'Sim', 'Consultando', NULL, NULL, NULL),
(9, '2020-03-26', '16:00:00', 1, 4, 1, '2800.00', 'Sim', 'Aguardando', NULL, NULL, NULL),
(10, '2020-03-26', '15:00:00', 2, 1, 1, '160.00', 'Sim', 'Consultando', NULL, NULL, NULL),
(11, '2020-03-26', '17:00:00', 1, 3, 2, '60.00', 'Sim', 'Consultando', NULL, NULL, NULL),
(13, '2021-05-24', '13:00:00', 2, 2, 2, '180.00', 'Não', NULL, NULL, NULL, NULL),
(14, '2021-05-25', '08:00:00', 2, 2, 1, '180.00', 'Não', NULL, NULL, NULL, NULL),
(15, '2021-05-24', '10:00:00', 2, 2, 1, '180.00', 'Não', NULL, NULL, NULL, NULL),
(16, '2021-05-25', '11:30:00', 1, 1, 1, '160.00', 'Não', NULL, NULL, NULL, NULL),
(17, '2021-05-25', '13:30:00', 2, 4, 1, '2800.00', 'Sim', 'Aguardando', NULL, NULL, NULL),
(18, '2021-05-25', '15:00:00', 1, 4, 1, '2800.00', 'Sim', 'Aguardando', NULL, NULL, NULL),
(19, '2021-05-25', '14:00:00', 2, 4, 1, '2800.00', 'Não', NULL, NULL, NULL, NULL),
(20, '2021-05-25', '07:00:00', 1, 4, 1, '2800.00', 'Sim', 'Aguardando', NULL, NULL, NULL),
(21, '2021-05-25', '09:30:00', 2, 4, 2, '2800.00', 'Não', NULL, NULL, NULL, NULL),
(22, '2021-05-25', '13:30:00', 2, 2, 2, '180.00', 'Sim', 'Aguardando', NULL, NULL, NULL),
(23, '2021-05-25', '11:30:00', 1, 4, 2, '2800.00', 'Não', NULL, NULL, NULL, NULL),
(24, '2021-05-25', '11:00:00', 2, 3, 3, '60.00', 'Não', NULL, NULL, NULL, NULL),
(25, '2021-05-25', '10:30:00', 1, 3, 3, '60.00', 'Sim', 'Aguardando', NULL, NULL, NULL),
(26, '2021-05-24', '09:30:00', 1, 3, 3, '60.00', 'Não', NULL, NULL, NULL, NULL),
(27, '2021-05-25', '09:30:00', 2, 4, 1, '2800.00', 'Não', NULL, NULL, NULL, NULL),
(28, '2021-05-25', '10:30:00', 2, 4, 1, '2800.00', 'Sim', 'Aguardando', NULL, NULL, NULL),
(30, '2021-05-26', '13:00:00', 2, 1, 1, '160.00', 'Não', NULL, NULL, NULL, NULL),
(31, '2021-05-26', '11:00:00', 1, 1, 1, '160.00', 'Não', NULL, NULL, NULL, NULL),
(32, '2021-05-26', '14:30:00', 1, 3, 1, '60.00', 'Sim', 'Finalizada', 7, 'Sim', 'Sim'),
(33, '2021-05-26', '07:30:00', 1, 3, 2, '60.00', 'Sim', 'Aguardando', NULL, NULL, NULL),
(35, '2021-05-26', '14:00:00', 3, 3, 3, '60.00', 'Sim', 'Aguardando', NULL, NULL, NULL),
(36, '2021-05-26', '13:30:00', 2, 3, 3, '60.00', 'Sim', 'Aguardando', NULL, NULL, NULL),
(39, '2021-05-26', '09:30:00', 1, 4, 1, '2800.00', 'Sim', 'Finalizada', NULL, NULL, 'Sim'),
(41, '2021-05-26', '10:30:00', 1, 4, 1, '2800.00', 'Sim', 'Aguardando', NULL, NULL, NULL),
(42, '2021-05-26', '10:30:00', 1, 4, 2, '2800.00', 'Não', NULL, NULL, NULL, NULL),
(43, '2021-05-26', '11:30:00', 1, 1, 2, '160.00', 'Sim', 'Aguardando', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contas_pagar`
--

CREATE TABLE `contas_pagar` (
  `id` int(11) NOT NULL,
  `descricao` varchar(40) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `pagamento` date DEFAULT NULL,
  `pago` varchar(5) NOT NULL,
  `funcionario` varchar(20) NOT NULL,
  `foto` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `contas_pagar`
--

INSERT INTO `contas_pagar` (`id`, `descricao`, `valor`, `vencimento`, `pagamento`, `pago`, `funcionario`, `foto`) VALUES
(1, 'Luz', '850.00', '2020-03-25', '2020-03-25', 'Sim', '999.999.999-93', 'sem-foto.png'),
(2, 'Ãgua', '650.00', '2020-03-25', NULL, 'NÃ£o', '999.999.999-93', 'conta2.jpg'),
(3, 'Compra de RemÃ©dios', '50.00', '2020-03-25', NULL, 'NÃ£o', '444.444.444-44', 'sem-foto.png'),
(4, 'Compra de RemÃ©dios', '3.00', '2020-03-25', NULL, 'NÃ£o', '444.444.444-44', 'sem-foto.png'),
(5, 'Compra de Cadeiras', '40.00', '2020-03-23', '2020-03-25', 'Sim', '999.999.999-93', 'sem-foto.png'),
(7, 'Compra de Materiais', '80.55', '2020-03-25', NULL, 'NÃ£o', '999.999.999-93', 'sem-foto.png'),
(9, 'Conta de Telefone', '20.99', '2020-03-25', '2020-03-25', 'Sim', '999.999.999-93', 'sem-foto.png'),
(10, 'Compra de RemÃ©dios', '10.00', '2020-03-25', NULL, 'NÃ£o', '444.444.444-44', 'sem-foto.png'),
(11, 'Compra de RemÃ©dios', '4.98', '2020-03-25', '2020-03-25', 'Sim', '999.999.999-93', 'sem-foto.png'),
(12, 'Luz', '650.00', '2020-03-26', NULL, 'NÃ£o', '999.999.999-93', 'sem-foto.png'),
(13, 'Pagamento Eletrecista', '230.00', '2020-03-26', NULL, 'NÃ£o', '999.999.999-93', 'sem-foto.png'),
(14, 'Conta de Luz', '600.00', '2021-05-25', '2021-05-25', 'Sim', '999.999.999-93', 'pix-itau.jpeg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contas_receber`
--

CREATE TABLE `contas_receber` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `data_baixa` date DEFAULT NULL,
  `forma_pgto` varchar(25) DEFAULT NULL,
  `tipo_pgto` varchar(30) DEFAULT NULL,
  `tesoureiro` varchar(30) DEFAULT NULL,
  `id_consulta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `contas_receber`
--

INSERT INTO `contas_receber` (`id`, `descricao`, `valor`, `vencimento`, `data_baixa`, `forma_pgto`, `tipo_pgto`, `tesoureiro`, `id_consulta`) VALUES
(1, '4', '2800.00', '2020-03-25', NULL, NULL, NULL, NULL, 1),
(2, '2', '180.00', '2020-03-25', '2020-03-25', 'Dinheiro', 'A Vista', '999.999.999-93', 2),
(3, '1', '160.00', '2020-03-25', NULL, NULL, NULL, NULL, 3),
(4, '1', '160.00', '2020-03-25', '2020-03-25', 'Dinheiro', 'A Vista', '999.999.999-93', 4),
(5, '3', '60.00', '2020-03-25', '2020-03-25', 'Dinheiro', 'A Vista', '999.999.999-93', 5),
(6, '4', '2800.00', '2020-03-26', '2020-03-26', 'Dinheiro', 'A Vista', '999.999.999-93', 6),
(7, '1', '160.00', '2020-03-26', NULL, NULL, NULL, NULL, 7),
(8, '4', '2800.00', '2020-03-26', '2020-03-26', 'Dinheiro', 'A Vista', '999.999.999-93', 8),
(9, '4', '2800.00', '2020-03-26', '2020-03-26', 'Dinheiro', 'A Vista', '999.999.999-93', 9),
(10, '1', '160.00', '2020-03-26', '2020-03-26', 'Dinheiro', 'A Vista', '999.999.999-93', 10),
(11, '3', '60.00', '2020-03-26', '2020-03-26', 'Dinheiro', 'A Vista', '999.999.999-93', 11),
(13, '2', '180.00', '2021-05-24', NULL, NULL, NULL, NULL, 13),
(14, '2', '180.00', '2021-05-25', NULL, NULL, NULL, NULL, 14),
(15, '2', '180.00', '2021-05-24', NULL, NULL, NULL, NULL, 15),
(16, '1', '160.00', '2021-05-25', NULL, NULL, NULL, NULL, 16),
(17, '4', '2800.00', '2021-05-25', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 17),
(18, '4', '2800.00', '2021-05-25', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 18),
(19, '4', '2800.00', '2021-05-25', NULL, NULL, NULL, NULL, 19),
(20, '4', '2800.00', '2021-05-25', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 20),
(21, '4', '2800.00', '2021-05-25', NULL, NULL, NULL, NULL, 21),
(22, '2', '180.00', '2021-05-25', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 22),
(23, '4', '2800.00', '2021-05-25', NULL, NULL, NULL, NULL, 23),
(24, '3', '60.00', '2021-05-25', NULL, NULL, NULL, NULL, 24),
(25, '3', '60.00', '2021-05-25', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 25),
(26, '3', '60.00', '2021-05-24', NULL, NULL, NULL, NULL, 26),
(27, '4', '2800.00', '2021-05-25', NULL, NULL, NULL, NULL, 27),
(28, '4', '2800.00', '2021-05-25', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 28),
(29, '2', '180.00', '2021-05-26', NULL, NULL, NULL, NULL, 29),
(30, '1', '160.00', '2021-05-26', NULL, NULL, NULL, NULL, 30),
(31, '1', '160.00', '2021-05-26', NULL, NULL, NULL, NULL, 31),
(32, '3', '60.00', '2021-05-26', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 32),
(33, '3', '60.00', '2021-05-26', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 33),
(34, '3', '60.00', '2021-05-26', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 34),
(35, '3', '60.00', '2021-05-26', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 35),
(36, '3', '60.00', '2021-05-26', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 36),
(37, '4', '2800.00', '2021-05-26', NULL, NULL, NULL, NULL, 37),
(38, '4', '2800.00', '2021-05-26', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 38),
(39, '4', '2800.00', '2021-05-26', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 39),
(40, '1', '160.00', '2021-05-26', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 40),
(41, '4', '2800.00', '2021-05-26', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 41),
(42, '4', '2800.00', '2021-05-26', NULL, NULL, NULL, NULL, 42),
(43, '1', '160.00', '2021-05-26', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 43),
(44, '1', '160.00', '2021-05-26', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 44),
(45, '4', '2800.00', '2021-05-26', '2021-05-26', 'Dinheiro', '', '999.999.999-93', 45);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entradas_remedios`
--

CREATE TABLE `entradas_remedios` (
  `id` int(11) NOT NULL,
  `remedio` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `fornecedor` int(11) NOT NULL,
  `farmaceutico` varchar(20) NOT NULL,
  `nome_remedio` varchar(100) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `entradas_remedios`
--

INSERT INTO `entradas_remedios` (`id`, `remedio`, `quantidade`, `valor`, `fornecedor`, `farmaceutico`, `nome_remedio`, `data`) VALUES
(1, 3, 25, '2.00', 1, '444.444.444-44', 'Aspirina Comprimido', '2020-03-25'),
(2, 2, 3, '1.00', 1, '444.444.444-44', 'Dipirona Comprimido', '2020-03-25'),
(3, 3, 5, '2.00', 1, '444.444.444-44', 'Aspirina Comprimido', '2020-03-25'),
(4, 3, 2, '2.49', 1, '444.444.444-44', 'Aspirina Comprimido', '2020-03-25');

-- --------------------------------------------------------

--
-- Estrutura da tabela `especializacoes`
--

CREATE TABLE `especializacoes` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `especializacoes`
--

INSERT INTO `especializacoes` (`id`, `nome`) VALUES
(1, 'Pediatra'),
(2, 'Ortopedista');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(35) NOT NULL,
  `remedios` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `nome`, `telefone`, `email`, `remedios`) VALUES
(1, 'Pablo Silva', '(66) 66666-6666', 'pablo@hotmail.com', 'RemÃ©dios em geral');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(35) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `cargo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `nome`, `cpf`, `telefone`, `email`, `cargo`) VALUES
(1, 'Patrick Silva', '000.000.000-10', '(55) 55555-5555', 'patrick@hotmail.com', 'Medico'),
(2, 'Paula Campos', '000.000.000-20', '(66) 66666-6666', 'paula@hotmail.com', 'Medico'),
(3, 'Kamila Santos', '555.555.566-65', '(66) 66666-6666', 'kamila@hotmail.com', 'Balconista'),
(4, 'Marilio Antonio', '555.556.666-66', '(33) 33333-3333', 'marilio@hotmail.com', 'FarmÃ¡ceutico'),
(5, 'Gabriel Silva', '444.444.444-44', '(44) 44444-4444', 'gabriel@hotmail.com', 'FarmÃ¡ceutico'),
(6, 'Marta Campos', '555.555.555-56', '(66) 66666-6666', 'marta@hotmail.com', 'Enfermeira'),
(7, 'AmÃ©lia Silva', '777.777.899-55', '(22) 22222-2222', 'amelia@hotmail.com', 'Faxineira'),
(8, 'Marcos Silva', '111.111.111-11', '(66) 66666-6666', 'marcos@hotmail.com', 'Recepcionista'),
(11, 'Gomes Silva', '444.444.444-44', '(44) 44444-4444', 'gomes@hotmail.com', 'Recepcionista'),
(12, 'Allan Machado', '666.666.666-66', '(55) 55555-5555', 'alan@hotmail.com', 'Tesoureiro'),
(13, 'Diego Campos', '999.999.999-93', '(99) 99999-9999', 'tesoureiro@hotmail.com', 'Tesoureiro'),
(14, 'Pedro Silva', '584.555.555-55', '(78) 55555-5555', 'pedro@hotmail.com', 'Medico');

-- --------------------------------------------------------

--
-- Estrutura da tabela `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `horario` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `horarios`
--

INSERT INTO `horarios` (`id`, `horario`) VALUES
(1, '07:00:00'),
(2, '07:30:00'),
(3, '08:00:00'),
(4, '08:30:00'),
(5, '09:00:00'),
(6, '09:30:00'),
(7, '10:00:00'),
(8, '10:30:00'),
(9, '11:00:00'),
(10, '11:30:00'),
(11, '13:00:00'),
(12, '13:30:00'),
(13, '14:00:00'),
(14, '14:30:00'),
(15, '15:00:00'),
(16, '15:30:00'),
(17, '16:00:00'),
(18, '16:30:00'),
(19, '17:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `medicos`
--

CREATE TABLE `medicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `especialidade` int(11) NOT NULL,
  `crm` varchar(20) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `turno` varchar(15) NOT NULL,
  `consultorio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `medicos`
--

INSERT INTO `medicos` (`id`, `nome`, `especialidade`, `crm`, `cpf`, `telefone`, `email`, `turno`, `consultorio`) VALUES
(1, 'Patrick Silva', 2, 'MG012345', '000.000.000-10', '(55) 55555-5555', 'patrick@hotmail.com', 'ManhÃ£', '102'),
(2, 'Paula Campos', 1, 'MG012346', '000.000.000-20', '(66) 66666-6666', 'paula@hotmail.com', 'ManhÃ£', '101'),
(3, 'Pedro Silva', 2, '45454545545', '584.555.555-55', '(78) 55555-5555', 'pedro@hotmail.com', 'Manhã', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimentacoes`
--

CREATE TABLE `movimentacoes` (
  `id` int(11) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `movimento` varchar(30) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tesoureiro` varchar(20) NOT NULL,
  `data` date NOT NULL,
  `id_movimento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `movimentacoes`
--

INSERT INTO `movimentacoes` (`id`, `tipo`, `movimento`, `valor`, `tesoureiro`, `data`, `id_movimento`) VALUES
(1, 'Entrada', 'Consulta', '60.00', '999.999.999-93', '2020-03-25', 5),
(2, 'Entrada', 'Consulta', '160.00', '999.999.999-93', '2020-03-25', 4),
(3, 'Entrada', 'Consulta', '180.00', '999.999.999-93', '2020-03-25', 2),
(4, 'SaÃ­da', 'Pagamento Conta', '850.00', '999.999.999-93', '2020-03-25', 1),
(5, 'SaÃ­da', 'Pagamento Conta', '40.00', '999.999.999-93', '2020-03-25', 5),
(6, 'SaÃ­da', 'Pagamento Conta', '20.99', '999.999.999-93', '2020-03-25', 9),
(7, 'SaÃ­da', 'Pagamento Conta', '4.98', '999.999.999-93', '2020-03-25', 11),
(8, 'SaÃ­da', 'Pgto FuncionÃ¡rio', '900.00', '999.999.999-93', '2020-03-26', 1),
(10, 'SaÃ­da', 'Pgto FuncionÃ¡rio', '20.55', '999.999.999-93', '2020-03-26', 3),
(11, 'Entrada', 'Consulta', '2800.00', '999.999.999-93', '2020-03-26', 9),
(12, 'Entrada', 'Consulta', '60.00', '999.999.999-93', '2020-03-26', 11),
(13, 'Entrada', 'Consulta', '160.00', '999.999.999-93', '2020-03-26', 10),
(14, 'Entrada', 'Consulta', '2800.00', '999.999.999-93', '2020-03-26', 8),
(15, 'Entrada', 'Consulta', '2800.00', '999.999.999-93', '2020-03-26', 6),
(16, 'Saída', 'Pgto Funcionário', '1150.00', '999.999.999-93', '2021-05-25', 4),
(17, 'Saída', 'Pagamento Conta', '600.00', '999.999.999-93', '2021-05-25', 14),
(18, 'Entrada', 'Consulta', '2800.00', '999.999.999-93', '2021-05-26', 28),
(19, 'Entrada', 'Consulta', '60.00', '999.999.999-93', '2021-05-26', 36),
(20, 'Entrada', 'Consulta', '60.00', '999.999.999-93', '2021-05-26', 34),
(21, 'Entrada', 'Consulta', '60.00', '999.999.999-93', '2021-05-26', 35),
(22, 'Entrada', 'Consulta', '60.00', '999.999.999-93', '2021-05-26', 33),
(23, 'Entrada', 'Consulta', '60.00', '999.999.999-93', '2021-05-26', 32),
(24, 'Entrada', 'Consulta', '60.00', '999.999.999-93', '2021-05-26', 25),
(25, 'Entrada', 'Consulta', '180.00', '999.999.999-93', '2021-05-26', 22),
(26, 'Entrada', 'Consulta', '2800.00', '999.999.999-93', '2021-05-26', 20),
(27, 'Entrada', 'Consulta', '2800.00', '999.999.999-93', '2021-05-26', 18),
(28, 'Entrada', 'Consulta', '2800.00', '999.999.999-93', '2021-05-26', 17),
(29, 'Entrada', 'Consulta', '2800.00', '999.999.999-93', '2021-05-26', 41),
(30, 'Entrada', 'Consulta', '160.00', '999.999.999-93', '2021-05-26', 40),
(31, 'Entrada', 'Consulta', '2800.00', '999.999.999-93', '2021-05-26', 39),
(32, 'Entrada', 'Consulta', '2800.00', '999.999.999-93', '2021-05-26', 45),
(33, 'Entrada', 'Consulta', '160.00', '999.999.999-93', '2021-05-26', 44),
(34, 'Entrada', 'Consulta', '160.00', '999.999.999-93', '2021-05-26', 43),
(35, 'Entrada', 'Consulta', '2800.00', '999.999.999-93', '2021-05-26', 38);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(35) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(35) NOT NULL,
  `data_nasc` date NOT NULL,
  `idade` int(11) NOT NULL,
  `civil` varchar(15) NOT NULL,
  `sexo` varchar(15) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `obs` varchar(350) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pacientes`
--

INSERT INTO `pacientes` (`id`, `nome`, `cpf`, `rg`, `telefone`, `email`, `data_nasc`, `idade`, `civil`, `sexo`, `endereco`, `obs`) VALUES
(1, 'Hugo Vasconcelos', '111.111.222-22', 'MG36454545', '(33) 33333-3333', 'contato@hugocursos.com.br', '1993-03-27', 26, 'Casado', 'Masculino', 'Rua Almeida Campos 150', 'Paciente SaudÃ¡vel, nÃ£o apresenta dores e nenhum queixa.'),
(2, 'Helena Silva', '888.888.888-88', 'MG36454546', '(44) 44444-4444', 'helena@hotmail.com', '1980-03-27', 39, 'Solteiro', 'Feminino', 'Rua Almeida Campos 150', 'Paciente DiabÃ©tica, aprensenta dores na coluna, teve duas internaÃ§Ãµes recentemente e uma cirÃºrgia cardÃ­aca.'),
(3, 'Maurilio Campo', '456.789.622-22', 'MG1456982', '(31) 97527-5084', 'mauri@hotmail.com', '1990-12-20', 30, 'Solteiro', 'Masculino', 'Rua Almeida Campos 150', 'Nenhuma'),
(4, 'João Carlos', '565.666.666-66', '65555555555555', '(66) 55566-6666', 'joa@hotmail.com', '2021-05-12', 0, 'Solteiro', 'Masculino', 'Rua Almeida Campos 150', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `id` int(11) NOT NULL,
  `funcionario` varchar(35) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tesoureiro` varchar(35) NOT NULL,
  `data` date NOT NULL,
  `nome_funcionario` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pagamentos`
--

INSERT INTO `pagamentos` (`id`, `funcionario`, `valor`, `tesoureiro`, `data`, `nome_funcionario`) VALUES
(1, '444.444.444-44', '900.00', '999.999.999-93', '2020-03-26', 'Gabriel Silva'),
(3, '555.555.555-56', '20.55', '999.999.999-93', '2020-03-26', 'Marta Campos'),
(4, '555.555.555-56', '1150.00', '999.999.999-93', '2021-05-25', 'Marta Campos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `prescricao`
--

CREATE TABLE `prescricao` (
  `id` int(11) NOT NULL,
  `id_consulta` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `remedio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `prescricao`
--

INSERT INTO `prescricao` (`id`, `id_consulta`, `item`, `remedio`) VALUES
(1, 5, 1, 'Soro na veia xxxxxxx'),
(2, 5, 2, 'RemÃ©dio x '),
(3, 32, 1, 'sddfsfdf'),
(4, 32, 2, 'fdfdsfsd');

-- --------------------------------------------------------

--
-- Estrutura da tabela `receitas`
--

CREATE TABLE `receitas` (
  `id` int(11) NOT NULL,
  `id_consulta` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `remedio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `receitas`
--

INSERT INTO `receitas` (`id`, `id_consulta`, `item`, `remedio`) VALUES
(1, 5, 1, 'Dipirona Liquida 3 vezes'),
(2, 5, 2, 'Soro na veira com xxxx'),
(3, 32, 1, 'XXXX'),
(4, 32, 2, 'SSSSS'),
(5, 39, 1, 'Remedio 1'),
(6, 39, 2, 'Remedio 2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `recepcionistas`
--

CREATE TABLE `recepcionistas` (
  `id` int(11) NOT NULL,
  `nome` varchar(35) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `turno` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `recepcionistas`
--

INSERT INTO `recepcionistas` (`id`, `nome`, `cpf`, `telefone`, `email`, `turno`) VALUES
(1, 'Gomes Silva', '444.444.444-44', '(44) 44444-4444', 'gomes@hotmail.com', 'ManhÃ£');

-- --------------------------------------------------------

--
-- Estrutura da tabela `remedios`
--

CREATE TABLE `remedios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `estoque` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `remedios`
--

INSERT INTO `remedios` (`id`, `nome`, `descricao`, `estoque`) VALUES
(1, 'Dipirona LÃ­quida', '200 ML', 0),
(2, 'Dipirona Comprimido', 'Cartela com 20', 3),
(3, 'Aspirina Comprimido', 'Cartela com 20', 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `responsaveis`
--

CREATE TABLE `responsaveis` (
  `id` int(11) NOT NULL,
  `paciente` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `data_nasc` date NOT NULL,
  `cpf` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `responsaveis`
--

INSERT INTO `responsaveis` (`id`, `paciente`, `nome`, `data_nasc`, `cpf`) VALUES
(1, 3, 'Marta Souza', '2021-05-25', '444.444.444-44'),
(2, 2, 'Patricia Santos', '2021-05-05', '656.566.666-66');

-- --------------------------------------------------------

--
-- Estrutura da tabela `saidas_remedios`
--

CREATE TABLE `saidas_remedios` (
  `id` int(11) NOT NULL,
  `remedio` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `farmaceutico` varchar(20) NOT NULL,
  `nome_remedio` varchar(100) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `saidas_remedios`
--

INSERT INTO `saidas_remedios` (`id`, `remedio`, `quantidade`, `funcionario`, `farmaceutico`, `nome_remedio`, `data`) VALUES
(1, 3, 2, 6, '444.444.444-44', 'Aspirina Comprimido', '2020-03-25');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tesoureiros`
--

CREATE TABLE `tesoureiros` (
  `id` int(11) NOT NULL,
  `nome` varchar(35) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `turno` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tesoureiros`
--

INSERT INTO `tesoureiros` (`id`, `nome`, `cpf`, `telefone`, `email`, `turno`) VALUES
(1, 'Allan Machado', '666.666.666-66', '(55) 55555-5555', 'alan@hotmail.com', 'ManhÃ£'),
(2, 'Diego Campos', '999.999.999-93', '(99) 99999-9999', 'tesoureiro@hotmail.com', 'ManhÃ£');

-- --------------------------------------------------------

--
-- Estrutura da tabela `triagens`
--

CREATE TABLE `triagens` (
  `id` int(11) NOT NULL,
  `paciente` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `obs` longtext NOT NULL,
  `urgencia` varchar(50) NOT NULL,
  `finalizada` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `triagens`
--

INSERT INTO `triagens` (`id`, `paciente`, `data`, `hora`, `obs`, `urgencia`, `finalizada`) VALUES
(6, 2, '2021-05-26', '14:53:12', 'Paciente com dor de cabeça, febre, dor no corpo...', 'Baixa', ''),
(7, 1, '2021-05-26', '14:53:23', 'Paciente com dor no corpo...', 'Média', 'Sim'),
(8, 3, '2021-05-26', '14:53:31', 'Paciente com dor de cabeça....', 'Altíssima', ''),
(9, 3, '2021-05-26', '14:57:33', 'Dor no corpo.', 'Alta', 'Não'),
(10, 1, '2021-05-26', '15:05:23', 'aaaaaaaaa', 'Alta', 'Não'),
(11, 2, '2021-05-26', '15:05:31', 'fsfsgd', 'Altíssima', 'Sim'),
(13, 3, '2021-05-26', '18:07:26', 'Paciente apresenta ....', 'Média', 'Não');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `usuario` varchar(40) NOT NULL,
  `senha` varchar(200) NOT NULL,
  `senha_original` varchar(25) NOT NULL,
  `nivel` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `usuario`, `senha`, `senha_original`, `nivel`) VALUES
(11, 'Hugo Vasconcelos', 'contato@hugocursos.com.br', '202cb962ac59075b964b07152d234b70', '123', 'admin'),
(54, 'Tela', 'tela@tela', 'c6f057b86584942e415435ffb1fa93d4', '000', 'Tela'),
(55, 'Patrick Silva', 'patrick@hotmail.com', '202cb962ac59075b964b07152d234b70', '123', 'Medico'),
(56, 'Paula Campos', 'paula@hotmail.com', '202cb962ac59075b964b07152d234b70', '123', 'Medico'),
(57, 'Marilio Antonio', 'marilio@hotmail.com', 'a7f60148059bbabb892e3bc130db681a', '55555666666', 'Farmaceutico'),
(58, 'Gabriel Silva', 'gabriel@hotmail.com', '202cb962ac59075b964b07152d234b70', '123', 'Farmaceutico'),
(59, 'Gomes Silva', 'gomes@hotmail.com', '202cb962ac59075b964b07152d234b70', '123', 'Recepcionista'),
(60, 'Allan Machado', 'alan@hotmail.com', '68bac75ed032e0a86bc3eae1b5c996cf', '66666666666', 'Tesoureiro'),
(61, 'Diego Campos', 'tesoureiro@hotmail.com', '202cb962ac59075b964b07152d234b70', '123', 'Tesoureiro'),
(68, 'Administrador', 'contatoadm@hotmail.com', '202cb962ac59075b964b07152d234b70', '123', 'admin'),
(69, 'Pedro Silva', 'pedro@hotmail.com', 'db3630b7ef1be795f1fecd4e0fad1088', '58455555555', 'Médico');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `chamadas`
--
ALTER TABLE `chamadas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `contas_pagar`
--
ALTER TABLE `contas_pagar`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `contas_receber`
--
ALTER TABLE `contas_receber`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `entradas_remedios`
--
ALTER TABLE `entradas_remedios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `especializacoes`
--
ALTER TABLE `especializacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `prescricao`
--
ALTER TABLE `prescricao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `receitas`
--
ALTER TABLE `receitas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `recepcionistas`
--
ALTER TABLE `recepcionistas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `remedios`
--
ALTER TABLE `remedios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `responsaveis`
--
ALTER TABLE `responsaveis`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `saidas_remedios`
--
ALTER TABLE `saidas_remedios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tesoureiros`
--
ALTER TABLE `tesoureiros`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `triagens`
--
ALTER TABLE `triagens`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `contas_pagar`
--
ALTER TABLE `contas_pagar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `contas_receber`
--
ALTER TABLE `contas_receber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `entradas_remedios`
--
ALTER TABLE `entradas_remedios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `especializacoes`
--
ALTER TABLE `especializacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `prescricao`
--
ALTER TABLE `prescricao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `receitas`
--
ALTER TABLE `receitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `recepcionistas`
--
ALTER TABLE `recepcionistas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `remedios`
--
ALTER TABLE `remedios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `responsaveis`
--
ALTER TABLE `responsaveis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `saidas_remedios`
--
ALTER TABLE `saidas_remedios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tesoureiros`
--
ALTER TABLE `tesoureiros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `triagens`
--
ALTER TABLE `triagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
