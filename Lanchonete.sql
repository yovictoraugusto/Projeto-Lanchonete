-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.35-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para lanchonete2infoc2019
DROP DATABASE IF EXISTS `lanchonete2infoc2019`;
CREATE DATABASE IF NOT EXISTS `lanchonete2infoc2019` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lanchonete2infoc2019`;


-- Copiando estrutura para tabela lanchonete2infoc2019.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `codCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `bairro` varchar(45) DEFAULT 'Centro',
  `cidade` varchar(45) DEFAULT 'Machado',
  `cep` varchar(45) DEFAULT '37.750-000',
  `uf` char(2) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `contatoVirtual` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`codCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete2infoc2019.cliente: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`codCliente`, `nome`, `cpf`, `rg`, `endereco`, `bairro`, `cidade`, `cep`, `uf`, `telefone`, `celular`, `dataNascimento`, `contatoVirtual`) VALUES
	(1, 'Guilherme Carvalho', NULL, NULL, NULL, 'Centro', 'Machado', '37.750-000', NULL, '(35)3295-7444', NULL, '1980-05-15', NULL),
	(2, 'Fabiana Alves', NULL, NULL, NULL, 'Centro', 'Machado', '37.750-000', NULL, NULL, '(35)98811-7474', '2002-12-28', NULL),
	(3, 'Joselei Teixeira', '411.255.111-08', NULL, NULL, 'Centro', 'Machado', '37.750-000', NULL, NULL, NULL, '1969-04-20', NULL),
	(4, 'Richard Stallman', NULL, NULL, NULL, 'Centro', 'Machado', '37.750-000', NULL, NULL, NULL, '1978-11-02', NULL),
	(5, 'Edgar Codd', NULL, NULL, NULL, 'Centro', 'Machado', '37.750-000', NULL, NULL, NULL, '1989-04-25', 'edgar.codd@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


-- Copiando estrutura para tabela lanchonete2infoc2019.funcao
DROP TABLE IF EXISTS `funcao`;
CREATE TABLE IF NOT EXISTS `funcao` (
  `codFuncao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`codFuncao`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete2infoc2019.funcao: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `funcao` DISABLE KEYS */;
INSERT INTO `funcao` (`codFuncao`, `nome`) VALUES
	(1, 'Gerente'),
	(2, 'Vendedor'),
	(3, 'Atendente'),
	(4, 'Recepcionista'),
	(5, 'Cozinheiro'),
	(6, 'Motoboy'),
	(7, 'Quintandeiro(a)');
/*!40000 ALTER TABLE `funcao` ENABLE KEYS */;


