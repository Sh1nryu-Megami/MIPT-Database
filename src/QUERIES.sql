# (1) Получить количество работников по каждой из должностей

SELECT WORKER_TITLE, COUNT(*) AS WORKER_COUNT
FROM WORKER
GROUP BY WORKER_TITLE;

# (2) Еще неначатые проекты

SELECT *
FROM PROJECT
WHERE PROJECT_STATUS = 'Не начат';

# (3) Материалы со стоимостью выше среднего

SELECT *
FROM MATERIAL
WHERE METERIAL_COST > (SELECT AVG(METERIAL_COST) FROM MATERIAL);

# (4) Работинки работающие над 2 и более проектами

SELECT WORKER_ID, COUNT(PROJECT_ID) AS PROJECT_COUNT
FROM PROJECT_WORKER
GROUP BY WORKER_ID
HAVING COUNT(PROJECT_ID) > 1;


# (5) Проект, который заказ какой-то конкретный клиент

SELECT *
FROM PROJECT
WHERE CLIENT_ID = (SELECT CLIENT_ID FROM CLIENT WHERE CLIENT_NAME = 'Дмитрий' AND CLIENT_SURNAME = 'Иванов');

# (6) Самый дорогой материал, используемый в проекте

SELECT MAX(METERIAL_COST) AS MAX_COST
FROM MATERIAL
JOIN PROJECT_MATERIAL ON MATERIAL.MATERIAL_ID = PROJECT_MATERIAL.MATERIAL_ID
WHERE PROJECT_MATERIAL.PROJECT_ID = 1;

# (7) Проекты, котоыре будут завершены в следующем месяце (по календарю ирл)

SELECT *
FROM PROJECT
WHERE PROJECT_END BETWEEN '2024-05-01' AND '2024-05-31';


# (8) Количество материалов, заказанных для каждого из проектов

SELECT PROJECT_ID, COUNT(MATERIAL_ID) AS MATERIAL_COUNT
FROM PROJECT_MATERIAL
GROUP BY PROJECT_ID;

# (9) Клиент, который заказ более одного проекта 

SELECT CLIENT_ID, COUNT(PROJECT_ID) AS PROJECT_COUNT
FROM PROJECT
GROUP BY CLIENT_ID
HAVING COUNT(PROJECT_ID) > 1;


# (10) Просто список всех проектов, отсортированных по дате начала

SELECT *
FROM PROJECT
ORDER BY PROJECT_START;
