-- Bölümler tablosuna veri ekle
INSERT INTO bolumler (bolum_id, bolum_adi)
VALUES (1, 'Bilgisayar Mühendisliği'), (2, 'Elektrik Elektronik Mühendisliği'), (3, 'Makine Mühendisliği');

-- Öğrenci tablosuna veri ekle
INSERT INTO ogrenci (ogrenci_id, isim, bolum_id)
VALUES (1, 'Ali', 1), (2, 'Ayşe', 1), (3, 'Mehmet', 2), (4, 'Elif', 3);

SELECT b.bolum_adi, AVG(n.not) AS ortalama_not
FROM ogrenci o
JOIN notlar n ON o.ogrenci_id = n.ogrenci_id
JOIN bolumler b ON o.bolum_id = b.bolum_id
GROUP BY b.bolum_adi;