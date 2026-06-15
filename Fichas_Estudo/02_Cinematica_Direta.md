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
