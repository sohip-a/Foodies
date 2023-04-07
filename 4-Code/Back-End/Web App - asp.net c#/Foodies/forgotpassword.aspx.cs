using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodies
{
    public partial class forgotpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void resetBtnClicked(object sender, EventArgs e)
        {
            bool isValidEmail = false;
            bool isValidPassword = false;

            string email = Request["email"];
            string newPassword = Request["new-password"];
            string confirmPassword = Request["confirm-password"];

            if(IsValidEmailAddress(email))
            {
                string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                SqlConnection myconnection = new SqlConnection(connectionString);
                myconnection.Open();

                string emailSqlCommand = "select email from customer";
                SqlCommand selectEmailComm = new SqlCommand(emailSqlCommand, myconnection);

                SqlDataReader reader = selectEmailComm.ExecuteReader();

                while (reader.Read())
                {
                    if (email.Equals(reader[0].ToString()) )
                    {
                        isValidEmail = true;
                        break;
                    }
                }

                if(!reader.Read() && !isValidEmail )
                {
                    Response.Write("<script>alert('The Email is not registered');</script>");
                }
                reader.Close();

                if (IsValidNewPassword(newPassword, confirmPassword))
                {
                    isValidPassword = true;
                }
                else
                {
                    Response.Write("<script>alert('The Password is not valid');</script>");
                }

                if(isValidEmail && isValidPassword)
                {
                    string updateCommand = "update customer set password = @password where email = @email";
                    SqlCommand updateCustomrePassCommand = new SqlCommand(updateCommand, myconnection);

                    updateCustomrePassCommand.Parameters.AddWithValue("@password", newPassword);
                    updateCustomrePassCommand.Parameters.AddWithValue("@email", email);
                    updateCustomrePassCommand.ExecuteNonQuery();

                    Response.Redirect("login.aspx");
                }


            }
            else
            {
                Response.Write("<script>alert('The Email foramt is wrong');</script>");
            }    
            
            

        }




        public bool IsValidEmailAddress(string email)
        {
            if (!string.IsNullOrEmpty(email) && new EmailAddressAttribute().IsValid(email))
                return true;
            else
                return false;
        }

        public bool IsValidNewPassword(string password, string confirmPassword)
        {
            if (!string.IsNullOrEmpty(password) && Regex.Match(password, "^(?=.*\\d).+$").Success && Regex.Match(password, "^(?=.*[A-Z]).+$").Success && Regex.Match(password, "(?=.*[!@#$%^&*]).+$").Success && password.Length >= 8 && password.Equals(confirmPassword))
                return true;
            else
                return false;
        }


    }
}