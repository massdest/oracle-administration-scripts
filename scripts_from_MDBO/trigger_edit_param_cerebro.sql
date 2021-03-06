CREATE OR REPLACE TRIGGER "SYS"."SYS$_000003"
  BEFORE INSERT OR UPDATE
  ON CER_PARAM.PARAMETER
  FOR EACH ROW
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  IF (inserting) AND (:NEW.NAME = '_aud_ddl_') AND (:NEW.UV = '0')
  THEN
    EXECUTE IMMEDIATE 'ALTER TRIGGER SYS.sys$_000002 ENABLE';
  END IF;
  IF (inserting) AND (:NEW.NAME = '_aud_ddl_') AND (:NEW.UV = '1')
  THEN
    EXECUTE IMMEDIATE 'ALTER TRIGGER SYS.sys$_000002 DISABLE';
  END IF;
  IF (updating) AND (:OLD.NAME = '_aud_ddl_') AND (:NEW.UV = '0')
  THEN
    EXECUTE IMMEDIATE 'ALTER TRIGGER SYS.sys$_000002 ENABLE';
  END IF;
  IF (updating) AND (:OLD.NAME = '_aud_ddl_') AND (:NEW.UV = '1')
  THEN
    EXECUTE IMMEDIATE 'ALTER TRIGGER SYS.sys$_000002 DISABLE';
  END IF;
END;

ALTER TRIGGER "SYS"."SYS$_000003" ENABLE
