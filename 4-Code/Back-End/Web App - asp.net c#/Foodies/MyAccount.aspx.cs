using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Security;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodies
{
    public partial class MyAccount : System.Web.UI.Page
    {
        string userName;
        string phoneNum;
        string pass;

        protected void Page_Load(object sender, EventArgs e)
        {
            string loggedEmail = Request.QueryString["email"];

            if (!String.IsNullOrEmpty(loggedEmail))
            {
                //string loggedEmail = Request.QueryString["email"];
                email.Value = loggedEmail; 

                string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                SqlConnection myconnection = new SqlConnection(connectionString);
                myconnection.Open();

                //// username
                string usernameSqlCommand = "select username from customer where email = @email";
                SqlCommand selectUserComm = new SqlCommand(usernameSqlCommand, myconnection);
                selectUserComm.Parameters.AddWithValue("@email", loggedEmail);

                userName = selectUserComm.ExecuteScalar().ToString();
                user_id.Value = userName;

                ///// Phone
                string phoneSqlCommand = "select phone from customer where email = @email";
                SqlCommand selectPhoneComm = new SqlCommand(phoneSqlCommand, myconnection);
                selectPhoneComm.Parameters.AddWithValue("@email", loggedEmail);

                phoneNum = selectPhoneComm.ExecuteScalar().ToString();
                phone.Value = phoneNum;

                ///// pass
                string passSqlCommand = "select password from customer where email = @email";
                SqlCommand selectPassComm = new SqlCommand(passSqlCommand, myconnection);
                selectPassComm.Parameters.AddWithValue("@email", loggedEmail);


                pass = selectPassComm.ExecuteScalar().ToString();
                password.Value = pass;
                
            }
            else
            {
                Response.Redirect("homepage.aspx");
            }

        }


        protected void saveBtnClicked(object sender, EventArgs e)
        {
            string loggedEmail = Request.QueryString["email"];

            string usernameField = user_id.Value;
            string emailField = email.Value;
            string phoneField = phone.Value;
            string passwordField = password.Value;

            string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
            SqlConnection myconnection = new SqlConnection(connectionString);
            myconnection.Open();

            if(!usernameField.Equals(userName) && IsValidUserName(usernameField))
            {
                string updateUsernameSqlCommand = "update customer set username = @username where email = @loggedEmail";
                SqlCommand updateUsernameComm = new SqlCommand(updateUsernameSqlCommand, myconnection);

                updateUsernameComm.Parameters.AddWithValue("@username", usernameField);
                updateUsernameComm.Parameters.AddWithValue("@loggedEmail", loggedEmail);

                updateUsernameComm.ExecuteNonQuery();                
            }

            if(!phoneField.Equals(phone) && IsValidPhone(phoneField))
            {
                string updatePhoneSqlCommand = "update customer set phone = @phone where email = @loggedEmail";
                SqlCommand updatePhoneComm = new SqlCommand(updatePhoneSqlCommand, myconnection);

                updatePhoneComm.Parameters.AddWithValue("@phone", phoneField);
                updatePhoneComm.Parameters.AddWithValue("@loggedEmail", loggedEmail);

                updatePhoneComm.ExecuteNonQuery();
            }

            if(!passwordField.Equals(pass) && IsValidPassword(passwordField))
            {
                string updatePassSqlCommand = "update customer set password = @password where email = @loggedEmail";
                SqlCommand updatePassComm = new SqlCommand(updatePassSqlCommand, myconnection);

                updatePassComm.Parameters.AddWithValue("@password", passwordField);
                updatePassComm.Parameters.AddWithValue("@loggedEmail", loggedEmail);

                updatePassComm.ExecuteNonQuery();
            }

            if(!emailField.Equals(loggedEmail) && IsValidEmailAddress(emailField))
            {
                string updateEmailSqlCommand = "update customer set email = @email where email = @loggedEmail";
                SqlCommand updateEmailComm = new SqlCommand(updateEmailSqlCommand, myconnection);

                updateEmailComm.Parameters.AddWithValue("@email", emailField);
                updateEmailComm.Parameters.AddWithValue("@loggedEmail", loggedEmail);

                updateEmailComm.ExecuteNonQuery();
            }

            Response.Redirect("homepage.aspx?email=" + emailField);

        }

        protected void homeNavClick(object sender, EventArgs e)
        {
            string loggedEmail = Request.QueryString["email"];
            Response.Redirect("homepage.aspx?email=" + loggedEmail);
        }

        protected void loyaltyNavClick(object sender, EventArgs e)
        {
            string loggedEmail = Request.QueryString["email"];
            Response.Redirect("loyaltyPointsPage.aspx?email=" + loggedEmail);
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
                if (username.Equals(reader[0].ToString()))
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

        public bool IsValidPassword(string password)
        {
            if (!string.IsNullOrEmpty(password) && Regex.Match(password, "^(?=.*\\d).+$").Success && Regex.Match(password, "^(?=.*[A-Z]).+$").Success && Regex.Match(password, "(?=.*[!@#$%^&*]).+$").Success && password.Length >= 8 )
                return true;
            else
                return false;
        }


       protected void userNameChanged(object sender, EventArgs e)
        {
            //phone.Value = user_id.Value;
            Response.Write("<script>alert('edited username');</script>");
        }



    }
}