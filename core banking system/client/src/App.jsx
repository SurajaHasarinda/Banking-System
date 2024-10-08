import React from 'react';
import { BrowserRouter as Router} from 'react-router-dom';
import UserDashboard from './components/user/dashboard/UserDashboard';

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


