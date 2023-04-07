using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace Foodies
{
    public partial class addmenuitem : System.Web.UI.Page
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

                restaurantSelection.DataSource = ds;
                restaurantSelection.DataTextField = "restName";
                restaurantSelection.DataValueField = "restName";
                restaurantSelection.DataBind();

                restaurantSelection.Items.Insert(0, "Select the restaurant");
            }
        }

        protected void addItemClick(object sender, EventArgs e)
        {
            string restName = restaurantSelection.Value;
            string item = itemName.Value.ToString();
            string photoPath = itemPhoto.Value.ToString();
            string price = itemPrice.Value.ToString();
           
            if ( !restName.Equals("Select the restaurant"))
            {
                if( !String.IsNullOrEmpty(item) && !String.IsNullOrEmpty(photoPath) && !String.IsNullOrEmpty(price) )
                {
                    if( Regex.Match(item, "^[a-z A-Z]*$").Success )
                    {
                        if( Regex.Match(price, "^[1-9]\\d*(\\.\\d+)?$").Success )
                        {
                            string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                            SqlConnection myconnection = new SqlConnection(connectionString);
                            myconnection.Open();

                            string addItemSqlCommand = "insert into menuItem (restName , itemName , itemPrice , photoLocation ) values (@restName , @itemName , @itemPrice , @photoLocation) ";
                            SqlCommand addItemComm = new SqlCommand(addItemSqlCommand, myconnection);
                            addItemComm.Parameters.AddWithValue("@restName", restName);
                            addItemComm.Parameters.AddWithValue("@itemName", item);
                            addItemComm.Parameters.AddWithValue("@itemPrice", price);
                            addItemComm.Parameters.AddWithValue("@photoLocation", photoPath);

                            addItemComm.ExecuteNonQuery();

                            Response.Write("<script>alert('The Menue Item has been added successfully');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Item price is not valid');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Item name is not valid');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('please fill all fields');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Please select the restaurant first');</script>");
            }

        }


    }
}