# Frequência dos Temas nos Exames

> Baseado em 5 exames: SR 2025, SR 2024, SR 2023 Normal, SR 2023 Recurso, RI 2023
> *(Nota: exame de 2022 presente nas resoluções mas sem enunciado completo)*

---

## Ranking de frequência

| # | Tema | Frequência | Peso médio | Observações |
|---|---|---|---|---|
| 1 | **Denavit-Hartenberg** | 5/5 (100%) | 10–15% | SEMPRE Q1. Base de tudo o resto. |
| 2 | **Cinemática Direta** | 5/5 (100%) | 15–20% | SEMPRE Q2. |
| 3 | **Cinemática Inversa** | 5/5 (100%) | 20% | SEMPRE Q3. Maior peso individual. |
| 4 | **ᵂT_objeto** | 5/5 (100%) | 10% | SEMPRE Q4. |
| 5 | **ᵂT_base + ᴮT_obj** | 5/5 (100%) | 15% | SEMPRE Q5. |
| 6 | **Jacobiana / Velocidades** | 3/5 (60%) | 10% | Q6 na maioria dos exames. |
| 7 | **Conceitos / Teoria** | 5/5 (100%) | 10–20% | Q7 (e Q8 em 2025). Tema varia cada ano. |
| 8 | **Forças e Torques** | 1/5 (20%) | 10% | Q6 apenas em SR 2024. |

---

## Tipos de robot mais frequentes

| Configuração | Exames | Notas |
|---|---|---|
| θ₁, θ₂, d₃ (2 rot + 1 pris vertical) | SR 2025, SR 2024 | Cilíndrico modificado |
| θ₁, d₂, θ₃ (2 rot + 1 pris horizontal) | SR/RI 2023 Normal | Articulado com prisma no meio |
| θ₁, d₂, d₃ (1 rot + 2 pris) | SR 2023 Recurso | Menos frequente |

---

## Distribuição típica de pontos num exame

```
Q1 — DH:               10%
Q2 — Cin. Direta:      15%
Q3 — Cin. Inversa:     20%  ← mais peso, estudar bem!
Q4 — ᵂT_objeto:       10%
Q5 — ᵂT_base:         15%
Q6 — Velocidades:      10%
Q7 — Teoria:           10%
(Q8 — SR 2025 apenas): 10%
```

---

## Temas teóricos por exame (Q7 e Q8)

| Exame | Tema teórico |
|---|---|
| SR 2025 Q7 | Áreas económicas da robótica e potencial de crescimento |
| SR 2025 Q8 | Teleoperação robótica + 2 exemplos |
| SR 2024 Q7 | Formas de programação do robô industrial |
| SR/RI 2023 Normal Q7 | Diferenças robô industrial vs. Cobot |
| SR 2023 Recurso Q7 | Condições de segurança do robô industrial |

**Padrão:** cada ano aparece um tema teórico diferente. Estudar todos para cobrir o imprevisível.

---

## O que estudar com mais prioridade

1. ⭐⭐⭐ **Cinemática Inversa** — 20% + mais difícil + sempre presente
2. ⭐⭐⭐ **DH + Cinemática Direta** — base de tudo, Q1+Q2 = 25–35%
3. ⭐⭐ **Matrizes de Transformação** (Q4+Q5) — 25%, procedimento claro
4. ⭐⭐ **Jacobiana** — 10%, cálculo direto se DH estiver dominada
5. ⭐ **Teoria** — 10–20%, memorizar as fichas 07–10

---

## Tipos de objeto nos exames

| Exame | Tipo de objeto | Dimensões | Contexto |
|---|---|---|---|
| SR 2025 | Paralelepípedo (mesa) | 10×6×6cm | Soldadura de arestas superiores |
| SR 2024 | Caixa em passadeira | Não dado | Câmara visão artificial |
| SR/RI 2023 Normal | Paralelepípedo | 6×10×6cm | Apanhar objeto (pick & place) |
| SR 2023 Recurso | Objeto com cilindro topo | ≈6×10×6cm | Ventosa no cilindro |
