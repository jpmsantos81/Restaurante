carregar();

const eventos = new EventSource("../api/mudarPreco.php");
eventos.onmessage = (obj => {
    if (obj === null) 
        return;
    const prato = JSON.parse(obj.data);
    atualizar(prato);
});

async function carregar() {
    const resposta = await fetch("../api/endpoints/pratos.php");
    const pratos = await resposta.json();
    console.log(pratos);
    const pratosDiv = document.getElementById("pratos");

    pratos.forEach(prato => {
        const pratoCard = document.createElement("div");
        pratoCard.classList.add("prato");
        pratoCard.id = prato.id;

        pratoCard.innerHTML = `
                <div class="fotoPrato">
                    <img src="${prato.imagem}" alt="${prato.nome}">
                </div>

                <h2>${prato.nome}</h2>
                <hr>
                <p class="infoPrato">Preço: R$ <span class="preco">${prato.preco}</span>
                <br>
                Vendidos: <span class="vendidos">${prato.vendidos} (R$${Number(prato.dinheiroGanho).toFixed(2)})</span></p>
        `;
        pratosDiv.appendChild(pratoCard);
    });

    
}

function atualizar(prato) {
    console.log("PRATO RECEBIDO:", prato);
    console.log("ID DO PRATO:", prato.id);
    var card = document.getElementById(`${prato.id}`);

    card.querySelector(".preco").innerText = prato.preco;
    card.querySelector(".vendidos").innerText = `${prato.vendidos} (R$${Number(prato.dinheiroGanho).toFixed(2)})`;
}