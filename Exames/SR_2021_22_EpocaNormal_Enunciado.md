# Exame de Sistemas Robóticos — 8-7-2022

**Instituição:** ISEC — Instituto Superior de Engenharia de Coimbra  
**Mestrado em Engenharia Eletrotécnica**  
**Data:** 8-7-2022 (Época Normal 2021/22)  
**Fonte:** `../Foto de Miro Luis (1).jpg` (enunciado) + `../Foto de Miro Luis.jpg` (formulário)

---

## Descrição do Robô

Manipulador com **3 graus de liberdade**:
- 2 prismáticos: **d₂** e **d₃**
- 1 rotacional: **θ₁**
- *End effector*: ventosa
- Curso das juntas prismáticas: entre **20cm e 100cm**

**Configuração:** θ₁ em baixo (base rotativa), d₂ vertical (coluna), d₃ horizontal (braço)

```
        [ventosa] ← d₃ →
        z₂
        |
        z₁ (d₂ — vertical)
        |
  θ₁ — z₀ (base rotativa)
```

---

## Perguntas

**1. (10%)** Coloque os vários sistemas de eixos segundo o modelo de Denavit-Hartenberg.

**2. (15%)** Determine a cinemática Direta.

**3. (20%)** Determine a cinemática Inversa.

**4. (10%)** Obtenha a matriz de transformação ᵂT_Objeto, considerando a figura e que as dimensões do objeto são **6×10×6cm**. Considere que a origem do sistema de eixo do objeto é no centro da face superior.

**5. (15%)** Considerando que o robô pode ser colocado no chão, numa parede lateral ou suspenso no teto. Coloque o referencial base do robô (Base) na figura, de modo a que o robô seja capaz de apanhar o objeto e construa as matrizes de transformação **ᵂT_Base** e **ᴮᵃˢᵉT_Objeto**.

> ⚠️ **Nota:** As perguntas Q6 e Q7 não estão visíveis na imagem disponível. Pode haver página adicional não fotografada.

---

## Tabela DH esperada

Com base na configuração do robô (θ₁, d₂, d₃):

| i | θ | d | a | α |
|---|---|---|---|---|
| 1 | θ₁ | 0 | 0 | 0° |
| 2 | 0 | d₂ | 0 | −90° |
| 3 | 0 | d₃ | 0 | 0° |

> ⚠️ Requer validação manual — a tabela DH depende da leitura exata da figura do enunciado.

---

## Formulário (fornecido no exame)

### Identidades trigonométricas

- c₁₂ = c₁c₂ − s₁s₂
- s₁₂ = c₁s₂ + s₁c₂
- tan₁₂ = (tan₁ + tan₂) / (1 − tan₁·tan₂)

### Matriz DH — Convenção Craig

$${}^{i-1}_iT = \begin{bmatrix} \cos\theta_i & -\sin\theta_i\cos\alpha_i & \sin\theta_i\sin\alpha_i & a_i\cos\theta_i \\ \sin\theta_i & \cos\theta_i\cos\alpha_i & -\cos\theta_i\sin\alpha_i & a_i\sin\theta_i \\ 0 & \sin\alpha_i & \cos\alpha_i & d_i \\ 0 & 0 & 0 & 1 \end{bmatrix}$$

### Inversa

$${}^i_{i-1}T = \begin{bmatrix} {}^{i-1}R^T & -{}^{i-1}R^T \cdot {}^{i-1}P \\ 0\ 0\ 0 & 1 \end{bmatrix}$$

### Junta de revolução (velocidades)

- ⁱ⁺¹ωᵢ₊₁ = ⁱ⁺¹ᵢR · ⁱωᵢ + θ̇ᵢ₊₁ · ⁱ⁺¹Zᵢ₊₁
- ⁱ⁺¹vᵢ₊₁ = ⁱ⁺¹ᵢR · ⁱvᵢ + ⁱ⁺¹ᵢR · (ⁱωᵢ × ⁱPᵢ₊₁)

### Junta prismática (velocidades)

- ⁱ⁺¹ωᵢ₊₁ = ⁱ⁺¹ᵢR · ⁱωᵢ
- ⁱ⁺¹vᵢ₊₁ = ⁱ⁺¹ᵢR · ⁱvᵢ + ⁱ⁺¹ᵢR · (ⁱωᵢ × ⁱPᵢ₊₁) + ḋᵢ₊₁ · ⁱ⁺¹Zᵢ₊₁
