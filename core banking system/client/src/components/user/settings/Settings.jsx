
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { TextField, Button, Switch, FormControlLabel, Typography, Grid, Dialog, DialogActions, DialogContent, DialogTitle } from '@mui/material';
import CancelIcon from '@mui/icons-material/Cancel';
import SaveIcon from '@mui/icons-material/Save';
import CheckCircleIcon from '@mui/icons-material/CheckCircle';
import './Settings.css';

const userId = 1; // TODO: make this dynamic

const Settings = () => {
  const [open, setOpen] = useState(false);
  const [currentPassword, setCurrentPassword] = useState('');
  const [newPassword, setNewPassword] = useState('');
  const [personalInfo, setPersonalInfo] = useState({
    username: '',
    email: '',
    address: '',
    mobileNumber: '',
    landlineNumber: ''
  });
  const [initialInfo, setInitialInfo] = useState({ ...personalInfo }); // Store the initial user information

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const handleCancel = () => {
    setPersonalInfo({ ...initialInfo }); // Reset the form to the initial user information
  };

  const handleSave = async () => {
    // TODO: Add validation logic here
    try {
      const response = await axios.put(`http://localhost:8800/user_info/${userId}`, personalInfo);
      console.log('Personal Info updated successfully:', response.data);
    } catch (error) {
      console.error('Error updating personal info:', error.response ? error.response.data : error.message);
    } finally {
      window.location.reload(); // Reload the page to reset the form
    }
  };

  const handlePasswordChange = () => {
    console.log('Current Password:', currentPassword);
    console.log('New Password:', newPassword);
    // Add logic here for handling the password change (e.g., API call)
    setOpen(false); // Close the dialog after the password is changed
  };

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get(`http://localhost:8800/user_info/${userId}`); 
        const data = response.data[0]; // Assuming the response is an array with a single object
        setPersonalInfo({
          username: data.username,
          email: data.email,
          address: data.address,
          mobileNumber: data.mobile_number,
          landlineNumber: data.landline_number
        });
        setInitialInfo({
          username: data.username,
          email: data.email,
          address: data.address,
          mobileNumber: data.mobile_number,
          landlineNumber: data.landline_number
        });
      } catch (err) {
        console.error('Error fetching data:', err);
      }
    }
    fetchData();
  }, []);

  console.log('Personal Info:', personalInfo);

  return (
    <div className='settings-container'>
      <div className="form-container">
        <Typography variant="h6">Personal Information</Typography>
        <form noValidate>
          <TextField
            label="Username"
            id="username"
            name="username"
            value={personalInfo.username}
            fullWidth
            margin="normal"
            onChange={(e) => setPersonalInfo({ ...personalInfo, username: e.target.value })}
          />

          <TextField
            label="Email"
            id="email"
            name="email"
            type="email"
            value={personalInfo.email}
            fullWidth
            margin="normal"
            onChange={(e) => setPersonalInfo({ ...personalInfo, email: e.target.value })}
          />

          <Button
            variant="contained"
            sx={{ backgroundColor: '#695CFE', ':hover': { backgroundColor: '#5648CC' } }}
            style={{ marginRight: '8px' }}
            onClick={handleClickOpen}
          >
            Change Password
          </Button>

          <TextField
            label="Address"
            id="address"
            name="address"
            value={personalInfo.address}
            fullWidth
            margin="normal"
            onChange={(e) => setPersonalInfo({ ...personalInfo, address: e.target.value })}
          />

          <div className="phone-numbers-container">
            <TextField
              label="Phone number (Mobile)"
              id="mobile-number"
              name="mobile-number"
              type="tel"
              value={personalInfo.mobileNumber}
              fullWidth
              margin="normal"
              style={{ marginRight: '8px' }}
              onChange={(e) => setPersonalInfo({ ...personalInfo, mobileNumber: e.target.value })}
            />

            <TextField
              label="Phone number (Home)"
              id="home-number"
              name="home-number"
              type="tel"
              value={personalInfo.landlineNumber}
              fullWidth
              margin="normal"
              onChange={(e) => setPersonalInfo({ ...personalInfo, landlineNumber: e.target.value })}
            />
          </div>

          <div className="button-container">
            <Button
              variant="contained"
              startIcon={<CancelIcon />}
              sx={{ backgroundColor: '#695CFE', ':hover': { backgroundColor: '#5648CC' } }}
              style={{ marginRight: '8px' }}
              onClick={handleCancel} // cancel the changes
            >
              Cancel
            </Button>

            <Button
              variant="contained"
              endIcon={<SaveIcon />}
              sx={{ backgroundColor: '#695CFE', ':hover': { backgroundColor: '#5648CC' } }}
              onClick={handleSave} // save (update) the user information
            >
              Save
            </Button>
          </div>
        </form>
      </div>

      <div className="form-container">
        <Grid container justifyContent="space-between" alignItems="center">
          <Typography variant="h6">Notifications</Typography>
          <FormControlLabel
            control={<Switch color="primary" defaultChecked />}
          />
        </Grid>
      </div>

      {/* Dialog for changing password */}
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>Change Password</DialogTitle>
        <DialogContent>
          <TextField
            label="Current Password"
            type="password"
            fullWidth
            margin="normal"
            value={currentPassword}
            onChange={(e) => setCurrentPassword(e.target.value)}
          />
          <TextField
            label="New Password"
            type="password"
            fullWidth
            margin="normal"
            value={newPassword}
            onChange={(e) => setNewPassword(e.target.value)}
          />
        </DialogContent>

        <DialogActions>
            <Button 
                onClick={handleClose} 
                startIcon={<CancelIcon />}
                sx={{ backgroundColor: '#695CFE', ':hover': { backgroundColor: '#5648CC' } }} 
                variant="contained"
            >
                Cancel
            </Button>
            <Button 
                onClick={handlePasswordChange} 
                endIcon={<CheckCircleIcon  />}
                sx={{ backgroundColor: '#695CFE', ':hover': { backgroundColor: '#5648CC' } }} 
                variant="contained"
            >
                Submit
            </Button>
        </DialogActions>
      </Dialog>

    </div>
  );
};

export default Settings;

