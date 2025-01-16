trigger OrderTrigger on Order (before insert, before update, before delete, after insert, after update, after delete) {

    switch on Trigger.OperationType {
        when BEFORE_INSERT {
            OrderHelper.SetProduct(Trigger.new); //only sending triggering records
        }
    }
}