import React, { useState } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { 
  faMoneyBillTransfer, faWallet, faClockRotateLeft, faGear, 
  faHouseUser, faArrowRightFromBracket, faCircleQuestion, 
  faCaretRight, faSackDollar
} from '@fortawesome/free-solid-svg-icons';

import {Routes, Link, useNavigate, Route} from 'react-router-dom';
import { logout } from '../../../services/auth';

import './UserDashboard.css';
import Notification from './notification/Notification';
import Home from '../home/Home';
<<<<<<< HEAD
import MoneyTransfer1 from '../MoneyTransfer/MoneyTransfer1';

=======
import AccountDetails from '../account-details/AccountDetails';
import MoneyTransfer from '../money-transfer/MoneyTransfer';
import TransactionHistory from '../transaction-history/TransactionHistory';
import Loans from '../loans/Loans';
import ApplyLoan from '../loans/ApplyLoan';
import LoanPayment from '../loans/LoanPayment';
import LoanDetails from '../loans/LoanDetails';
import Settings from '../settings/Settings';
>>>>>>> 8602410fa1591e06335630ad6e49555dc4349342

const DashboardSidebar = () => {
  const [isSidebarClosed, setSidebarClosed] = useState(true);
  const navigate = useNavigate();

  const user = JSON.parse(localStorage.getItem('user') || '{}');
  const userName = user.username || 'User'; // Fallback to 'User' if username is not found

  const toggleSidebar = () => setSidebarClosed(!isSidebarClosed);

  const handleLogout = () => {
    logout();
    navigate('/login');
  };

  const menuItems = [
    { path: '/dashboard/home', icon: faHouseUser, text: 'Home' },
    { path: '/dashboard/account-details', icon: faWallet, text: 'Account Details' },
    { path: '/dashboard/money-transfer', icon: faMoneyBillTransfer, text: 'Money Transfer' },
    { path: '/dashboard/transaction-history', icon: faClockRotateLeft, text: 'Transaction History' },
    { 
      path: '/dashboard/loans', 
      icon: faSackDollar, 
      text: 'Loans',
      subItems: [
        { path: '/dashboard/loans/apply', text: 'Apply Loan' },
        { path: '/dashboard/loans/payment', text: 'Loan Payment' },
        { path: '/dashboard/loans/details', text: 'Loan Details' },
      ]
    },
  ];

  return (
    <div className="body">
      <nav className={`sidebar ${isSidebarClosed ? 'close' : ''}`}>
        <header>
          <div className="image-text">
            <span className="image">
              <img src="https://cf-vectorizer-live.s3.amazonaws.com/vectorized/2lNO9ykbvoI6dXm568P2qXGrFfQ/2lNOEmLgmd3NUzrav2Oc0zsvjrV.svg" alt="" />
            </span>
            <div className="text logo-text">
              <span className="name">Seychelles</span>
              <span className="name">Trust Bank</span>
            </div>
          </div>
          <FontAwesomeIcon icon={faCaretRight} className='bx bx-chevron-right toggle' onClick={toggleSidebar}/>
        </header>

        <div className="menu-bar">
          <div className="menu">
            <ul className="menu-links">
<<<<<<< HEAD
              <li className="nav-link">
                <Link to="/home">
                    <FontAwesomeIcon icon={faHouseUser} className='icon'/>
                    <span className="text nav-text">Home</span>
                </Link>
              </li>

              <li className="nav-link">
                <Link to="/home">
                    <FontAwesomeIcon icon={faWallet} className='icon'/>
                    <span className="text nav-text">Account Details</span>
                </Link>
              </li>

              <li className="nav-link">
                <Link to="Money-transfer">
                    <FontAwesomeIcon icon={faMoneyBillTransfer} className='icon'/>
                    <span className="text nav-text">Money Transfer</span>
                </Link>
              </li>

              <li className="nav-link">
                <a href="#">
                    <FontAwesomeIcon icon={faClockRotateLeft} className='icon'/>
                    <span className="text nav-text">Transaction History</span>
                </a>
              </li>

              <li className="nav-link">
                <a href="#">
                    <FontAwesomeIcon icon={faSackDollar} className='icon'/>
                    <span className="text nav-text">Loans</span>
                </a>
              </li>


=======
              {menuItems.map((item, index) => (
                <li className="nav-link" key={index}>
                  <Link to={item.path} onClick={()=>navigate(item.path)}>
                    <FontAwesomeIcon icon={item.icon} className='icon'/>
                    <span className="text nav-text">{item.text}</span>
                  </Link>
                  {item.subItems && (
                    <ul className="sub-menu">
                      {item.subItems.map((subItem, subIndex) => (
                        <li key={subIndex}>
                          <Link to={subItem.path} onClick={() => navigate(subItem.path)}>
                            <span className="text nav-text">{subItem.text}</span>
                          </Link>
                        </li>
                      ))}
                    </ul>
                  )}
                </li>
              ))}
>>>>>>> 8602410fa1591e06335630ad6e49555dc4349342
            </ul>
          </div>

          <div className="bottom-content">
            <li className="nav-link">
              <Link to="/dashboard/settings">
                <FontAwesomeIcon icon={faGear} className='icon'/>
                <span className="text nav-text">Settings</span>
              </Link>
            </li>
            <li>
              <a href="#" onClick={handleLogout}>
                <FontAwesomeIcon icon={faArrowRightFromBracket} className='icon'/>
                <span className="text nav-text">Logout</span>
              </a>
            </li>
            <li>
              <a href="#">
                <FontAwesomeIcon icon={faCircleQuestion} className='icon'/>
                <span className="text nav-text">Get Help</span>
              </a>
            </li>
          </div>
        </div>
      </nav>

      <section className="home">
        <div className="top-bar">
          <div className="text">Welcome, {userName}</div>
          <div className="notification"><Notification/></div>
        </div>

        <Routes>
<<<<<<< HEAD
            <Route path="/home" element={<Home />} />
            <Route path="/Money-transfer" element={<MoneyTransfer1 />} />
            {/* Add other routes here */}
=======
          <Route index element={<Home />} />
          <Route path="home" element={<Home />} />
          <Route path="account-details" element={<AccountDetails />} />
          <Route path="money-transfer" element={<MoneyTransfer />} />
          <Route path="transaction-history" element={<TransactionHistory />} />
          <Route path="loans" element={<Loans />}>
            <Route path="apply" element={<ApplyLoan />} />
            <Route path="payment" element={<LoanPayment />} />
            <Route path="details" element={<LoanDetails />} />
          </Route>
          <Route path="settings" element={<Settings />} />
>>>>>>> 8602410fa1591e06335630ad6e49555dc4349342
        </Routes>
      </section>
    </div>
  );
};

export default DashboardSidebar;