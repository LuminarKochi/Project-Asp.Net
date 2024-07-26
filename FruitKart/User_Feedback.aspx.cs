using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;

namespace FruitKart
{
    public partial class User_Feedback : System.Web.UI.Page
    {
        private ConnectionClass clsobj;

        protected void Page_Load(object sender, EventArgs e)
        {
            clsobj = new ConnectionClass(); // Initialize the connection class
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Generate new feedback_id
            string sel = "SELECT ISNULL(MAX(feedback_id), 0) FROM feedback_tb";
            string feedbackIdStr = clsobj.Fn_ExeScalar(sel);
            int feedbackId = Convert.ToInt32(feedbackIdStr) + 1;

            // Get the user ID and feedback from the form
            string userId = Session["userid"]?.ToString();
            string feedback = FeedbackText.Text;

            // Ensure feedback is not empty
            if (!string.IsNullOrEmpty(feedback))
            {
                // Insert feedback into the database
                string ins = $"INSERT INTO feedback_tb (feedback_id, user_id, feedback,reply, feedback_status) " +
                             $"VALUES ({feedbackId}, '{userId}', '{feedback}','Waiting', 'pending')";

                int i = clsobj.Fn_ExeNonQuery(ins);
                if (i == 1)
                {
                    // Send feedback email
                    SendFeedbackEmail(userId, feedback);

                    // Show success message
                    LabelMessage.Text = "Your feedback has been submitted successfully.";
                    FeedbackText.Text = string.Empty;
                }
                else
                {
                    LabelMessage.Text = "Failed to submit your feedback.";
                }
            }
            else
            {
                LabelMessage.Text = "Please enter your feedback.";
            }
        }

        private void SendFeedbackEmail(string userId, string feedback)
        {
            string adminEmail = "adhithyasomaraj@gmail.com"; // Admin email address
            string userEmail = GetUserEmail(userId);
            string subject = "New Feedback from User";
            string body = $"User ID: {userId}<br/>Feedback: {feedback}";

            SendEmail("Your Name", "somarajadhithya@gmail.com", "uqsb bhbl szwq pvpz", "Admin", adminEmail, subject, body);
        }

        private string GetUserEmail(string userId)
        {
            string query = $"SELECT email FROM user_reg_tb WHERE user_id = '{userId}'";
            return clsobj.Fn_ExeScalar(query);
        }

        public static void SendEmail(string yourName, string yourGmailUserName, string yourGmailPassword, string toName, string toEmail, string subject, string body)
        {
            string to = toEmail; // To address
            string from = yourGmailUserName; // From address
            MailMessage message = new MailMessage(from, to);

            string mailbody = body;
            message.Subject = subject;
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); // Gmail SMTP
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential(yourGmailUserName, yourGmailPassword);
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
