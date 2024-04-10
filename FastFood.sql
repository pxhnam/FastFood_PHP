CREATE TABLE USERS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL DEFAULT 'USER',
);
CREATE TABLE INFORMATIONS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    phone_number VARCHAR(15),
    address VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE TABLE CATEGORIES (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    is_delete BIT DEFAULT FALSE
);
CREATE TABLE PRODUCTS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    is_delete BIT DEFAULT FALSE,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);
CREATE TABLE ORDERS(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
    
);
CREATE TABLE ORDER_DETAILS(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
