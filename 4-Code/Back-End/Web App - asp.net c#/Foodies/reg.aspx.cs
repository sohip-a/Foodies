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
                string insertCommand = "insert into customer (email , username, phone , password) values(@email,@username,@phone,@password)";
                SqlCommand insertNewCustomerCommand = new SqlCommand(insertCommand, myconnection);
                insertNewCustomerCommand.Parameters.AddWithValue("@email", email);
                insertNewCustomerCommand.Parameters.AddWithValue("@username", username);
                insertNewCustomerCommand.Parameters.AddWithValue("@phone", phone);
                insertNewCustomerCommand.Parameters.AddWithValue("@password", password);
                insertNewCustomerCommand.ExecuteNonQuery();

                Response.Redirect("homepage.aspx?email=" + email);
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

            if (!string.IsNullOrEmpty(username.Trim()) && isUnique)
            {
                return true;
            }           
            else if (!isUnique)
            {
                Response.Write("<script>alert('The username is not unique');</script>");
                return false;                
            }
            else
            {
                Response.Write("<script>alert('The username is not valid');</script>");
                return false;
            }
        }

        public bool IsValidEmailAddress(string email)  
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

             if (!string.IsNullOrEmpty(email.Trim()) && new EmailAddressAttribute().IsValid(email) && isUnique)
            {
                return true;
            }
             else if(!new EmailAddressAttribute().IsValid(email))
            {
                Response.Write("<script>alert('The Email is not in the right format');</script>");
                return false;
            }
             else if(!isUnique)
            {
                Response.Write("<script>alert('The Email is not unique');</script>");
                return false;
            }                 
             else
            {
                Response.Write("<script>alert('The Email is not valid');</script>");
                return false;
            }
                 
            
        }

        public bool IsValidPhone(string phone)
        {
            if (!string.IsNullOrEmpty(phone) && Regex.Match(phone, "^[0-9]*$").Success && phone.Length == 10)
            {
                return true;
            }               
            else if (!Regex.Match(phone, "^[0-9]*$").Success)
            {
                Response.Write("<script>alert('The phone format is not valid');</script>");
                return false;
            }
            else if(phone.Length != 10)
            {
                Response.Write("<script>alert('The phone must be 10 digits only');</script>");
                return false;
            }
            else
            {
                Response.Write("<script>alert('The phone is not valid');</script>");
                return false;
            }
                
        }

        public bool IsValidPassword(string password , string confirmPassword)
        {
            if (!string.IsNullOrEmpty(password) && Regex.Match(password, "^(?=.*\\d).+$").Success && Regex.Match(password, "^(?=.*[A-Z]).+$").Success && Regex.Match(password, "(?=.*[!@#$%^&*]).+$").Success && password.Length >= 8 && password.Equals(confirmPassword))
            {
                return true;
            }
            else if (password.Length < 8)
            {
                Response.Write("<script>alert('The Password must be 8 characters at least');</script>");
                return false;
            }
            else if (!Regex.Match(password, "^(?=.*[A-Z]).+$").Success)
            {
                Response.Write("<script>alert('The Password must contain Uppercase letter');</script>");
                return false;
            }
            else if (!Regex.Match(password, "(?=.*[!@#$%^&*]).+$").Success)
            {
                Response.Write("<script>alert('The Password must contain special character');</script>");
                return false;
            }
            else if (!password.Equals(confirmPassword))
            {
                Response.Write("<script>alert('The Passwords are not matched');</script>");
                return false;
            }
            else
            {
                Response.Write("<script>alert('The Password is not valid');</script>");
                return false;
            }

        }


    }

    
}