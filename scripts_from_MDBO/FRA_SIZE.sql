select ROUND((SPACE_USED)/1024/1024/1024) "������ GB", ROUND((SPACE_LIMIT)/1024/1024/1024) "������ GB", ROUND(((SPACE_LIMIT)-(SPACE_USED))/1024/1024/1024) "�������� GB"
from V$recovery_File_Dest
