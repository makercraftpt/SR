# Ficha 10 — Segurança em Robótica Industrial

> Aparece como Q7 no Recurso SR 2022/23 (17-07-2023) (10%)

---

## Condições de segurança para robôs industriais

### Normas relevantes

- **ISO 10218-1/2**: Robôs industriais — requisitos de segurança
- **ISO/TS 15066**: Robôs colaborativos (cobots)
- **EN 954-1 / ISO 13849**: Segurança de máquinas

---

## Categorias de medidas de segurança

### 1. Barreiras físicas

- Gaiolas metálicas ao redor da célula robótica
- Vedação que impede o acesso durante a operação
- Portas com interruptores de segurança (relés de segurança)

### 2. Sistemas de deteção de presença

- **Cortinas de luz (light curtains)**: deteção de intrusão sem contacto
- **Tapetes de pressão**: detetam peso no chão da célula
- **Scanners laser** (SICK, Pilz): mapeiam a área em tempo real

### 3. Paragem de emergência (E-stop)

- Botões de emergência em locais acessíveis
- Paragem categoria 0 (corte imediato) ou categoria 1 (rampa controlada)

### 4. Limites de velocidade e força (para cobots)

- ISO/TS 15066 define limites de força de contacto por zona do corpo
- Monitorização contínua de velocidade e força no cobot

### 5. Formação e procedimentos operacionais

- Operadores formados em segurança
- Procedimentos de lockout/tagout (LOTO) para manutenção
- Sinalização de aviso na célula

### 6. Redundância e validação do sistema

- Sensores redundantes nos eixos
- Verificação de limites de junta (software e hardware)
- Supervisão do controlador com watchdog

---

## Frase-chave para o exame

> "As condições de segurança para robôs industriais incluem: barreiras físicas (gaiolas), sistemas de deteção de presença (cortinas de luz, scanners laser), botões de paragem de emergência, procedimentos de lockout/tagout para manutenção, e, no caso de cobots, limites de força e velocidade segundo a norma ISO/TS 15066."
