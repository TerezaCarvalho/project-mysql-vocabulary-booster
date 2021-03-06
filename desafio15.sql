-- Crie uma procedure chamada buscar_media_por_cargo que recebe como parâmetro o nome de um cargo e em retorno deve mostrar
-- a média salarial de todas as pessoas que possuem esse cargo. Usando o banco hr como referência,
-- sua procedure deve retornar somente uma coluna, com o alias "Média salarial", que mostra a média salarial
-- arredondada para duas casas decimais.

-- Confirme a execução correta da procedure, chamando-a e passando o nome de cargo igual a "Programmer":

-- CALL buscar_media_por_cargo('Programmer');

-- Chamando-a dessa forma, sua procedure deve retornar 5760.00 como média salarial para pessoas que ocupam o cargo "Programmer".

USE hr
DELIMITER //

CREATE PROCEDURE buscar_media_por_cargo(IN cargo VARCHAR(35))
BEGIN
SELECT 
    ROUND(AVG(E.SALARY), 2) AS 'Média salarial'
FROM
    hr.employees AS E
        INNER JOIN
    hr.jobs AS J ON E.JOB_ID = J.JOB_ID
        AND J.JOB_TITLE = cargo
GROUP BY J.JOB_TITLE
ORDER BY ROUND(AVG(E.SALARY), 2) , J.JOB_TITLE;
END //

DELIMITER ;

CALL buscar_media_por_cargo('Programmer');
