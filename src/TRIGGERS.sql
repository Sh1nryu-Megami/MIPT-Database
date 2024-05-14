CREATE TRIGGER LOG_UPDATE
AFTER UPDATE ON PROJECT
FOR EACH ROW
WHEN (OLD.PROJECT_STATUS != NEW.PROJECT_STATUS)
BEGIN
    INSERT INTO PROJECT_STATUS_HISTORY (PROJECT_ID, PROJECT_STATUS, CHANGE_DATE)
    VALUES (NEW.PROJECT_ID, NEW.PROJECT_STATUS, CURRENT_DATE);
END;

CREATE TRIGGER CHECK_LIMIT
BEFORE INSERT ON PROJECT_WORKER
FOR EACH ROW
DECLARE
    worker_count INT;
BEGIN
    SELECT COUNT(*) INTO worker_count FROM PROJECT_WORKER WHERE PROJECT_ID = NEW.PROJECT_ID;
    IF worker_count >= 10 THEN
        RAISE EXCEPTION 'Превышен лимит работников в проекте';
    END IF;
END;

CREATE TRIGGER CHECK_MATERIAL
BEFORE INSERT ON ORDER_MATERIAL
FOR EACH ROW
DECLARE
    material_count INT;
BEGIN
    SELECT COUNT(*) INTO material_count FROM MATERIAL WHERE MATERIAL_ID = NEW.MATERIAL_ID;
    IF material_count <= 0 THEN
        RAISE EXCEPTION 'Недостаточно материалов на складе';
    END IF;
END;