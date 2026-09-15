-- Optional MySQL schema for a future server-backed version
CREATE DATABASE IF NOT EXISTS campus_find CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE campus_find;

CREATE TABLE users (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(190) NOT NULL UNIQUE,
  student_id VARCHAR(40) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('student','admin') NOT NULL DEFAULT 'student',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE item_reports (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL,
  report_type ENUM('lost','found') NOT NULL,
  item_name VARCHAR(100) NOT NULL,
  category VARCHAR(50) NOT NULL,
  description VARCHAR(500) NOT NULL,
  campus_location VARCHAR(120) NOT NULL,
  event_date DATE NOT NULL,
  image_url VARCHAR(500),
  status ENUM('open','claim_pending','returned','archived') NOT NULL DEFAULT 'open',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_report_user FOREIGN KEY (user_id) REFERENCES users(id),
  INDEX idx_report_search (report_type, category, status, event_date)
);

CREATE TABLE claims (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  item_report_id BIGINT UNSIGNED NOT NULL,
  claimant_id BIGINT UNSIGNED NOT NULL,
  proof_description VARCHAR(500) NOT NULL,
  status ENUM('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  reviewed_at TIMESTAMP NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_claim_report FOREIGN KEY (item_report_id) REFERENCES item_reports(id),
  CONSTRAINT fk_claim_user FOREIGN KEY (claimant_id) REFERENCES users(id),
  UNIQUE KEY one_claim_per_student (item_report_id, claimant_id)
);
