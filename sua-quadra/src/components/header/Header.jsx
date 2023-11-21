

function Header() {
  return (
    <header className="bg-gray-800 text-white p-6">
        <div className="container mx-auto flex justify-between items-center h-12">
        <a href="/"><img src="logo.png" alt="Logo" className="h-6" /></a>
            <div className="bg bg-slate-300 border-gray-900 w-fit h-fit rounded-3xl gap-1">
                <input type="text" placeholder="Data" className="rounded-md m-4 p-1" />
                <input type="text" placeholder="Horário" className="rounded-md m-4 p-1" />
                <input type="text" placeholder="Localização" className="rounded-md m-4 p-1" />
            </div>
            <nav className="flex items-center space-x-4">
                <a href="login" className="hover:text-gray-300">Login</a><a href="registro" className="hover:text-gray-300">Registrar</a>
            </nav>
        </div>
        
    </header>
  )
}

export default Header