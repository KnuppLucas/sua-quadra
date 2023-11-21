

function Navbar() {
  return (
    <nav className="bg-gray-400 text-white p-4">
        <div className="container mx-auto flex justify-around items-center h-16">
            <a href="society" className="hover:text-gray-300">Society</a>
            <a href="futsal" className="hover:text-gray-300">Futsal</a>
            <a href="campo" className="hover:text-gray-300">Campo</a>
        </div>
    </nav>
  )
}

export default Navbar