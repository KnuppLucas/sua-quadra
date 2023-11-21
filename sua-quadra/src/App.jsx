import React, { createContext, useContext, useState } from 'react';
import { BrowserRouter as Router, Route, Routes, Navigate } from 'react-router-dom';
import Header from './components/Header/Header';
import Content from './components/content/Content';
import ItemContent from './components/content/ItemContent';
import ReservaDetails from './components/content/ReservaDetails';
import Navbar from './components/navbar/Navbar';
import LoginPage from './components/user/LoginPage';
import RegisterPage from './components/user/RegisterPage';
import SocietyList from './components/content/SocietyList';
import FutsalList from './components/content/FutsalList';
import CampoList from './components/content/CampoList';

// Contexto de Autenticação
const AuthContext = createContext();

function App() {
  const [isAuthenticated, setIsAuthenticated] = useState(false);

  const login = () => {
    setIsAuthenticated(true);
  };

  return (
    <Router>
      <AuthContext.Provider value={{ isAuthenticated, login }}>
        <Header />
        <Navbar />
        <Routes>
          <Route
            path="/login"
            element={<LoginPage login={login} />}
          />
          <Route path="/registro" element={<RegisterPage />} />
          <Route
            path="/"
            element={
              isAuthenticated ? <Content /> : <Navigate to="/login" />
            }
          />
          <Route path="/item/:id" element={<ItemContent />} />
          <Route path="/reserva-details" element={<ReservaDetails />} />
          <Route path="/society" element={<SocietyList />} />
          <Route path="/futsal" element={<FutsalList />} />
          <Route path="/campo" element={<CampoList />} />
        </Routes>
      </AuthContext.Provider>
    </Router>
  );
}

export default App;