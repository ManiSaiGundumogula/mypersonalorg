public class TestClass {
    public static void testClassMethod(){
        Map<String, Schema.SObjectType> gd =Schema.getGlobalDescribe();
        system.debug('gd'+gd);
    }
}