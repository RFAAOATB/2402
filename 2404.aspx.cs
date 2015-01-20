using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimpleMailer
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            inputDate.Text = DateTime.Now.ToShortDateString();
            inputTime1.Text = DateTime.Now.ToString("HH:mm");
        }

        

        protected void SendMailButton_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(emailTo.Text);
                mailMessage.From = new MailAddress("another@mail-address.com");
                mailMessage.Subject = "Emailed DA2404";
                StringBuilder sb = new StringBuilder();
                // Need to request to id parameter
                sb.AppendLine(string.Format("Organization: {0}",Request.Form["inputOrganization"]));
                sb.AppendLine(string.Format("Nomenclature and Model: {0}", Request.Form["inputModel"]));
                sb.AppendLine(string.Format("Registration/Serial/NSN: {0}", Request.Form["inputNSN"]));
                sb.AppendLine(string.Format("Miles: {0} \r\nHours: {1}\r\nRounds Fired: {2}\r\nHot Starts: {3}", Request.Form["inputMiles"], Request.Form["inputHours"], Request.Form["inputRoundsFired"], Request.Form["inputHotStarts"]));
                sb.AppendLine(string.Format("Date: {0}", Request.Form["inputDate"]));
                sb.AppendLine(string.Format("Type Inspection: {0}", Request.Form["inputInspection"]));
                sb.AppendLine(string.Format("First Applicable Refernce: {0} {1}", Request.Form["inputTM1"], Request.Form["inputTMD1"]));
                sb.AppendLine(string.Format("Second Applicable Refernce: {0} {1}", Request.Form["inputTM2"], Request.Form["inputTMD2"]));
                sb.AppendLine(string.Format("Inspector Signature: {0} {1}", Request.Form["inputSig1"], Request.Form["inputTime1"]));
                sb.AppendLine(string.Format("Supervisor Signature: {0} {1}", Request.Form["inputSig2"], Request.Form["inputTime2"]));
                // Need to have one or many rows print.
                // First row will be there.
                sb.AppendLine(
                    string.Format(
                        "TM Item Number: {0}\r\nStatus: {1}\r\nDeficiencies and Shortcomings: {2}\r\nCorrective Action: {3}\r\nInitial When Corrected: {4}",
                        Request.Form["inputItemNumber"], Request.Form["inputStatus"], Request.Form["inputDeficiencies"],
                        Request.Form["inputCorrectiveAction"],Request.Form["inputInitials"]));
                // Subsequent rows from the button will have a name and number from the Javascript
                var addedRowCount = 1;
                while (Request.Form["inputItemNumber" + addedRowCount.ToString()] != null)
                {
                    sb.AppendLine(
                    string.Format(
                        "TM Item Number: {0}\r\nStatus: {1}\r\nDeficiencies and Shortcomings: {2}\r\nCorrective Action{3}\r\nInitial When Corrected: {4}",
                        Request.Form["inputItemNumber" + addedRowCount.ToString()], Request.Form["inputStatus" + addedRowCount.ToString()], Request.Form["inputDeficiencies" + addedRowCount.ToString()],
                        Request.Form["inputCorrectiveAction" + addedRowCount.ToString()], Request.Form["inputInitials" + addedRowCount.ToString()]));
                    addedRowCount++;
                }

                mailMessage.Body = sb.ToString();
                SmtpClient smtpClient = new SmtpClient();
                //smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
               // smtpClient.Port = 587;
                //smtpClient.EnableSsl = true;
                //var NetworkCred = new System.Net.NetworkCredential("rfaaoatb@gmail.com", "MistySmith00++");
                //smtpClient.UseDefaultCredentials = true;
                //smtpClient.Credentials = NetworkCred;
                smtpClient.Send(mailMessage);
                HelloWorldLabel.Text="E-mail sent!";
            }
            catch (Exception ex)
            {
                HelloWorldLabel.Text="Could not send the e-mail - error: " + ex.Message;
            }
        }
    }
}