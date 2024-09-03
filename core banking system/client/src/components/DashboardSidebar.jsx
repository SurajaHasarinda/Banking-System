import React, { useState } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faMoneyBillTransfer, faBuildingColumns, faClockRotateLeft, faGear, faHouseUser, faArrowRightFromBracket, faCircleQuestion, faCaretRight, faHandHoldingDollar, faSackDollar} from '@fortawesome/free-solid-svg-icons'
import './DashboardSidebar.css';

const DashboardSidebar = () => {
  const [isSidebarClosed, setSidebarClosed] = useState(true);

  const toggleSidebar = () => setSidebarClosed(!isSidebarClosed);

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
              <li className="nav-link">
                <a href="#">
                    <FontAwesomeIcon icon={faHouseUser} className='icon'/>
                    <span className="text nav-text">Dashboard</span>
                </a>
              </li>

              <li className="nav-link">
                <a href="#">
                    <FontAwesomeIcon icon={faMoneyBillTransfer} className='icon'/>
                    <span className="text nav-text">Money Transfer</span>
                </a>
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
                    <span className="text nav-text">Online Loan</span>
                </a>
              </li>

              <li className="nav-link">
                <a href="#">
                    <FontAwesomeIcon icon={faHandHoldingDollar} className='icon'/>
                    <span className="text nav-text">Loan Repayment</span>
                </a>
              </li>

              <li className="nav-link">
                <a href="#">
                    <FontAwesomeIcon icon={faGear} className='icon'/>
                    <span className="text nav-text">Settings</span>
                </a>
              </li>

            </ul>
          </div>

          <div className="bottom-content">
            <li>
              <a href="#">
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
        <div className="text">Welcome, Suraja!</div>
      </section>
    </div>
  );
};

export default DashboardSidebar;