-- Copiando estrutura para tabela lanchonete2infoc2019.funcionario
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `codFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `rg` varchar(45) NOT NULL,
  `carteiraTrabalho` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT 'Centro',
  `cidade` varchar(45) DEFAULT 'Machado',
  `cep` varchar(45) DEFAULT '37.750-000',
  `uf` char(2) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `dataAdmissao` date DEFAULT NULL,
  `dataDemissao` date DEFAULT NULL,
  `dataNascimento` date NOT NULL,
  `dataPagamento` date DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `curriculo` mediumtext,
  `FUNCAO_codFuncao` int(11) NOT NULL,
  PRIMARY KEY (`codFuncionario`,`FUNCAO_codFuncao`),
  KEY `fk_FUNCIONARIO_FUNCAO1_idx` (`FUNCAO_codFuncao`),
  CONSTRAINT `fk_FUNCIONARIO_FUNCAO1` FOREIGN KEY (`FUNCAO_codFuncao`) REFERENCES `funcao` (`codFuncao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete2infoc2019.funcionario: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`codFuncionario`, `nome`, `cpf`, `rg`, `carteiraTrabalho`, `endereco`, `bairro`, `cidade`, `cep`, `uf`, `telefone`, `celular`, `dataAdmissao`, `dataDemissao`, `dataNascimento`, `dataPagamento`, `salario`, `curriculo`, `FUNCAO_codFuncao`) VALUES
	(1, 'Felipe Telles', '123.456.789-00', 'MG 10.444.711', '12.987', NULL, 'Centro', 'Machado', '37.750-000', NULL, '(35)3295-9700', NULL, '2019-02-01', NULL, '1980-04-20', NULL, 3500, NULL, 1),
	(2, 'Sabrina Alves', '556.191.761-02', 'MG 10.987.123', '51.345', NULL, 'Centro', 'Alfenas', '37,130-000', NULL, '(35)3295-8585', NULL, '2017-04-23', '2019-04-23', '1990-05-02', NULL, 2000, NULL, 2),
	(3, 'Rafael Soares', '164.414.115-03', 'MG 10.112.913', '45.123', NULL, 'Centro', 'Alfenas', '37,130-000', NULL, '(35)3295-1234', NULL, '2018-07-12', NULL, '1991-12-05', NULL, 998, NULL, 3),
	(4, 'Regina Dias', '461.176.793-02', 'MG 12.134.562', NULL, NULL, 'Centro', 'Alfenas', '37,130-000', NULL, NULL, NULL, NULL, NULL, '1985-01-02', NULL, 1800, NULL, 4),
	(5, 'Ronaldo Souza', '587.654.321-00', 'MG 11.753.164', NULL, NULL, 'Centro', 'Alfenas', '37,130-000', NULL, NULL, NULL, NULL, NULL, '1989-03-07', NULL, 2100, NULL, 5),
	(6, 'André Gomes', '789.164.178-00', 'MG 10.711.489', NULL, NULL, 'Centro', 'Alfenas', '37,130-000', NULL, NULL, NULL, NULL, NULL, '1975-08-15', NULL, 1200, NULL, 6),
	(7, 'Fred Teixeira', '', '', NULL, NULL, 'Centro', 'Machado', '37.750-000', NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 3000, NULL, 1);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;


