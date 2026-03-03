# LogiTech Solutions
Databases for organize and performance the work-flow of Megaestore_global enterprice,
solving the operative crisis


## Proyect structure
```
└── 📁src
    └── 📁config
        ├── env.js
        ├── pgconfig.js
    └── 📁controllers
        ├── customer.controller.js
        ├── product.controller.js
        ├── supplier.controller.js
    └── 📁data
        ├── Captura desde 2026-03-02 18-57-17.png
        ├── db.sql
        ├── PM-prueba-desempeno-data_m4.csv
    └── 📁routes
        ├── customers.route.js
        ├── index.js
        ├── product.route.js
        ├── supplier.route.js
    └── 📁service
        ├── customer.service.js
        ├── product.service.js
        ├── supplier.service.js
    ├── app.js
    └── server.js
```

##

## step by step installation
1. Clone the repo:
    https://github.com/Frosty2801/DB_ASSESTMENT_MD4.git

2. Install the dependencies:
    npm install
    This reads the package.json and downloads everything into node_modules automatically.

3. If you want to install manually one by one: 
    npm install express        # server HTTP
    npm install pg             # conection PostgreSQL
    npm install mongoose       # conection MongoDB
    npm install xlsx           # reading Excel files
    npm install dotenv         # environment variables

4. Run the proyect:
    npm run dev


## ENDPOINTS

1. Customers:
GET: /customers

POST: /customers

2. Products:
GET: /products

POST: /products

3. Suppliers: 
GET: /suppliers

POST: /suppliers

