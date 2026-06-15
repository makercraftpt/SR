# Ficha 01 — Convenção de Denavit-Hartenberg (DH)

> Aparece em **TODOS** os exames como Q1 (10–15%)

---

## O que é

DH é uma convenção para descrever a geometria de um manipulador robótico com um conjunto mínimo de 4 parâmetros por junta.

---

## Os 4 parâmetros DH

| Parâmetro | Símbolo | Tipo | Descrição |
|---|---|---|---|
| Ângulo da junta | θᵢ | **variável** se junta rotacional | Rotação em torno de Zᵢ₋₁ |
| Offset da junta | dᵢ | **variável** se junta prismática | Translação ao longo de Zᵢ₋₁ |
| Comprimento do elo | aᵢ | constante | Distância entre Zᵢ₋₁ e Zᵢ ao longo de Xᵢ |
| Torção do elo | αᵢ | constante | Ângulo entre Zᵢ₋₁ e Zᵢ em torno de Xᵢ |

**Regra rápida:**
- Junta **rotacional** → θᵢ é variável, dᵢ é constante
- Junta **prismática** → dᵢ é variável, θᵢ = 0 (ou constante)

---

## As 3 regras para colocar eixos (cábula)

> **Regra 1 — Z segue a junta**
> Zᵢ aponta ao longo do eixo da junta i (rotação ou translação)

> **Regra 2 — X é a normal comum**
> Xᵢ é perpendicular a Zᵢ₋₁ **e** a Zᵢ (nunca paralelo a nenhum dos dois!)
> Xᵢ = direcção de Zᵢ₋₁ × Zᵢ (produto externo)

> **Regra 3 — Y pela mão direita**
> Yᵢ completa o sistema: X × Y = Z

**α = ângulo de Zᵢ₋₁ para Zᵢ medido em torno de Xᵢ**
→ Se Z rodou 90° → α = ±90°; se ficou igual → α = 0°

---

## Exemplo resolvido — SR 2024/25 (θ₁, θ₂, d₃)

```
Frame 0 (base):    Z₀ = ↑cima     X₀ = →frente    Y₀ = ecrã
Frame 1 (junta θ₂): Z₁ = ecrã     X₁ = →frente    Y₁ = ↓baixo
Frame 2 (junta d₃): Z₂ = ↑cima    X₂ = →frente    Y₂ = ecrã
```

Porquê X₁ = frente?
- Z₀ = cima, Z₁ = ecrã → normal comum = Z₀ × Z₁ = **frente**

Porquê α₁ = −90°?
- Rodar Z₀ (cima) → Z₁ (ecrã) em torno de X₁ (frente) = −90°

Porquê α₂ = +90°?
- Rodar Z₁ (ecrã) → Z₂ (cima) em torno de X₂ (frente) = +90°

---

## Exemplos dos exames

### Exame SR 2024/25 — Robô com θ1, θ2, d3

| i | θ | d | a | α |
|---|---|---|---|---|
| 1 | θ₁ | h₁ | 0 | **−90°** |
| 2 | θ₂ | d₂ | 0 | **+90°** |
| 3 | 0 | d₃ | 0 | 0° |

(ver exemplo resolvido acima para justificação dos α)

### Exame SR 2023/24 — Robô com θ1, θ2, d3

| i | θ | d | a | α |
|---|---|---|---|---|
| 1 | θ₁ | L₁ | 0 | 90° |
| 2 | θ₂ | 0 | 0 | −90° |
| 3 | 0 | d₃ | 0 | 0° |

(L₁ = 40cm; d₃ ∈ [20cm, 100cm])

### Exame SR/RI 2022/23 — Robô com θ1, d2, θ3

| i | θ | d | a | α |
|---|---|---|---|---|
| 1 | θ₁ | l₁ | 0 | 90° |
| 2 | 0 | d₂ | −l₂ | −90° |
| 3 | θ₃ | 0 | l₂ | 90° |

(l₀ = l₁ = l₂ = l₃ = 40cm; d₂ ∈ [0cm, 100cm])

### Exame SR Recurso 2022/23 (17-07-2023) — Robô com θ1, d2, d3

| i | θ | d | a | α |
|---|---|---|---|---|
| 1 | θ₁ | l₁ | 0 | −90° |
| 2 | 90° | d₂ | −l₂ | −90° |
| 3 | 0 | d₃ | 0 | 0° |

---

## Pontos de atenção

- α = 90° → Zᵢ₋₁ ⊥ Zᵢ (roda 90° em torno de X)
- α = −90° → igual mas sentido contrário
- α = 0° → Zᵢ₋₁ ∥ Zᵢ (frames no mesmo plano)
- α = 180° → Zᵢ aponta no sentido contrário de Zᵢ₋₁

---

## Checklist de verificação

- [ ] Cada frame tem Z alinhado com o eixo da junta?
- [ ] As normais comuns estão corretas?
- [ ] Os sinais de α estão corretos (regra da mão direita)?
- [ ] O parâmetro variável está identificado?
