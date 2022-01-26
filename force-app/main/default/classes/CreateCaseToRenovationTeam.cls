public class CreateCaseToRenovationTeam implements Queueable, Database.AllowsCallouts {
  private List<Salon__c> salons;

  public CreateCaseToRenovationTeam(List<Salon__c> salons) {
    this.salons = salons;
  }

  public void execute(QueueableContext context) {
    List<Case> cases = new List<Case>();
    for (Salon__c salon : salons) {
      cases.add(
        new Case(
          Subject = Utils.RENOVATION_CASE + salon.Name,
          Salon__c = salon.Id
        )
      );
    }
    insert cases;
    System.enqueueJob(new CreateCaseToRenovationTeamRequestSender(cases));
  }
}
