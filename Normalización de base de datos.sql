-- Tabla original

SELECT * FROM dbo.[Datos ventas limpios] AS total

-- Normalizaci�n de datos

-- 1NF
	-- Atomicidad
	-- No filas ni columnas duplicadas
	-- Crear una tabla para cada conjunto de datos relacionados.
	-- Identifique cada conjunto de datos relacionados con una clave primaria.

-- 2NF
	-- 1NF
	-- Las columnas son dependentes de la clave primaria
	-- Relacione las tablas con una clave externa

-- 3NF
	-- 2NF
	-- Eliminar las columnas que no dependan de la clave primaria
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

-- Realizamos la creaci�n de tablas para cada conjunto de datos relacionados.
	-- Es decir, una tabla para productos, order_date, city, categor�a, state, adress y post_code

-- tabla Category

CREATE VIEW dim_category AS (
SELECT RANK() OVER(ORDER BY total.category ) AS id_category,
		total.category 
FROM dbo.[Datos ventas limpios] total
GROUP BY total.category
);

SELECT * FROM dim_category

-- tabla City / state

CREATE VIEW dim_city_state AS (
SELECT RANK() OVER(ORDER BY total.city_state) AS id_city_state, 
		total.city_state 
FROM dbo.[Datos ventas limpios] AS total
GROUP BY total.city_state
);


SELECT * FROM dbo.dim_city_state


-- Producto

CREATE VIEW dim_product AS(
SELECT RANK() OVER(ORDER BY total.product ) AS id_product,
		total.product, dimcat.id_category
FROM dbo.[Datos ventas limpios] AS total
JOIN dim_category dimcat ON dimcat.category = total.category
GROUP BY total.product, dimcat.id_category
);

SELECT * FROM dim_product


-- Calendario

CREATE VIEW dim_calendario AS(
SELECT fecha,
		DAY(calen.fecha) AS d�a,
		MONTH(calen.fecha) AS mes,
		YEAR(calen.fecha) AS a�o,
		DATEPART(dw, calen.fecha) AS dia_semana,
		DATENAME(dw, calen.fecha) AS nombre_dia,
		DATENAME(month, calen.fecha) AS nombre_mes,
		CASE
			WHEN DATEPART(dw, calen.fecha) IN (1,7) THEN 'Fin de semana'
			ELSE 'D�a laboral'
	    END AS tipo_dia
FROM (SELECT CAST(total.order_date AS DATE) AS fecha
	  FROM dbo.[Datos ventas limpios] AS total) AS calen
);

SELECT * FROM dim_calendario


-- Tabla de hechos

CREATE VIEW hecho_ventas AS(
SELECT
		total.order_date,
		dimpro.id_product,
		dimcitystate.id_city_state,
		total.quantity_ordered,
		total.price_each
FROM dbo.[Datos ventas limpios] AS total
JOIN dim_product dimpro ON total.product = dimpro.product
JOIN dim_city_state dimcitystate ON dimcitystate.city_state =  total.city_state
);

SELECT * FROM hecho_ventas 