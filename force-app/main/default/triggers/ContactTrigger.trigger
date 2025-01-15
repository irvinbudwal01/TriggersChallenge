trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete) {
    switch on Trigger.OperationType {
        when BEFORE_INSERT {
            ContactHelper.SetDefaultEmail(Trigger.new);
            ContactHelper.PreventDuplicatePhone(Trigger.new);
        }

        when BEFORE_UPDATE {
            ContactHelper.UpdatePhones(Trigger.new);
        }
    }
}