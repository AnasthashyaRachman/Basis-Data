-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TugasIndividu1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TugasIndividu1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TugasIndividu1` ;
USE `TugasIndividu1` ;

-- -----------------------------------------------------
-- Table `TugasIndividu1`.`Pengguna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TugasIndividu1`.`Pengguna` (
  `id_pengguna` INT NOT NULL,
  `nama` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `alamat` VARCHAR(45) NOT NULL,
  `tanggal_lahir` DATE NOT NULL,
  `Penggunacol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_pengguna`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TugasIndividu1`.`Kursus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TugasIndividu1`.`Kursus` (
  `id_kursus` INT NOT NULL,
  `nama_kursus` VARCHAR(45) NOT NULL,
  `deskripsi` VARCHAR(45) NOT NULL,
  `durasi` INT NOT NULL,
  `harga` INT NOT NULL,
  `gambar` TINYBLOB NOT NULL,
  `id_pengguna` INT NOT NULL,
  `kelas_kursus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_kursus`),
  INDEX `fk_Kursus_Pengguna1_idx` (`id_pengguna` ASC) VISIBLE,
  CONSTRAINT `fk_Kursus_Pengguna1`
    FOREIGN KEY (`id_pengguna`)
    REFERENCES `TugasIndividu1`.`Pengguna` (`id_pengguna`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TugasIndividu1`.`Materi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TugasIndividu1`.`Materi` (
  `id_materi` INT NOT NULL,
  `nama_materi` VARCHAR(45) NOT NULL,
  `deskripsi` VARCHAR(45) NOT NULL,
  `id_kursus` INT NOT NULL,
  `isi_materi` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_materi`),
  INDEX `fk_Materi_Kursus1_idx` (`id_kursus` ASC) VISIBLE,
  CONSTRAINT `fk_Materi_Kursus1`
    FOREIGN KEY (`id_kursus`)
    REFERENCES `TugasIndividu1`.`Kursus` (`id_kursus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TugasIndividu1`.`Postingan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TugasIndividu1`.`Postingan` (
  `id_postingan` INT NOT NULL,
  `jenis_file` VARCHAR(45) NOT NULL,
  `tanggal_posting` DATE NOT NULL,
  `deskripsi` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_postingan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TugasIndividu1`.`Soal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TugasIndividu1`.`Soal` (
  `id_soal` INT NOT NULL,
  `tingkat_kesulitan` VARCHAR(45) NOT NULL,
  `jumlah_soal` VARCHAR(45) NOT NULL,
  `jenis_soal` INT NOT NULL,
  `id_postingan` INT NOT NULL,
  PRIMARY KEY (`id_soal`),
  INDEX `fk_Soal_Postingan1_idx` (`id_postingan` ASC) VISIBLE,
  CONSTRAINT `fk_Soal_Postingan1`
    FOREIGN KEY (`id_postingan`)
    REFERENCES `TugasIndividu1`.`Postingan` (`id_postingan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TugasIndividu1`.`Jawaban`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TugasIndividu1`.`Jawaban` (
  `id_jawaban` INT NOT NULL,
  `jumlah_soal_salah` INT NOT NULL,
  `jumlah_soal_benar` INT NOT NULL,
  `nilai` INT NOT NULL,
  `id_pengguna` INT NOT NULL,
  PRIMARY KEY (`id_jawaban`),
  INDEX `fk_Jawaban_Pengguna1_idx` (`id_pengguna` ASC) VISIBLE,
  CONSTRAINT `fk_Jawaban_Pengguna1`
    FOREIGN KEY (`id_pengguna`)
    REFERENCES `TugasIndividu1`.`Pengguna` (`id_pengguna`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TugasIndividu1`.`Komentar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TugasIndividu1`.`Komentar` (
  `id_komentar` INT NOT NULL,
  `rating_jawaban` INT NOT NULL,
  `komentar` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_komentar`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TugasIndividu1`.`Ujian`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TugasIndividu1`.`Ujian` (
  `id_ujian` INT NOT NULL,
  `durasi` INT NOT NULL,
  `bobot_ujian` INT NOT NULL,
  `jumlah_soal` INT NOT NULL,
  `jenis_ujian` VARCHAR(45) NOT NULL,
  `id_soal` INT NOT NULL,
  `id_jawaban` INT NOT NULL,
  `id_postingan` INT NOT NULL,
  `id_komentar` INT NOT NULL,
  PRIMARY KEY (`id_ujian`),
  INDEX `fk_Ujian_Soal1_idx` (`id_soal` ASC) VISIBLE,
  INDEX `fk_Ujian_Jawaban1_idx` (`id_jawaban` ASC) VISIBLE,
  INDEX `fk_Ujian_Postingan1_idx` (`id_postingan` ASC) VISIBLE,
  INDEX `fk_Ujian_Komentar1_idx` (`id_komentar` ASC) VISIBLE,
  CONSTRAINT `fk_Ujian_Soal1`
    FOREIGN KEY (`id_soal`)
    REFERENCES `TugasIndividu1`.`Soal` (`id_soal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ujian_Jawaban1`
    FOREIGN KEY (`id_jawaban`)
    REFERENCES `TugasIndividu1`.`Jawaban` (`id_jawaban`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ujian_Postingan1`
    FOREIGN KEY (`id_postingan`)
    REFERENCES `TugasIndividu1`.`Postingan` (`id_postingan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ujian_Komentar1`
    FOREIGN KEY (`id_komentar`)
    REFERENCES `TugasIndividu1`.`Komentar` (`id_komentar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TugasIndividu1`.`Materi_has_Postingan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TugasIndividu1`.`Materi_has_Postingan` (
  `id_materi` INT NOT NULL,
  `id_postingan` INT NOT NULL,
  PRIMARY KEY (`id_materi`, `id_postingan`),
  INDEX `fk_Materi_has_Postingan_Postingan1_idx` (`id_postingan` ASC) VISIBLE,
  INDEX `fk_Materi_has_Postingan_Materi1_idx` (`id_materi` ASC) VISIBLE,
  CONSTRAINT `fk_Materi_has_Postingan_Materi1`
    FOREIGN KEY (`id_materi`)
    REFERENCES `TugasIndividu1`.`Materi` (`id_materi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materi_has_Postingan_Postingan1`
    FOREIGN KEY (`id_postingan`)
    REFERENCES `TugasIndividu1`.`Postingan` (`id_postingan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TugasIndividu1`.`Komentar_has_Postingan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TugasIndividu1`.`Komentar_has_Postingan` (
  `id_komentar` INT NOT NULL,
  `id_postingan` INT NOT NULL,
  PRIMARY KEY (`id_komentar`, `id_postingan`),
  INDEX `fk_Komentar_has_Postingan_Postingan1_idx` (`id_postingan` ASC) VISIBLE,
  INDEX `fk_Komentar_has_Postingan_Komentar1_idx` (`id_komentar` ASC) VISIBLE,
  CONSTRAINT `fk_Komentar_has_Postingan_Komentar1`
    FOREIGN KEY (`id_komentar`)
    REFERENCES `TugasIndividu1`.`Komentar` (`id_komentar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Komentar_has_Postingan_Postingan1`
    FOREIGN KEY (`id_postingan`)
    REFERENCES `TugasIndividu1`.`Postingan` (`id_postingan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TugasIndividu1`.`Soal_has_Jawaban`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TugasIndividu1`.`Soal_has_Jawaban` (
  `Soal_id_soal` INT NOT NULL,
  `id_jawaban` INT NOT NULL,
  PRIMARY KEY (`Soal_id_soal`, `id_jawaban`),
  INDEX `fk_Soal_has_Jawaban_Jawaban1_idx` (`id_jawaban` ASC) VISIBLE,
  INDEX `fk_Soal_has_Jawaban_Soal1_idx` (`Soal_id_soal` ASC) VISIBLE,
  CONSTRAINT `fk_Soal_has_Jawaban_Soal1`
    FOREIGN KEY (`Soal_id_soal`)
    REFERENCES `TugasIndividu1`.`Soal` (`id_soal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Soal_has_Jawaban_Jawaban1`
    FOREIGN KEY (`id_jawaban`)
    REFERENCES `TugasIndividu1`.`Jawaban` (`id_jawaban`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TugasIndividu1`.`Jawaban_has_Postingan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TugasIndividu1`.`Jawaban_has_Postingan` (
  `id_jawaban` INT NOT NULL,
  `id_postingan` INT NOT NULL,
  PRIMARY KEY (`id_jawaban`, `id_postingan`),
  INDEX `fk_Jawaban_has_Postingan_Postingan1_idx` (`id_postingan` ASC) VISIBLE,
  INDEX `fk_Jawaban_has_Postingan_Jawaban1_idx` (`id_jawaban` ASC) VISIBLE,
  CONSTRAINT `fk_Jawaban_has_Postingan_Jawaban1`
    FOREIGN KEY (`id_jawaban`)
    REFERENCES `TugasIndividu1`.`Jawaban` (`id_jawaban`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jawaban_has_Postingan_Postingan1`
    FOREIGN KEY (`id_postingan`)
    REFERENCES `TugasIndividu1`.`Postingan` (`id_postingan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
