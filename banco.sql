-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.24-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para bancon3
CREATE DATABASE IF NOT EXISTS `bancon3` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bancon3`;

-- Copiando estrutura para tabela bancon3.alunos
CREATE TABLE IF NOT EXISTS `alunos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomes_alunos` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela bancon3.alunos: ~5 rows (aproximadamente)
INSERT INTO `alunos` (`id`, `nomes_alunos`, `cpf`) VALUES
	(1, 'aluno1', '11111111111'),
	(2, 'aluno2', '22222222222'),
	(3, 'aluno3', '33333333333'),
	(4, 'aluno4', '44444444444'),
	(5, 'aluno5', '55555555555');

-- Copiando estrutura para tabela bancon3.alunos_turmas
CREATE TABLE IF NOT EXISTS `alunos_turmas` (
  `id_alunos_turma` int(11) NOT NULL AUTO_INCREMENT,
  `id_aluno` int(11) NOT NULL DEFAULT 0,
  `id_turma` int(11) NOT NULL DEFAULT 0,
  `matriculado` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_alunos_turma`),
  KEY `FK_alunos_turmas_alunos` (`id_aluno`),
  KEY `FK_alunos_turmas_turma` (`id_turma`),
  CONSTRAINT `FK_alunos_turmas_alunos` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_alunos_turmas_turma` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela bancon3.alunos_turmas: ~5 rows (aproximadamente)
INSERT INTO `alunos_turmas` (`id_alunos_turma`, `id_aluno`, `id_turma`, `matriculado`) VALUES
	(1, 1, 1, 'true\r\n'),
	(2, 2, 2, 'true'),
	(3, 3, 3, 'nop'),
	(4, 4, 4, 'nop'),
	(5, 5, 5, 'true');

-- Copiando estrutura para tabela bancon3.aprovado
CREATE TABLE IF NOT EXISTS `aprovado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aprovado` smallint(6) NOT NULL DEFAULT 0,
  `id_alunos` int(11) DEFAULT NULL,
  `id_semestres` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aprovado_alunos` (`id_alunos`),
  KEY `FK_aprovado_semestres` (`id_semestres`),
  CONSTRAINT `FK_aprovado_alunos` FOREIGN KEY (`id_alunos`) REFERENCES `alunos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_aprovado_semestres` FOREIGN KEY (`id_semestres`) REFERENCES `semestres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela bancon3.aprovado: ~5 rows (aproximadamente)
INSERT INTO `aprovado` (`id`, `aprovado`, `id_alunos`, `id_semestres`) VALUES
	(1, 1, 1, NULL),
	(2, 1, 2, NULL),
	(3, 0, 3, NULL),
	(4, 0, 4, NULL),
	(5, 0, 5, NULL);

-- Copiando estrutura para tabela bancon3.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomes_cursos` varchar(50) DEFAULT NULL,
  `id_materias` int(11) DEFAULT NULL,
  `id_semestres` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cursos_materias` (`id_materias`),
  KEY `FK_cursos_semestres` (`id_semestres`),
  CONSTRAINT `FK_cursos_materias` FOREIGN KEY (`id_materias`) REFERENCES `materias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cursos_semestres` FOREIGN KEY (`id_semestres`) REFERENCES `semestres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela bancon3.cursos: ~2 rows (aproximadamente)
INSERT INTO `cursos` (`id`, `nomes_cursos`, `id_materias`, `id_semestres`) VALUES
	(1, 'curso1', NULL, NULL),
	(2, 'curso2', NULL, NULL);

-- Copiando estrutura para tabela bancon3.materias
CREATE TABLE IF NOT EXISTS `materias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomes_materias` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela bancon3.materias: ~4 rows (aproximadamente)
INSERT INTO `materias` (`id`, `nomes_materias`) VALUES
	(1, 'materia1'),
	(2, 'materia2'),
	(3, 'materia3'),
	(4, 'materia4');

