# Banking-System
An online platform designed for efficient e-banking.

# 1. Introduction

## 1.1 Purpose

This Software Requirements Specification (SRS) document outlines the requirements for the Core Banking Solution. The CBS is designed to manage the essential banking functions for a private bank in Seychelles, including account management, branch operations, customer management, loan processing, and transaction handling. This document provides a detailed description of the system’s functionality and is intended to serve as a comprehensive guide for developers, testers, project managers, and stakeholders involved in the project.

## 1.2 Document Conventions

This document adheres to the following conventions:

- **Bold** text is used for headings and key terms.
- _Italic_ text is used for emphasis.
- Monospaced font is used for code snippets and system paths.
- Priorities for requirements are indicated using the following format:

- **High**: Essential for initial release.
- **Medium**: Important but not critical.
- **Low**: Nice to have, will not impact the system significantly if omitted.

- Each requirement statement is assigned its own priority, independent of higher-level requirements.

## 1.3 Intended Audience and Reading Suggestions

This SRS is intended for a diverse audience including:

- **Developers**: To understand the functional and non-functional requirements of the system.
- **Project Managers**: To get an overview of the project scope, timelines, and deliverables.
- **Marketing Staff**: To understand the key features and benefits of the system.
- **End Users**: To gain insight into the capabilities and functionalities of the system.
- **Testers**: To design and execute test cases based on the specified requirements.
- **Documentation Writers**: To develop user manuals and help guides.

Readers are advised to begin with section 1 for an introduction, followed by section 2 for a product description, and section 3 for Interface Requirements. Developers and testers should pay special attention to the System Features in section 4 and Other Nonfunctional Requirements in section 5

## 1.4 Product Scope

The purpose of this software development project is to create a Core Banking Solution (CBS) for a private bank in Seychelles. Key functionalities include:

- **Account Management**: Opening, closing, and maintaining customer accounts.
- **Branch Operations**: Managing branch information and operations.
- **Customer Management**: Handling customer information and interactions.
- **Loan Processing**: Managing loan applications, approvals, and repayments.
- **Transaction Handling**: Recording and processing financial transactions.

The CBS aligns with the bank’s strategic goal to enhance operational efficiency, improve customer service, and support future growth.

## 1.5 References

IEEE. _IEEE Std 830-1998 IEEE Recommended Practice for Software Requirements Specifications._ IEEE Computer Society, 1998.

# 2.0 Overall Description

## 2.1 System Environment

The **Bank Transaction and Loan Processing System** is an advanced banking platform designed to replace the outdated DOS-based system currently in use by Bank A, a private bank in Seychelles. The primary goal of this new system is to modernize the bank's operations, ensure compliance with Seychelles' financial regulations, and lay the groundwork for future expansion, including integration with the national banking switch for cross-bank transactions and ATM services.

## 2.1.1 Deployment Architecture

The system will be deployed across all branches of Bank A, with the head office acting as the central hub. A secure **leased line network** will connect each branch to the head office, facilitating real-time communication and data transfer. The system's architecture will include:

- **Central Servers**: Located at the head office, these servers will host the core banking software, manage databases, and handle transaction processing.
- **Branch Terminals**: Bank employees will access the system through secure terminals at each branch, allowing for branch-level operations such as account management and loan processing.
- **Customer Portal**: Customers will interact with the system via an online portal, enabling them to manage their accounts, transfer funds, and apply for loans from anywhere.
- **Data Security Measures**: The system will incorporate robust security features, including encryption, secure login protocols, and regular audits, to protect sensitive banking data.

## 2.1.2 System Interfaces

The system will interact with several external and internal interfaces, including:

- **Banking Regulatory Systems**: Ensures compliance with national financial regulations through regular data exchanges.
- **Future Integration with National Banking Switch**: Although not included in the initial phase, the system is designed to integrate seamlessly with the Seychelles national banking switch for cross-bank transactions and ATM operations.
- **Reporting Tools**: Provides secure access to reports generated by the system, available only to authorized personnel like branch managers.

## 2.2 Functional Requirements Specification

The Bank Transaction and Loan Processing System is divided into several key functional areas, each encompassing specific use cases. These functional areas include branch management, account management, internal fund transfers, loan processing, and reporting.

### 2.2.1 Branch Management Use Cases

- **Use case: Manage Branches**

- **Description**: Allows the bank to manage branch-specific details, such as updating branch information, assigning branch managers, and maintaining employee records. This functionality is crucial for ensuring that each branch operates efficiently and complies with the bank's internal policies.
- **Priority**: _High_
- **Actors**: Branch Manager, System Administrator

### 2.2.2 Account Management Use Cases

- **Use case: Create and Manage Accounts**

