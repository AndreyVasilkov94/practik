-- -----------------------------------------------------
-- Database: tourism_db
-- Автор: [Ваше Имя]
-- Дата создания: [Текущая дата]
-- -----------------------------------------------------

-- Удаляем старую версию базы (если существует)
DROP DATABASE IF EXISTS tourism_db;

-- Создаем новую базу
CREATE DATABASE tourism_db;
USE tourism_db;

-- -----------------------------------------------------
-- Table: clients (справочник клиентов)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS clients (
  client_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  passport VARCHAR(20) NOT NULL UNIQUE,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(50) NOT NULL
);

-- -----------------------------------------------------
-- Table: services (справочник услуг)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS services (
  service_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL
);

-- -----------------------------------------------------
-- Table: tours (справочник туров)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tours (
  tour_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  destination VARCHAR(100) NOT NULL,
  duration_days INT NOT NULL,
  base_price DECIMAL(10, 2) NOT NULL
);

-- -----------------------------------------------------
-- Table: employees (справочник сотрудников)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS employees (
  employee_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  position VARCHAR(50) NOT NULL,
  hire_date DATE NOT NULL
);

-- -----------------------------------------------------
-- Table: orders (таблица заказов - оперативные данные)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  client_id INT NOT NULL,
  tour_id INT NOT NULL,
  employee_id INT NOT NULL,
  order_date DATE NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,
  status ENUM('Оформлен', 'Оплачен', 'Завершен') DEFAULT 'Оформлен',
  
  CONSTRAINT fk_client
    FOREIGN KEY (client_id)
    REFERENCES clients(client_id),
    
  CONSTRAINT fk_tour
    FOREIGN KEY (tour_id)
    REFERENCES tours(tour_id),
    
  CONSTRAINT fk_employee
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
);

-- -----------------------------------------------------
-- Тестовые данные
-- -----------------------------------------------------

-- Клиенты
INSERT INTO clients (full_name, passport, phone, email) VALUES
('Иванов Иван', '1234 567890', '+79991234567', 'ivanov@mail.ru'),
('Петрова Мария', '0987 654321', '+79987654321', 'petrova@yandex.ru'),
('Сидоров Алексей', '1122 334455', '+79995556677', 'sidorov@gmail.com');

-- Услуги
INSERT INTO services (name, description, price) VALUES
('Экскурсия в музей', 'Обзорная экскурсия по музею истории', 1500.00),
('Трансфер', 'Трансфер аэропорт-отель-аэропорт', 3000.00),
('Страховка', 'Полная медицинская страховка на время тура', 2500.00);

-- Туры
INSERT INTO tours (title, destination, duration_days, base_price) VALUES
('Золотое кольцо', 'Россия', 7, 45000.00),
('Отдых в Сочи', 'Сочи, Россия', 10, 68000.00),
('Горнолыжный курорт', 'Альпы, Франция', 14, 125000.00);

-- Сотрудники
INSERT INTO employees (full_name, position, hire_date) VALUES
('Сидоров Алексей', 'Менеджер по продажам', '2020-05-15'),
('Козлова Елена', 'Специалист по бронированию', '2022-11-01'),
('Федоров Дмитрий', 'Руководитель отдела', '2018-03-10');

-- Заказы
INSERT INTO orders (client_id, tour_id, employee_id, order_date, start_date, end_date, total_price, status) VALUES
(1, 1, 1, '2025-08-04', '2025-09-01', '2025-09-07', 47000.00, 'Оформлен'),
(2, 2, 2, '2025-08-05', '2025-09-10', '2025-09-20', 71000.00, 'Оплачен'),
(3, 3, 3, '2025-08-06', '2025-12-15', '2025-12-29', 130000.00, 'Завершен');

-- -----------------------------------------------------
-- Пример запроса: Показать все активные заказы
-- -----------------------------------------------------
SELECT 
  o.order_id,
  c.full_name AS client,
  t.title AS tour,
  e.full_name AS employee,
  o.order_date,
  o.start_date,
  o.end_date,
  o.total_price,
  o.status
FROM orders o
JOIN clients c ON o.client_id = c.client_id
JOIN tours t ON o.tour_id = t.tour_id
JOIN employees e ON o.employee_id = e.employee_id
WHERE o.status != 'Завершен';