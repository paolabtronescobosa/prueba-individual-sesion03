--Para A1:

--Días con demanda superior a 800 GWh

SELECT strftime('%Y', fecha) AS año,
       COUNT(*) AS dias_800
FROM demanda
WHERE demanda_gwh > 800
GROUP BY año;

--Fechas con demanda superior a 800 GWh
SELECT fecha,
       strftime('%w', fecha) AS dia_semana,
       demanda_gwh
FROM demanda
WHERE demanda_gwh > 800
ORDER BY fecha ASC;

--Días con demanda superior a 800 GWh por año
SELECT strftime('%Y', fecha) AS año,
       strftime('%w', fecha) AS num_dia,
	   CASE strftime('%w', fecha)
            WHEN '0' THEN 'Domingo'
            WHEN '1' THEN 'Lunes'
            WHEN '2' THEN 'Martes'
            WHEN '3' THEN 'Miércoles'
            WHEN '4' THEN 'Jueves'
            WHEN '5' THEN 'Viernes'
            WHEN '6' THEN 'Sábado'
       END AS dia_semana,
       COUNT(*) AS dias_800
FROM demanda
WHERE demanda_gwh > 800
GROUP BY año, num_dia
ORDER BY año, num_dia;

--Meses con demanda superior a 800 GWh por año
SELECT strftime('%Y', fecha) AS año,
       strftime('%m', fecha) AS mes,
	          COUNT(*) AS dias_800
FROM demanda
WHERE demanda_gwh > 800
GROUP BY año, mes
ORDER BY año, mes;

--Fecha del día con demanda más baja
SELECT fecha,
       strftime('%Y', fecha) AS año,
       demanda_gwh
FROM demanda
ORDER BY demanda_gwh ASC
LIMIT 1;

--Para A2:

--Demanda media por año
SELECT año,
       AVG(CASE WHEN descanso = 0 THEN demanda_gwh END) AS laborable,
       AVG(CASE WHEN descanso = 1 THEN demanda_gwh END) AS descanso,
       100.0 * (AVG(CASE WHEN descanso = 0 THEN demanda_gwh END)
              - AVG(CASE WHEN descanso = 1 THEN demanda_gwh END))
             / AVG(CASE WHEN descanso = 0 THEN demanda_gwh END) AS pct_menos
FROM (
    SELECT d.fecha,
           strftime('%Y', d.fecha) AS año,
           d.demanda_gwh,
           CASE WHEN strftime('%w', d.fecha) IN ('0', '6')
                  OR f.fecha IS NOT NULL
                THEN 1 ELSE 0 END AS descanso
    FROM demanda AS d
    LEFT JOIN festivos AS f ON d.fecha = f.fecha
)
GROUP BY año;

--Para A3:

--Mes con mayor demanda media:
SELECT strftime('%Y', fecha) AS año,
       strftime('%m', fecha) AS mes,
       AVG(demanda_gwh) AS demanda_media
FROM demanda
GROUP BY año, mes
ORDER BY demanda_media DESC
LIMIT 1;

--Mes con menor demanda media:
SELECT strftime('%Y', fecha) AS año,
       strftime('%m', fecha) AS mes,
       AVG(demanda_gwh) AS demanda_media
FROM demanda
GROUP BY año, mes
ORDER BY demanda_media ASC
LIMIT 1;

Para B1:

--Demanda de los 5 días más calurosos
SELECT d.fecha,
       strftime('%w', d.fecha) AS dia_semana,
       d.demanda_gwh,
       t.t_med
FROM demanda AS d
JOIN temperatura_nacional AS t ON d.fecha = t.fecha
ORDER BY t.t_med DESC
LIMIT 5;

--Demanda según dia de la semana y tipo de día (laborable o descanso)
SELECT strftime('%w', d.fecha) AS num_dia,      
         CASE strftime('%w', d.fecha)
                WHEN '0' THEN 'Domingo'
                WHEN '1' THEN 'Lunes'
                WHEN '2' THEN 'Martes'
                WHEN '3' THEN 'Miércoles'
                WHEN '4' THEN 'Jueves'
                WHEN '5' THEN 'Viernes'
                WHEN '6' THEN 'Sábado'
         END AS dia_semana,
         CASE WHEN strftime('%w', d.fecha) IN ('0', '6')
                    OR f.fecha IS NOT NULL
                 THEN 1 ELSE 0 END AS descanso,
         AVG(d.demanda_gwh) AS demanda_media            
FROM demanda AS d
LEFT JOIN festivos AS f ON d.fecha = f.fecha    
GROUP BY num_dia, descanso
ORDER BY num_dia, descanso;

Para B2:
--Tipos de tecnologías de generación:
SELECT DISTINCT tecnologia 
    FROM generacion;

--Generación total para la tecnología solar fotovoltaica
SELECT strftime('%Y', fecha) AS año,
    SUM(gwh) / 1000.0 AS fotovoltaica_twh
    FROM generacion
    WHERE tecnologia = 'Solar fotovoltaica'
    GROUP BY año;

--Generación total de energía por año
SELECT strftime('%Y', fecha) AS año,
    SUM(gwh) / 1000.0 AS total_twh
FROM generacion
GROUP BY año;

Para B3:
--Ciudades con más días de lluvia (lluvia_mm >= 1)
SELECT ciudad, COUNT(*) AS dias_lluvia
    FROM tiempo
    WHERE lluvia_mm >=1
    GROUP BY ciudad
    ORDER BY dias_lluvia DESC;



