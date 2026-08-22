CREATE DATABASE saborotage;
USE saborotage;

CREATE TABLE garcons(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);
CREATE TABLE mesas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL UNIQUE
); 
CREATE TABLE pratos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);
CREATE TABLE pedidos(
    id int PRIMARY KEY AUTO_INCREMENT,
    idGarcom int not null,
    idMesa int not null,
    criadoEm timestamp DEFAULT CURRENT_TIMESTAMP,
    prontoEm timestamp null,
    entregueEm timestamp null,
    
    FOREIGN KEY (idGarcom) REFERENCES garcons (id),
    FOREIGN KEY (idMesa) REFERENCES mesas (id)
    );
CREATE TABLE pratos_pedidos(
    id int PRIMARY KEY AUTO_INCREMENT,
    idPrato int not null,
    idPedido int not null,
    quantidade int not null CHECK (quantidade > 0),
    
    FOREIGN KEY (idPrato) REFERENCES pratos(id),
    FOREIGN KEY (idPedido) REFERENCES pedidos(id)
    );