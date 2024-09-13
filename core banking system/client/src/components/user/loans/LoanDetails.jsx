import React from 'react';
import { Typography, Card, CardContent } from '@mui/material';

const LoanDetails = () => {
  return (
    <Card>
      <CardContent>
        <Typography variant="h5" component="div">
          Loan Details
        </Typography>
        <Typography variant="body2">
          This is a dummy page for viewing loan details. You would typically see a list of active loans and their details here.
        </Typography>
      </CardContent>
    </Card>
  );
};

export default LoanDetails;