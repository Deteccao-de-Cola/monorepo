# Detecção de Cola - Monorepo

Este repositório contém todos os serviços do projeto como submódulos Git.

## Estrutura

- `migrations/` - Migrações do banco de dados
- `detection-service/` - Serviço de detecção
- `client-service/` - Serviço do cliente
- `app-service/` - Serviço da aplicação

## Como clonar

Para clonar o repositório com todos os submódulos:

```bash
git clone --recurse-submodules git@github.com:Deteccao-de-Cola/monorepo.git .
```

## Já clonou sem os submódulos?

Se você já clonou o repositório sem a flag `--recurse-submodules`, execute:

```bash
git submodule update --init --recursive
```

## Configuração recomendada

Para que futuros `git pull` baixem automaticamente as atualizações dos submódulos:

```bash
git config submodule.recurse true
```

## Atualizando submódulos

Para atualizar todos os submódulos para as versões mais recentes:

```bash
git submodule update --remote --merge
```