- **Description**: Supports the creation and ongoing management of customer accounts, including Savings Accounts, Checking Accounts, and Fixed Deposits. The system will enforce withdrawal limits for Savings Accounts and automatically calculate and apply interest rates based on the type of account.
- **Priority**: _High_
- **Actors**: Bank Employees, Customers

- **Use case: Link Fixed Deposit to Savings Account**

- **Description**: Allows customers to start Fixed Deposits linked to their Savings Accounts. The system will calculate interest on the Fixed Deposits monthly and deposit it into the linked Savings Account.
- **Priority**: _High_
- **Actors**: Bank Employees, Customers

- **Use case: Update Account Information**

- **Description**: Enables bank employees to update account information, such as personal details, account status, and account type.
- **Priority**: _Medium_
- **Actors**: Bank Employees

### 2.2.3 Internal Fund Transfers Use Case

- **Use case: Transfer Funds**

- **Description**: Enables customers to transfer funds between their accounts within the bank. This feature supports real-time processing, allowing for instant fund availability. The system will also ensure that no transaction fees are applied to these internal transfers.
- **Priority**: _High_
- **Actors**: Customers, Bank Employees

### 2.2.4 Loan Processing Use Cases

- **Use case: Apply for Loan In-Branch**

- **Description**: Allows customers to apply for loans directly at a branch with assistance from bank employees. Loan applications require branch manager approval before they can be processed further. This feature supports both personal and business loans, with customizable loan terms based on the customer’s profile.
- **Priority**: _High_
- **Actors**: Customers, Bank Employees, Branch Manager

- **Use case: Apply for Loan Online**

- **Description**: Provides customers with the convenience of applying for loans online if they hold an existing Fixed Deposit with the bank. The system automates the approval process, leveraging predefined criteria, and does not require branch manager involvement for these cases.
- **Priority**: _High_
- **Actors**: Customers

- **Use case: Calculate and Track Loan Installments**

- **Description**: Once a loan is approved, the system will automatically calculate the monthly installments, schedule payment dates, and track each installment as it is paid. The system will generate reminders for customers and alerts for bank employees in case of missed payments.
- **Priority**: _High_
- **Actors**: Customers, Bank Employees

### 2.2.5 Reporting Use Cases

- **Use case: Generate Branch-Wise Transaction Report**

- **Description**: Branch managers can generate detailed reports of all transactions that occurred within their branch during a specified period. These reports are essential for internal audits and compliance with regulatory requirements.
- **Priority**: _Medium_
- **Actors**: Branch Manager, System Administrator

- **Use case: Generate Branch-Wise Loan Installment Report**

- **Description**: This feature allows branch managers to generate reports on loan installments, focusing on payments that are late or missed. These reports help the branch manager take necessary actions to ensure loan recovery.
- **Priority**: _Medium_
- **Actors**: Branch Manager

- **Use case: Generate Regulatory Compliance Report**

- **Description**: The system will generate reports required by Seychelles’ financial authorities to ensure the bank’s operations comply with national regulations.
- **Priority**: _High_
- **Actors**: Branch Manager, System Administrator

# 3. External Interface Requirements

## 3.1 User Interfaces  
The online banking system will provide a web-based user interface that allows users to perform various banking functions. The interface will adhere to modern web design principles, ensuring it is intuitive, responsive, and accessible. Key characteristics include:

- **Login/Registration Screens:** Secure login and account registration screens with standard input fields (username, password) and security measures like CAPTCHA and two-factor authentication.
- **Dashboard:** A central dashboard displaying account balances, recent transactions, and quick links to common actions such as transfers and bill payments.
- **Account Management:** Interfaces for viewing account details, managing account settings, and downloading statements.
- **Transaction Management:** Screens for initiating transfers, paying bills, and viewing transaction histories.
- **Notifications:** A section for displaying alerts, messages, and important notifications from the bank.
- **Help and Support:** Access to customer support via chat, email, or phone, with a help section that includes FAQs and guides.
- **Standard Buttons and Functions:** Consistent use of standard buttons like "Submit," "Cancel," and "Help" across all screens. Keyboard shortcuts for common actions (e.g., "Ctrl+T" for new transfer) will be provided.
- **Error Messages:** Clear and concise error messages will be displayed when users encounter issues, with guidance on how to resolve them.

## 3.2 Hardware Interfaces  
The web app will primarily interact with client devices such as desktop computers, laptops, tablets, and smartphones. It will support modern web browsers on various operating systems (e.g., Windows, macOS, Android, iOS). Key hardware interface characteristics include:

- **Device Compatibility:** The application will be compatible with devices having different screen sizes and resolutions, ensuring responsive design and a consistent user experience.
- **Input Devices:** The app will support input via mouse, keyboard, touchscreens, and virtual keyboards.
- **Security Devices:** Integration with hardware security modules (HSMs) and secure elements for transactions requiring strong authentication (e.g., smart cards or biometric devices).

