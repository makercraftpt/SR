# Ficha 05 — Jacobiana e Velocidades das Juntas

> Aparece em **TODOS** os exames como Q6 (10%)

---

## O que é

O Jacobiano relaciona as **velocidades das juntas** (θ̇, ḋ) com a **velocidade do end-effector** (v):

```
v = J · q̇
```

onde:
- `v` = vetor de velocidade cartesiana do end-effector [vx, vy, vz]ᵀ
- `J` = matriz Jacobiana (3×n)
- `q̇` = vetor de velocidades das juntas [θ̇₁, ḋ₂, ḋ₃]ᵀ ou similar

---

## Como calcular o Jacobiano (método geométrico)

Para um robô com posição do end-effector P = [Px, Py, Pz]ᵀ:

```
J = [∂Px/∂q₁   ∂Px/∂q₂   ∂Px/∂q₃]
    [∂Py/∂q₁   ∂Py/∂q₂   ∂Py/∂q₃]
    [∂Pz/∂q₁   ∂Pz/∂q₂   ∂Pz/∂q₃]
```

Deriva cada componente de P em ordem a cada variável de junta.

---

## Como usar o Jacobiano nos exames

O enunciado dá a velocidade do end-effector no sistema do objeto (e.g., vZ = 0.2 m/s).
É preciso:

1. Calcular J para a posição específica pedida
2. Resolver `J · q̇ = v` para obter q̇

Se J não é quadrada ou é singular, usar a pseudoinversa:
```
q̇ = J⁺ · v    (se sistema sobredeterminado ou singular)
```

---

## Exemplo — Exame SR 2024/25 (Q6)

End-effector no vértice nº1 do objeto, velocidade v = [0, 0, 0.2]ᵀ m/s no sistema do objeto.

Primeiro, transformar a velocidade para o sistema do robô:
```
v_robô = ᵂR_objeto × v_objeto
```

Da cinemática direta com θ₁=... d₃=...:
```
P = [Px, Py, Pz]
```

Jacobiano calculado a partir de P:
```
J = [∂Px/∂θ₁   ∂Px/∂θ₂   ∂Px/∂d₃]
    [∂Py/∂θ₁   ∂Py/∂θ₂   ∂Py/∂d₃]
    [∂Pz/∂θ₁   ∂Pz/∂θ₂   ∂Pz/∂d₃]
```

Para Px = −c₁s₂d₃, Py = −s₁s₂d₃, Pz = h₁ + c₂d₃:
```
J = [s₁d₃s₂   -c₁c₂d₃   -c₁s₂]
    [-c₁d₃s₂  -s₁c₂d₃   -s₁s₂]
    [0          s₂d₃       c₂  ]  ← REQUER VALIDAÇÃO MANUAL
```

*(Requer validação manual — depende dos valores numéricos do vértice)*

---

## Exemplo — Exame SR 2023/24 (Q6, força)

Para a questão de forças (ver Ficha 06), o Jacobiano transposto é usado:
```
τ = Jᵀ · f
```

---

## Exemplo — Exame SR 2022/23 Recurso (Q6)

Robô com θ₁, d₂, d₃. Vértice no ponto de origem do objeto.
Com θ₁=0°, d₂=20cm, d₃=78cm:

```
J = [-20    0   -1]
    [-78    1    0]
    [  0    0    0]
```
*(Matriz singular → singularidade! O robô tem um grau de liberdade bloqueado neste ponto.)*

---

## Singularidades

Uma singularidade ocorre quando **det(J) = 0**. Significa que:
- O robô perde um grau de liberdade nessa configuração
- Não consegue mover-se em certas direções
- Velocidades das juntas podem tender para infinito

**Como detetar:** calcular det(J) e verificar se é zero.

---

## Propagação de velocidades (método alternativo — formulário do exame)

Para junta de revolução:
```
ⁱ⁺¹ωᵢ₊₁ = ⁱ⁺¹ᵢR · ⁱωᵢ + θ̇ᵢ₊₁ · ⁱ⁺¹Zᵢ₊₁
ⁱ⁺¹vᵢ₊₁ = ⁱ⁺¹ᵢR · ⁱvᵢ + ⁱ⁺¹ᵢR · (ⁱωᵢ × ⁱPᵢ₊₁)
```

Para junta prismática:
```
ⁱ⁺¹ωᵢ₊₁ = ⁱ⁺¹ᵢR · ⁱωᵢ
ⁱ⁺¹vᵢ₊₁ = ⁱ⁺¹ᵢR · ⁱvᵢ + ⁱ⁺¹ᵢR · (ⁱωᵢ × ⁱPᵢ₊₁) + ḋᵢ₊₁ · ⁱ⁺¹Zᵢ₊₁
```
