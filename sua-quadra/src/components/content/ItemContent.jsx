import { useParams, useNavigate } from "react-router-dom";
import { useState } from "react";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";

function ItemContent() {
  const { id } = useParams();
  const [selectedDate, setSelectedDate] = useState(null);
  const [selectedTime, setSelectedTime] = useState("");
  const navigateTo = useNavigate();

  const handleDateChange = (date) => {
    setSelectedDate(date);
  };

  const handleTimeChange = (e) => {
    setSelectedTime(e.target.value);
  };

  const handleReserva = () => {
    if (selectedDate && selectedTime) {
      const reservaData = {
        idQuadra: id,
        data: selectedDate.toLocaleDateString(),
        horario: selectedTime,
      };
      localStorage.setItem("reservaData", JSON.stringify(reservaData));

      navigateTo(`/reserva-details`);
    } else {
      alert("Selecione uma data e horário antes de salvar a reserva.");
    }
  };

  const horariosDisponiveis = ["09:00", "12:00", "15:00", "18:00", "21:00"];

  return (
    <div className="container mx-auto mt-8">
      {/* Seção de Imagem */}
      <div className="mb-4">
        <img
          className="w-full h-64 object-cover rounded"
          src="url_da_imagem_principal"
          alt="Imagem Principal"
        />
      </div>

      {/* Botões Compartilhar e Salvar */}
      <div className="flex justify-between mb-4">
        <button className="bg-blue-500 text-white px-4 py-2 rounded">
          Compartilhar {id}
        </button>
        <button className="bg-green-500 text-white px-4 py-2 rounded">
          Salvar
        </button>
      </div>

      {/* Detalhes do Espaço */}
      <div>
        <h1 className="text-3xl font-semibold mb-2">
          Casa de Campo - S. Lourenço da Serra 20 min. Embu
        </h1>
        <p className="text-gray-600 mb-4">
          Mais de 16 hóspedes · 3 quartos · 10 camas · 6 banheiros e meio
        </p>
        {/* Outras informações, como a pontuação e avaliações */}
        {/* ... */}
      </div>

      {/* Descrição do Espaço */}
      <div className="mt-8">
        <h2 className="text-2xl font-semibold mb-4">Ótima localização</h2>
        <p className="text-gray-600 mb-4">
          O Sítio Canto da Mata está localizado a 50 Min. de São Paulo, com
          fácil acesso pela Regis Bitencourt...
        </p>
        {/* Mais detalhes sobre o espaço */}
        {/* ... */}
      </div>

      {/* Acesso do Hóspede */}
      <div className="mt-8">
        <h2 className="text-2xl font-semibold mb-4">Acesso do hóspede</h2>
        <p className="text-gray-600 mb-4">
          Toda a área cercada da chácara +/- 50.000 mil m2, estará disponível
          exclusivamente aos hóspedes...
        </p>
        {/* Mais detalhes sobre o acesso do hóspede */}
        {/* ... */}
      </div>

      {/* Onde Você Vai Dormir */}
      <div className="mt-8">
        <h2 className="text-2xl font-semibold mb-4">Onde você vai dormir</h2>
        {/* Detalhes sobre os quartos e camas */}
        {/* ... */}
      </div>

      {/* Preços e Reserva */}
      <div className="mt-8">
        <h2 className="text-2xl font-semibold mb-4">Preços e Reserva</h2>
        {/* Detalhes sobre preços, datas disponíveis, etc. */}
        {/* ... */}
      </div>
      {/* Seção de Reserva */}
      <div className="mt-8">
        <h2 className="text-2xl font-semibold mb-4">Reservar</h2>
        <div className="mb-4">
          <label htmlFor="data" className="block text-gray-700 font-bold mb-2">
            Selecione a data:
          </label>
          <DatePicker
            id="data"
            selected={selectedDate}
            onChange={handleDateChange}
            dateFormat="dd/MM/yyyy"
            placeholderText="Selecione a data"
          />
        </div>
        <div className="mb-4">
          <label
            htmlFor="horario"
            className="block text-gray-700 font-bold mb-2"
          >
            Selecione o horário:
          </label>
          <select
            id="horario"
            className="w-full border p-2"
            value={selectedTime}
            onChange={handleTimeChange}
          >
            <option value="" disabled>
              Selecione o horário
            </option>
            {horariosDisponiveis.map((horario) => (
              <option key={horario} value={horario}>
                {horario}
              </option>
            ))}
          </select>
        </div>
        <button
          className="bg-green-500 text-white px-4 py-2 rounded"
          onClick={handleReserva}
        >
          Reservar
        </button>
      </div>
    </div>
  );
}

export default ItemContent;
