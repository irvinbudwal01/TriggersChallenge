trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete) {
    switch on Trigger.OperationType {
        when BEFORE_UPDATE {
            
        }

        when AFTER_INSERT {
            AccountHelper.CreateRelatedContact(Trigger.new);
        }

        when BEFORE_DELETE {
            AccountHelper.PreventDelete(Trigger.old);
        }
    
    }
}