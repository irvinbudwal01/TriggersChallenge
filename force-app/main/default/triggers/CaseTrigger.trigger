trigger CaseTrigger on Case (before insert, before update, before delete, after insert, after update, after delete) {

    switch on Trigger.OperationType {
        when BEFORE_INSERT {
            CaseHelper.SetStatusNew(Trigger.new); //only sending triggering records
        }

        when BEFORE_UPDATE {
            CaseHelper.SetStatusWorking(Trigger.old, Trigger.new);
        }

    }
}