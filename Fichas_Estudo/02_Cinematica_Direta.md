# Ficha 02 — Cinemática Direta

> Aparece em **TODOS** os exames como Q2 (15–20%)

---

## O que é

Dado os valores das variáveis das juntas (θᵢ, dᵢ), determinar a posição e orientação do end-effector no referencial base.

**Resultado:** matriz de transformação homogénea ⁰Tₙ (4×4)

---

## Fórmula DH — Matriz de transformação entre frames consecutivos

### Convenção Craig (usada no ISEC):

$${}^{i-1}_iT = \begin{bmatrix} \cos\theta_i & -\sin\theta_i\cos\alpha_i & \sin\theta_i\sin\alpha_i & a_i\cos\theta_i \\ \sin\theta_i & \cos\theta_i\cos\alpha_i & -\cos\theta_i\sin\alpha_i & a_i\sin\theta_i \\ 0 & \sin\alpha_i & \cos\alpha_i & d_i \\ 0 & 0 & 0 & 1 \end{bmatrix}$$

**Equivalente:** `T = Tz,θ · Td,z · Ta,x · Tα,x`

### Convenção alternativa (Hayati):

`T = Tx,a · Tα,x · Tz,d · Tθ,z`

$${}^{i-1}_iT = \begin{bmatrix} \cos\theta_i & -\sin\theta_i & 0 & a_i \\ \cos\alpha_i\sin\theta_i & \cos\alpha_i\cos\theta_i & -\sin\alpha_i & -\sin\alpha_i d_i \\ \sin\alpha_i\sin\theta_i & \sin\alpha_i\cos\theta_i & \cos\alpha_i & \cos\alpha_i d_i \\ 0 & 0 & 0 & 1 \end{bmatrix}$$

---

## Procedimento

1. Construir tabela DH
2. Calcular cada ⁰T₁, ¹T₂, ..., ⁿ⁻¹Tₙ
3. Multiplicar: **⁰Tₙ = ⁰T₁ × ¹T₂ × ... × ⁿ⁻¹Tₙ**
4. A coluna de translação da matriz final dá a posição do end-effector: (Px, Py, Pz)

---

## Exemplo — Exame SR 2024/25 (θ1, θ2, d3)

Com a tabela DH (h₁ = h₂ = 60cm):

**⁰T₁** (α=90°, d=h₁, a=0):
```
⁰T₁ = [cos θ₁   0   sin θ₁   0  ]
       [sin θ₁   0  -cos θ₁   0  ]
       [0         1   0        h₁ ]
       [0         0   0        1  ]
```

**¹T₂** (α=-90°, d=0, a=0):
```
¹T₂ = [cos θ₂   0  -sin θ₂   0  ]
       [sin θ₂   0   cos θ₂   0  ]
       [0        -1   0        0  ]
       [0         0   0        1  ]
```

**²T₃** (θ=0, α=0, d=d₃, a=0):
```
²T₃ = [1   0   0   0  ]
       [0   1   0   0  ]
       [0   0   1   d₃ ]
       [0   0   0   1  ]
```

**⁰T₃ = ⁰T₁ × ¹T₂ × ²T₃:**
```
⁰T₃ = [c₁c₂   s₁   -c₁s₂   -c₁s₂·d₃        ]
       [s₁c₂  -c₁   -s₁s₂   -s₁s₂·d₃        ]
       [s₂     0     c₂      h₁ + c₂·d₃      ]
       [0       0     0       1               ]
```

A posição do end-effector:
- Px = −c₁s₂·d₃
- Py = −s₁s₂·d₃
- Pz = h₁ + c₂·d₃

*(onde c₁=cos θ₁, s₁=sin θ₁, c₂=cos θ₂, s₂=sin θ₂)*

---

## Exemplo resolvido — Exame 20-6-2025 (θ₁, θ₂, d₃)

### Tabela DH

| i | θ | d | a | α |
|---|---|---|---|---|
| 1 | θ₁ | h₁ | 0 | −90° |
| 2 | θ₂ | d₂ | 0 | +90° |
| 3 | 0 | d₃ | 0 | 0° |

### Passo 1 — Calcular ⁰T₁ (θ₁, h₁, a=0, α=−90°)

cos(−90°) = 0, sin(−90°) = −1, a = 0

$$^0T_1 = \begin{bmatrix} c_1 & 0 & -s_1 & 0 \\ s_1 & 0 & c_1 & 0 \\ 0 & -1 & 0 & h_1 \\ 0 & 0 & 0 & 1 \end{bmatrix}$$

Coluna a coluna:
- Col 1: [cθ, sθ, 0, 0] = [c₁, s₁, 0, 0]
- Col 2: [−sθ·cα, cθ·cα, sα, 0] = [−s₁·0, c₁·0, −1, 0] = [0, 0, −1, 0]
- Col 3: [sθ·sα, −cθ·sα, cα, 0] = [s₁·(−1), −c₁·(−1), 0, 0] = [−s₁, c₁, 0, 0]
- Col 4: [a·cθ, a·sθ, d, 1] = [0, 0, h₁, 1]

### Passo 2 — Calcular ¹T₂ (θ₂, d₂, a=0, α=+90°)

