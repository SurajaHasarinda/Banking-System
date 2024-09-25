import express from 'express';
import mysql from 'mysql';
import cors from 'cors';
import dotenv from 'dotenv';

dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
})

db.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the database.');
});

const PORT = process.env.PORT || 8800; // 8800 is the default port

app.listen(PORT, () => {
    console.log(`Connected to backend!.....Server is running on http://localhost:${PORT}`);
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



// get account summary
app.get("/accounts_summary/:customerId", (req, res) => {
    const customerId = req.params.customerId;
    const q = "SELECT * FROM bank_database.accounts_summary WHERE customer_id = ?"

    db.query(q, [customerId], (err, data)=>{
        if(err) return res.json(err)
        return res.json(data)
    });
});

// get recent transactions
app.get("/recent_transactions/:customerId", (req, res) => {
    const customerId = req.params.customerId;

    const q = "SELECT transaction_id, date, transaction_type, amount, description FROM bank_database.transaction_history WHERE customer_id = ? LIMIT 3"

    db.query(q, [customerId], (err, data)=>{
        if(err) return res.json(err)
        return res.json(data)
    });
});

// get user information
app.get("/user_info/:userId", (req, res) => {
    const userId = req.params.userId;

    const q = "SELECT * FROM bank_database.user_info WHERE user_id = ?"

    db.query(q, [userId], (err, data)=>{
        if(err) return res.json(err)
        return res.json(data)
    });
});

// update user information
app.put("/user_info/:userId", (req, res) => {
    const userId = req.params.userId;
    const { username, email, address, mobileNumber, landlineNumber } = req.body;

    const q = "CALL update_user_info(?, ?, ?, ?, ?, ?);";

    db.query(q, [userId, username, email, address, mobileNumber, landlineNumber], (err, data) => {
        if (err) {
            console.error('Error executing stored procedure:', err);
            return res.status(500).json({ error: 'Database query failed', details: err });
        }
        return res.json(data);
    });
});
