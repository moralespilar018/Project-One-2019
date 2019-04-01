public with sharing class TransactionCloneButtonExtension {

    private ApexPages.StandardController ctrl;
    public TransactionCloneButtonExtension(ApexPages.StandardController ctrl){
        this.ctrl = ctrl;
		//fields that are cloned 
        this.ctrl.addFields(new List<String> {'Name', 'BankAccount__c', 'Budget__c', 'RecordTypeId', 'Deposit_Type__c', 
        										'PurchaseCategory__c', 'PurchaseSubClass__c', 'TransactionDate__c', 'Amount__c'});  
    }
    
    public PageReference cloneTransaction(){
        // Transaction beign cloned 
        Transaction__c currTransaction = (Transaction__c)ctrl.getRecord(); 
        // Logic for clone button 
        Transaction__c cloneTransaction = new Transaction__c(); 
        cloneTransaction.Name = currTransaction.Name;
        cloneTransaction.BankAccount__c = currTransaction.BankAccount__c; 
        cloneTransaction.Budget__c = currTransaction.Budget__c; 
        cloneTransaction.RecordTypeId = currTransaction.RecordTypeId; 
        cloneTransaction.Deposit_Type__c = currTransaction.Deposit_Type__c;
        cloneTransaction.PurchaseCategory__c = currTransaction.PurchaseCategory__c; 
        cloneTransaction.PurchaseSubClass__c = currTransaction.PurchaseSubClass__c; 
		cloneTransaction.TransactionDate__c = currTransaction.TransactionDate__c; 
        cloneTransaction.Amount__c = currTransaction.Amount__c; 
        insert cloneTransaction; 
        //show cloned record
        return new ApexPages.StandardController(cloneTransaction).view();
               
    }
}