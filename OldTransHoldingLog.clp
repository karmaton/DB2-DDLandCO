select substr(uow.workload_occurrence_state,1,20) as "Status",
        substr(uow.session_auth_id,1,10) as "Authid",
        uow.application_handle as "Appl Handle",
        int(uow.UOW_LOG_SPACE_USED/1024/1024) as "Log Used (M)",
        uow.total_act_time as "Total Activity time(msec)",
        uow.total_act_wait_time as "Total Activity Wait time",
        uow.uow_start_time as "UOW Start Time"
from  table (MON_GET_TRANSACTION_LOG(-1)) as db, 
    table (MON_GET_UNIT_OF_WORK(NULL,-1)) as uow
where  uow.application_handle  = db.APPLID_HOLDING_OLDEST_XACT ;

