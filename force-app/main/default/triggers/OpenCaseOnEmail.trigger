trigger OpenCaseOnEmail on EmailMessage (after insert,after update) {
    List<Case> css=[select id,ClosedDate,Status,SuppliedEmail from Case where Status='Closed'];
     for(Case cas:css){ 
     
    for(EmailMessage c:trigger.new){
        //CaseComment caseIds=[select ParentId from CaseComment where id=:c.id];
       if(cas.ClosedDate!=null &&  cas.ClosedDate<=system.now() && c.FromAddress==cas.SuppliedEmail){
            // System.debug(caseIds);
          //  Case cs=[SELECT ClosedDate,Status FROM Case where id=:cas.id];
         //   System.debug(cs);
                cas.Status='Working';
                update cas;
                System.debug(cas);
            }
        }
    }
}