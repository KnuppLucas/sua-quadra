import { useState, useEffect } from 'react';
import QuadraCard from './QuadraCard';

function FutsalList() {
  const [quadras, setQuadras] = useState([]);

  useEffect(() => {
    // Substitua 'http://localhost:8080/sua-aplicacao/api/quadras' pelo seu endpoint real
    fetch('http://localhost:8080/sua-aplicacao/api/quadras-society')
      .then((response) => response.json())
      .then((data) => setQuadras(data))
      .catch((error) => console.error('Erro ao obter quadras:', error));
  }, []);

  return (
    <div className="container mx-auto">
      <div className="flex flex-wrap">
        {quadras.map((quadra) => (
          <QuadraCard
            key={quadra.id}
            id={quadra.id}
            imagemSrc={quadra.imagemSrc}
            endereco={quadra.endereco}
            categoria={quadra.categoria}
            avaliacao={quadra.avaliacao}
          />
        ))}
      </div>
    </div>
  );
}

export default FutsalList;