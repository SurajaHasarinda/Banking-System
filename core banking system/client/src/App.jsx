import React from 'react';
import { BrowserRouter as Router } from 'react-router-dom'; // Add this import
import UserDashboard from './components/user/dashboard/UserDashboard';
//import MoneyTransfer from './components/user/MoneyTransfer/MoneyTransfer';
import MoneyTransfer1 from './components/user/MoneyTransfer/MoneyTransfer1'; // Ensure the path is correct

function App() {
  return (
    <div className="App">
      <Router>
        <UserDashboard />
        
        
      </Router>
    </div>
  );
}

export default App;
