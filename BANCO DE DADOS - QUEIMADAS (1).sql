SELECT *
FROM `basedosdados.br_inpe_queimadas.microdados`
LIMIT 100;
SELECT sigla_uf AS estado, COUNT(id_foco) AS total_focos
FROM `basedosdados.br_inpe_queimadas.microdados`
WHERE EXTRACT(YEAR FROM data_hora) = 2022
GROUP BY sigla_uf
ORDER BY total_focos DESC
LIMIT 1;

SELECT ano, COUNT(id_foco) AS total_focos
FROM `basedosdados.br_inpe_queimadas.microdados`
WHERE ano BETWEEN 2018 AND 2023
GROUP BY ano
ORDER BY total_focos DESC
LIMIT 1;

SELECT bioma, COUNT(id_foco) AS total_focos
FROM `basedosdados.br_inpe_queimadas.microdados`
WHERE EXTRACT(YEAR FROM data_hora) = 2022
GROUP BY bioma
ORDER BY total_focos DESC
LIMIT 1;

SELECT sigla_uf AS estado, AVG(total_focos) AS media_focos
FROM (
    SELECT sigla_uf, COUNT(id_foco) AS total_focos
    FROM `basedosdados.br_inpe_queimadas.microdados`
    WHERE EXTRACT(YEAR FROM data_hora) = 2020
    GROUP BY sigla_uf
)
GROUP BY sigla_uf;

SELECT id_municipio, COUNT(id_foco) AS total_focos
FROM `basedosdados.br_inpe_queimadas.microdados`
WHERE EXTRACT(YEAR FROM data_hora) = 2021 AND bioma = 'Mata Atlântica'
GROUP BY id_municipio
ORDER BY total_focos DESC
LIMIT 1;

SELECT EXTRACT(YEAR FROM data_hora) AS ano, COUNT(id_foco) AS total_focos
FROM `basedosdados.br_inpe_queimadas.microdados`
WHERE bioma = 'Cerrado' AND EXTRACT(YEAR FROM data_hora) BETWEEN 2015 AND 2023
GROUP BY ano
ORDER BY ano;

SELECT bioma, COUNT(id_foco) AS total_focos
FROM `basedosdados.br_inpe_queimadas.microdados`
WHERE EXTRACT(YEAR FROM data_hora) = 2005
GROUP BY bioma;

SELECT COUNT(DISTINCT sigla_uf) AS total_estados, COUNT(DISTINCT EXTRACT(YEAR FROM data_hora)) AS total_anos
FROM `basedosdados.br_inpe_queimadas.microdados`;
