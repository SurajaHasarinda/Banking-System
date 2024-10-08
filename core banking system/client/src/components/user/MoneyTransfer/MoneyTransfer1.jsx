// Filename - MoneyTransfer.jsx
// It contains the Form, its Structure
// and Basic Form Functionalities

import { OutlinedInput } from "@mui/material";
import "./MoneyTransfer1.css";   
import React, { useState } from "react";
//import { Input, Page, setOptions } from '@mobiscroll/react';


function MoneyTransfer1() {
    const [selectedAccount, setSelectedAccount] = useState("");
    const [beneficiaryName, setBeneficiaryName] = useState("");
    const [BankName, setBankName] = useState("");
    const [BranchName, setBranchName] = useState("");
    const[currency,setCurrency]=useState("");
    const [beneficiaryAccount, setBeneficiaryAccount] = useState("");
    const [beneficiaryEmail, setBeneficiaryEmail] = useState("");
    const [transferAmount, setTransferAmount] = useState("");
    const [paymentMethod, setPaymentMethod] = useState("");
    const [description, setDescription] = useState("");

    const handleSubmit = (e) => {
        e.preventDefault();
        console.log(
            BankName,
            BranchName,
            currency,
            beneficiaryEmail,
            beneficiaryAccount,
            beneficiaryName,
            transferAmount,
            paymentMethod,
            description
        );
        // Add your form submission logic here
    };

    const handleReset = () => {
        setSelectedAccount("");
        setBeneficiaryAccount("");
        setTransferAmount("");
        setPaymentMethod("");
        setDescription("");
        setBeneficiaryName("");
        setBeneficiaryEmail("");
        setBankName("");
        setBranchName("");
        setCurrency("");
    };  

    return (
        <div className="App1">
            <h1>Money Transfer</h1>
            <h2>Other Bank Accounts</h2>
            <fieldset>
                <form action="#" method="get">
                    <label htmlFor="selectAccount">Payment To</label>
                    <select
                        name="selectAccount"
                        id="selectAccount"
                        value={selectedAccount}
                        onChange={(e) => setSelectedAccount(e.target.value)}
                    >
                        <option value="" disabled>Select the account</option>
                        <optgroup label="MS Semini Sawbhagya">
                            <option value="1">0056234178</option>
                        </optgroup>
                        <optgroup label="MS Semini Sawbhagya">
                            <option value="2">7526315989</option>
                        </optgroup>
                    </select>

                    <label htmlFor="beneficiaryAccount">Beneficiary Details</label>
    
                    <input Beneficiary Name
                        name="beneficiaryName"
                        id="beneficiaryName"
                        value={beneficiaryName}
                        onChange={(e) => setBeneficiaryName(e.target.value)}
                        placeholder="Beneficiary name"
                        required
                    />
                    <br />

                     <input
                        name="beneficiaryAccount"
                        id="beneficiaryAccount"
                        value={beneficiaryAccount}
                        onChange={(e) => setBeneficiaryAccount(e.target.value)}
                        placeholder="To Account"
                        required
                     />   
                     <br />
                      <input
                        name="beneficiaryEmail"
                        id="beneficiaryEmail"
                        value={beneficiaryEmail}
                        onChange={(e) => setBeneficiaryEmail(e.target.value)}
                        placeholder="Beneficiary Email"
                        required
                     />   
                     <br />
                    <label htmlFor="beneficiaryAccount">Beneficiary Bank Details</label>
    
                        <input
                            name="bankName"
                            id="bankName"
                            value={BankName}
                            onChange={(e) => setBankName(e.target.value)}
                            placeholder="Bank name"
                            required
                        />
                        <br />
                        <input
                            name="branchName"
                            id="branchName"
                            value={BranchName}
                            onChange={(e) => setBranchName(e.target.value)}
                            placeholder="Branch Name"
                            required
                        />   

                    <label htmlFor="paymentMethod">Payment Details</label>
                    <select
                        name="paymentMethod"
                        id="paymentMethod"
                        value={paymentMethod}
                        onChange={(e) => setPaymentMethod(e.target.value)}
                    >
                        <option value="" disabled>Select the method</option>
                        <option value="online">Online</option>
                        <option value="scheduled">Schedule Periodically</option>
                        <option value="onetime">Schedule Onetime</option>
                    </select>
                    
                    <select
                        name="currency"
                        id="currency"
                        value={currency}
                        onChange={(e) => setCurrency(e.target.value)}
                        placeholder="Transfer Currency"
                        required
                    >
                        <option value="" disabled>select currency</option>
                        <option value="LKR">LKR</option>
                        <option value="$">US $</option>
                        <option value="&">Euro</option>
                         
                    </select>

                        <input
                        type="number"
                        name="transferAmount"
                        id="transferAmount"
                        value={transferAmount}
                        onChange={(e) => setTransferAmount(e.target.value)}
                        placeholder="Transfer Amount"
                        required
                        />

                    <label htmlFor="description">Description Details</label>
                    <textarea
                        name="description"
                        id="description"
                        cols="30"
                        rows="10"
                        value={description}
                        onChange={(e) => setDescription(e.target.value)}
                        placeholder="Enter Description"
                        required
                    ></textarea>

                    <button
                        type="reset"
                        onClick={handleReset}
                    >
                        Reset
                    </button>
                    
                    <button
                        type="submit"
                        onClick={handleSubmit}
                    >
                        Submit
                    </button>
                    <br/>
                </form>
            </fieldset>
        </div>
    );
}

export default MoneyTransfer1;
