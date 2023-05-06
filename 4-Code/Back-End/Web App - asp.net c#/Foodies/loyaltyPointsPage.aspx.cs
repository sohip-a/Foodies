using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodies
{
    public partial class loyaltyPointsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string loggedEmail = Request.QueryString["email"];

            if (!String.IsNullOrEmpty(loggedEmail))
            {
                string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                SqlConnection myconnection = new SqlConnection(connectionString);
                myconnection.Open();

                //// username
                string loyaltySqlCommand = "select loyaltyP from customer where email = @email";
                SqlCommand selectUserLoyaltyPComm = new SqlCommand(loyaltySqlCommand, myconnection);
                selectUserLoyaltyPComm.Parameters.AddWithValue("@email", loggedEmail);

                string userLoyaltyPoints = selectUserLoyaltyPComm.ExecuteScalar().ToString();

                showLoyalty.InnerHtml = "Your loyalty points = " + userLoyaltyPoints;

            }
            else
            {
                Response.Redirect("homepage.aspx");
            }

        }

        protected void homeNavClick(object sender, EventArgs e)
        {
            string loggedEmail = Request.QueryString["email"];
            Response.Redirect("homepage.aspx?email=" + loggedEmail);
        }

        protected void accNavClick(object sender, EventArgs e)
        {
            string loggedEmail = Request.QueryString["email"];
            Response.Redirect("MyAccount.aspx?email=" + loggedEmail);
        }


    }
}