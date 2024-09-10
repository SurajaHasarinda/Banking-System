import express from 'express';
import mysql from 'mysql';
import cors from 'cors';

const app = express();
app.use(cors());

const db = mysql.createConnection({
    host: 'localhost',
    user: "root",
    password: "1112",
    database: "bank_database"
})

// If there is an auth problem
//ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '3.yGy4CjUFQT@g';
db.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the database.');
});

app.get("/",(req,res)=>{
    res.json("Hello this is the backend")
})

app.get("/accounts", (req, res) => {
    const q = "SELECT * FROM account"
    db.query(q, (err, data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})

app.listen(8800, () => {
  console.log('Connected to backend!.....Server is running on http://localhost:8800');
});

// get account summary
app.get("/accounts_summary", (req, res) => {
    const q = "SELECT * FROM bank_database.accounts_summary WHERE customer_id = 3"
    db.query(q, (err, data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})

// get recent transactions
app.get("/recent_transactions", (req, res) => {
    const q = "SELECT transaction_id, date, transaction_type, amount, description FROM bank_database.transaction_history WHERE customer_id = 2 LIMIT 3"
    db.query(q, (err, data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})
