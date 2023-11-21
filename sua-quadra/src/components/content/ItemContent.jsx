

function ItemContent() {
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
          Compartilhar
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
    </div>
  );
}

export default ItemContent;