-- Copiando estrutura para tabela lanchonete2infoc2019.itensvenda
DROP TABLE IF EXISTS `itensvenda`;
CREATE TABLE IF NOT EXISTS `itensvenda` (
  `venda_codVenda` int(11) NOT NULL,
  `produto_codProduto` int(11) NOT NULL,
  `quantidade` float NOT NULL,
  PRIMARY KEY (`venda_codVenda`,`produto_codProduto`),
  KEY `fk_venda_has_produto_produto1_idx` (`produto_codProduto`),
  KEY `fk_venda_has_produto_venda1_idx` (`venda_codVenda`),
  CONSTRAINT `fk_venda_has_produto_produto1` FOREIGN KEY (`produto_codProduto`) REFERENCES `produto` (`codProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_has_produto_venda1` FOREIGN KEY (`venda_codVenda`) REFERENCES `venda` (`codVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete2infoc2019.itensvenda: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `itensvenda` DISABLE KEYS */;
INSERT INTO `itensvenda` (`venda_codVenda`, `produto_codProduto`, `quantidade`) VALUES
	(1, 9, 4),
	(2, 9, 10),
	(3, 9, 3),
	(4, 1, 3);
/*!40000 ALTER TABLE `itensvenda` ENABLE KEYS */;


-- Copiando estrutura para tabela lanchonete2infoc2019.marca
DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `codMarca` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`codMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete2infoc2019.marca: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`codMarca`, `Nome`) VALUES
	(1, 'Nestlé'),
	(2, 'Garoto'),
	(3, 'Lacta'),
	(4, 'Salgado de fabricação própria'),
	(5, 'Doce de fabricação própria'),
	(6, 'Coca-Cola'),
	(7, 'Antarctica'),
	(8, 'Frutty'),
	(9, 'Dolly'),
	(10, 'Elma Chips');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;


-- Copiando estrutura para tabela lanchonete2infoc2019.produto
DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `codProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `precoCusto` float NOT NULL,
  `precoVenda` float DEFAULT NULL,
  `margemLucro` float DEFAULT NULL,
  `quantidadeEstoque` float NOT NULL,
  `quantidadeMinima` float NOT NULL,
  `cardapio` enum('Sim','Não') NOT NULL DEFAULT 'Sim',
  `UNIDADE_codUnidade` int(11) NOT NULL,
  `MARCA_codMarca` int(11) NOT NULL,
  PRIMARY KEY (`codProduto`,`UNIDADE_codUnidade`,`MARCA_codMarca`),
  KEY `fk_PRODUTO_UNIDADE_idx` (`UNIDADE_codUnidade`),
  KEY `fk_PRODUTO_MARCA1_idx` (`MARCA_codMarca`),
  CONSTRAINT `fk_PRODUTO_MARCA1` FOREIGN KEY (`MARCA_codMarca`) REFERENCES `marca` (`codMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUTO_UNIDADE` FOREIGN KEY (`UNIDADE_codUnidade`) REFERENCES `unidade` (`codUnidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete2infoc2019.produto: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`codProduto`, `nome`, `descricao`, `precoCusto`, `precoVenda`, `margemLucro`, `quantidadeEstoque`, `quantidadeMinima`, `cardapio`, `UNIDADE_codUnidade`, `MARCA_codMarca`) VALUES
	(1, 'Guaraná', NULL, 1.75, NULL, NULL, 47, 30, 'Sim', 2, 7),
	(2, 'Cola-Cola', NULL, 1.75, NULL, NULL, 30, 15, 'Sim', 2, 6),
	(3, 'Coxinha', NULL, 2, 2.5, NULL, 15, 10, 'Sim', 1, 4),
	(4, 'Pastel', NULL, 2, 2.5, NULL, 12, 10, 'Sim', 1, 4),
	(6, 'Ouro Branco', NULL, 0.75, 1, NULL, 17, 10, 'Sim', 1, 3),
	(7, 'Pão de Hot Dog', NULL, 0.9, NULL, NULL, 30, 15, 'Não', 1, 4),
	(8, 'Sonho de Valsa', NULL, 0.8, NULL, NULL, 30, 10, 'Sim', 1, 3),
	(9, 'Kit Kat', NULL, 0.5, 1.5, NULL, 18, 10, 'Sim', 1, 1),
	(10, 'Mega-Trufa', NULL, 5, 7.5, 50, 10, 5, 'Sim', 1, 5),
	(11, 'Super-Hamburgão', NULL, 10, 15, 50, 20, 10, 'Sim', 1, 4),
	(13, 'Brigadeiro', NULL, 1.5, 2.25, 50, 0, 0, 'Sim', 1, 5);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;


-- Copiando estrutura para tabela lanchonete2infoc2019.unidade
DROP TABLE IF EXISTS `unidade`;
CREATE TABLE IF NOT EXISTS `unidade` (
  `codUnidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`codUnidade`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete2infoc2019.unidade: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `unidade` DISABLE KEYS */;
INSERT INTO `unidade` (`codUnidade`, `nome`) VALUES
	(1, 'Unidade'),
	(2, 'Lata de 350ml'),
	(3, 'Garrafa de 600ml'),
	(4, 'Garrafa de 2l'),
	(5, 'Garrafa de 1l'),
	(6, 'Fatia'),
	(7, 'Kg'),
	(8, 'Cento');
/*!40000 ALTER TABLE `unidade` ENABLE KEYS */;


-- Copiando estrutura para tabela lanchonete2infoc2019.venda
DROP TABLE IF EXISTS `venda`;
CREATE TABLE IF NOT EXISTS `venda` (
  `codVenda` int(11) NOT NULL AUTO_INCREMENT,
  `dataHora` datetime NOT NULL,
  `desconto` float DEFAULT NULL,
  `comissao` float DEFAULT NULL,
  `tpoPagamento` enum('Dinheiro','Cartão de crédito','Cartão de débito','Boleto','Chegue','Ticket') NOT NULL,
  `cliente_codCliente` int(11) NOT NULL,
  `funcionario_codFuncionario` int(11) NOT NULL,
  PRIMARY KEY (`codVenda`,`cliente_codCliente`,`funcionario_codFuncionario`),
  KEY `fk_venda_cliente1_idx` (`cliente_codCliente`),
  KEY `fk_venda_funcionario1_idx` (`funcionario_codFuncionario`),
  CONSTRAINT `fk_venda_cliente1` FOREIGN KEY (`cliente_codCliente`) REFERENCES `cliente` (`codCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_funcionario1` FOREIGN KEY (`funcionario_codFuncionario`) REFERENCES `funcionario` (`codFuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete2infoc2019.venda: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` (`codVenda`, `dataHora`, `desconto`, `comissao`, `tpoPagamento`, `cliente_codCliente`, `funcionario_codFuncionario`) VALUES
	(1, '2019-04-30 08:18:41', NULL, NULL, 'Dinheiro', 1, 2),
	(2, '2019-04-30 08:40:21', NULL, NULL, 'Dinheiro', 2, 2),
	(3, '2019-04-30 08:41:05', NULL, NULL, 'Dinheiro', 3, 2),
	(4, '2019-05-02 16:18:50', NULL, NULL, 'Dinheiro', 4, 2);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;


-- Copiando estrutura para trigger lanchonete2infoc2019.atualizaEstoque
DROP TRIGGER IF EXISTS `atualizaEstoque`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `atualizaEstoque` AFTER UPDATE ON `itensvenda` FOR EACH ROW BEGIN
set @diferenca = abs(old.quantidade - new.quantidade);
if(old.quantidade > new.quantidade)
	then update produto set quantidadeEstoque = quantidadeEstoque + @diferenca
		where codProduto = old.produto_codProduto;
	else
		update produto set quantidadeEstoque = quantidadeEstoque - @diferenca 
		where codProduto = old.produto_codProduto;
end if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Copiando estrutura para trigger lanchonete2infoc2019.atualizaSalarioFuncAtendente
DROP TRIGGER IF EXISTS `atualizaSalarioFuncAtendente`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `atualizaSalarioFuncAtendente` BEFORE UPDATE ON `funcionario` FOR EACH ROW BEGIN
if (new.FUNCAO_codFuncao = 3)
	then set new.salario = 998.0;
end if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Copiando estrutura para trigger lanchonete2infoc2019.baixaEstoque
DROP TRIGGER IF EXISTS `baixaEstoque`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `baixaEstoque` AFTER INSERT ON `itensvenda` FOR EACH ROW BEGIN
update produto set quantidadeEstoque = quantidadeEstoque - new.quantidade 
where codProduto = new.produto_codProduto;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Copiando estrutura para trigger lanchonete2infoc2019.calculaPrecoVenda
DROP TRIGGER IF EXISTS `calculaPrecoVenda`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `calculaPrecoVenda` BEFORE INSERT ON `produto` FOR EACH ROW BEGIN
if (new.precoCusto is not null) and (new.margemLucro)
		then set new.precoVenda = new.precoCusto + (new.precoCusto * new.margemLucro/100);
	else
		set new.precoVenda = 0;
end if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Copiando estrutura para trigger lanchonete2infoc2019.devolveEstoque
DROP TRIGGER IF EXISTS `devolveEstoque`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `devolveEstoque` AFTER DELETE ON `itensvenda` FOR EACH ROW BEGIN
update produto set quantidadeEstoque = quantidadeEstoque + old.quantidade 
where codProduto = old.produto_codProduto;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Copiando estrutura para trigger lanchonete2infoc2019.registraSalarioCliente
DROP TRIGGER IF EXISTS `registraSalarioCliente`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `registraSalarioCliente` BEFORE INSERT ON `funcionario` FOR EACH ROW BEGIN
if(new.FUNCAO_codFuncao = 1)
	then set new.salario = 3000.0;
end if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
