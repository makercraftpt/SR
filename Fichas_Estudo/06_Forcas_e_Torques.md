# Ficha 06 — Forças e Torques (Estática)

> Aparece em alguns exames como Q6 alternativa (10%) — SR 2023/24

---

## O que é

Dado uma força aplicada pelo end-effector, determinar os **binários/forças** nas juntas necessários para a equilibrar.

---

## Relação estática com o Jacobiano transposto

```
τ = Jᵀ · f
```

onde:
- `τ` = vetor de forças/torques nas juntas [τ₁, τ₂, τ₃]ᵀ
- `Jᵀ` = transposta do Jacobiano (n×3)
- `f` = força aplicada no end-effector [fx, fy, fz]ᵀ

---

## Procedimento

1. Calcular o Jacobiano J para a posição pedida
2. Transpor: Jᵀ
3. Multiplicar: τ = Jᵀ × f

---

## Propagação de forças (método do formulário)

Para calcular as forças nas juntas usando o método iterativo (de dentro para fora):

Para junta i (de n até 1):
```
ⁱfᵢ = ⁱᵢ₊₁R · ⁱ⁺¹fᵢ₊₁
ⁱnᵢ = ⁱᵢ₊₁R · ⁱ⁺¹nᵢ₊₁ + ⁱPᵢ₊₁ × ⁱfᵢ
```

Condições de fronteira no end-effector (frame n):
- ⁿfₙ = força externa aplicada (por ex. 10N em Z)
- ⁿnₙ = momento externo aplicado (normalmente 0)

---

## Exemplo — SR 2023/24 (Q6)

Força de 10N sobre o objeto, no eixo Z do sistema do objeto.

Requer validação manual — os valores numéricos dependem da posição do robô quando aplica a força.

---

## Notas importantes

- Para **junta rotacional**: o binário é a componente de nᵢ ao longo de Zᵢ₋₁
- Para **junta prismática**: a força é a componente de fᵢ ao longo de Zᵢ₋₁
- Verificar a direção da força pedida (no sistema do objeto ou do mundo?)
