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
    const pratosDiv = document.getElementById("pratosDiv");
    
    pratos.forEach(prato => {
        let categoriaDiv = document.getElementById(prato.categoria)
        let pratosCategoria;
        if(categoriaDiv == null){
            categoriaDiv = document.createElement("section");
            categoriaDiv.id = prato.categoria;
            categoriaDiv.classList.add("categoria");
            categoriaDiv.innerHTML = `<h2 class="dentro-categoria">${prato.categoria}</h2>`;
            // categoriaDiv.style.backgroundColor = prato.corCategoria;
            
            pratosCategoria = document.createElement("div");
            pratosCategoria.classList.add("pratos");
            
            categoriaDiv.appendChild(pratosCategoria);
            pratosDiv.appendChild(categoriaDiv);
        }
        else{
            pratosCategoria = document.querySelector(`#${prato.categoria} > .pratos`); 
        }
        console.log(pratosCategoria);
        
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
        
        pratosCategoria.appendChild(pratoCard);
    });

    
}

function atualizar(prato) {
    console.log("PRATO RECEBIDO:", prato);
    console.log("ID DO PRATO:", prato.id);
    var card = document.getElementById(`${prato.id}`);

    card.querySelector(".preco").innerText = prato.preco;
    card.querySelector(".vendidos").innerText = `${prato.vendidos} (R$${Number(prato.dinheiroGanho).toFixed(2)})`;
}