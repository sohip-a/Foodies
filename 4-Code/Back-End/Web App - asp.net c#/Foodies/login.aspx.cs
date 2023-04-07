using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodies
{
    public partial class login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBtnClicked(object sender, EventArgs e)
        {
            

            bool isAdmin = false;

            string email = Request["email"];
            string password = Request["password"];

            if(IsValidEmailAddress(email))
            {
                string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                SqlConnection myconnection = new SqlConnection(connectionString);
                myconnection.Open();

                string adminEmailSqlCommand = "select email , password from admin";
                SqlCommand adminSelectEmailComm = new SqlCommand(adminEmailSqlCommand, myconnection);

                SqlDataReader reader = adminSelectEmailComm.ExecuteReader();

                while (reader.Read())
                {
                    if (email.Equals(reader[0].ToString()) && password.Equals(reader[1].ToString()))
                    {
                        isAdmin = true;
                        Response.Redirect("adminPage.aspx");
                        break;
                    }
                }
                reader.Close();

                if (isAdmin == false)
                {
                    string userEmailSqlCommand = "select email, password from customer";
                    SqlCommand userSelectEmailComm = new SqlCommand(userEmailSqlCommand, myconnection);

                    reader = userSelectEmailComm.ExecuteReader();

                    while (reader.Read())
                    {
                        if (email.Equals(reader[0].ToString()) && password.Equals(reader[1].ToString()))
                        {
                            Response.Redirect("homepage.aspx?email=" + reader[0].ToString());
                            break;
                        }
                    }

                }

                if(!reader.Read())
                {
                    Response.Write("<script>alert('Please enter a valid Credentials to login');</script>");
                }
             
            }
            else
            {
                Response.Write("<script>alert('Please enter a valid email address');</script>");
            }

            
        }


        public bool IsValidEmailAddress(string email)
        {
            if (!string.IsNullOrEmpty(email) && new EmailAddressAttribute().IsValid(email))
                return true;
            else
                return false;
        }
    }
}