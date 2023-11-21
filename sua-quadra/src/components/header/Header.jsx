

function Header() {
  return (
    <header className="bg-gray-800 text-white p-6">
        <div className="container mx-auto flex justify-between items-center h-12">
            <div>Logo</div>
            <div className="bg bg-slate-300 border-gray-900 w-fit h-fit rounded-3xl gap-1">
                <input type="text" placeholder="Data" className="rounded-md m-4 p-1" />
                <input type="text" placeholder="Horário" className="rounded-md m-4 p-1" />
                <input type="text" placeholder="Localização" className="rounded-md m-4 p-1" />
            </div>
            <nav className="flex items-center space-x-4">
                <a href="#" className="hover:text-gray-300">Login</a>
            </nav>
        </div>
        
    </header>
  )
}

export default Header