cos(+90°) = 0, sin(+90°) = 1, a = 0

$$^1T_2 = \begin{bmatrix} c_2 & 0 & s_2 & 0 \\ s_2 & 0 & -c_2 & 0 \\ 0 & 1 & 0 & d_2 \\ 0 & 0 & 0 & 1 \end{bmatrix}$$

Coluna a coluna:
- Col 1: [c₂, s₂, 0, 0]
- Col 2: [−s₂·0, c₂·0, 1, 0] = [0, 0, 1, 0]
- Col 3: [s₂·1, −c₂·1, 0, 0] = [s₂, −c₂, 0, 0]
- Col 4: [0, 0, d₂, 1]

### Passo 3 — Calcular ²T₃ (θ=0, d₃, a=0, α=0°)

cos(0°) = 1, sin(0°) = 0 → matriz identidade com translação d₃

$$^2T_3 = \begin{bmatrix} 1 & 0 & 0 & 0 \\ 0 & 1 & 0 & 0 \\ 0 & 0 & 1 & d_3 \\ 0 & 0 & 0 & 1 \end{bmatrix}$$

### Passo 4 — Multiplicar ⁰T₁ × ¹T₂ (linha por coluna)

$$^0T_1 \times ^1T_2 = \begin{bmatrix} c_1 & 0 & -s_1 & 0 \\ s_1 & 0 & c_1 & 0 \\ 0 & -1 & 0 & h_1 \\ 0 & 0 & 0 & 1 \end{bmatrix} \times \begin{bmatrix} c_2 & 0 & s_2 & 0 \\ s_2 & 0 & -c_2 & 0 \\ 0 & 1 & 0 & d_2 \\ 0 & 0 & 0 & 1 \end{bmatrix}$$

**Linha 1** = [c₁, 0, −s₁, 0]:
- × Col 1: c₁·c₂ + 0·s₂ + (−s₁)·0 + 0·0 = **c₁c₂**
- × Col 2: c₁·0 + 0·0 + (−s₁)·1 + 0·0 = **−s₁**
- × Col 3: c₁·s₂ + 0·(−c₂) + (−s₁)·0 + 0·0 = **c₁s₂**
- × Col 4: c₁·0 + 0·0 + (−s₁)·d₂ + 0·1 = **−s₁d₂**

**Linha 2** = [s₁, 0, c₁, 0]:
- × Col 1: s₁·c₂ + 0 + 0 + 0 = **s₁c₂**
- × Col 2: s₁·0 + 0 + c₁·1 + 0 = **c₁**
- × Col 3: s₁·s₂ + 0 + 0 + 0 = **s₁s₂**
- × Col 4: 0 + 0 + c₁·d₂ + 0 = **c₁d₂**

**Linha 3** = [0, −1, 0, h₁]:
- × Col 1: 0 + (−1)·s₂ + 0 + 0 = **−s₂**
- × Col 2: 0 + (−1)·0 + 0 + 0 = **0**
- × Col 3: 0 + (−1)·(−c₂) + 0 + 0 = **c₂**
- × Col 4: 0 + 0 + 0 + h₁·1 = **h₁**

**Linha 4** = [0, 0, 0, 1] → sempre [0, 0, 0, 1]

$$^0T_{12} = \begin{bmatrix} c_1c_2 & -s_1 & c_1s_2 & -s_1d_2 \\ s_1c_2 & c_1 & s_1s_2 & c_1d_2 \\ -s_2 & 0 & c_2 & h_1 \\ 0 & 0 & 0 & 1 \end{bmatrix}$$

### Passo 5 — Multiplicar ⁰T₁₂ × ²T₃

Como ²T₃ é a identidade com só d₃ na posição (3,4):
- **Colunas 1, 2, 3 não mudam**
- **Coluna 4 nova** = col4 antiga + col3 × d₃

- Linha 1: −s₁d₂ + c₁s₂·d₃
- Linha 2: c₁d₂ + s₁s₂·d₃
- Linha 3: h₁ + c₂·d₃
- Linha 4: 1

### Resultado final — ⁰T₃

$$\boxed{^0T_3 = \begin{bmatrix} c_1c_2 & -s_1 & c_1s_2 & c_1s_2d_3 - s_1d_2 \\ s_1c_2 & c_1 & s_1s_2 & s_1s_2d_3 + c_1d_2 \\ -s_2 & 0 & c_2 & c_2d_3 + h_1 \\ 0 & 0 & 0 & 1 \end{bmatrix}}$$

A 4ª coluna dá a posição do end-effector no referencial base:
- **Px** = c₁s₂d₃ − s₁d₂
- **Py** = s₁s₂d₃ + c₁d₂
- **Pz** = c₂d₃ + h₁

---

## Atalhos úteis

| α | cos α | sin α |
|---|---|---|
| 0° | 1 | 0 |
| 90° | 0 | 1 |
| −90° | 0 | −1 |
| 180° | −1 | 0 |

---

## Erros comuns

- Esquecer de multiplicar pela ordem correta (⁰T₁ × ¹T₂, NÃO ¹T₂ × ⁰T₁)
- Confundir a convenção Craig com a Hayati
- Sinais errados em α = −90°: sin(−90°) = −1, cos(−90°) = 0
