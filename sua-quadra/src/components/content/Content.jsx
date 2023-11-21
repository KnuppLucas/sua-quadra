import QuadraCard from './QuadraCard';

function Content() {
    const quadras = [
        { id: 1, imagemSrc: 'url_da_imagem1', endereco: 'Endereço 1', categoria: 'Categoria 1', avaliacao: 4.5 },
        { id: 2, imagemSrc: 'url_da_imagem2', endereco: 'Endereço 2', categoria: 'Categoria 2', avaliacao: 3.8 },
        { id: 3, imagemSrc: 'url_da_imagem1', endereco: 'Endereço 1', categoria: 'Categoria 1', avaliacao: 4.5 },
        { id: 4, imagemSrc: 'url_da_imagem2', endereco: 'Endereço 2', categoria: 'Categoria 2', avaliacao: 3.8 },
        { id: 5, imagemSrc: 'url_da_imagem1', endereco: 'Endereço 1', categoria: 'Categoria 1', avaliacao: 4.5 },
        { id: 6, imagemSrc: 'url_da_imagem2', endereco: 'Endereço 2', categoria: 'Categoria 2', avaliacao: 3.8 },
        { id: 7, imagemSrc: 'url_da_imagem1', endereco: 'Endereço 1', categoria: 'Categoria 1', avaliacao: 4.5 },
        { id: 8, imagemSrc: 'url_da_imagem2', endereco: 'Endereço 2', categoria: 'Categoria 2', avaliacao: 3.8 },
        { id: 9, imagemSrc: 'url_da_imagem1', endereco: 'Endereço 1', categoria: 'Categoria 1', avaliacao: 4.5 },
        { id: 10, imagemSrc: 'url_da_imagem2', endereco: 'Endereço 2', categoria: 'Categoria 2', avaliacao: 3.8 },
        { id: 11, imagemSrc: 'url_da_imagem1', endereco: 'Endereço 1', categoria: 'Categoria 1', avaliacao: 4.5 },
        { id: 12, imagemSrc: 'url_da_imagem2', endereco: 'Endereço 2', categoria: 'Categoria 2', avaliacao: 3.8 },
        { id: 13, imagemSrc: 'url_da_imagem1', endereco: 'Endereço 1', categoria: 'Categoria 1', avaliacao: 4.5 },
        { id: 14, imagemSrc: 'url_da_imagem2', endereco: 'Endereço 2', categoria: 'Categoria 2', avaliacao: 3.8 },
        // Adicione mais quadras conforme necessário
      ];

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
  )
}

export default Content