/**
 * @author Leszek Szczotka
 * @date 18/01/2022
 * @description Class created to send email to director with new offers.
 */
public class SendEmailToDirector {
  /**
   * @author Leszek Szczotka
   * @date 18.01.2022
   * @description method responsibility for creating and sending emails with new offers
   */
  @future(callout=true)
  public static void sendEmail(List<Id> inOffers) {
    if (inOffers != null & inOffers.size() > 0) {
      Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
      List<String> address = new List<String>();
      address.add(Utils.DIRECTOR_EMAIL);
      email.setToAddresses(address);
      email.setSubject(Utils.EMAIL_SUBJECT);
      email.setPlainTextBody(Utils.EMAIL_BODY + inOffers.size());
      Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ email });
    }
  }
}
