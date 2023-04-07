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
    public partial class DeletemenueItem : System.Web.UI.Page
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

                resturantSelect.DataSource = ds;
                resturantSelect.DataTextField = "restName";
                resturantSelect.DataValueField = "restName";
                resturantSelect.DataBind();
                resturantSelect.Items.Insert(0, "Select the restaurant");

                itemList.Items.Insert(0, "Select the menu item");

            }

        }

        protected void afterRestSelection(object sender, EventArgs e)
        {
            string selecedRest = resturantSelect.SelectedValue;

            if (!selecedRest.Equals("Select the restaurant"))
            {
                string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                string QueryString = "select itemName from menuItem where restName = @restName";

                SqlConnection myConnection = new SqlConnection(connectionString);
                SqlDataAdapter adapter = new SqlDataAdapter(QueryString, myConnection);
                adapter.SelectCommand.Parameters.AddWithValue("@restName", selecedRest);

                DataSet ds = new DataSet();
                adapter.Fill(ds, "itemName");

                itemList.DataSource = ds;
                itemList.DataTextField = "itemName";
                itemList.DataValueField = "itemName";
                itemList.DataBind();
                itemList.Items.Insert(0, "Select the menu item");
            }

        }

        protected void deleteItemClick(object sender, EventArgs e)
        {
            string selectedRest = resturantSelect.SelectedValue;
            string selectedItem = itemList.SelectedValue;

            if (!selectedItem.Equals("Select the menu item"))
            {
                string connectionString = "Data Source=DESKTOP-P087U98;Initial Catalog=FoodiesDB;Integrated Security=True";
                SqlConnection myconnection = new SqlConnection(connectionString);
                myconnection.Open();

                string deleteItemSqlCommand = "delete from menuItem where itemName = @itemName and restName = @restName ";
                SqlCommand deleteItemComm = new SqlCommand(deleteItemSqlCommand, myconnection);
                deleteItemComm.Parameters.AddWithValue("@itemName", selectedItem);
                deleteItemComm.Parameters.AddWithValue("@restName", selectedRest);

                deleteItemComm.ExecuteNonQuery();

                Response.Write("<script>alert('The item has been deleted successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Please select the offer to delete');</script>");
            }
        }
    }
}