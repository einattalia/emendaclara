# Configuração Supabase — Emenda Clara

Projeto: `jetwbolmydxgvbpwapqd`.

## Estado atual do projeto

- O schema `emenda_clara` e suas tabelas já existem.
- Os 21 gabinetes estão cadastrados (`GAB-01` a `GAB-21`).
- A migração `supabase_auth_identity_and_grants` foi aplicada para reconhecer `auth.uid()` e conceder os privilégios necessários, sempre com RLS.
- Ainda não há usuário em Supabase Auth nem perfil de administrador.

## Criar o administrador inicial

1. No painel deste projeto, abra **Authentication → Users**.
2. Crie ou convide `teste.camaramunicipal@gmail.com`. A conta precisa aparecer na lista de usuários do Auth. O envio de convite pode exigir SMTP próprio; o SMTP padrão do Supabase limita os destinatários autorizados.
3. Depois que o usuário existir, execute `003_admin_inicial.sql` no SQL Editor, ou peça ao assistente para aplicar o perfil. Esse script associa a conta Auth ao cadastro Emenda Clara e concede `administrador`; ele não cria nem armazena senha.

**Não execute `001_schema_supabase.sql` nem `002_seed_21_gabinetes.sql` novamente neste projeto.** O schema e os gabinetes já existem. O arquivo principal aborta se detectar o schema, para evitar alterações sobre uma estrutura existente. Os arquivos 001 e 002 servem apenas para uma instalação nova.

## Limites atuais

O banco e as permissões foram preparados, mas o protótipo HTML ainda não está conectado à autenticação ou às tabelas. Depois de criar o primeiro usuário, ainda será necessário integrar o aplicativo para oferecer login e carregar os dados reais. A lista de secretarias e os dados financeiros também precisam ser confirmados com a Câmara e a Prefeitura antes de uso operacional.
