--LOCK TABLE SIP.TB_WTMPS_SESSIONS_ARCHIVE IN EXCLUSIVE MODE NOWAIT;
--rollback;
--commit;
--alter session set ddl_lock_timeout =300;
--alter table SIP.TB_WTMPS_SESSIONS_ARCHIVE disable table lock; 