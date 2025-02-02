# Proyecto de ventas 

### Origen de los datos

Ventas de diferentes productos realizados del año 2019 al 2024.

### Desarrollo del proyecto

- Se utilizó **Python**, para realizar la importación de los datos que se encuentran en distintos archivos CSV. Posteriormente, se realizó la unión de todos los datos en un solo DataFrame.
  Además, se realizó la limpieza de los datos y exportación de los datos limpios en un archivo CSV.


- Se utilizó **SQL Server**, para realizar la normalización (1FN, 2FN y 3FN) de la base de datos limpios del archivo CSV. Se crearon las tablas de dimensión: ciudad, categoría, producto, calendario. Una tabla de hechos. 

- Se importan en **Power Bi** las diferentes tablas que fueron hechas con SQL Server. Posteriormente, se realizaron las relaciones entre las tablas y  se realizó una tabla calendario con DAX para poder realizar las comparaciones de ventas realizadas en el último mes y año.
 Además, se creó un reporte de las ventas.

    - Modelo
      ![image](https://github.com/user-attachments/assets/ed6c43e0-d8eb-46f1-8065-be54d96d5e5a)

    - Dashboard
      ![image](https://github.com/user-attachments/assets/1b4cacbd-d468-440b-8d4e-a376448ff363)

      ![image](https://github.com/user-attachments/assets/1697b892-fe2c-4337-aed5-0aa675a82be2)


