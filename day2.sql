/*======================= CONSTRAINTS - KISITLAMALAR ======================================
               
    NOT NULL - Bir Sütunun  NULL içermemesini garanti eder. 
?
    UNIQUE - Bir sütundaki tüm deðerlerin BENZERSÝZ olmasýný garanti eder.  null kabul eder, hatta birden fazla null deðer girebiliriz
?
    PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
                  BENZERSÝZ olmasýný garanti eder.(NOT NULL ve UNIQUE birleþimi gibi)
?
    FOREIGN KEY - Baþka bir tablodaki Primary Key’i referans göstermek için kullanýlýr. 
                  Böylelikle, tablolar arasýnda iliþki kurulmuþ olur. 
?
    CHECK - Bir sutundaki tüm verilerin belirlenen özel bir þartý saðlamasýný garanti eder. 
    soldan tablo silerken tablonun kapalý olmasý lazým*/
    
    --not null konusu
    CREATE TABLE ogrenciler(
    id char(4)not null,
    isim varchar(50),
    not_ort number(4,2),--bu 98,34 gibi bir sayi anlamýna geliyor
    kayit_tarihi date
    
    );

    SELECT * FROM ogrenciler;
    
    INSERT INTO ogrenciler VALUES('1234', 'hasan', 75.25, '14-01-2020');
    INSERT INTO ogrenciler VALUES('1234', 'ayse', null, null);
     SELECT * FROM ogrenciler;
     INSERT INTO ogrenciler (id, isim) VALUES ('3456', 'fatma');
     SELECT *FROM ogrenciler;
     INSERT INTO ogrenciler VALUES (null, 'necati', 545, '31-01-2012');--ORA-01400: ("AHMET"."OGRENCILER"."ID") içine NULL eklenemez hatasý verdi
     
    
    --unýque
    
    create table tedarikciler (
    id char (4) UNIQUE,
    isim varchar(50),
    adres varchar(100),
    tarih date
    );
    
    insert into tedarikciler values('458', 'amet memet', 'm nezih ozmen mh', '02-04-2015');
    select * from tedarikciler;
     insert into tedarikciler values('458', 'cortett', 'm nezih efemh', '02-12-2015'); --ORA-00001: benzersiz kural (AHMET.SYS_C0010973) ihlal edildi
      insert into tedarikciler values(null, 'tt', 'm zih mh', '02-12-2015');
      select * from tedarikciler;
      
      --primary key
      
      create table personel (
      id char (5) primary key,
      isim varchar (50) unique,
      maas number(5) not null,
      ise_baslama date
      );
    insert into personel values ('10012', 'ahmet altan', 5000, '14-03-1987');
    select * from personel;
    
    --primary key e alternatif yöntem 
    --bu yöntemle kýsýtlamaya istediðmiz ismi atayabiliriz
    
    create table CALISANLAR(
    id char (5),
    isim varchar(50) unique,
    maas number (5) not null,
    constraint id_primary primary key(id)
    );
    
    INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan',7000);
    INSERT INTO calisanlar VALUES( '10002', 'Mehmet Yýlmaz' ,12000);
    INSERT INTO calisanlar VALUES('10003', 'CAN', 5000);
    select * from calisanlar;
    --bir tabloya veri eklerken constraintlere dikkat edilmelidir. 
    
   --rnek 4 foreign key
   create table adresler(
   adres_id char(5),
   sokak varchar(30),
   cadde varchar(39),
   sehir varchar(15),
   constraint ID_foreign FOREIGN KEY (adres_id) references CALISANLAR (id)
   );
   
   
    INSERT INTO adresler VALUES('10001','Mutlu Sok', '40.Cad.','IST');
    INSERT INTO adresler VALUES('10001','Can Sok', '50.Cad.','Ankara');
    INSERT INTO adresler VALUES('10002','Aða Sok', '30.Cad.','Antep');
    INSERT INTO adresler VALUES('','Cano Sok', '30.Cad.','Antep');
    INSERT INTO adresler VALUES('','baba Sok', '30.Caddes.','Antep');
   
   select * from adresler;
   
DROP table calisanlar;--parent olduðu için silnmedi.
--calisanlar parent
--adresler child
--önce çocuk silinir sonra baba silinir.

--ogrenciler 5 tablosu oluþturacaðýz ve id, isim hanelerinin birleþimini primary key yapacaðýz

create table ogrenciler5(
id char(4),
isim varchar(20),
not_ort number(5,2),
kayit_tarihi date,
constraint ogrenciler5_primary PRIMARY KEY (id, isim)--id ve isim birleþiminin tamamý iki satýrda ayný olamaz. ayrý ayrý aynýlýklar olabilir. 
--primary key tek de olsa çift de olsa null lý deðeri istemiyor. 
);

INSERT INTO ogrenciler5 VALUES (null,'Veli Cem',90.6,'15-05-2019'); -- ORA-01400: cannot insert NULL into ("HR"."OGRENCILER5"."ID")
INSERT INTO ogrenciler5 VALUES (1234,null,90.6,'15-05-2019'); -- ORA-01400: cannot insert NULL into ("HR"."OGRENCILER5"."ISIM")
INSERT INTO ogrenciler5 VALUES (1234,'Ali Can',90.6,'15-05-2019'); -- PK= 1234Ali Can
INSERT INTO ogrenciler5 VALUES (1234,'Veli Cem',90.6,'15-05-2019'); -- PK=1234Veli Cem
INSERT INTO ogrenciler5 VALUES (1234,'Oli Can',90.6,'15-05-2019');  --PK=1234oli can
select * from ogrencýler5;

 --“tedarikciler4” isimli bir Tablo olusturun. Icinde “tedarikci_id”, “tedarikci_isim”, “iletisim_isim” field’lari olsun.
--“tedarikci_id” ve “tedarikci_isim” fieldlarini birlestirerek Primary Key olusturun.
--“urunler2” isminde baska bir tablo olusturun.Icinde “tedarikci_id” ve “urun_id” fieldlari olsun. 
--“tedarikci_id” ve “urun_id” fieldlarini birlestirerek Foreign Key olusturun
?
create table tedarikciler4 (
tedarikci_id char(4),
tedarikci_ismi varchar(20),
iletisim_ismi varchar(20),
CONSTRAINT tedarikciler4_pk PRIMARY KEY(tedarikci_id,tedarikci_ismi)--char +varchar
);
?
create table urunler2(
tedarikci_id char(4),
urun_id varchar(5),
yas number,
CONSTRAINT urunler2_fk FOREIGN KEY (tedarikci_id,urun_id)REFERENCES tedarikciler4 --urunler2_fk bu ifade foreign key in adý yerine kullandýk
                                  --char +varchar
                                  --yani FOREIGN KEY (tedarikci_id,urun_id) deki char ve varchar türünün PRIMARY KEY(tedarikci_id,tedarikci_ismi)deki char ve varchar olarak eþleþmesi önemli.
                                  --yoksa içerikleri ayný olmasa da olur. türler ayný olmalý. 
);
    
