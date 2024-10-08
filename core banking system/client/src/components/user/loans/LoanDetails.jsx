import React, { useState, useEffect } from 'react';
import { Typography, Card, CardContent, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper } from '@mui/material';
import api from '../../../services/api';

const LoanDetails = () => {
  const [loanDetails, setLoanDetails] = useState([]);

  useEffect(() => {
    const fetchLoanDetails = async () => {
      try {
        const userId = JSON.parse(localStorage.getItem('user')).id;
        const response = await api.get('/loan_details', { params: { userId } });
        setLoanDetails(response.data);
      } catch (error) {
        console.error('Error fetching loan details:', error);
      }
    };

    fetchLoanDetails();
  }, []);

  const formatCurrency = (value) => {
    const number = parseFloat(value);
    return isNaN(number) ? '0.00' : number.toFixed(2);
  };

  return (
    <Card>
      <CardContent>
        <Typography variant="h5" component="div" gutterBottom>
          Loan Details
        </Typography>
        {loanDetails.length > 0 ? (
          <TableContainer component={Paper}>
            <Table>
              <TableHead>
                <TableRow>
                  <TableCell>Loan ID</TableCell>
                  <TableCell>Loan Type</TableCell>
                  <TableCell>Amount</TableCell>
                  <TableCell>Interest Rate</TableCell>
                  <TableCell>Penalty</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {loanDetails.map((loan) => (
                  <TableRow key={loan.loan_id}>
                    <TableCell>{loan.loan_id}</TableCell>
                    <TableCell>{loan.loan_type}</TableCell>
                    <TableCell>${formatCurrency(loan.amount)}</TableCell>
                    <TableCell>{formatCurrency(loan.interest_rate)}%</TableCell>
                    <TableCell>${formatCurrency(loan.penalty_amount)}</TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </TableContainer>
        ) : (
          <Typography>No loan details available.</Typography>
        )}
      </CardContent>
    </Card>
  );
};

export default LoanDetails;