import express from 'express';
//import mysql from 'mysql';
import mysql from 'mysql2/promise';
import cors from 'cors';
import dotenv from 'dotenv';

dotenv.config();

const app = express();
app.use(cors());

const db = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
})

db.getConnection((err) => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the database.');
});

app.listen(8800, () => {
    console.log('Connected to backend!.....Server is running on http://localhost:8800');
  });

// get methods //

app.get("/",(req,res)=>{
    res.json("Hello this is the backend")
})

app.get("/accounts", async (req, res) => {
    try {
        const [rows] = await db.query("SELECT * FROM account");
        res.json(rows);
    } catch (err) {
        console.error('Error fetching accounts:', err);
        res.status(500).json({ error: 'Internal server error' });
    }
});


// get account summary
app.get("/accounts_summary", async (req, res) => {
    try {
        const [rows] = await db.query(
            "SELECT * FROM bank_database.accounts_summary WHERE customer_id = ?",
            [req.query.customer_id]
        );
        res.json(rows);
    } catch (err) {
        console.error('Error fetching account summary:', err);
        res.status(500).json({ error: 'Internal server error' });
    }
});

// get recent transactions
app.get("/recent_transactions", async (req, res) => {
    try {
        const [rows] = await db.query(
            "SELECT transaction_id, date, transaction_type, amount, description FROM bank_database.transaction_history WHERE customer_id = ? LIMIT 3",
            [req.query.customer_id]
        );
        res.json(rows);
    } catch (err) {
        console.error('Error fetching recent transactions:', err);
        res.status(500).json({ error: 'Internal server error' });
    }
});
