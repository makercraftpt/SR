# Ficha 09 — Teleoperação Robótica

> Aparece como Q8 no exame SR 2024/25 (10%)

---

## Definição

**Teleoperação robótica** é o controlo de um robô à distância por um operador humano, onde existe separação espacial entre o operador e o robô. O operador envia comandos e recebe feedback (visual, háptico, áudio) do ambiente remoto.

Elementos principais:
- **Mestre**: interface do operador (joystick, exosqueleto, luva háptica)
- **Escravo**: robô no ambiente remoto
- **Canal de comunicação**: rede, rádio, satélite (com latência)

---

## Desafios da teleoperação

- **Latência**: atraso na comunicação → problemas de estabilidade
- **Largura de banda**: vídeo + dados hápticos exigem muita banda
- **Fadiga do operador**: controlo contínuo é exigente
- **Perceção do ambiente**: câmaras limitadas vs. presença física

---

## Exemplos práticos (para o exame)

### 1. Exploração espacial

- Rovers de Marte (Curiosity, Perseverance — NASA/JPL)
- Operados da Terra com latência de 4 a 24 minutos
- Usam autonomia parcial para compensar o atraso

### 2. Cirurgia robótica minimamente invasiva

- Sistema Da Vinci (Intuitive Surgical)
- Cirurgião opera numa consola, o robô reproduz os movimentos com tremor filtrado
- Permite cirurgias à distância (telemedicina cirúrgica)

### 3. Desativação de engenhos explosivos (EOD)

- Robôs como iRobot PackBot ou Remotec Andros
- Operados por militares/polícia a distância segura

### 4. Inspeção e manutenção em ambientes perigosos

- Centrais nucleares (Fukushima — robôs da Toshiba)
- Plataformas petrolíferas offshore
- Fundos oceânicos (ROVs — Remotely Operated Vehicles)

---

## Tipos de teleoperação

| Tipo | Descrição |
|---|---|
| Teleoperação direta | Operador controla cada movimento (sem autonomia) |
| Supervisão | Operador dá objetivos; robô executa com autonomia parcial |
| Teleoperação háptica | Robô devolve forças ao operador (sensação táctil) |

---

## Frase-chave para o exame

> "A teleoperação robótica consiste no controlo remoto de um robô por um operador humano, com feedback sensorial do ambiente. Dois exemplos práticos são: (1) rovers de exploração espacial, como os rovers de Marte, operados da Terra apesar da latência; e (2) cirurgia robótica com o sistema Da Vinci, onde o cirurgião opera à distância com precisão aumentada."
