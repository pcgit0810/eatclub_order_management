# 🍕 EatClub Order Management System

A real-time backend system for managing food orders and inventory — built with **Ruby on Rails** and **PostgreSQL**.

---

## Overview

This backend application allows:

- Customers to place orders
- Staff to update order statuses
- Inventory tracking with auto-deduction/replenishment
- Notifications when stock runs low

---

## Tech Stack

- **Language:** Ruby
- **Framework:** Ruby on Rails
- **Database:** PostgreSQL
- **Gems Used:** `aasm` (for state transitions), `active_model_serializers` (optional), `pg`

---

## 🛠️ Setup Instructions

### 1. Clone the Repo

```bash
git clone https://github.com/your_username/eatclub_order_management.git
cd eatclub_order_management
bundle install
rails db:create
rails db:migrate
rails db:seed
rails server
```
### 2. Postman Collection in JSON
https://drive.google.com/file/d/1yXBs6ZJQx_J1n0IpFpNAHHQ-27lajaPQ/view?usp=sharing