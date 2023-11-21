import { useEffect, useState } from 'react';

const ReservaDetails = () => {
  const [reservaData, setReservaData] = useState(null);

  useEffect(() => {
    const storedReservaData = localStorage.getItem('reservaData');
    if (storedReservaData) {
      setReservaData(JSON.parse(storedReservaData));
    }
  }, []);

  return (
    <div className="container mx-auto mt-8">
      <h2 className="text-2xl font-semibold mb-4">Detalhes da Reserva</h2>
      {reservaData ? (
        <>
          <p>ID da Quadra: {reservaData.idQuadra}</p>
          <p>Data da Reserva: {reservaData.data}</p>
          <p>Horário da Reserva: {reservaData.horario}</p>
          {/* Adicione mais detalhes conforme necessário */}
        </>
      ) : (
        <p>Nenhuma reserva encontrada.</p>
      )}
    </div>
  );
};

export default ReservaDetails;