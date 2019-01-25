CREATE TABLESPACE CBT_ts DATAFILE 'd:/bizwork/ordata/CBT_ts' size 100M AUTOEXTEND ON NEXT 100K;

CREATE USER cbtUser IDENTIFIED by 1234 default tablespace CBT_ts;
GRANT DBA to cbtUser;