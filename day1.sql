--yorum satýrý burasý--

CREATE TABLE student
(
id CHAR(4),
name VARCHAR(20),
age NUMBER
);

--veri giriþi--

INSERT INTO student VALUES ('1001', 'AHMET MEHMET', 25);
INSERT INTO student VALUES ('1002','yusuf Osman', 12);

--tablodan veri sorgulama yýldýz ile komple oulyor
SELECT * FROM student;

--tablo silme

DROP TABLE student;

--parçalý veri giriþi

INSERT INTO student (id,name) VALUES ('1003', 'FATMA');

--veri tabanýnýzda ürünler adýnda bir tablo oluþturun

CREATE TABLE URUNLER
(
urun_id NUMBER,
Urun_name VARCHAR(50),
fiyat NUMBER
);

INSERT INTO URUNLER VALUES (100, 'cips', 5);
INSERT INTO URUNLER VALUES ('200', 'kola', 6);

SELECT * FROM URUNLER;