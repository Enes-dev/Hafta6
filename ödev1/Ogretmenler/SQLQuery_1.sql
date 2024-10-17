CREATE TABLE bolumler (
    bolum_id INT PRIMARY KEY IDENTITY(1,1),
    bolum_adi VARCHAR(100)
);

CREATE TABLE ogretmenler (
    ogretmen_id INT PRIMARY KEY IDENTITY(1,1),
    ad VARCHAR(100),
    soyad VARCHAR(100),
    bolum_id INT,
    FOREIGN KEY (bolum_id) REFERENCES bolumler(bolum_id)
);

INSERT INTO ogretmenler (ad, soyad, bolum_id)
VALUES
('Ahmet', 'Yılmaz', 1),
('Ayşe', 'Demir', 2),
('Mehmet', 'Çelik', 3),
('Elif', 'Kara', 1),
('Hakan', 'Öz', 2);

CREATE TABLE ogretmen_dersler (
    ogretmen_id INT,
    ders_id INT,
    FOREIGN KEY (ogretmen_id) REFERENCES ogretmenler(ogretmen_id),
    FOREIGN KEY (ders_id) REFERENCES dersler(ders_id)
);

INSERT INTO ogretmen_dersler (ogretmen_id, ders_id)
VALUES
(1, 101), (1, 102),  
(2, 103), (2, 104),  
(3, 105), (3, 106),  
(4, 101), (4, 105),  
(5, 104), (5, 106);  