import api from './api';

export const login = (user_name, password) => {
  return api.post('/login', { user_name, password });
};

export const logout = () => {
    localStorage.removeItem('user');
    localStorage.removeItem('userId');
    // localStorage.removeItem('token');
  };