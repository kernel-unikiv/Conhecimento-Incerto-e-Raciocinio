// HAMBURGER
const hamburger = document.getElementById("hamburger");
const menu = document.querySelector("header nav ul.menu");

hamburger.addEventListener("click", () => {
  menu.classList.toggle("show");
});

// MODAL
const modal = document.getElementById("modal");
const simularBtn = document.getElementById("simularBtn");
const simularHero = document.getElementById("simularHero");
const closeModal = document.getElementById("closeModal");

simularBtn.addEventListener("click", () => (modal.style.display = "block"));
simularHero.addEventListener("click", () => (modal.style.display = "block"));
closeModal.addEventListener("click", () => (modal.style.display = "none"));
window.addEventListener("click", (e) => {
  if (e.target === modal) modal.style.display = "none";
});

// INPUTS DINÂMICOS
const jogoModal = document.getElementById("jogoModal");
const inputsModal = document.getElementById("inputsModal");
const calcularModal = document.getElementById("calcularModal");
const resultadoModal = document.getElementById("resultadoModal");

jogoModal.addEventListener("change", () => {
  const jogo = jogoModal.value;
  inputsModal.innerHTML = "";
  resultadoModal.innerHTML = "";

  if (jogo === "roleta") {
    inputsModal.innerHTML = `
            <label for="cor">Escolha a cor:</label>
            <select id="cor">
                <option value="vermelho">Vermelho</option>
                <option value="preto">Preto</option>
                <option value="verde">Verde</option>
            </select>
            <label for="aposta">Valor da aposta:</label>
            <input type="number" id="aposta" min="1" placeholder="Digite o valor">
        `;
  } else if (jogo === "cara_ou_coroa") {
    inputsModal.innerHTML = `
            <label for="lado">Escolha o lado:</label>
            <select id="lado">
                <option value="cara">Cara</option>
                <option value="coroa">Coroa</option>
            </select>
            <label for="aposta">Valor da aposta:</label>
            <input type="number" id="aposta" min="1" placeholder="Digite o valor">
        `;
  } else if (jogo === "futebol") {
    inputsModal.innerHTML = `
            <label for="resultado">Escolha o resultado:</label>
            <select id="resultado">
                <option value="vitoria">Vitória</option>
                <option value="empate">Empate</option>
                <option value="derrota">Derrota</option>
            </select>
            <label for="aposta">Valor da aposta:</label>
            <input type="number" id="aposta" min="1" placeholder="Digite o valor">
        `;
  }
});

// CALCULAR PROBABILIDADE
calcularModal.addEventListener("click", () => {
  const jogo = jogoModal.value;
  if (!jogo) return alert("Selecione um jogo");
  const aposta = Number(document.getElementById("aposta").value);
  if (!aposta || aposta <= 0) return alert("Digite um valor válido");

  let prob = 0,
    ve = 0,
    sugestao = "";

  if (jogo === "roleta") {
    const cor = document.getElementById("cor").value;
    if (cor === "vermelho" || cor === "preto") prob = 18 / 37;
    else prob = 1 / 37;
    ve = prob * aposta * 2 - (1 - prob) * aposta;
    sugestao = ve > 0 ? "Apostar" : "Não Apostar";
  } else if (jogo === "cara_ou_coroa") {
    prob = 0.5;
    ve = prob * aposta * 2 - (1 - prob) * aposta;
    sugestao = prob > 0.5 ? "Apostar" : "Não Apostar";
  } else if (jogo === "futebol") {
    const res = document.getElementById("resultado").value;
    if (res === "vitoria") prob = 0.65;
    else if (res === "empate") prob = 0.2;
    else prob = 0.15;
    ve = prob * aposta * 2 - (1 - prob) * aposta;
    sugestao = prob > 0.6 ? "Apostar" : "Não Apostar";
  }

  resultadoModal.innerHTML = `
        <p>Probabilidade de ganhar: ${(prob * 100).toFixed(2)}%</p>
        <p>Valor esperado: ${ve.toFixed(2)}</p>
        <p>Sugestão: <b>${sugestao}</b></p>
    `;
});
