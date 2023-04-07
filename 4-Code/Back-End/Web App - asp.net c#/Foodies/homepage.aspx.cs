using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodies
{
    public partial class homepage : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                string QueryString = "select distinct city from address";

                SqlConnection myConnection = new SqlConnection(connectionString);
                SqlDataAdapter myCommand = new SqlDataAdapter(QueryString, myConnection);
                DataSet ds = new DataSet();
                myCommand.Fill(ds, "city");

                areaList.DataSource = ds;
                areaList.DataTextField = "city";
                areaList.DataValueField = "city";
                areaList.DataBind();
                areaList.Items.Insert(0, "Select your area");

                neighborhoodList.Items.Insert(0, "Select your neighborhood");

            }

        }

        protected void afterAreaSelection(object sender, EventArgs e)
        {
            string selecedItem = areaList.SelectedValue;

            if(!selecedItem.Equals("Select your area"))
            {
                string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                string QueryString = "select distinct area from address where city = @city";

                SqlConnection myConnection = new SqlConnection(connectionString);
                SqlDataAdapter adapter = new SqlDataAdapter(QueryString , myConnection);
                adapter.SelectCommand.Parameters.AddWithValue("@city",selecedItem);

                DataSet ds = new DataSet();
                adapter.Fill(ds, "area");

                neighborhoodList.DataSource = ds;
                neighborhoodList.DataTextField = "area";
                neighborhoodList.DataValueField = "area";
                neighborhoodList.DataBind();
                neighborhoodList.Items.Insert(0, "Select your neighborhood");
            }

            //Response.Write("<script>alert('"+ selecedItem +"list is clicked');</script>");
        }

        protected void goBtnClicked(object sender, EventArgs e)
        {
            /*string loggedEmail = Request.QueryString["email"];
            Response.Write("<script>alert('" + loggedEmail + " is the logged email');</script>");*/

            string selectedArea = areaList.SelectedValue;
            string selectedNeighborhood = neighborhoodList.SelectedValue;

            if (!selectedNeighborhood.Equals("Select your neighborhood"))
            {
                string loggedEmail = Request.QueryString["email"];
                Response.Redirect("ResturantMenupage.html?email=" + loggedEmail);
            }
            else
            {
                Response.Write("<script>alert('Please select your area and neighborhood first');</script>");
            }

            


        }

        protected void myAccClick(object sender, EventArgs e)
        {
            string loggedEmail = Request.QueryString["email"];

            if(String.IsNullOrEmpty(loggedEmail)) //admin tries to go to my account page
            {             
                Response.Write("<script>alert('Avaiable only to customers to update their info');</script>");
            }
            else
            {
                Response.Redirect("MyAccount.aspx?email=" + loggedEmail);
            }          
        }

        protected void loyaltyClick(object sender, EventArgs e)
        {
            string loggedEmail = Request.QueryString["email"];

            if (String.IsNullOrEmpty(loggedEmail)) //admin tries to go to my account page
            {
                Response.Write("<script>alert('Avaiable only to customers to check their loyalty points');</script>");
            }
            else
            {
                Response.Redirect("loyaltyPointsPage.aspx?email=" + loggedEmail);
            }

        }





    }
}