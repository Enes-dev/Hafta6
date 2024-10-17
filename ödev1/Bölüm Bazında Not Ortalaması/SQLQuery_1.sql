-- Veritabanını oluştur
CREATE DATABASE ogrenci_sistemi;

-- Veritabanını kullan
USE ogrenci_sistemi;

-- Bölümler tablosu
CREATE TABLE bolumler (
    bolum_id INT PRIMARY KEY,
    bolum_adi VARCHAR(100)
);

-- Öğrenciler tablosu
CREATE TABLE ogrenci (
    ogrenci_id INT PRIMARY KEY,
    isim VARCHAR(100),
    bolum_id INT,
    FOREIGN KEY (bolum_id) REFERENCES bolumler(bolum_id)
);

-- Notlar tablosu
CREATE TABLE notlar (
    ogrenci_id INT,
    ders_id INT,
    not INT,
    FOREIGN KEY (ogrenci_id) REFERENCES ogrenci(ogrenci_id)
);