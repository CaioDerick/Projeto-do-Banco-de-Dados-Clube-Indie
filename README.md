# Clube Indie DB — Modelagem e Administração em MySQL

Projeto prático de modelagem de dados e implementação em **MySQL 8.0** para a distribuidora e publicadora fictícia **Clube Indie**, simulando levantamento de requisitos de negócio, modelagem relacional e criação de objetos de banco.

## Contexto e Regras de Negócio
- **Estúdios (`estudio`):** Parceiros desenvolvedores que publicam jogos.
- **Categorias (`categoria`):** Classificação principal de cada jogo (`1:N` com `jogos`).
- **Plataformas (`plataformas`):** Plataformas onde os jogos são lançados (`N:M` com `jogos` via `plataformas_lancam_jogos`).
- **Jogadores (`jogadores`):** Clientes cadastrados na plataforma.
- **Compras (`jogadores_compram_jogos`):** Registro das compras realizadas pelos jogadores, guardando data e valor cobrado.

## Objetos Implementados
- **Tabelas:** `estudio`, `categoria`, `plataformas`, `jogadores`, `jogos`, `plataformas_lancam_jogos`, `jogadores_compram_jogos`.
- **Indexes:** `idx_jogos` e `idx_jogadores` criados para otimizar consultas nas respectivas tabelas.
- **View (`vw_catalogo_jogos`):** Consolida informações sobre o título, estúdio, categoria e preço dos jogos para consulta simplificada.
- **View (`vw_valor_promocional`):** Exibe o título, o preço padrão e o preço promocional com 10% de desconto.
- **Function (`fn_preco_promocional`):** Calcula o preço promocional multiplicando o preço padrão por `0.90` (aplicando 10% de desconto).
- **Trigger (`trg_valida_preco_jogos`):** Executada `BEFORE INSERT` em `jogos` para evitar preços negativos (ajustando para `0.00`).

## Estrutura da Pasta do Projeto
- `README.md` — Documentação do projeto.
- `clube_indie_completo.sql` — Script/dump do banco de dados.
- Arquivos de modelagem no **brModelo** (MER e MR) e modelo no **MySQL Workbench**.

## Como executar
1. Abra o MySQL Command Line Client ou MySQL Workbench.
2. Execute o script `clube_indie_completo.sql` (ou os scripts de criação/carga e objetos do banco).