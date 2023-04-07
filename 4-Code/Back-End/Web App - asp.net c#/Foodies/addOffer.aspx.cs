using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Text.RegularExpressions;

namespace Foodies
{
    public partial class addOffer : System.Web.UI.Page
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

                restaurant.DataSource = ds;
                restaurant.DataTextField = "restName";
                restaurant.DataValueField = "restName";
                restaurant.DataBind();
                restaurant.Items.Insert(0, "Select the restaurant");


            }
        }

        protected void addOfferBtnClick(object sender, EventArgs e)
        {
            string resturantName = restaurant.Value.ToString();
            string offer = offerName.Value.ToString();
            string description = offerDescription.Value.ToString();

            if (!resturantName.Equals("Select the restaurant"))
            {
                if(!String.IsNullOrEmpty(offer) && !String.IsNullOrEmpty(description)) 
                {
                    if( Regex.Match(offer, "^[a-z A-Z0-9]*$").Success && Regex.Match(description, "^[a-z A-Z0-9]*$").Success )
                    {
                        string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                        SqlConnection myconnection = new SqlConnection(connectionString);
                        myconnection.Open();

                        string addOfferSqlCommand = "insert into offers (restName , offerName , offerDescription) values (@restName, @offerName, @offerDescription)";
                        SqlCommand addOfferComm = new SqlCommand(addOfferSqlCommand, myconnection);
                        addOfferComm.Parameters.AddWithValue("@restName", resturantName);
                        addOfferComm.Parameters.AddWithValue("@offerName", offer);
                        addOfferComm.Parameters.AddWithValue("@offerDescription", description);

                        addOfferComm.ExecuteNonQuery();

                        Response.Write("<script>alert('The offer has been added successfully');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Fields must not contain special chars');</script>");

                    }

                }
                else
                {
                    Response.Write("<script>alert('Please fill the name and description fields');</script>");
                }
                
            }
            else
            {
                Response.Write("<script>alert('Please select the restaurant');</script>");

            }
        }
    }
}