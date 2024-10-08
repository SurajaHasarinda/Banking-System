import React from 'react';
import { BrowserRouter as Router } from 'react-router-dom'; // Add this import
import UserDashboard from './components/user/dashboard/UserDashboard';
import UserLogin from './components/Login/UserLogin';
import { BrowserRouter as Router, Route, Routes, Navigate } from 'react-router-dom';

function App() {
  return (
    <div className="App">
      <Router>
        <Routes>
          <Route path="/login" element={<UserLogin />} />
          <Route path="/dashboard/*" element={<UserDashboard />} />
          <Route path="/" element={<Navigate to="/login" replace />} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;

