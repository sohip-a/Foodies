using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Policy;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;  //--> ADO.NET

namespace Foodies
{
    public partial class _1_reg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void regBtnClicked(object sender, EventArgs e)
        {
            string username = Request["username"];
            string email = Request["email"];
            string phone = Request["phone"];
            string password = Request["password"];
            string confirmPassword = Request["confirm_password"];

            if (IsValidUserName(username) && IsValidEmailAddress(email) && IsValidPhone(phone) && IsValidPassword(password,confirmPassword) )
            {
                string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                SqlConnection myconnection = new SqlConnection(connectionString);
                myconnection.Open();

                // first command to show employee table
                string insertCommand = "insert into customer (email , phone , password) values(@email,@username,@phone,@password)";
                SqlCommand insertNewCustomerCommand = new SqlCommand(insertCommand, myconnection);
                insertNewCustomerCommand.Parameters.AddWithValue("@email", email);
                insertNewCustomerCommand.Parameters.AddWithValue("@username", username);
                insertNewCustomerCommand.Parameters.AddWithValue("@phone", phone);
                insertNewCustomerCommand.Parameters.AddWithValue("@password", password);
                insertNewCustomerCommand.ExecuteNonQuery();

                Response.Redirect("homepage.html");
            }
            
        }





        public bool IsValidUserName(string username)
        {
            bool isUnique = true;

            string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
            SqlConnection myconnection = new SqlConnection(connectionString);
            myconnection.Open();

            string usernameSqlCommand = "select username from customer";
            SqlCommand selectUsernameComm = new SqlCommand(usernameSqlCommand, myconnection);

            SqlDataReader reader = selectUsernameComm.ExecuteReader();


            while (reader.Read())
            {
                if ( username.Equals( reader[0].ToString() ) )
                {
                    isUnique = false;
                    break;
                }               
            }

            if (!string.IsNullOrEmpty(username) && isUnique)
                return true;
            else
            {
                Response.Write("<script>alert('The username is not unique');</script>");
                return false;                
            }
        }

        public bool IsValidEmailAddress(string email)  // Need test to check *****
        {
            bool isUnique = true;

            string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
            SqlConnection myconnection = new SqlConnection(connectionString);
            myconnection.Open();

            string emailSqlCommand = "select email from customer";
            SqlCommand emaileComm = new SqlCommand(emailSqlCommand, myconnection);

            SqlDataReader reader = emaileComm.ExecuteReader();


            while (reader.Read())
            {
                if (email.Equals(reader[0].ToString()))
                {
                    isUnique = false;
                    break;
                }
            }

             if (!string.IsNullOrEmpty(email) && new EmailAddressAttribute().IsValid(email) && isUnique)
                 return true;
             else
                 return false;
            
        }

        public bool IsValidPhone(string phone)
        {
            if (!string.IsNullOrEmpty(phone) && Regex.Match(phone, "^[0-9]*$").Success)
                return true;
            else
                return false;
        }

        public bool IsValidPassword(string password , string confirmPassword)
        {
            if (!string.IsNullOrEmpty(password) && Regex.Match(password, "^(?=.*\\d).+$").Success && Regex.Match(password, "^(?=.*[A-Z]).+$").Success && Regex.Match(password, "(?=.*[!@#$%^&*]).+$").Success && password.Length >= 8 && password.Equals(confirmPassword))
                return true;
            else
                return false;
        }


    }

    
}