## 3.3 Software Interfaces  
The online banking system will interact with several software components, including:

- **Operating Systems:** Compatibility with popular operating systems like Windows, macOS, Android, and iOS.
- **Databases:** Integration with secure databases for storing user data, transaction records, and account details. The system will use APIs to communicate with the database, ensuring data consistency and integrity.
- **Payment Gateways:** Interfaces to connect with third-party payment gateways for processing payments and transfers.
- **External APIs:** Interaction with external services like credit bureaus, KYC (Know Your Customer) verification services, and SMS/email notification services.
- **Web Servers:** The system will run on secure web servers, utilizing HTTPS for encrypted communication.
- **Libraries and Frameworks:** The application will leverage modern web development frameworks (e.g., React, Angular) and libraries (e.g., jQuery) for enhanced functionality and user experience.

## 3.4 Communications Interfaces  
The online banking system will require various communication functions to operate efficiently. These include:

- **Web Protocols:** The app will use HTTP/HTTPS for communication between client devices and the server. All data exchanges will be encrypted using SSL/TLS to ensure security.
- **Email and SMS Notifications:** The system will send transactional alerts, OTPs (One-Time Passwords), and other notifications via email and SMS. These communications will follow standard formats like SMTP for emails and SMS gateways for text messages.
- **API Communication:** The app will communicate with external APIs over RESTful services, using JSON or XML for data interchange. The APIs will be secured using OAuth or other authentication mechanisms.
- **Data Synchronization:** Real-time data synchronization will be implemented between the client and server, ensuring that user actions (e.g., initiating a transfer) are reflected instantly across all devices.
- **Security Protocols:** The system will use strong encryption algorithms (e.g., AES-256) for data at rest and in transit, and will adhere to industry standards like PCI DSS for handling payment information.

# 5. Other Nonfunctional Requirements

## 5.1 Performance Requirements

-  The system must handle up to about 20,000 concurrent users. The system must have a peak load time of less than 2 seconds for any transaction-related operations.

- Database queries should return results within 1 second for most of the transactions and it should have a maximum of 2 seconds for complex queries.

- The system must support up to 500 simultaneous loan processing operations without significant degradation in performance. It should ensure that all transactions are processed within 3 seconds.

- Reports generation like branch-wise total transaction reports should not take more than 10 seconds.

## 5.2 Safety Requirements

  - The system must ensure that all transactions are atomic, consistent, isolated, and durable. In a system failure, all in-progress transactions should be rolled back to maintain data integrity.

 - Data backups must be performed daily, with a retention period of 365 days. In case of a fatal failure, the system should be recoverable within 1 hour with no data loss.

 - Safety mechanisms should prevent unauthorized access and accidental deletion of critical data. The system should be able to send alerts to administrators in case of any suspicious activity.

## 5.3 Security Requirements

 - All user access to the system must be authenticated through multi-factor authentication to ensure secure access.

 - Data must be encrypted both in transit and at rest.

 - The system should log all access and transaction activities. The logs must be retained for a minimum of 1 year to support audits and other investigations.

 - The system must comply with Seychelles’ financial regulations and data protection laws such that it ensures the protection of customer data from breaches and unauthorized access.

 - The system should implement role-based access control to limit access to sensitive data, based on the user’s role within the bank.

## 5.4 Software Quality Attributes

1. **Availability**
	- The system should be available 24/7 except for scheduled maintenance.

2. **Reliability**
	- The system should operate reliably, with a target of fewer than 5 critical failures per year. Any critical failure should be resolved within 1 hour.

1. **Maintainability**
	- The system should be designed for ease of maintenance, allowing updates, bug fixes, and patches to be applied. The maintenance period should be minimal.

 4. **Scalability**
- The system should be able for the addition of new branches, users, and transactions without a major rebuild of the system architecture.

5. **Usability**
- The system should be user-friendly. It should require minimal training for employees and customers. The UI should be consistent across all platforms (desktop, web, and mobile).

6. **Interoperability:** (mekt wen namak thyenwnm dann. Chatgpt apu ekak)
- The system should be designed to integrate seamlessly with the country’s common banking switch. It should adhere to the required API standards and protocols.

## 5.5 Business Rules

 - Only branch managers can approve loan applications, with the exception of online loan requests which are automatically approved if conditions are met. (automatically approve????)

 - Customers must have an active Savings account to open a Fixed Deposit.

 - The system should enforce interest rate and withdrawal limits as per the defined account plans.

 - Loan installments must be calculated automatically upon loan approval and adjusted if early payments are made.

 - Only branch managers can view branch-wise transaction and late loan installment reports.
