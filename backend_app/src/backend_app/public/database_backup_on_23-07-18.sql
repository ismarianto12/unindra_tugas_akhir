

CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(14) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `level_id` int DEFAULT NULL,
  `token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `nama` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO login (id, username, password, created_at, update_at, level_id, token, nama) VALUES ('1','admin','123','2023-06-21 20:25:52','2023-06-21 20:25:52','1','$2y$10$u0ryr.IiMaRUIIyZ5mQQjuE7p25iEyaq4tmYOkHDcUPuG.5t.Wx.G','adminis');

INSERT INTO login (id, username, password, created_at, update_at, level_id, token, nama) VALUES ('2','','','','','','','');


CREATE TABLE `masterdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(14) DEFAULT NULL,
  `nama` varchar(14) DEFAULT NULL,
  `type` varchar(14) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO masterdata (id, kode, nama, type, create_at, updated_at) VALUES ('1','','','satuan','','');

INSERT INTO masterdata (id, kode, nama, type, create_at, updated_at) VALUES ('2','ONS','ONS','satuan','','');

INSERT INTO masterdata (id, kode, nama, type, create_at, updated_at) VALUES ('3','ONS','KG','satuan','','');

INSERT INTO masterdata (id, kode, nama, type, create_at, updated_at) VALUES ('4','ONS','MILIGRAM','satuan','','');

INSERT INTO masterdata (id, kode, nama, type, create_at, updated_at) VALUES ('5','PACK','BENDEL','satuan','','');

INSERT INTO masterdata (id, kode, nama, type, create_at, updated_at) VALUES ('6','PCS','PCS','satuan','','');

INSERT INTO masterdata (id, kode, nama, type, create_at, updated_at) VALUES ('7','PCS','PCS','satuan','','');

INSERT INTO masterdata (id, kode, nama, type, create_at, updated_at) VALUES ('8','PCS','PCS','satuan','','');

INSERT INTO masterdata (id, kode, nama, type, create_at, updated_at) VALUES ('9','PCS','PCS','satuan','','');

INSERT INTO masterdata (id, kode, nama, type, create_at, updated_at) VALUES ('10','tet','rian','satuan','','');

INSERT INTO masterdata (id, kode, nama, type, create_at, updated_at) VALUES ('11','tet','rian','satuan','','');


CREATE TABLE `peminjaman` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomorTelepon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alamat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `namaBarang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `deskripsiBarang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tanggalPenitipan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `durasiPenitipan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `biayaPenitipan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `instruksiKhusus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `return` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `penitipan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomorTelepon` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `namaBarang` varchar(50) DEFAULT NULL,
  `deskripsiBarang` varchar(50) DEFAULT NULL,
  `tanggalPenitipan` varchar(50) DEFAULT NULL,
  `durasiPenitipan` varchar(50) DEFAULT NULL,
  `biayaPenitipan` varchar(50) DEFAULT NULL,
  `instruksiKhusus` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `return` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO penitipan (id, nomorTelepon, alamat, namaBarang, deskripsiBarang, tanggalPenitipan, durasiPenitipan, biayaPenitipan, instruksiKhusus, created_at, updated_at, return) VALUES ('15','081231123','TEST','BARANG','BARANG','12/7/2023','1','120000','121','','','');

INSERT INTO penitipan (id, nomorTelepon, alamat, namaBarang, deskripsiBarang, tanggalPenitipan, durasiPenitipan, biayaPenitipan, instruksiKhusus, created_at, updated_at, return) VALUES ('16','adsadaasdad','adsadada','adasd','adadad','11/07/2023','1','10000','12','','','');

INSERT INTO penitipan (id, nomorTelepon, alamat, namaBarang, deskripsiBarang, tanggalPenitipan, durasiPenitipan, biayaPenitipan, instruksiKhusus, created_at, updated_at, return) VALUES ('17','083182305714','jalan aji ati ati','heroin','','12/07/2023','3 Hari','30000','kdjdjdj','','','');

INSERT INTO penitipan (id, nomorTelepon, alamat, namaBarang, deskripsiBarang, tanggalPenitipan, durasiPenitipan, biayaPenitipan, instruksiKhusus, created_at, updated_at, return) VALUES ('18','083182305714','jalan aji ati ati','heroin','','12/07/2023','3 Hari','30000','kdjdjdj','','','');

INSERT INTO penitipan (id, nomorTelepon, alamat, namaBarang, deskripsiBarang, tanggalPenitipan, durasiPenitipan, biayaPenitipan, instruksiKhusus, created_at, updated_at, return) VALUES ('19','083182305714','jalan aji ati ati','heroin','barang ','13/07/2023','4 Hari','40000','kdjdjdj','','','');

INSERT INTO penitipan (id, nomorTelepon, alamat, namaBarang, deskripsiBarang, tanggalPenitipan, durasiPenitipan, biayaPenitipan, instruksiKhusus, created_at, updated_at, return) VALUES ('20','08218373','jalan monokwari','beras 2 kg','ini beras super','11/07/2023','2 Hari','20000','12','','','');

INSERT INTO penitipan (id, nomorTelepon, alamat, namaBarang, deskripsiBarang, tanggalPenitipan, durasiPenitipan, biayaPenitipan, instruksiKhusus, created_at, updated_at, return) VALUES ('21','08218373','jalan monokwari','beras 2 kg','ini beras super','11/07/2023','2 Hari','20000','12','','','');

INSERT INTO penitipan (id, nomorTelepon, alamat, namaBarang, deskripsiBarang, tanggalPenitipan, durasiPenitipan, biayaPenitipan, instruksiKhusus, created_at, updated_at, return) VALUES ('22','','','','','','','','','','','');

INSERT INTO penitipan (id, nomorTelepon, alamat, namaBarang, deskripsiBarang, tanggalPenitipan, durasiPenitipan, biayaPenitipan, instruksiKhusus, created_at, updated_at, return) VALUES ('23','','','','','','','','','','','');

INSERT INTO penitipan (id, nomorTelepon, alamat, namaBarang, deskripsiBarang, tanggalPenitipan, durasiPenitipan, biayaPenitipan, instruksiKhusus, created_at, updated_at, return) VALUES ('24','','','','','','','','','','','');

INSERT INTO penitipan (id, nomorTelepon, alamat, namaBarang, deskripsiBarang, tanggalPenitipan, durasiPenitipan, biayaPenitipan, instruksiKhusus, created_at, updated_at, return) VALUES ('25','','','','','','','','','','','');

INSERT INTO penitipan (id, nomorTelepon, alamat, namaBarang, deskripsiBarang, tanggalPenitipan, durasiPenitipan, biayaPenitipan, instruksiKhusus, created_at, updated_at, return) VALUES ('26','','','','','','','','','','','');

INSERT INTO penitipan (id, nomorTelepon, alamat, namaBarang, deskripsiBarang, tanggalPenitipan, durasiPenitipan, biayaPenitipan, instruksiKhusus, created_at, updated_at, return) VALUES ('27','','','','','','','','','','','');
