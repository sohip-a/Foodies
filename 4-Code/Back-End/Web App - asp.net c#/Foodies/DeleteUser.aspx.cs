using Antlr.Runtime.Misc;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodies
{
    public partial class DeleteUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void deleteUserClick(object sender, EventArgs e)
        {
            bool isIdExist = false;
            string userId = userID.Value;

            if( !String.IsNullOrEmpty(userId) && Regex.Match(userId, "^[0-9]*$").Success) 
            {
                string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                SqlConnection myconnection = new SqlConnection(connectionString);
                myconnection.Open();


                string idSqlCommand = "select id from customer";
                SqlCommand idComm = new SqlCommand(idSqlCommand, myconnection);
                SqlDataReader reader = idComm.ExecuteReader();
                while (reader.Read())
                {
                    if (userId.Equals(reader[0].ToString()))
                    {
                        isIdExist = true;
                        break;
                    }
                }
                reader.Close();

                if( isIdExist )
                {
                    string delUserSqlCommand = "delete from customer where id = @id";
                    SqlCommand delUserComm = new SqlCommand(delUserSqlCommand, myconnection);
                    delUserComm.Parameters.AddWithValue("@id", userId);

                    delUserComm.ExecuteNonQuery();

                    Response.Write("<script>alert('The cusomer has been deleted successfully');</script>");
                }
                else
                {
                    Response.Write("<script>alert('The cusomer id is not existed');</script>");
                }

                
            }
            else
            {
                Response.Write("<script>alert('The cusomer id is not in correct foramt');</script>");
            }
        }
    }
}