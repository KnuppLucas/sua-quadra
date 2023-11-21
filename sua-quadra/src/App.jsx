import Header from "./components/Header/Header"
import Content from "./components/content/Content"
import ItemContent from "./components/content/ItemContent"
import Navbar from "./components/navbar/Navbar"
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'


function App() {

  return (
    <Router>
      <Header />
      <Navbar />
      <Routes>
        <Route path="/" exact element={<Content />} />
        <Route path="/item/:id" element={<ItemContent />} />
      </Routes>
    </Router>
  )
}

export default App
