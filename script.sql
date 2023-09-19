-- 1.1 Escreva um cursor que exiba as variáveis rank e youtuber de toda tupla que tiver
-- video_count pelo menos igual a 1000 e cuja category seja igual a Sports ou Music.

-- cursores com parâmetro 
DO $$
DECLARE
	v_rank INT;
	v_youtuber VARCHAR(200);
	v_video_count INT := 1000;
	v_category VARCHAR(200);
	
	-- vinculado (bound)
	-- 1. Declaração do Cursor
	cur_rank_youtuber CURSOR (rank INT, youtuber VARCHAR)
	FOR SELECT cod_top_youtubers FROM tb_top_youtubers WHERE 
	video_count <= 1000 AND category LIKE '%Sports%' OR category LIKE '%Music%';
BEGIN
	-- passagem por nome
	-- 2. abertura do cursor 
	OPEN cur_rank_youtuber (rank := v_rank, youtuber := v_youtuber);
	LOOP
		-- 3. Recuperação de Dados
		FETCH cur_rank_youtuber INTO v_rank;
		EXIT WHEN NOT FOUND;
		RAISE NOTICE '%', v_rank;
	END LOOP;
	CLOSE cur_rank_youtuber;
END;
$$

SELECT * FROM tb_top_youtubers;

