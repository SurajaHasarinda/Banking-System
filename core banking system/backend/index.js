import express from 'express';
import mysql from 'mysql';
import cors from 'cors';
import dotenv from 'dotenv';

dotenv.config();


dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,

    database: process.env.DB_NAME

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

// deposit funds
// app.post('/withdraw', (req, res) => {
//     const { accountNumber, amount, branchId, description } = req.body;

//     // print the user inputs
//     console.log('Withdrawal request:', req.body);

//     const query = `
//         CALL WithdrawFunds(?, ?, ?, ?, @result_message);
//         SELECT @result_message AS result;
//     `;

//     // Execute the query with user inputs (but not @result_message, since it's an output parameter)
//     db.query(query, [accountNumber, amount, branchId, description], (err, results) => {
//         if (err) {
//             console.error('Error processing withdrawal:', err);
//             return res.status(500).json({ error: 'Error processing withdrawal', details: err.message });
//         }

//         // Retrieve the result message
//         const resultMessage = results[1][0].result; // Access the second result set for the message
//         res.status(200).json({ message: resultMessage }); // Send success response with the result message
//     });
// });


app.post('/withdraw', (req, res) => {
    const { accountNumber, amount, branchId, description } = req.body;

    const callQuery = `CALL WithdrawFunds(?, ?, ?, ?, @result_message)`;
    const selectQuery = `SELECT @result_message AS result`;

    // execute the stored procedure call first
    db.query(callQuery, [accountNumber, amount, branchId, description], (err) => {
        if (err) {
            console.error('Error processing withdrawal:', err);
            return res.status(500).json({ error: 'Error processing withdrawal', details: err.message });
        }

        // execute the select query to get the result message
        db.query(selectQuery, (err, results) => {
            if (err) {
                console.error('Error retrieving result message:', err);
                return res.status(500).json({ error: 'Error retrieving result message', details: err.message });
            }

            // Log the results to see their structure
            console.log('Results from SELECT query:', results[0].result);
            

            // Check if results are valid before accessing them
            if (results.length > 0 && results[0]) {
                const resultMessage = results[0].result; // Access the result message
                return res.status(200).json({ message: resultMessage }); // Send success response with the result message
            } else {
                return res.status(400).json({ error: 'No result message returned from the stored procedure.' });
            }
        });
    });
});




