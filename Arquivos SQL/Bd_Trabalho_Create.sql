-- -----------------------------------------------------
-- Table `TbCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbCliente` (
    `CdCliente` INT NOT NULL,
    `NmCliente` VARCHAR(100) NOT NULL,
    `CPF` CHAR(14) NOT NULL,
    `DtNasc` DATE NOT NULL,
    `Genero` CHAR NOT NULL,
    PRIMARY KEY (`CdCliente`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `TbIngresso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbIngresso` (
    `CdIngresso` INT NOT NULL,
    `Preco` NUMERIC(6 , 2) NOT NULL,
    `CdCliente` INT NOT NULL,
    PRIMARY KEY (`CdIngresso`),
    FOREIGN KEY (`CdCliente`)
        REFERENCES `TbCliente` (`CdCliente`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `TbVisita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbVisita` (
    `CdVisita` INT NOT NULL,
    `DtVisita` DATE NOT NULL,
    `HrEntrada` TIME NOT NULL,
    `HrSaida` TIME NOT NULL,
    `CdIngresso` INT NOT NULL,
    PRIMARY KEY (`CdVisita`),
    FOREIGN KEY (`CdIngresso`)
        REFERENCES `TbIngresso` (`CdIngresso`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `TbHabitat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbHabitat` (
    `CdHabitat` INT NOT NULL,
    `NumHabitat` INT NOT NULL,
    `TipoHabitat` VARCHAR(50) NOT NULL,
    `Capacidade` INT NOT NULL,
    PRIMARY KEY (`CdHabitat`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `TbAnimal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbAnimal` (
    `CdAnimal` INT NOT NULL,
    `Genero` CHAR NOT NULL,
    `NmPopular` VARCHAR(50) NOT NULL,
    `DtNasc` DATE NOT NULL,
    `Peso` NUMERIC(7 , 2 ) NOT NULL,
    `Caracteristica` VARCHAR(30) NOT NULL,
    `NmCientifico` VARCHAR(70) NOT NULL,
    `CdHabitat` INT NOT NULL,
    PRIMARY KEY (`CdAnimal`),
    FOREIGN KEY (`CdHabitat`)
        REFERENCES `TbHabitat` (`CdHabitat`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `TbFuncionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbFuncionario` (
    `CdFuncionario` INT NOT NULL,
    `NmFuncionario` VARCHAR(100) NOT NULL,
    `CPF` CHAR(14) NOT NULL,
    `DtNasc` DATE NOT NULL,
    `TempoProfissional` INT NOT NULL,
    `Genero` CHAR NOT NULL,
    `Endereco` VARCHAR(200) NOT NULL,
    PRIMARY KEY (`CdFuncionario`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `TbTelefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbTelefone` (
    `CdFuncionario` INT NOT NULL,
    `Telefone` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`CdFuncionario` , `Telefone`),
    FOREIGN KEY (`CdFuncionario`)
        REFERENCES `TbFuncionario` (`CdFuncionario`)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `TbEspecialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbEspecialidade` (
    `CdEspecialidade` INT NOT NULL,
    `Area` VARCHAR(50) NOT NULL,
    `NmEspecialidade` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`CdEspecialidade`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `TbVisitaHabitat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbVisitaHabitat` (
    `CdVisita` INT NOT NULL,
    `CdHabitat` INT NOT NULL,
    PRIMARY KEY (`CdVisita` , `CdHabitat`),
    FOREIGN KEY (`CdVisita`)
        REFERENCES `TbVisita` (`CdVisita`),
    FOREIGN KEY (`CdHabitat`)
        REFERENCES `TbHabitat` (`CdHabitat`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `TbAnimalFuncionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbAnimalFuncionario` (
    `CdAnimal` INT NOT NULL,
    `CdFuncionario` INT NOT NULL,
    PRIMARY KEY (`CdAnimal` , `CdFuncionario`),
    FOREIGN KEY (`CdAnimal`)
        REFERENCES `TbAnimal` (`CdAnimal`),
    FOREIGN KEY (`CdFuncionario`)
        REFERENCES `TbFuncionario` (`CdFuncionario`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `TbFuncionarioEspecialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbFuncionarioEspecialidade` (
    `CdFuncionario` INT NOT NULL,
    `CdEspecialidade` INT NOT NULL,
    PRIMARY KEY (`CdFuncionario` , `CdEspecialidade`),
    FOREIGN KEY (`CdFuncionario`)
        REFERENCES `TbFuncionario` (`CdFuncionario`),
    FOREIGN KEY (`CdEspecialidade`)
        REFERENCES `TbEspecialidade` (`CdEspecialidade`)
)  ENGINE=INNODB;