// src/components/Dashboard.js
import React from 'react';
import './Dashboard.css';

const Dashboard = () => {
  return (
    <div className="dashboard">
      <aside className="sidebar">
        <div className="logo">OpenPay</div>
        <nav className="menu">
          <a href="#dashboard" className="menu-item active">Dashboard</a>
          <a href="#invoices" className="menu-item">Invoices</a>
          <a href="#messages" className="menu-item">Messages</a>
          <a href="#wallets" className="menu-item">My Wallets</a>
          <a href="#activity" className="menu-item">Activity</a>
          <a href="#analytics" className="menu-item">Analytics</a>
        </nav>
        <div className="bottom-menu">
          <a href="#help" className="menu-item">Get Help</a>
          <a href="#settings" className="menu-item">Settings</a>
        </div>
      </aside>

      <main className="content">
        <div className="header">
          <h2>Welcome Suraja</h2>
        </div>
        <div className="accounts">
          <div className="account">Account 1 : Show balance</div>
          <div className="account">Account 2 : Show balance</div>
          <div className="account">Account 3 : Show balance</div>
        </div>

        <div className="recent-transactions">
          <h3>Recent Transactions</h3>
          <div className="transaction">
            <div className="transaction-icon bitcoin-icon" />
            <div className="transaction-details">
              <span>Bitcoin Transactions</span>
              <span>Jan 16, 2020</span>
            </div>
            <div className="transaction-id">****45242</div>
            <div className="transaction-amount">-$853.00</div>
            <div className="transaction-status success">Success</div>
          </div>

          <div className="transaction">
            <div className="transaction-icon user-icon" />
            <div className="transaction-details">
              <span>Sent to antonia</span>
              <span>Jan 16, 2020</span>
            </div>
            <div className="transaction-id">****97212</div>
            <div className="transaction-amount">-$155.00</div>
            <div className="transaction-status pending">Pending</div>
          </div>

          <div className="transaction">
            <div className="transaction-icon paypal-icon" />
            <div className="transaction-details">
              <span>Withdraw Paypal</span>
              <span>Jan 16, 2020</span>
            </div>
            <div className="transaction-id">****36275</div>
            <div className="transaction-amount">+$223.00</div>
            <div className="transaction-status success">Success</div>
          </div>
        </div>

        <div className="quick-transfer">
          <h3>Quick Transfer</h3>
          <div className="transfer-card">
            <div className="transfer-method">Debit</div>
            <div className="transfer-amount">$10,432</div>
            <input type="text" placeholder="Enter amount" className="transfer-input" />
            <div className="transfer-users">
              <span className="user-icon" />
              <span className="user-icon" />
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}

export default Dashboard;
