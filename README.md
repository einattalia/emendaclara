# Banco inicial do Emenda Clara

Pacote inicial de esquema PostgreSQL para cadastrar as emendas dos 21 gabinetes da Câmara.

## O que cria

- Estrutura `emenda_clara` com usuários, perfis, vereadores, gabinetes e secretarias
- Relação de usuários com um ou mais gabinetes e secretarias
- Emendas com valor solicitado, exercício, objeto, secretaria, status e responsáveis
- Documentos por referência de armazenamento e histórico de alterações
- Área separada para lotes e movimentações financeiras futuras
- Políticas de segurança por linha (RLS) para separar os gabinetes e limitar acessos por perfil
- Carga inicial de 21 gabinetes com rótulos `Gabinete 01` a `Gabinete 21`

Os rótulos são provisórios. Não há nomes de vereadores, contas de acesso nem nomes de secretarias preenchidos, pois esses cadastros precisam ser confirmados pela Câmara e pela Prefeitura.

## Como aplicar

1. Crie um banco PostgreSQL exclusivo para o sistema, por exemplo `emenda_clara`.
2. Execute `001_schema.sql` nesse banco.
3. Execute `002_seed_21_gabinetes.sql`.
4. Cadastre os usuários pelo provedor de autenticação escolhido e relacione cada conta a um ou mais gabinetes em `gabinete_usuarios`.
5. Depois de confirmar a estrutura administrativa, cadastre as secretarias em `secretarias` e os vínculos em `secretaria_usuarios`.

O esquema usa `bigint` para identificadores, `numeric(14,2)` para valores, `timestamptz` para datas com horário e índices nas chaves estrangeiras usadas em consultas.

## Acesso e segurança

As políticas RLS leem o usuário autenticado do contexto PostgreSQL `emenda_clara.usuario_id`. O backend deve autenticar a pessoa, abrir uma transação e definir esse contexto para cada requisição, por exemplo com `set_config('emenda_clara.usuario_id', '<id interno>', true)`. Use uma conexão de aplicação sem privilégios de proprietário ou `BYPASSRLS`; nunca conecte o navegador diretamente ao banco. O provedor de autenticação ainda precisa ser escolhido e integrado.

A tabela `emenda_historico` foi desenhada para receber eventos append-only. A aplicação e os privilégios do banco devem impedir edição e exclusão do histórico por usuários comuns. Documentos ficam em armazenamento de arquivos; o banco guarda a chave e os metadados, não o conteúdo do arquivo.

A publicação pública deve usar uma consulta ou visão explícita com campos aprovados. Este pacote não concede acesso anônimo nem cria uma conexão com a contabilidade municipal.

## Limites desta entrega

O pacote contém os scripts de estrutura e carga inicial; ele não instala nem inicia um servidor PostgreSQL e não cria contas de usuários. A integração financeira está modelada para uma etapa posterior, após confirmação de formato, origem e validação pela Fazenda e TI. O script ainda precisa ser aplicado e revisado em uma instância PostgreSQL de desenvolvimento antes de qualquer uso real.