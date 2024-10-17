CREATE TABLE OgrenciKulup (
    OgrenciID INT,
    KulupID INT,
    Rol NVARCHAR(50),
    KatilimTarihi DATE,
    PRIMARY KEY (OgrenciID, KulupID),
    FOREIGN KEY (KulupID) REFERENCES Kulüpler(KulupID)
);

INSERT INTO Kulüpler (KulupAdi, KurulusYili) VALUES 
('Tiyatro Kulübü', 2001),
('Müzik Kulübü', 2003),
('Spor Kulübü', 2005),
('Kitap Kulübü', 2010),
('Bilim Kulübü', 2015);

INSERT INTO OgrenciKulup (OgrenciID, KulupID, Rol, KatilimTarihi) VALUES 
(1, 1, 'Başkan', '2023-09-01'),
(2, 1, 'Üye', '2023-09-01'),
(3, 1, 'Sekreter', '2023-09-01'),
(4, 2, 'Başkan', '2023-09-02'),
(5, 2, 'Üye', '2023-09-02'),
(6, 2, 'Üye', '2023-09-02'),
(7, 3, 'Başkan', '2023-09-03'),
(8, 3, 'Sekreter', '2023-09-03'),
(9, 3, 'Üye', '2023-09-03'),
(10, 4, 'Başkan', '2023-09-04'),
(11, 4, 'Üye', '2023-09-04'),
(12, 4, 'Üye', '2023-09-04'),
(13, 5, 'Başkan', '2023-09-05'),
(14, 5, 'Üye', '2023-09-05'),
(15, 5, 'Sekreter', '2023-09-05');

SELECT o.OgrenciID, o.Ad, o.Soyad, k.KulupAdi
FROM OgrenciKulup ok
JOIN Ogrenciler o ON ok.OgrenciID = o.OgrenciID
JOIN Kulüpler k ON ok.KulupID = k.KulupID;

SELECT o.Ad, o.Soyad, ok.Rol
FROM OgrenciKulup ok
JOIN Ogrenciler o ON ok.OgrenciID = o.OgrenciID
JOIN Kulüpler k ON ok.KulupID = k.KulupID
WHERE k.KulupAdi = 'Tiyatro Kulübü';

SELECT o.Ad, o.Soyad, k.KulupAdi
FROM OgrenciKulup ok
JOIN Ogrenciler o ON ok.OgrenciID = o.OgrenciID
JOIN Kulüpler k ON ok.KulupID = k.KulupID
WHERE ok.Rol = 'Başkan';

SELECT k.KulupAdi, COUNT(ok.OgrenciID) AS UyeSayisi
FROM OgrenciKulup ok
JOIN Kulüpler k ON ok.KulupID = k.KulupID
GROUP BY k.KulupAdi;

SELECT o.Ad, o.Soyad, k.KulupAdi
FROM OgrenciKulup ok
JOIN Ogrenciler o ON ok.OgrenciID = o.OgrenciID
JOIN Kulüpler k ON ok.KulupID = k.KulupID
ORDER BY k.KurulusYili ASC
LIMIT 1;

SELECT o.Ad, o.Soyad, k.KulupAdi, ok.KatilimTarihi
FROM OgrenciKulup ok
JOIN Ogrenciler o ON ok.OgrenciID = o.OgrenciID
JOIN Kulüpler k ON ok.KulupID = k.KulupID;

SELECT DISTINCT ok.Rol
FROM OgrenciKulup ok
JOIN Kulüpler k ON ok.KulupID = k.KulupID
WHERE k.KulupAdi = 'Müzik Kulübü';

SELECT k.KulupAdi, COUNT(ok.OgrenciID) AS BaskanSayisi
FROM OgrenciKulup ok
JOIN Kulüpler k ON ok.KulupID = k.KulupID
WHERE ok.Rol = 'Başkan'
GROUP BY k.KulupAdi;

SELECT o.Ad, o.Soyad, k.KulupAdi, ok.KatilimTarihi
FROM OgrenciKulup ok
JOIN Ogrenciler o ON ok.OgrenciID = o.OgrenciID
JOIN Kulüpler k ON ok.KulupID = k.KulupID
ORDER BY ok.KatilimTarihi DESC;

SELECT o.Ad, o.Soyad, COUNT(ok.KulupID) AS KulupSayisi
FROM OgrenciKulup ok
JOIN Ogrenciler o ON ok.OgrenciID = o.OgrenciID
GROUP BY o.Ad, o.Soyad
HAVING COUNT(ok.KulupID) > 1;