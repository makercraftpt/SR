# Ficha 03 — Cinemática Inversa

> Aparece em **TODOS** os exames como Q3 (20%) — a pergunta com mais peso!

---

## O que é

Dado a posição e orientação desejada do end-effector (Px, Py, Pz), determinar os valores das variáveis das juntas (θ₁, θ₂, d₃, etc.).

**É o inverso da cinemática direta.**

---

## Método algébrico (usado nos exames do ISEC)

### Passo a passo:

1. Escrever ⁰Tₙ da cinemática direta com as variáveis simbólicas
2. Igualar ao "alvo": `⁰Tₙ = T_desejada` (normalmente a orientação é dada como identidade ou rotação conhecida)
3. Extrair equações da coluna de translação: Px, Py, Pz em função de θ₁, θ₂, d₃
4. Resolver o sistema

**Truque:** Pré-multiplicar por `(⁰T₁)⁻¹` dos dois lados para isolar variáveis:
```
(⁰T₁)⁻¹ × ⁰T₃ = ¹T₂ × ²T₃
```

---

## Inversa da matriz de transformação

$${}^{i-1}_iT^{-1} = {}^i_{i-1}T = \begin{bmatrix} {}^{i-1}R^T & -{}^{i-1}R^T \cdot {}^{i-1}P \\ 0\ 0\ 0 & 1 \end{bmatrix}$$

Para ⁰T₁ com α=90°, d=h₁:
```
(⁰T₁)⁻¹ = [c₁   s₁   0   0 ]
            [0    0    1  -h₁]
            [s₁  -c₁   0   0 ]
            [0    0    0   1 ]
```

---

## Exemplo — Exame SR 2024/25 (θ1, θ2, d3)

Da cinemática direta: Px = −c₁s₂·d₃, Py = −s₁s₂·d₃, Pz = h₁ + c₂·d₃

**Encontrar θ₁:**

De Px e Py:
```
Px/Py = (−c₁s₂·d₃)/(−s₁s₂·d₃) = c₁/s₁ = cot θ₁
```
→ **θ₁ = atan2(Py, Px)** (ou atan2(−Py, −Px), dependendo da configuração)

**Encontrar d₃ e θ₂:**

Substituindo θ₁:
```
−Px·c₁ − Py·s₁ = s₂·d₃
Pz − h₁ = c₂·d₃
```
→ d₃ = √(Pz−h₁)² + (Px·c₁+Py·s₁)²

→ θ₂ = atan2(−(c₁Px + s₁Py), Pz − h₁)

---

## Exemplo — Exame SR/RI 2022/23 (θ1, d2, θ3)

Da kinemática direta: Px = c₁s₃·d₂ + ..., Py = s₁s₃·d₂ + ..., Pz = l₁+l₂

**θ₁:** atan2(−Px/Py) ou similar

**d₂:** d₂ = c₁·Py − s₁·Px (após substituir θ₁)

**θ₃:** d₃ = −c₁·Px − s₁·Py

---

## Exemplo — Exame SR 2023/24 (com abordagem pelo Jacobiano)

Usando pré-multiplicação por (⁰T₁)⁻¹:
```
(⁰T₁)⁻¹ × ⁰T₃ = ¹T₂ × ²T₃
```
Comparando elementos da matriz:
- Elemento [1,4]: c₁·Px + s₁·Py = ... → dá d₂ ou d₃
- Elemento [3,4]: −s₁·Px + c₁·Py = ... → dá outra variável
- Elemento [2,4]: Pz − h₁ = ... → dá θ₂

---

## Formulário dos ângulos

```
tan₁₂ = (tan₁ + tan₂) / (1 − tan₁·tan₂)
c₁₂ = c₁c₂ − s₁s₂
s₁₂ = c₁s₂ + s₁c₂
```

---

## Pontos de atenção

- Pode haver **múltiplas soluções** (elbow up / elbow down)
- Verificar os **limites das juntas** (e.g., d₃ ∈ [20cm, 100cm])
- Usar `atan2(y,x)` em vez de `atan(y/x)` para evitar ambiguidade de quadrante
- Quando θ₁ = 0°: simplifica os cálculos (c₁=1, s₁=0)

---

## Requer resolução ou validação manual

As resoluções dos colegas para este problema podem conter erros de sinal ou de escolha de solução. Verificar sempre substituindo de volta na cinemática direta.
