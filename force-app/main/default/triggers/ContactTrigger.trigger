trigger AccountTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete) {
    switch on Trigger.OperationType {
        when BEFORE_INSERT {
            ContactHelper.SetDefaultEmail(Trigger.new);
        }
    }
}