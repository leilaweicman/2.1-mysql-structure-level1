# S2.01-MySQL-Structure-Level1

## 📄 Description – Exercise Statement

This project contains the solution to the following Java exercises:

### Exercise 1 – *Optics Store Database*

Design a database for an **optical shop** that sells glasses and manages customers, employees, suppliers, and sales.

#### Main Requirements

- Store information about:
    - **Customers** (with self-references for referrals).
    - **Employees**.
    - **Suppliers**.
    - **Glasses** (linked to suppliers).
    - **Sales** and **Sale Details** (linking employees, customers, and products).

#### Validation Queries
- List the total invoices of a customer within a given period.
- List the different models of glasses sold by an employee in a specific year.
- List the different suppliers who have provided glasses successfully sold by the store.

---

### Exercise 2 – *Pizzeria Database*

Design a database for a **pizzeria** that handles online and in-store orders, customers, employees, and product management.

#### Main Requirements

- **Customers** belong to a locality and province.
- Each **locality** belongs to one **province**.
- **Products** include pizzas, burgers, and drinks.
- **Pizzas** belong to a category (which may change throughout the year).
- Each **order**:
    - Is linked to one customer and one store.
    - Can include multiple products through an order detail table.
    - May be for **pickup** or **delivery**.
    - If delivery, stores the **delivery employee** and **delivery time**.

#### Validation Queries
- Count how many products from the *“Bebidas”* category were sold in a given locality.
- Count how many orders were handled by a specific employee (e.g., a delivery driver).

---

## 💻 Technologies Used
- MySQL 8.0 (Dockerized)
- Docker & Docker Compose
- SQL (DDL + DML + queries)
- Git & GitHub

---

## 🐳 Docker Setup

The project includes a `docker-compose.yml` file that launches:

- A **MySQL** container for each database (Optics & Pizzeria).

Example (partial):

```sh
services:
  mysql-optics:
    image: mysql:8.0
    platform: linux/arm64
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: optics
      MYSQL_USER: optics_user
      MYSQL_PASSWORD: optics_pass
    ports:
      - "3306:3306"
```

---

## ▶️ Execution

Start the containers:
```sh
docker-compose up -d
```

Run validation queries from `03_queries_optics.sql` and `06_queries_pizzeria.sql`.

---


## 🌐 Deployment
Not applicable (local practice project).

---

## 🤝 Contributions

1. Fork this repository.
2. Create a new branch:
```sh
git checkout -b feature/NewFeature
```
3. Commit your changes:
```sh
git commit -m "Add NewFeature"
```
4. Commit your changes:
```sh
git push origin feature/NewFeature
```
5. Open a Pull Request.
