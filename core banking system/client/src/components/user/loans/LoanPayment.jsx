import React from 'react';
import { Typography, Card, CardContent } from '@mui/material';

const LoanPayment = () => {
  return (
    <Card>
      <CardContent>
        <Typography variant="h5" component="div">
          Loan Payment
        </Typography>
        <Typography variant="body2">
          This is a dummy page for making loan payments. You would typically see payment options and current loan balances here.
        </Typography>
      </CardContent>
    </Card>
  );
};

export default LoanPayment;