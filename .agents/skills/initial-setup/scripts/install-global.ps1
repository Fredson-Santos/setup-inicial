# ==============================================================================
# Script para Instalar a Skill 'initial-setup' Globalmente no Antigravity
# Copia a skill para ~/.gemini/config/skills/initial-setup
# ==============================================================================

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$skillSource = Split-Path -Parent $scriptDir

$globalSkillsDir = Join-Path $env:USERPROFILE ".gemini\config\skills"
$globalSkillDest = Join-Path $globalSkillsDir "initial-setup"

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  >> Instalando Skill 'initial-setup' Globalmente no Antigravity" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

Write-Host "`nOrigem: $skillSource" -ForegroundColor Yellow
Write-Host "Destino: $globalSkillDest" -ForegroundColor Yellow

if (-not (Test-Path $globalSkillsDir)) {
    New-Item -ItemType Directory -Path $globalSkillsDir -Force | Out-Null
    Write-Host "`n[OK] Diretorio de skills globais criado: $globalSkillsDir" -ForegroundColor Green
}

if (Test-Path $globalSkillDest) {
    Write-Host "`n[INFO] Atualizando instalacao existente em $globalSkillDest..." -ForegroundColor DarkYellow
    Remove-Item -Path $globalSkillDest -Recurse -Force
}

Copy-Item -Path $skillSource -Destination $globalSkillDest -Recurse -Force

Write-Host "`n[OK] Skill copiada com sucesso para o ambiente global!" -ForegroundColor Green
Write-Host "`nA partir de agora, em qualquer projeto novo aberto no Antigravity, basta pedir:" -ForegroundColor Cyan
Write-Host "   'Faca o setup inicial' ou 'Inicialize o projeto'" -ForegroundColor White
Write-Host "`n==========================================================" -ForegroundColor Green
