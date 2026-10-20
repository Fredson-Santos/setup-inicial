# ==============================================================================
# Script de Setup Inicial de Projeto — Antigravity
# Executa a padronizacao do repositorio: Git, templates e regras do agente.
# ==============================================================================

[CmdletBinding()]
param (
    [string]$TargetDir = (Get-Location).Path,
    [switch]$SkipGitCommit = $false
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$skillRoot = Split-Path -Parent $scriptDir
$templatesDir = Join-Path $skillRoot "resources\templates"
$rulesDir = Join-Path $skillRoot "resources\rules"

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  >> Inicializando Setup do Projeto em: $TargetDir" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Obter nome do projeto a partir do diretorio
$projectName = Split-Path -Leaf $TargetDir
Write-Host "`n[1/5] Nome do Projeto identificado: $projectName" -ForegroundColor Yellow

# 2. Inicializacao do Git
Write-Host "`n[2/5] Verificando repositorio Git..." -ForegroundColor Yellow
$gitDir = Join-Path $TargetDir ".git"
if (-not (Test-Path $gitDir)) {
    try {
        $null = & git -C $TargetDir init -b main 2>&1
        if ($LASTEXITCODE -ne 0) {
            $null = & git -C $TargetDir init 2>&1
        }
        Write-Host "  [OK] Repositorio Git inicializado com sucesso." -ForegroundColor Green
    } catch {
        Write-Host "  [AVISO] Nao foi possivel executar 'git init'. Verifique se o Git esta instalado no PATH." -ForegroundColor DarkYellow
    }
} else {
    Write-Host "  [INFO] Repositorio Git ja existente." -ForegroundColor Gray
}

# 3. Criacao de arquivos base a partir dos templates
Write-Host "`n[3/5] Configurando arquivos base (.gitignore, .gitattributes, .env.example, README.md)..." -ForegroundColor Yellow

# .gitignore
$destGitignore = Join-Path $TargetDir ".gitignore"
if (-not (Test-Path $destGitignore)) {
    Copy-Item (Join-Path $templatesDir "gitignore.template") $destGitignore
    Write-Host "  [OK] .gitignore criado." -ForegroundColor Green
} else {
    Write-Host "  [INFO] .gitignore ja existia (mantido)." -ForegroundColor Gray
}

# .gitattributes
$destGitattributes = Join-Path $TargetDir ".gitattributes"
if (-not (Test-Path $destGitattributes)) {
    Copy-Item (Join-Path $templatesDir "gitattributes.template") $destGitattributes
    Write-Host "  [OK] .gitattributes criado." -ForegroundColor Green
} else {
    Write-Host "  [INFO] .gitattributes ja existia (mantido)." -ForegroundColor Gray
}

# .env.example
$destEnvExample = Join-Path $TargetDir ".env.example"
if (-not (Test-Path $destEnvExample)) {
    Copy-Item (Join-Path $templatesDir "env.example.template") $destEnvExample
    Write-Host "  [OK] .env.example criado." -ForegroundColor Green
} else {
    Write-Host "  [INFO] .env.example ja existia (mantido)." -ForegroundColor Gray
}

# README.md
$destReadme = Join-Path $TargetDir "README.md"
if (-not (Test-Path $destReadme)) {
    $readmeContent = Get-Content (Join-Path $templatesDir "README.template.md") -Raw
    $readmeContent = $readmeContent.Replace("{{PROJECT_NAME}}", $projectName)
    Set-Content -Path $destReadme -Value $readmeContent -Encoding UTF8
    Write-Host "  [OK] README.md criado com nome do projeto '$projectName'." -ForegroundColor Green
} else {
    Write-Host "  [INFO] README.md ja existia (mantido)." -ForegroundColor Gray
}

# 4. Configuracao das regras do Antigravity (.agents/rules)
Write-Host "`n[4/5] Configurando regras do Antigravity (.agents/rules/)..." -ForegroundColor Yellow
$targetRulesDir = Join-Path $TargetDir ".agents\rules"
if (-not (Test-Path $targetRulesDir)) {
    New-Item -ItemType Directory -Path $targetRulesDir -Force | Out-Null
}

$ruleFiles = @("git.md", "dev.md", "tests.md")
foreach ($rf in $ruleFiles) {
    $src = Join-Path $rulesDir $rf
    $dst = Join-Path $targetRulesDir $rf
    if (-not (Test-Path $dst)) {
        Copy-Item $src $dst
        Write-Host "  [OK] Regra instalada: .agents/rules/$rf" -ForegroundColor Green
    } else {
        Write-Host "  [INFO] Regra ja existente: .agents/rules/$rf (mantida)" -ForegroundColor Gray
    }
}

# 5. Commit inicial no Git (opcional)
Write-Host "`n[5/5] Verificando Git status para commit inicial..." -ForegroundColor Yellow
if (-not $SkipGitCommit) {
    try {
        $status = & git -C $TargetDir status --porcelain 2>&1
        if ($status) {
            $null = & git -C $TargetDir add .gitignore .gitattributes .env.example README.md .agents/ 2>&1
            $null = & git -C $TargetDir commit -m "chore: setup inicial do projeto com gitignore e regras do agente" 2>&1
            if ($LASTEXITCODE -eq 0) {
                Write-Host "  [OK] Commit inicial realizado com sucesso!" -ForegroundColor Green
            } else {
                Write-Host "  [INFO] Arquivos preparados no staging do Git." -ForegroundColor Gray
            }
        } else {
            Write-Host "  [INFO] Nenhuma alteracao pendente para commit." -ForegroundColor Gray
        }
    } catch {
        Write-Host "  [INFO] Git commit ignorado." -ForegroundColor Gray
    }
}

Write-Host "`n==========================================================" -ForegroundColor Green
Write-Host "  >> Setup inicial concluido com sucesso!" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green
