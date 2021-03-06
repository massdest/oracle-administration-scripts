BEGIN
  SYS.DBMS_SCHEDULER.DROP_JOB
    (job_name  => 'SYS.MIGRATION_TO_SIPARCH');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB
    (
       job_name        => 'SYS.MIGRATION_TO_SIPARCH'
      ,start_date      => TO_TIMESTAMP_TZ('2016/09/16 14:00:55.454068 +03:00','yyyy/mm/dd hh24:mi:ss.ff tzr')
      ,repeat_interval => 'FREQ=MONTHLY;BYMONTHDAY=16'
      ,end_date        => NULL
      ,job_class       => 'DEFAULT_JOB_CLASS'
      ,job_type        => 'STORED_PROCEDURE'
      ,job_action      => 'SYS.MIGRATION_SIPARCH'
      ,comments        => NULL
    );
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'SYS.MIGRATION_TO_SIPARCH'
     ,attribute => 'RESTARTABLE'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'SYS.MIGRATION_TO_SIPARCH'
     ,attribute => 'LOGGING_LEVEL'
     ,value     => SYS.DBMS_SCHEDULER.LOGGING_FULL);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'SYS.MIGRATION_TO_SIPARCH'
     ,attribute => 'MAX_FAILURES');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'SYS.MIGRATION_TO_SIPARCH'
     ,attribute => 'MAX_RUNS');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'SYS.MIGRATION_TO_SIPARCH'
     ,attribute => 'STOP_ON_WINDOW_CLOSE'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'SYS.MIGRATION_TO_SIPARCH'
     ,attribute => 'JOB_PRIORITY'
     ,value     => 3);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'SYS.MIGRATION_TO_SIPARCH'
     ,attribute => 'SCHEDULE_LIMIT');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'SYS.MIGRATION_TO_SIPARCH'
     ,attribute => 'AUTO_DROP'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'SYS.MIGRATION_TO_SIPARCH'
     ,attribute => 'RAISE_EVENTS'
     ,value     => SYS.DBMS_SCHEDULER.JOB_STARTED + SYS.DBMS_SCHEDULER.JOB_SUCCEEDED + SYS.DBMS_SCHEDULER.JOB_FAILED + SYS.DBMS_SCHEDULER.JOB_BROKEN + SYS.DBMS_SCHEDULER.JOB_COMPLETED + SYS.DBMS_SCHEDULER.JOB_STOPPED + SYS.DBMS_SCHEDULER.JOB_SCH_LIM_REACHED + SYS.DBMS_SCHEDULER.JOB_DISABLED + SYS.DBMS_SCHEDULER.JOB_CHAIN_STALLED);

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'SYS.MIGRATION_TO_SIPARCH');
END;
/
