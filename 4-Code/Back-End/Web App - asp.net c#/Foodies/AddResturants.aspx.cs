using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodies
{
    public partial class AddResturants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addRestClick(object sender, EventArgs e)
        {
            string resturantName = restName.Value;
            string resturantLogoPath = restLogo.Value;


            if(!String.IsNullOrEmpty(resturantName) && !String.IsNullOrEmpty(resturantLogoPath))
            {
                if( Regex.Match(resturantName, "^[a-zA-Z]*$").Success)
                {
                    string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                    SqlConnection myconnection = new SqlConnection(connectionString);
                    myconnection.Open();

                    string insertRestSqlCommand = "insert into restaurants (restName , logoLocation ) values (@restName , @logoLocation)";
                    SqlCommand insertRestComm = new SqlCommand(insertRestSqlCommand, myconnection);
                    insertRestComm.Parameters.AddWithValue("@restName", resturantName);
                    insertRestComm.Parameters.AddWithValue("@logoLocation", resturantLogoPath);

                    insertRestComm.ExecuteNonQuery();

                    Response.Write("<script>alert('The restaurant has been addedd successfully');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Restaurant name is not valid. It should only contain alphabetic chars');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Please fill all fields');</script>");
            }

        }
    }
}