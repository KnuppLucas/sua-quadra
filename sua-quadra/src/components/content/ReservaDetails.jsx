import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';

const ReservaDetails = () => {
  const [reservaData, setReservaData] = useState(null);
  const navigateTo = useNavigate();

  useEffect(() => {
    const storedReservaData = localStorage.getItem('reservaData');
    if (storedReservaData) {
      setReservaData(JSON.parse(storedReservaData));
    }
  }, []);

  const handleFinalizarReserva = async () => {
    try {
      const response = await fetch('URL_DO_BACKEND/reservas', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(reservaData),
      });

      if (response.ok) {
        console.log('Reserva finalizada com sucesso!');
        localStorage.removeItem('reservaData');
        setReservaData(null);
        navigateTo('/');
      } else {
        console.error('Erro ao finalizar a reserva.');
        navigateTo('/');
      }
    } catch (error) {
      console.error('Erro ao conectar com o backend:', error);
    }
  };

  return (
    <div className="container mx-auto mt-8">
      <h2 className="text-2xl font-semibold mb-4">Detalhes da Reserva</h2>
      {reservaData ? (
        <>
          <p>ID da Quadra: {reservaData.idQuadra}</p>
          <p>Data da Reserva: {reservaData.data}</p>
          <p>Horário da Reserva: {reservaData.horario}</p>
          {/* Adicione mais detalhes conforme necessário */}
          <button onClick={handleFinalizarReserva} className="bg-blue-500 text-white px-4 py-2 mt-4">
            Finalizar Reserva
          </button>
        </>
      ) : (
        <p>Nenhuma reserva encontrada.</p>
      )}
    </div>
  );
};

export default ReservaDetails;