public with sharing class OrderHelper {
    public OrderHelper() {

    }

    public static void SetProduct(List<Order> orderList) {
        List<OrderItem> jncList = new List<OrderItem>();

        List<Product2> productList = [SELECT Id FROM Product2 WHERE Id='01tak00000CSECjAAP'];

        for(Order o : orderList) {
            OrderItem newJnc = new OrderItem();

            newJnc.OrderId = o.Id;
            newJnc.Product2Id = productList[0].Id; //Installation portable ID.

            jncList.add(newJnc);
        }
        insert jncList;
    }
}