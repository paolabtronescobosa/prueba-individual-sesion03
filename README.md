# Prueba individual · Sesión 03

**Career Tech Hub · Empleo Data + IA**
Autora: Paola Tron Escobosa
Fecha de entrega: noviembre de 2026

Prueba técnica sobre la demanda y la generación de electricidad en España (del 01/01/2023 al 15/11/2026), resuelta con **Python (pandas)**, **SQL (SQLite)** y **Excel**.

---

## Contenido del repositorio

```
prueba-individual-sesion03/
├── README.md
├── notebook/
│   └── Prueba_individual_Paola Tron Escobosa.ipynb   ← cuaderno con las partes A, B y D
├── datos/
│   ├── electricidad.db                               ← base de datos SQLite
│   └── electricidad_para_panel.xlsx                  ← datos para la parte C
├── Consultas_SQL/
│   └── consultas.sql                                 ← consultas de la parte B
└── parte_C/
    └── capturas de la tabla dinámica y del gráfico (Excel)
```

## Partes resueltas

| Parte | Herramienta | Contenido |
|---|---|---|
| A | pandas | Días con demanda > 800 GWh, demanda en laborables vs. descanso, meses de mayor y menor demanda |
| B | SQL | Días más calurosos y su demanda, generación solar fotovoltaica, días de lluvia por ciudad y reto con `LAG` |
| C | Excel | Tabla dinámica de demanda media (mes × año) y gráfico de generación por tecnología en 2025 |
| D | — | Decisiones, resultado principal, límites del análisis y uso de IA |

Además de lo que pedía cada pregunta, se añadieron gráficos y comprobaciones para apoyar las conclusiones (por ejemplo, la relación entre temperatura y demanda o la generación solar por mes).

## Principales resultados

- **A1.** 115 días superaron los 800 GWh: 16 en 2023, 10 en 2024, 25 en 2025 y 64 en 2026, aunque este último año aún no está completo.
- **A2.** En un día de descanso se demanda entre un 13,5 % y un 14,5 % menos de electricidad que en un día laborable, y la diferencia se mantiene estable todos los años.
- **A3.** El mes con mayor demanda media fue julio de 2026 (814,83 GWh) y el de menor, abril de 2023 (610,56 GWh). La demanda tiene dos picos al año (invierno y verano) y dos valles (primavera y otoño).
- **B1.** Los cinco días más calurosos superan la media de su tipo de día (laborable o descanso), pero solo uno pasa de 800 GWh, porque tres de ellos cayeron en fin de semana.
- **B2.** La fotovoltaica pasó de 37,45 TWh (14,2 %) en 2023 a 50,29 TWh (18,5 %) en 2025. El 22,4 % de 2026 probablemente esté sobreestimado, porque faltan noviembre y diciembre, que son meses de poca generación solar.
- **B3.** Bilbao es la ciudad con más días de lluvia (611) y Valencia la que menos tiene (218).
- **Reto.** La mayor subida diaria fue el 29/04/2025 (+186,71 GWh), por la recuperación tras el apagón del 28/04/2025, cuando la demanda cayó a 403 GWh.
- **C1.** Noviembre de 2026 no se puede comparar con los demás meses, porque solo incluye la primera quincena.
- **C2.** La eólica fue la tecnología con mayor generación en 2025, con un 22 % del total.

## Limitaciones

- Los datos de 2026 llegan hasta el 15/11/2026, así que la media anual de 2026, noviembre de 2026 y los porcentajes de ese año no son del todo comparables con los de los años completos.
- En la B3 se cuentan días de lluvia, no la cantidad de lluvia caída.
- La relación entre temperatura y demanda no permite separar el efecto del clima de otros factores (día de la semana, vacaciones o aumento general del consumo). Para eso harían falta datos de demanda por sector.

## Cómo ejecutar el cuaderno

1. Clona o descarga el repositorio, manteniendo la estructura de carpetas.
2. Instala las librerías necesarias:
   ```
   pip install pandas matplotlib openpyxl
   ```
3. Abre `notebook/Prueba_individual_Paola Tron Escobosa.ipynb` en Jupyter o VS Code y ejecuta todas las celdas. El cuaderno lee los datos de la carpeta `datos/` con rutas relativas (`../datos/...`).

## Uso de IA

Se usó una IA como apoyo durante la prueba. El detalle de para qué se usó y cómo se comprobaron los resultados está en la respuesta **D4** del cuaderno.
