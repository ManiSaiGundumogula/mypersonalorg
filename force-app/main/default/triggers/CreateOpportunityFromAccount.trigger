trigger CreateOpportunityFromAccount on Account (after insert) {
    for(Account record: trigger.new){
    OpportunityCreation.createOpportunity(record);
        }
}