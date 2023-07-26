/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : voucherdb

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 26/07/2023 12:25:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2023_06_21_041450_create_voucers_table', 1);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Testing', 'test@test.test', NULL, '$2y$10$DBmC2ge.8ikQYJ7wTtbexucKxHSh071Akg9acyP4U4gxsPgU8sZ8e', NULL, '2023-07-26 04:42:55', '2023-07-26 04:42:55');

-- ----------------------------
-- Table structure for voucher
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher`  (
  `id_vch` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_vch` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_dept` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `event` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nominal` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `start_date` date NOT NULL,
  `expired_date` date NOT NULL,
  `status` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_vch`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of voucher
-- ----------------------------
INSERT INTO `voucher` VALUES ('C0-10062020-10-0000', 'C0', '10', 'Spesial Ramadhan', '100000', '2020-06-10', '2020-06-10', 'OPEN');
INSERT INTO `voucher` VALUES ('C0-10062020-10-0001', 'C0', '10', 'Spesial Ra', '100000', '2020-06-10', '2020-06-10', 'OPEN');
INSERT INTO `voucher` VALUES ('C0-10062020-10-0002', 'C0', '10', 'Spesial Ramadhan', '100000', '2020-06-10', '2020-06-10', 'OPEN');
INSERT INTO `voucher` VALUES ('C0-10062020-10-0003', 'C0', '10', 'Spesial Ramadhan', '100000', '2020-06-10', '2020-06-10', 'OPEN');
INSERT INTO `voucher` VALUES ('C0-10062020-10-0004', 'C0', '10', 'Spesial Ramadhan', '100000', '2020-06-10', '2020-06-10', 'OPEN');
INSERT INTO `voucher` VALUES ('C1-13062020-00-0000', 'C1', '00', 'TEST', '100000', '2020-06-13', '2020-06-13', 'OPEN');
INSERT INTO `voucher` VALUES ('C1-13062020-00-0001', 'C1', '00', 'TEST', '100000', '2020-06-13', '2020-06-13', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-03072020-02-0015', 'G0', '02', 'VOUCHER', '100000', '2020-07-03', '2020-07-03', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-03072020-02-0016', 'G0', '02', 'VOUCHER GRATIS', '100000', '2020-07-03', '2020-07-03', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-03072020-02-0017', 'G0', '02', 'VOUCHER GRATIS', '100000', '2020-07-03', '2020-07-03', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-03072020-02-0018', 'G0', '02', 'VOUCHER GRATIS', '100000', '2020-07-03', '2020-07-03', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-03072020-02-0019', 'G0', '02', 'VOUCHER GRATIS', '100000', '2020-07-03', '2020-07-03', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-05062020-00-0000', 'G0', '00', 'VOUCHER GRATIS', '100000', '2020-06-05', '2021-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-05062020-00-0001', 'G0', '00', 'VOUCHER GRATIS', '100000', '2020-06-05', '2021-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-05062020-00-0002', 'G0', '00', 'VOUCHER GRATIS', '100000', '2020-06-05', '2021-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-05062020-00-0003', 'G0', '00', 'VOUCHER GRATIS', '100000', '2020-06-05', '2021-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-05062020-00-0004', 'G0', '00', 'VOUCHER GRATIS', '100000', '2020-06-05', '2021-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-05062020-00-0005', 'G0', '00', 'VOUCHER GRATIS', '100000', '2020-06-05', '2021-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-05062020-00-0006', 'G0', '00', 'VOUCHER GRATIS', '100000', '2020-06-05', '2021-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-05062020-00-0007', 'G0', '00', 'VOUCHER GRATIS', '100000', '2020-06-05', '2021-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-05062020-00-0008', 'G0', '00', 'VOUCHER GRATIS', '100000', '2020-06-05', '2021-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-05062020-00-0009', 'G0', '00', 'VOUCHER GRATIS', '100000', '2020-06-05', '2021-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-06062020-01-0010', 'G0', '01', 'VOUCHER GRATIS', '100000', '2020-06-05', '2020-06-05', 'CLOSED');
INSERT INTO `voucher` VALUES ('G0-06062020-01-0011', 'G0', '01', 'VOUCHER GRATIS', '100000', '2020-06-05', '2020-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-06062020-01-0012', 'G0', '01', 'VOUCHER GRATIS', '100000', '2020-06-05', '2020-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-06062020-01-0013', 'G0', '01', 'VOUCHER GRATIS', '100000', '2020-06-05', '2020-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-06062020-01-0014', 'G0', '01', 'VOUCHER GRATIS', '100000', '2020-06-05', '2020-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-13062020-00-0020', 'G0', '00', 'TEST', '100000', '2020-06-13', '2020-06-13', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-13062020-00-0021', 'G0', '00', 'TEST', '100000', '2020-06-13', '2020-06-13', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-13062020-00-0022', 'G0', '00', 'TEST', '100000', '2020-06-13', '2020-06-13', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-13062020-00-0023', 'G0', '00', 'TEST', '100000', '2020-06-13', '2020-06-13', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-13062020-00-0024', 'G0', '00', 'TEST', '100000', '2020-06-13', '2020-06-13', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-13062020-00-0025', 'G0', '00', 'TEST', '100000', '2020-06-13', '2020-06-13', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-13062020-00-0028', 'G0', '00', 'TEST', '100000', '2020-06-13', '2020-06-13', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-13062020-00-0029', 'G0', '00', 'TEST', '100000', '2020-06-13', '2020-06-13', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-13062020-01-0026', 'G0', '01', 'TEST', '100000', '2020-06-13', '2020-06-13', 'OPEN');
INSERT INTO `voucher` VALUES ('G0-13062020-01-0027', 'G0', '01', 'TEST', '100000', '2020-06-13', '2020-06-13', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-05062020-01-0000', 'G1', '01', 'Voucher Ramadhan', '500000', '2020-06-05', '2020-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-05062020-01-0001', 'G1', '01', 'Voucher Ramadhan', '500000', '2020-06-05', '2020-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-05062020-01-0002', 'G1', '01', 'Voucher Ramadhan', '500000', '2020-06-05', '2020-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-05062020-01-0003', 'G1', '01', 'Voucher Ramadhan', '500000', '2020-06-05', '2020-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-05062020-01-0004', 'G1', '01', 'Voucher Ramadhan', '500000', '2020-06-05', '2020-06-05', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-09062020-01-0005', 'G1', '01', 'BAGI-BAGI REZEKI', '1000000', '2020-06-09', '2021-06-09', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-09062020-01-0006', 'G1', '01', 'BAGI-BAGI REZEKI', '1000000', '2020-06-09', '2021-06-09', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-09062020-01-0007', 'G1', '01', 'BAGI-BAGI REZEKI', '1000000', '2020-06-09', '2021-06-09', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-09062020-01-0008', 'G1', '01', 'BAGI-BAGI REZEKI', '1000000', '2020-06-09', '2021-06-09', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-09062020-01-0009', 'G1', '01', 'BAGI-BAGI REZEKI', '1000000', '2020-06-09', '2021-06-09', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-09062020-01-0010', 'G1', '01', 'BAGI-BAGI REZEKI', '1000000', '2020-06-09', '2021-06-09', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-09062020-01-0011', 'G1', '01', 'BAGI-BAGI REZEKI', '1000000', '2020-06-09', '2021-06-09', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-09062020-01-0012', 'G1', '01', 'BAGI-BAGI REZEKI', '1000000', '2020-06-09', '2021-06-09', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-09062020-01-0013', 'G1', '01', 'BAGI-BAGI REZEKI', '1000000', '2020-06-09', '2021-06-09', 'OPEN');
INSERT INTO `voucher` VALUES ('G1-09062020-01-0014', 'G1', '01', 'BAGI-BAGI REZEKI', '1000000', '2020-06-09', '2021-06-09', 'OPEN');
INSERT INTO `voucher` VALUES ('P0-13062020-00-0000', 'P0', '00', 'TEST', '100000', '2020-06-13', '2020-06-13', 'OPEN');
INSERT INTO `voucher` VALUES ('P0-13062020-00-0001', 'P0', '00', 'TEST', '100000', '2020-06-13', '2020-06-13', 'OPEN');
INSERT INTO `voucher` VALUES ('P0-13062020-05-0002', 'P0', '05', 'Hi', '100000', '2020-06-13', '2020-06-13', 'OPEN');

-- ----------------------------
-- Table structure for vouchers
-- ----------------------------
DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE `vouchers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nominal` int NULL DEFAULT NULL,
  `start_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `expired_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vouchers
-- ----------------------------
INSERT INTO `vouchers` VALUES (1, 'VCH-000001', 'Spesial Ramadhan', 100000, '2023-07-26', '2023-08-03', 1, '2023-07-26 12:12:43', '2023-07-26 12:24:26');
INSERT INTO `vouchers` VALUES (2, 'VCH-000002', 'VOUCHER GRATIS', 100000, '2023-07-19', '2023-08-03', 1, '2023-07-26 12:13:56', NULL);

SET FOREIGN_KEY_CHECKS = 1;
