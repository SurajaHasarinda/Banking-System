import express from 'express';
//import mysql from 'mysql';
import mysql from 'mysql2/promise';
import cors from 'cors';
import dotenv from 'dotenv';

dotenv.config();

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
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

app.post("/login", async (req, res) => {
    const { username, password } = req.body;
    try {
      const [rows] = await db.query(
        "SELECT * FROM user WHERE user_name = ? AND password = ?",
        [username, password]
      );
      if (rows.length > 0) {
        const user = rows[0];
        res.json({ 
            success: true, 
            user: { 
                id: user.user_id, 
                username: user.user_name, role: user.role 
            } 
        });
      } else {
        res.json({ success: false });
      }
    } catch (err) {
      console.error('Error during login:', err);
      res.status(500).json({ error: 'Internal server error' });
    }
  });