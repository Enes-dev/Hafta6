CREATE TABLE personel (
    personel_id INT PRIMARY KEY IDENTITY(1,1),
    ad VARCHAR(100),
    soyad VARCHAR(100),
    pozisyon VARCHAR(100),
    baslangic_tarihi DATE
);

CREATE TABLE maaslar (
    maas_id INT PRIMARY KEY IDENTITY(1,1),
    personel_id INT,
    maas_miktari DECIMAL(10, 2),
    guncelleme_tarihi DATE,
    FOREIGN KEY (personel_id) REFERENCES personel(personel_id)
);

INSERT INTO personel (ad, soyad, pozisyon, baslangic_tarihi)
VALUES
('Ahmet', 'Yılmaz', 'Okul Müdürü', '2020-01-10'),
('Ayşe', 'Demir', 'Öğretmen', '2019-09-15'),
('Mehmet', 'Çelik', 'Öğretmen', '2018-08-20'),
('Fatma', 'Kara', 'Sekreter', '2021-03-01'),
('Ali', 'Şahin', 'Öğretmen', '2022-02-05'),
('Selin', 'Güzel', 'Sekreter', '2020-07-15'),
('Murat', 'Öz', 'Öğretmen', '2017-11-23'),
('Cem', 'Ersoy', 'Okul Müdürü', '2016-05-12'),
('Deniz', 'Turan', 'Sekreter', '2021-10-08'),
('Elif', 'Kurt', 'Öğretmen', '2019-12-22');

INSERT INTO maaslar (personel_id, maas_miktari, guncelleme_tarihi)
VALUES
(1, 10000.00, '2020-01-10'), (1, 11000.00, '2022-06-15'),
(2, 5000.00, '2019-09-15'), (2, 5500.00, '2021-07-10'),
(3, 5200.00, '2018-08-20'), (3, 5700.00, '2022-01-25'),
(4, 3000.00, '2021-03-01'), (4, 3200.00, '2023-02-11'),
(5, 5100.00, '2022-02-05'), (5, 5600.00, '2023-05-30'),
(6, 3100.00, '2020-07-15'), (6, 3300.00, '2023-06-12'),
(7, 5300.00, '2017-11-23'), (7, 5800.00, '2021-08-19'),
(8, 10500.00, '2016-05-12'), (8, 11500.00, '2020-12-05'),
(9, 3100.00, '2021-10-08'), (9, 3500.00, '2022-12-20'),
(10, 5000.00, '2019-12-22'), (10, 5300.00, '2023-03-01');

SELECT p.ad, p.soyad, p.pozisyon, m.maas_miktari
FROM personel p
JOIN maaslar m ON p.personel_id = m.personel_id
WHERE m.guncelleme_tarihi = (
    SELECT MAX(m2.guncelleme_tarihi)
    FROM maaslar m2
    WHERE m2.personel_id = p.personel_id
);

SELECT AVG(m.maas_miktari) AS ortalama_maas
FROM maaslar m
JOIN (SELECT personel_id, MAX(guncelleme_tarihi) AS son_guncelleme
      FROM maaslar
      GROUP BY personel_id) AS son_maas ON m.personel_id = son_maas.personel_id
AND m.guncelleme_tarihi = son_maas.son_guncelleme;

SELECT p.pozisyon, MAX(m.maas_miktari) AS en_yuksek_maas, MIN(m.maas_miktari) AS en_dusuk_maas
FROM personel p
JOIN maaslar m ON p.personel_id = m.personel_id
GROUP BY p.pozisyon;

SELECT ad, soyad, pozisyon
FROM personel;

SELECT pozisyon, COUNT(*) AS personel_sayisi
FROM personel
GROUP BY pozisyon;

SELECT p.ad, p.soyad, m.maas_miktari, m.guncelleme_tarihi
FROM personel p
JOIN maaslar m ON p.personel_id = m.personel_id
WHERE m.guncelleme_tarihi = (
    SELECT MAX(m2.guncelleme_tarihi)
    FROM maaslar m2
    WHERE m2.personel_id = p.personel_id
);

SELECT ad, soyad
FROM personel
WHERE pozisyon = 'Öğretmen';

SELECT AVG(m.maas_miktari) AS ortalama_maas
FROM maaslar m
JOIN (SELECT personel_id, MAX(guncelleme_tarihi) AS son_guncelleme
      FROM maaslar
      GROUP BY personel_id) AS son_maas ON m.personel_id = son_maas.personel_id
AND m.guncelleme_tarihi = son_maas.son_guncelleme;

SELECT p.ad, p.soyad, m.maas_miktari
FROM personel p
JOIN maaslar m ON p.personel_id = m.personel_id
WHERE m.guncelleme_tarihi = (
    SELECT MAX(m2.guncelleme_tarihi)
    FROM maaslar m2
    WHERE m2.personel_id = p.personel_id)
ORDER BY m.maas_miktari DESC
LIMIT 1;

SELECT p.ad, p.soyad, m.maas_miktari, m.guncelleme_tarihi
FROM personel p
JOIN maaslar m ON p.personel_id = m.personel_id
WHERE p.personel_id = 1  -- Buraya personel_id'yi yerleştirin
ORDER BY m.guncelleme_tarihi ASC;

SELECT p.pozisyon, MAX(m.maas_miktari) AS en_yuksek_maas, MIN(m.maas_miktari) AS en_dusuk_maas
FROM personel p
JOIN maaslar m ON p.personel_id = m.personel_id
GROUP BY p.pozisyon;

SELECT p.ad, p.soyad, m.guncelleme_tarihi
FROM personel p
JOIN maaslar m ON p.personel_id = m.personel_id
WHERE m.guncelleme_tarihi >= DATEADD(MONTH, -6, GETDATE());

SELECT p.ad, p.soyad, COUNT(m.maas_id) AS guncelleme_sayisi
FROM personel p
JOIN maaslar m ON p.personel_id = m.personel_id
GROUP BY p.ad, p.soyad
HAVING COUNT(m.maas_id) >= 2;