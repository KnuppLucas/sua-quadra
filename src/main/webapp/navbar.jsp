
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <!-- Substituir texto por imagem do logo -->
                <a class="navbar-brand" href="content.jsp"><img src="./images/logo.jpeg" style="max-height: 60px; alt="Logo do Site"></a>
                
                <!-- Restante do código permanece inalterado -->
                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					    <li class="nav-item"><a class="nav-link active" aria-current="page" href="content.jsp">Home</a></li>
					    <li class="nav-item"><a class="nav-link" href="quadra.jsp?type=campo">Campo</a></li>
					    <li class="nav-item dropdown">
					        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="content.jsp" role="button" data-bs-toggle="dropdown" aria-expanded="false">Quadras</a>
					        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					            <li><hr class="dropdown-divider" /></li>
					            <li><a class="dropdown-item" href="quadra.jsp?type=tenis">Tênis</a></li>
					            <li><a class="dropdown-item" href="quadra.jsp?type=society">Society</a></li>
					            <li><a class="dropdown-item" href="quadra.jsp?type=volei">Vôlei</a></li>
					            <li><a class="dropdown-item" href="quadra.jsp?type=basquete">Basquete</a></li>
					        </ul>
					    </li>
					</ul>
        
                    <!-- Adicionar botão de login -->
                    <a href="login.jsp"><button class="btn btn-outline-dark me-2" type="button">Login</button></a>
                    
                    <!-- Adicionar botão de registro -->
                    <a href="registro.jsp"><button class="btn btn-outline-dark" type="button">Registro</button></a>
        
                </div>
            </div>
        </nav>