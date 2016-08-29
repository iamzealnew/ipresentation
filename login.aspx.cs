using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class login : System.Web.UI.Page
    {
        public static String username1;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {

            if (username1 != null && txtUserPass.Text.Length>0)
            {
                if (ValidateUser(username1, txtUserPass.Text))
                    FormsAuthentication.RedirectFromLoginPage(txtUserName.Text,
                        true);
                else
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "alert('NO MATCH')", true);
            }

        }

    
        private bool ValidateUser(string userName, string passWord)
        {
            SqlConnection conn;
            SqlCommand cmd;
            string lookupPassword = null;
            System.Diagnostics.Trace.WriteLine("olalalalalalaal");

            System.Diagnostics.Trace.WriteLine(userName);
            System.Diagnostics.Trace.WriteLine(passWord);

            System.Diagnostics.Trace.WriteLine("olalalalalalal");

            // Check for invalid userName.
            // userName must not be null and must be between 1 and 15 characters.
            if ((null == userName) || (0 == userName.Length) )
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of userName failed.");
                return false;
            }

            // Check for invalid passWord.
            // passWord must not be null and must be between 1 and 25 characters.
            if ((null == passWord) || (0 == passWord.Length) || (passWord.Length > 25))
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of passWord failed.");
                return false;
            }

            try
            {
                // Consult with your SQL Server administrator for an appropriate connection
                // string to use to connect to your local SQL Server.
                conn = new SqlConnection(@"Data Source=(localdb)\ProjectsV13;Initial Catalog=test;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                conn.Open();

                // Create SqlCommand to select pwd field from users table given supplied userName.
                cmd = new SqlCommand("Select password from employeeAdd where Email=@userName", conn);
                cmd.Parameters.Add("@userName", SqlDbType.VarChar, 25);
                cmd.Parameters["@userName"].Value = userName;

                // Execute command and fetch pwd field into lookupPassword string.
                lookupPassword = (string)cmd.ExecuteScalar();

                // Cleanup command and connection objects.
                cmd.Dispose();
                conn.Dispose();
            }
            catch (Exception ex)
            {
                // Add error handling here for debugging.
                // This error message should not be sent back to the caller.
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Exception " + ex.Message);
            }

            // If no password found, return false.
            if (null == lookupPassword)
            {
                // You could write failed login attempts here to event log for additional security.
                return false;
            }

            // Compare lookupPassword and input passWord, using a case-sensitive comparison.
            return (0 == string.Compare(lookupPassword, passWord, false));

        }

       
        protected void clientBtn_Click1(object sender, EventArgs e)

        {

            System.Threading.Thread.Sleep(2000);



            System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of passWord failedasdadasdasdadsadsadsadsasdasdadasda.");

            SqlConnection conn;
            SqlCommand cmd;
            conn = new SqlConnection(@"Data Source=(localdb)\ProjectsV13;Initial Catalog=test;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            conn.Open();

            // Create SqlCommand to select pwd field from users table given supplied userName.
            cmd = new SqlCommand("Select password from employeeAdd where Email=@userName", conn);
            cmd.Parameters.Add("@userName", SqlDbType.VarChar, 25);
            cmd.Parameters["@userName"].Value = txtUserName.Text;

            System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of passWord failed."+ txtUserName.Text);



            String lookupuser = (string)cmd.ExecuteScalar();
            SqlDataReader dr = cmd.ExecuteReader();

            if (!dr.Read())
            {
                uerror.Visible = true;

            }
            else
            {
                username1 = txtUserName.Text;
                //   Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "swap()", true);
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "swap()", true);

                //clientBtn.OnClientClick = "return swap()";
                // this.ClientScript.RegisterStartupScript(this.GetType(), "clientClick", "clickHyperlink", true);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "test", "<script type='text/javascript'>swap()</script>");//call javascript function

            }

        }
    }
}