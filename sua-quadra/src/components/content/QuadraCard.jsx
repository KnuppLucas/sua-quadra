
import { Link } from 'react-router-dom';

const QuadraCard = ({ id, imagemSrc, endereco, categoria, avaliacao }) => {
  return (
    <Link to={`/item/${id}`} className="max-w-xs mx-2 my-4 bg-white rounded-lg overflow-hidden shadow-md">
      <img className="w-full h-40 object-cover" src={imagemSrc} alt="Quadra" />
      <div className="p-4">
        <h1 className="text-xl font-semibold mb-2">{endereco}</h1>
        <p className="text-sm text-gray-600 mb-2">{categoria}</p>
        <p className="text-sm text-gray-600 mb-2">Avaliação: {avaliacao}</p>
      </div>
    </Link>
  );
};

export default QuadraCard;