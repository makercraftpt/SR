# Script PowerShell - Copiar originais para 00_ORIGINAIS
# Executa este script UMA VEZ para preservar os ficheiros originais.
# Podes correr com: .\copiar_originais.ps1

$base = Split-Path -Parent $MyInvocation.MyCommand.Path
$destino = Join-Path $base "00_ORIGINAIS"

# Criar pasta de destino
New-Item -ItemType Directory -Force -Path $destino | Out-Null
New-Item -ItemType Directory -Force -Path "$destino\ResMira" | Out-Null

# Copiar ficheiros da raiz
$ficheiros = @(
    "Exame_SR_24_25.pdf",
    "Adobe Scan 06_06_2026.pdf",
    "Adobe Scan 06_06_2026 (1).pdf",
    "WhatsApp Image 2026-06-06 at 18.12.30.jpeg",
    "WhatsApp Image 2026-06-06 at 18.12.30 (1).jpeg",
    "WhatsApp Image 2026-06-06 at 18.12.30 (2).jpeg",
    "WhatsApp Image 2026-06-06 at 18.12.30 (3).jpeg",
    "Foto de Miro Luis.jpg",
    "Foto de Miro Luis (1).jpg"
)

foreach ($f in $ficheiros) {
    $src = Join-Path $base $f
    if (Test-Path $src) {
        Copy-Item $src -Destination $destino -Force
        Write-Host "Copiado: $f"
    }
}

# Copiar pasta ResMira
$resMiraSrc = Join-Path $base "ResMira"
if (Test-Path $resMiraSrc) {
    Get-ChildItem $resMiraSrc | ForEach-Object {
        Copy-Item $_.FullName -Destination "$destino\ResMira" -Force
        Write-Host "Copiado: ResMira\$($_.Name)"
    }
}

Write-Host "`nConcluido! Originais preservados em 00_ORIGINAIS\"
