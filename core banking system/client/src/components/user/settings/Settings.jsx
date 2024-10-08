import React from 'react';
import { 
  Typography, 
  Card, 
  CardContent, 
  List, 
  ListItem, 
  ListItemText, 
  ListItemIcon,
  Switch
} from '@mui/material';
import { 
  Notifications, 
  Security, 
  Language, 
  Brightness4
} from '@mui/icons-material';

const Settings = () => {
  const [notifications, setNotifications] = React.useState(true);
  const [darkMode, setDarkMode] = React.useState(false);

  const handleNotificationChange = () => {
    setNotifications(!notifications);
  };

  const handleDarkModeChange = () => {
    setDarkMode(!darkMode);
  };

  return (
    <div className="settings-container">
      <Typography variant="h4" gutterBottom>
        Settings
      </Typography>
      <Card>
        <CardContent>
          <List>
            <ListItem>
              <ListItemIcon>
                <Notifications />
              </ListItemIcon>
              <ListItemText primary="Notifications" secondary="Enable or disable notifications" />
              <Switch
                edge="end"
                checked={notifications}
                onChange={handleNotificationChange}
              />
            </ListItem>
            <ListItem>
              <ListItemIcon>
                <Security />
              </ListItemIcon>
              <ListItemText primary="Security" secondary="Manage your account security settings" />
            </ListItem>
            <ListItem>
              <ListItemIcon>
                <Language />
              </ListItemIcon>
              <ListItemText primary="Language" secondary="Choose your preferred language" />
            </ListItem>
            <ListItem>
              <ListItemIcon>
                <Brightness4 />
              </ListItemIcon>
              <ListItemText primary="Dark Mode" secondary="Toggle dark mode on or off" />
              <Switch
                edge="end"
                checked={darkMode}
                onChange={handleDarkModeChange}
              />
            </ListItem>
          </List>
        </CardContent>
      </Card>
    </div>
  );
};

export default Settings;