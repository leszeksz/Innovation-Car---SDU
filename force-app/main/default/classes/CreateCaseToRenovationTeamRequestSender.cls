/**
 * @author Leszek Szczotka
 * @date 18/01/2022
 * @description Class responsible for integration with renovation system
 */
public class CreateCaseToRenovationTeamRequestSender implements Queueable, Database.AllowsCallouts {
  private List<Case> caseList;

  public CreateCaseToRenovationTeamRequestSender(List<Case> cases) {
    this.caseList = cases;
  }

  public void execute(QueueableContext ctx) {
    sendRequest();
  }

  private HttpResponse sendRequest() {
    Http server = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint(Utils.JSON_ENDPOINT);
    req.setMethod(Utils.POST);
    req.setBody(JSON.serialize(caseList));
    HttpResponse resp = server.send(req);
    if (resp.getStatusCode() == 201) {
      for (Case newCase : caseList) {
        newCase.Status = Utils.STATUS_CASE_CLOSED;
      }
    } else {
      for (Case newCase : caseList) {
        newCase.Status = Utils.STATUS_CASE_FAILED;
      }
    }
    {
      System.debug(LoggingLevel.ERROR, Utils.CONNECTION_ERROR_MESSAGE);
    }
    update caseList;
    return resp;
  }
}
