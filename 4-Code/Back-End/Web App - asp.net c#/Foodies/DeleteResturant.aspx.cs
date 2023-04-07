using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodies
{
    public partial class DeleteResturant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                string QueryString = "select distinct restName from restaurants";

                SqlConnection myConnection = new SqlConnection(connectionString);
                SqlDataAdapter myCommand = new SqlDataAdapter(QueryString, myConnection);
                DataSet ds = new DataSet();
                myCommand.Fill(ds, "restName");

                restaurantSelect.DataSource = ds;
                restaurantSelect.DataTextField = "restName";
                restaurantSelect.DataValueField = "restName";
                restaurantSelect.DataBind();
                restaurantSelect.Items.Insert(0, "Select the restaurant");


            }
        }

        protected void deleteRestClick(object sender, EventArgs e)
        {
            string resturantName = restaurantSelect.Value.ToString();

            if (!restaurantSelect.Value.Equals("Select the restaurant"))
            {
                string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                SqlConnection myconnection = new SqlConnection(connectionString);
                myconnection.Open();

                string deleteRestSqlCommand = "delete from restaurants where restName = @restName ";
                SqlCommand deleteRestComm = new SqlCommand(deleteRestSqlCommand, myconnection);
                deleteRestComm.Parameters.AddWithValue("@restName", resturantName);

                deleteRestComm.ExecuteNonQuery();

                Response.Write("<script>alert('The restaurant has been deleted successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Please select the restaurant');</script>");

            }
        }
    }
}