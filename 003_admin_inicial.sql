-- Promove para administrador o usuário já criado em Supabase Auth.
-- Execute somente depois de criar teste.camaramunicipal@gmail.com em Authentication > Users.
-- Não cria senha nem envia convite.

DO LANGUAGE plpgsql $bootstrap$
DECLARE
    auth_user_id uuid;
    app_user_id bigint;
BEGIN
    SELECT au.id
      INTO auth_user_id
      FROM auth.users AS au
     WHERE lower(au.email) = lower('teste.camaramunicipal@gmail.com')
     ORDER BY au.created_at DESC
     LIMIT 1;

    IF auth_user_id IS NULL THEN
        RAISE EXCEPTION 'Usuário teste.camaramunicipal@gmail.com não existe em Supabase Auth. Crie-o primeiro em Authentication > Users.';
    END IF;

    INSERT INTO emenda_clara.usuarios (
        identificador_autenticacao,
        nome_exibicao,
        email,
        ativo
    )
    VALUES (
        auth_user_id::text,
        'Administrador inicial',
        'teste.camaramunicipal@gmail.com',
        true
    )
    ON CONFLICT (identificador_autenticacao)
    DO UPDATE SET
        email = EXCLUDED.email,
        ativo = true,
        atualizado_em = now()
    RETURNING id INTO app_user_id;

    INSERT INTO emenda_clara.usuario_perfis (usuario_id, perfil)
    VALUES (app_user_id, 'administrador')
    ON CONFLICT (usuario_id, perfil) DO NOTHING;
END;
$bootstrap$;
