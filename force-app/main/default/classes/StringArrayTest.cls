public class StringArrayTest {
    public static list<String> generateStringArray(integer n){
        list<string> obj = new list<string>();
        String[] strings = new list<String>();
       
        //system.debug(strings);
      
        for(integer i=0;i<n;i++){
            obj.add('Test '+i);
        }
        system.debug(obj);
    	return obj;
    }
}