# Ficha 04 — Matrizes de Transformação Homogénea

> Aparece em **TODOS** os exames como Q4 e Q5 (10–15% cada)

---

## O que é

Uma matriz de transformação homogénea 4×4 codifica **orientação** (rotação 3×3) + **posição** (vetor 3×1) de um frame relativamente a outro:

```
ᴬTᴮ = [  ᴬR_B    ᴬP_B  ]
       [ 0  0  0    1   ]
```

onde:
- ᴬR_B = matriz de rotação 3×3 (colunas = eixos de B expressos em A)
- ᴬP_B = posição da origem de B expressa em A

---

## Composição de matrizes

Para transformar do frame do objeto para o frame World, passando por frames intermédios:

```
ᵂT_objeto = ᵂT_câmara × ᶜᵃᵐᵃʳᵃT_objeto
ᵂT_objeto = ᵂT_base × ᴮᵃˢᵉT_objeto
ᴮᵃˢᵉT_objeto = (ᵂT_base)⁻¹ × ᵂT_objeto
```

---

## Q4 — Matriz ᵂT_objeto

Determina a posição e orientação do **objeto** relativamente ao **referencial do mundo (W)**.

### Procedimento:

1. Identificar a posição da origem do sistema de eixos do objeto em W
2. Identificar a orientação (em geral, igual a W, ou com rotação se objeto estiver inclinado)
3. A origem do objeto é normalmente no centro da face superior

### Exemplo — SR 2024/25 (objeto 10×6×6cm, origem no centro da face superior):

A figura mostra o objeto numa mesa com sistema W. Pelos dados:
```
ᵂT_objeto = [0   0   1   55 ]   ← depende da posição na figura
             [0  -1   0   33 ]
             [1   0   0    6 ]
             [0   0   0    1 ]
```
*(Requer validação manual — depende da leitura correta da figura)*

### Exemplo — SR 2023/24 (câmara e passadeira):

Câmara em (100, 80, 100) relativamente a W, objeto detetado em (5, 10) na imagem:
```
ᵂT_câmara = [1  0  0  100]     (orientação igual a W)
             [0  1  0   80]
             [0  0  1  100]
             [0  0  0    1]

ᵂT_objeto = [1  0  0  105]     (100 + 5, 80 + 10, 20 — altura da passadeira)
             [0  1  0   90]
             [0  0  1   20]
             [0  0  0    1]
```

---

## Q5 — Colocação do robô e matrizes ᵂT_base e ᴮᵃˢᵉT_objeto

### Posições possíveis do robô:

| Posição | Notas |
|---|---|
| Chão (embaixo) | Z_base aponta para cima (= Z_W) |
| Parede lateral | Z_base aponta horizontalmente |
| Teto (suspenso) | Z_base aponta para baixo (= −Z_W) |

### Como escolher a posição?

O robô tem de conseguir alcançar o objeto. Para isso:
- Verificar se a junta prismática tem alcance suficiente
- A pose do robô deve ter Z_base alinhado com o sentido de extensão do braço

### Procedimento para ᵂT_base:

1. Escolher a posição do robô (parede, teto ou chão)
2. Identificar as colunas de ᵂT_base: [X_base_em_W | Y_base_em_W | Z_base_em_W | P_base_em_W]
3. Calcular ᴮᵃˢᵉT_objeto = (ᵂT_base)⁻¹ × ᵂT_objeto

### Exemplo — Robô na parede (SR 2022/23 Recurso):

```
ᵂT_base = [0   1   0   90 ]    ← X_base = Y_W
           [0   0   1  -14 ]    ← Y_base = Z_W  
           [1   0   0   90 ]    ← Z_base = X_W
           [0   0   0    1 ]
```

---

## Inversa da matriz de transformação homogénea

```
(ᴬTᴮ)⁻¹ = ᴮTᴬ = [  Rᵀ    -Rᵀ·P ]
                   [ 0 0 0    1   ]
```

---

## Checklist Q4 e Q5

- [ ] A origem do sistema de eixos do objeto está no lugar certo (face superior, centro)?
- [ ] A orientação do objeto é a mesma do W, ou está rotacionada?
- [ ] O robô consegue fisicamente alcançar o objeto na posição escolhida?
- [ ] (ᵂT_base)⁻¹ foi calculado corretamente (transposta da rotação + vetor correto)?
- [ ] ᴮᵃˢᵉT_objeto = (ᵂT_base)⁻¹ × ᵂT_objeto?
