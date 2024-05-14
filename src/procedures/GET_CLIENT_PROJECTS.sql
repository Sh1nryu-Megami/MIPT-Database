CREATE OR REPLACE PROCEDURE GET_CLIENT_PROJECTS(p_client_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT * FROM PROJECT WHERE CLIENT_ID = p_client_id;
END; $$