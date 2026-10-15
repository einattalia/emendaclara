-- Emenda Clara - 21 gabinetes iniciais
-- Estes nomes são rótulos de cadastro, não nomes oficiais de vereadores.
-- Vincule cada gabinete ao vereador correto após receber a relação oficial da Câmara.

BEGIN;
INSERT INTO emenda_clara.gabinetes (codigo, nome)
SELECT 'GAB-' || lpad(n::text, 2, '0'), 'Gabinete ' || lpad(n::text, 2, '0')
FROM generate_series(1, 21) AS n
ON CONFLICT (codigo) DO NOTHING;
COMMIT;