# Ürün İnceleme ve Değerlendirme Sistemi

Bu proje, kullanıcıların ürün incelemeleri yapmasına, değerlendirmeler bırakmasına ve diğer kullanıcıların yorumlarını görüntülemesine olanak tanır. Kullanıcılar, ürünlere puan vererek daha bilinçli alışveriş kararları alabilir ve ürünlerin genel değerlendirmesini takip edebilir.

---

## Proje Amacı  
Ürün İnceleme ve Değerlendirme Sistemi, kullanıcıların ürünlerle ilgili deneyimlerini paylaşmasını ve diğer kullanıcıların bu değerlendirmelerden faydalanmasını sağlar. Bu sistem, daha bilinçli kararlar alınmasına yardımcı olmayı ve kullanıcı memnuniyetini artırmayı amaçlar.

---

## Özellikler  
- **Kullanıcı Yönetimi:** Kullanıcı kayıtları, giriş ve kayıt işlemleri yapılabilir.  
- **Ürün İncelemeleri:** Kullanıcılar ürünlere yorum yapabilir ve puan verebilir.  
- **Filtreleme:** Ürünler kategorilere göre filtrelenebilir. 
- **Favoriler:** Kullanıcılar beğendikleri ürünleri favorilerine ekleyebilir.
- **Detaylı Ürün Görüntüleme:** Ürün açıklamaları, teknik detaylar ve resimler kullanıcıya sunulur.  

---

## Teknolojiler  
- **Veritabanı:** MySQL (utf8mb4_unicode_ci)  
- **Backend Framework:** Laravel  
- **Frontend:** HTML, CSS, PHP, BLADE, JavaScript (Bootstrap)

## Veritabanı Tabloları  
Proje kapsamında oluşturulan temel tablolar ve ilişkiler şunlardır:  

- **users**: Kullanıcı bilgilerini içerir (ad, soyad, e-posta, şifre, vb.).  
- **products**: Ürün bilgilerini içerir (isim, açıklama, fiyat, vb.).  
- **reviews**: Kullanıcıların ürünlere yaptığı yorumlar ve puanlamalar.  
- **categories**: Ürün kategorilerini tanımlar.  
- **favorites**: Kullanıcıların favori ürünlerini saklar.  

---

## Kurulum  
Bu projeyi yerel makinenizde çalıştırmak için aşağıdaki adımları takip edebilirsiniz:

### Projeyi klonlayın:  
``` 
https://github.com/SalimCan213/db-1.git
``` 
Gerekli bağımlılıkları yükleyin:
```
composer install
```
.env dosyasını yapılandırın:

```
cp .env.example .env
```

Veritabanını oluşturun ve migrasyonları çalıştırın:

```
php artisan migrate
```
Uygulamayı başlatın:
```
php artisan serve
```
