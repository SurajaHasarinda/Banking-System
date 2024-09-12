import React from "react";
import "./AccountDetails.css";

const AccountDetails = () => {
  const accounts = [
    // accounts
  ]
  return(
    <div className="account-details">
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

      <div className="main-content">
        <h1>Account Details</h1>
        <div id="accounts">
          {accounts.map((account) => (
            <div className="account-card" key={account.id}>
              <h2>{account.accountType} Account - {account.accountNumber}</h2>
              <p>Account Type: {account.accountType}</p>
              <p>Current Balance: {account.balance}</p>
              <p>Interest Rate: {account.interestRate}</p>
              <p>Withdrawals: {account.withdrawals || "N/A"}</p>
              {account.linkedAccount && (
                <p>Linked Savings Account: {account.linkedAccount}</p>
              )}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
  
  // return (
  //   <div className="container">
  //     {/* Sidebar */}
  //     <div className="sidebar">
  //       <h2>Menu</h2>
  //       <ul>
  //         <li><a href="#dashboard">Dashboard</a></li>
  //         <li><a href="#loan-payment">Loan Payment</a></li>
  //         <li><a href="#settings">Settings</a></li>
  //       </ul>
  //     </div>

  //     {/* Main Content */}
      
  //       {/* Action Buttons */}
  //       <div className="actions">
  //         <button onClick={transferFunds}>Transfer Funds</button>
  //         <button onClick={viewHistory}>View Full History</button>
  //       </div>
  //     </div>
  //   </div>
  // );

};

export default AccountDetails;
