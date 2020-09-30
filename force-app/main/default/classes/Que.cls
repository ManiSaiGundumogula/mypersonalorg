public class Que implements Queueable{
    public void execute(QueueableContext con){
        Account acc= new Account(name='testing demo');
        insert acc;
    }
}
   //Id JobId=system.EnqueueJob(new que());