using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace Foodies
{
    public partial class DeleteOffer : System.Web.UI.Page
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

                ResturantSelect.DataSource = ds;
                ResturantSelect.DataTextField = "restName";
                ResturantSelect.DataValueField = "restName";
                ResturantSelect.DataBind();
                
                ResturantSelect.Items.Insert(0, "Select the restaurant");
                offerList.Items.Insert(0, "Select the offer");


            }
        }

        protected void afterRestSelection(object sender, EventArgs e)
        {
            string selecedRest = ResturantSelect.SelectedValue;

            if (!selecedRest.Equals("Select the restaurant"))
            {
                string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                string QueryString = "select offerName from offers where restName = @restName";

                SqlConnection myConnection = new SqlConnection(connectionString);
                SqlDataAdapter adapter = new SqlDataAdapter(QueryString, myConnection);
                adapter.SelectCommand.Parameters.AddWithValue("@restName", selecedRest);

                DataSet ds = new DataSet();
                adapter.Fill(ds, "offerName");

                offerList.DataSource = ds;
                offerList.DataTextField = "offerName";
                offerList.DataValueField = "offerName";
                offerList.DataBind();
                offerList.Items.Insert(0, "Select the offer");
            }

        }

        protected void deleteOfferBtnClick(object sender, EventArgs e)
        {
            string selectedRest = ResturantSelect.SelectedValue;
            string selectedOffer = offerList.SelectedValue;

            if (!selectedOffer.Equals("Select the offer"))
            {
                string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                SqlConnection myconnection = new SqlConnection(connectionString);
                myconnection.Open();

                string deleteOfferSqlCommand = "delete from offers where offerName = @offerName and restName = @restName ";
                SqlCommand deleteOfferComm = new SqlCommand(deleteOfferSqlCommand, myconnection);
                deleteOfferComm.Parameters.AddWithValue("@offerName", selectedOffer);
                deleteOfferComm.Parameters.AddWithValue("@restName", selectedRest);

                deleteOfferComm.ExecuteNonQuery();

                Response.Write("<script>alert('The offer has been deleted successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Please select the offer to delete');</script>");
            }
        }
    }
}