-- Copiando estrutura para tabela bancon3.notas
CREATE TABLE IF NOT EXISTS `notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notas` int(11) DEFAULT NULL,
  `id_alunos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_notas_alunos` (`id_alunos`),
  CONSTRAINT `FK_notas_alunos` FOREIGN KEY (`id_alunos`) REFERENCES `alunos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela bancon3.notas: ~5 rows (aproximadamente)
INSERT INTO `notas` (`id`, `notas`, `id_alunos`) VALUES
	(1, 5, 1),
	(2, 6, 2),
	(3, 7, 3),
	(4, 8, 4),
	(5, 1, 5);

-- Copiando estrutura para tabela bancon3.professores
CREATE TABLE IF NOT EXISTS `professores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomes_professores` varchar(50) DEFAULT NULL,
  `id_materias` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_professores_materias` (`id_materias`),
  CONSTRAINT `FK_professores_materias` FOREIGN KEY (`id_materias`) REFERENCES `materias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela bancon3.professores: ~4 rows (aproximadamente)
INSERT INTO `professores` (`id`, `nomes_professores`, `id_materias`) VALUES
	(1, 'professor1', 1),
	(2, 'professor2', 2),
	(3, 'professor3', 3),
	(4, 'professor4', 4);

-- Copiando estrutura para tabela bancon3.professor_turma_materia
CREATE TABLE IF NOT EXISTS `professor_turma_materia` (
  `id_professor_turma_materia` int(11) NOT NULL AUTO_INCREMENT,
  `id_professor` int(11) NOT NULL DEFAULT 0,
  `id_turma` int(11) NOT NULL DEFAULT 0,
  `id_materia` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_professor_turma_materia`),
  KEY `FK__professores` (`id_professor`),
  KEY `FK__turma` (`id_turma`),
  KEY `FK__materias` (`id_materia`),
  CONSTRAINT `FK__materias` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__professores` FOREIGN KEY (`id_professor`) REFERENCES `professores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__turma` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela bancon3.professor_turma_materia: ~5 rows (aproximadamente)
INSERT INTO `professor_turma_materia` (`id_professor_turma_materia`, `id_professor`, `id_turma`, `id_materia`) VALUES
	(1, 1, 1, 1),
	(2, 2, 2, 2),
	(3, 3, 3, 3),
	(4, 4, 4, 4),
	(5, 4, 5, 4);

-- Copiando estrutura para tabela bancon3.semestres
CREATE TABLE IF NOT EXISTS `semestres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semestres_turma` int(10) DEFAULT NULL,
  `id_cursos` int(11) DEFAULT NULL,
  `id_turma` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_semestres_cursos` (`id_cursos`),
  KEY `FK_semestres_turma` (`id_turma`),
  CONSTRAINT `FK_semestres_cursos` FOREIGN KEY (`id_cursos`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_semestres_turma` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela bancon3.semestres: ~5 rows (aproximadamente)
INSERT INTO `semestres` (`id`, `semestres_turma`, `id_cursos`, `id_turma`) VALUES
	(1, 1, 1, 1),
	(2, 2, 1, 2),
	(3, 3, 2, 3),
	(4, 4, 2, 4),
	(5, 5, 2, 5);

-- Copiando estrutura para tabela bancon3.turma
CREATE TABLE IF NOT EXISTS `turma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `turma` int(11) DEFAULT NULL,
  `id_alunos` int(11) DEFAULT NULL,
  `id_cursos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_turma_alunos` (`id_alunos`),
  KEY `FK_turma_cursos` (`id_cursos`),
  CONSTRAINT `FK_turma_alunos` FOREIGN KEY (`id_alunos`) REFERENCES `alunos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_turma_cursos` FOREIGN KEY (`id_cursos`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela bancon3.turma: ~5 rows (aproximadamente)
INSERT INTO `turma` (`id`, `turma`, `id_alunos`, `id_cursos`) VALUES
	(1, 1, 1, 1),
	(2, 2, 2, 1),
	(3, 3, 3, 2),
	(4, 4, 4, 2),
	(5, 5, 5, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
