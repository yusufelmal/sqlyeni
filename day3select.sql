
-----------------SELECT- WHERE---------------
 CREATE TABLE ogrenciler2
    (
        id NUMBER(9),
        isim VARCHAR2(50),
        adres VARCHAR2(100),
        sinav_notu NUMBER(3)
    );
    INSERT INTO ogrenciler2 VALUES(123, 'Ali Can', 'Ankara',75);
    INSERT INTO ogrenciler2 VALUES(124, 'Merve Gul', 'Ankara',85);
    INSERT INTO ogrenciler2 VALUES(125, 'Kemal Yasa', 'Istanbul',85);
     select * from ogrenciler2;
     /* ============================================================================
   Verileri SELECT komutu ile veritabanýndan çekerken filtreleme yapmak için
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanýlabilir.
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adý WHERE koþul;
==============================================================================*/
 --ornek1: sinav notu 80 den buyuk olan tum ogrencilerin bilgilerini listele
  select * from ogrenciler2
  where sinav_notu>80;
 --=====================================================
  --ornek2: adresi Ankara olan ogrencilerin isim ve adres bilgilerini listele
  select isim , adres FROM ogrenciler2
  where adres= 'Ankara';
  --ornek3: id si 124 olan ogrencilerin tum bilgilerini sil
  delete from ogrenciler2
  where id=124;
  -------------select-BETWEEN------------
  CREATE TABLE personel2
    (
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );
    drop table personel;
    INSERT INTO personel2 VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel2 VALUES( '10002', 'Mehmet Yýlmaz' ,12000);
    INSERT INTO personel2 VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel2 VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel2 VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel2 VALUES('10005', 'Ayþe Can', 4000);
    SELECT * FROM personel2;
    --ornek4:  id si 10002 ile 10005 arasinda olan personelin bilgilerini listele
  --  1. yontem :
  select * from personel2
  where id between '10002' AND '10005'; -- between de ilk ve son deger dahil
  
  --2.yontem :
  select * from personel2
  where id >= '10002' AND id <= '10005';
  --ornek5 :  ismi Mehmet Yilmaz ile Veli Han arasindaki personel bilgilerini listele
  select * from personel2
  where isim  BETWEEN 'Mehmet Yilmaz' AND 'Veli Han'  ;
  --ornek6: id si 10002-10004 arasýnda olmayan personelin maasýný  listele
  select id,maas from personel2
  where id NOT between '10002' AND '10004';
  
  SELECT * FROM personel2
  WHERE isim IN('Veli Han','Ahmet Aslan');
  
  --UPDATE - SET----
?
 /*Aþaðýdaki gibi tedarikciler adýnda bir tablo oluþturunuz ve vergi_no
   sutununu primary key yapýnýz. Ayrýca aþaðýdaki verileri tabloya giriniz.
?
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
        
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
	INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
	INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
        
    Sonrasýnda aþaðýdaki gibi urunler adýnda bir baþka tablo oluþturunuz ve bu
    tablonun ted_vergino sutunu ile tedarikciler tablosunun vergi_no sutunu
    iliþkilendiriniz. Verileri giriniz.
?
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayþe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yýlmaz');*/
    
    
    create table tedarikciler1 (
    vergi_no NUMBER(3) PRIMARY KEY,
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50)
    
    );
    
     INSERT INTO tedarikciler1 VALUES (101, 'IBM', 'Kim Yon');
	INSERT INTO tedarikciler1 VALUES (102, 'Huawei', 'Çin Li');
	INSERT INTO tedarikciler1 VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler1 VALUES (104, 'Apple', 'Adam Eve');
    
    create table urunler1(
     ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    CONSTRAINT urunler_fk FOREIGN KEY ( ted_vergino) REFERENCES tedarikciler1 (vergi_no)--bu fk yazdýðýmýz þey foreign keyin fk si
    );
    
     INSERT INTO urunler1 VALUES(101, 1001,'Laptop', 'Ayþe Can');
    INSERT INTO urunler1 VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler1 VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler1 VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler1 VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler1 VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler1 VALUES(104, 1007,'Phone', 'Aslan Yýlmaz');
    
    select * from urunler1;
    select * from tedarikciler1;
    
    -- SYNTAX
    ----------
    -- UPDATE tablo_adý
    -- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
    -- WHERE koþul;
    
   --ornek1: vergi_no su 101 olan tedarikcinin firma ismini 'LG' olarak guncelleyin
   
   UPDATE tedarikciler1
   SET firma_ismi='LG'
   WHERE vergi_no=101;
   SELECT * FROM tedarikciler1;
    
  --  ornek2: tedarikciler tablosundaki tüm firma isimlerini Samsung olarak guncelle
    UPDATE tedarikciler1
    SET firma_ismi='Samsung';--yer belirtmeyince komple çeviriyor.
    
    
  -- ornek3:  ORNEK3: vergi_no’su 102 olan tedarikcinin ismini 'LENOVO' ve irtibat_ismi’ni 
 -- 'Ali Veli' olarak güncelleyeniz. 
 
 UPDATE tedarikciler1
 SET firma_ismi='LENOVO', irtibat_ismi='Ali Veli'
 WHERE vergi_no=102;
 
    --ornek4:   firma ismi Samsung olan tedarikcinin irtibat_ismini
    --Ayse Yilmaz olarak guncelleyiniz
    
    UPDATE tedarikciler1
    SET irtibat_ismi='Ayse Yilmaz'
    WHERE firma_ismi='Samsung'; --sadece samsung yazýlý olan isimleri ayþe yaptý
    
  --ornek5:   urunler tablosundaki urun_id deðeri 1004'ten büyük olanlarýn urun_id
 -- deðerlerini bir arttýrýnýz
 
 UPDATE urunler1
 SET urun_id=urun_id+1
 WHERE urun_id>1004;
 SELECT * FROM urunler1;
 
 
 --ornek6: urunler tablosundaki tüm ürünlerin urun_id deðerini ted_vergino 
 -- sutun deðeri ile toplayarak güncelleyiniz.
 
 UPDATE urunler1
 SET urun_id=urun_id + ted_vergýno;
 
 
--ornek7: urunler tablosundan Ali Bak’in  aldigi urunun ismini, TEDARÝKCÝ 
-- TABLOSUNDA ÝRTÝBAT_ÝSMÝ 'Adam Eve' OLAN FÝRMANIN ÝSMÝ (FÝRMA_ÝSMÝ) ile 
 --degistiriniz.
 
 UPDATE urunler1
 SET urun_isim =( SELECT firma_ismi FROM tedarikciler1
                      WHERE irtibat_ismi='Ali Veli'
 )
 WHERE musteri_isim='Ali Bak';
  SELECT * FROM urunler1;
  SELECT * FROM tedarikciler1;
 
-- ORNEK8: Laptop satin alan musterilerin ismini, Apple’in irtibat_isim'i ile 
 --degistirin
 
update urunler1
set musterý_ýsým=(select irtibat_ismi from tedarikciler1
where firma_ismi='LENOVO')

WHERE urun_isim='Laptop';