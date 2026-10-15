# Configuração Supabase — Emenda Clara

Pacote SQL preparado para o projeto informado pela Câmara: `jetwbolmydxgvbpwapqd`.

## O que este pacote prepara

- Schema privado `emenda_clara` para usuários, perfis, 21 gabinetes, vereadores, secretarias, emendas e registros financeiros
- Políticas RLS compatíveis com a identidade de Supabase Auth (`auth.uid()`)
- Acesso limitado por gabinete e por perfil
- Um script para atribuir perfil de administrador ao usuário já criado no Supabase Auth

## Aplicação no painel

1. Confirme no painel que o projeto selecionado é `jetwbolmydxgvbpwapqd` e que o schema `emenda_clara` ainda não existe. O script principal aborta se encontrar esse schema, para evitar alterar uma estrutura preexistente.
2. No SQL Editor, execute `001_schema_supabase.sql`.
3. Execute `002_seed_21_gabinetes.sql` para criar os gabinetes `GAB-01` a `GAB-21`.
4. Em **Authentication → Users**, crie ou convide `teste.camaramunicipal@gmail.com`. Não coloque senha em arquivo ou no chat. O envio do convite pode exigir SMTP próprio; o SMTP padrão do Supabase só envia para endereços autorizados da equipe do projeto.
5. Depois que o usuário aparecer em Authentication → Users, execute `003_admin_inicial.sql`. Ele vincula o `auth.uid()` do e-mail acima e concede o perfil `administrador`.
6. Se o aplicativo for consultar as tabelas pela Data API, adicione `emenda_clara` à lista de schemas expostos nas configurações da API. O script concede acesso apenas ao papel `authenticated` e mantém RLS habilitado.

Os scripts não contêm senha, chave secreta ou `service_role`. `001_schema_supabase.sql` e `003_admin_inicial.sql` devem ser executados como administrador do banco pelo SQL Editor. O usuário deve ser criado primeiro em Supabase Auth para que a atribuição de perfil funcione.

## Limites atuais

Não consegui aplicar ou inspecionar o projeto diretamente: a conexão Supabase disponível nesta sessão não tem permissão nele. Portanto, estes scripts ainda não foram executados nem verificados contra o banco remoto. O protótipo HTML existente continua demonstrativo e ainda não está conectado à autenticação ou às tabelas; esta etapa prepara o banco e o vínculo do primeiro administrador.

Antes de aplicar, confira se o projeto correto está aberto e se o schema `emenda_clara` está livre. Se o schema já existir, pare e revise a estrutura antes de prosseguir. Use dados fictícios em desenvolvimento e faça backup antes de qualquer implantação operacional.
