# Emenda em Dia — Gestão e Transparência

Protótipo estático e navegável para explorar um fluxo de gestão de emendas parlamentares.

## Como abrir

Extraia o ZIP e abra `index.html` em um navegador moderno. O protótipo não exige instalação nem dependências.

## O que está incluído

- Painel demonstrativo e consulta de emendas
- Cadastro demonstrativo de rascunhos
- Relação de referência das secretarias
- Leitura local de CSV no formato indicado em `data/modelo-integracao-financeira.csv`
- Páginas de preparação da integração financeira e transparência
- Tipografia Source Sans 3, com fallback para a fonte do sistema

## Limites desta versão

Todos os valores, parlamentares, emendas e movimentações são fictícios. A página não se conecta à Prefeitura, à Sisvetor ou ao Audesp. A importação de CSV é local ao navegador e não altera sistemas oficiais. Antes de uso operacional, valide a estrutura administrativa, os fluxos e as regras municipais e implemente uma integração autorizada com a fonte contábil oficial.

A fonte Source Sans 3 é carregada do Google Fonts. Se o navegador estiver sem acesso à internet, será usada a fonte de fallback do sistema.

## Integração financeira futura

O CSV é apenas um formato de demonstração. A integração de produção deve validar o leiaute, códigos de unidade/dotação/fonte, vínculo com a emenda, periodicidade, origem dos dados e totais com a Secretaria da Fazenda e a área de tecnologia.
