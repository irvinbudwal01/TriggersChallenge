trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete) {
    switch on Trigger.OperationType {
        when BEFORE_INSERT {
            AccountHelper.SetDefaultEmail(Trigger.new);
        }
    
        when BEFORE_UPDATE {
            
        }

        when BEFORE_DELETE {
            AccountHelper.PreventDelete(Trigger.old);
        }
    
    }
}