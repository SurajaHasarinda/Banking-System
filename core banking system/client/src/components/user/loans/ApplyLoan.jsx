import React from 'react';
import { Typography, Card, CardContent } from '@mui/material';

const ApplyLoan = () => {
  return (
    <Card>
      <CardContent>
        <Typography variant="h5" component="div">
          Apply for a Loan
        </Typography>
        <Typography variant="body2">
          This is a dummy page for applying for a loan. You would typically see a form here to fill out loan application details.
        </Typography>
      </CardContent>
    </Card>
  );
};

export default ApplyLoan;