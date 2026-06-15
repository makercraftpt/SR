# Ficha 07 — Programação de Robôs Industriais

> Aparece como Q7 no exame SR 2023/24 (10%)

---

## Formas de programação de um robô industrial

### 1. Programação Textual (Online e Offline)

**Online (direto no controlador):**
- O programador escreve código diretamente na consola do robô
- Linguagens proprietárias: RAPID (ABB), KRL (KUKA), KAREL (FANUC)
- Requer paragem da linha de produção

**Offline (em PC):**
- Programação num ambiente de simulação 3D
- Software: RobotStudio (ABB), KUKA.Sim, RoboGuide (FANUC)
- Vantagem: não interrompe a produção; possível verificar alcance e colisões

### 2. Programação por Demonstração (Teach & Playback)

- O operador guia o robô manualmente pelos pontos desejados (usando um teach pendant)
- O controlador grava as posições
- O robô reproduz depois a sequência guardada
- **Vantagem:** intuitivo, não exige conhecimentos de programação
- **Desvantagem:** limitado a trajetórias simples, difícil de modificar

### 3. Programação por Aprendizagem (Learning from Demonstration)

- O robô aprende a partir de demonstrações humanas
- Usa técnicas de machine learning / IA
- Mais avançada; ainda em investigação para ambientes industriais

### 4. Programação com linguagens de alto nível (ROS, Python, etc.)

- Permite integração com sensores, câmaras, PLCs
- Mais flexível; usada em robôs colaborativos e sistemas avançados

---

## Resumo para o exame

| Método | Vantagem principal | Desvantagem principal |
|---|---|---|
| Textual offline | Não para a produção | Requer simulação precisa |
| Textual online | Simples e direto | Para a produção |
| Teach & Playback | Intuitivo | Limitado e inflexível |
| Alto nível (ROS) | Flexível | Complexidade técnica |

---

## Frase-chave para o exame

> "As principais formas de programação de um robô industrial são: programação textual (online e offline), programação por demonstração (teach & playback) e programação baseada em aprendizagem. A programação offline é preferida em ambientes de produção para minimizar o tempo de inatividade."
