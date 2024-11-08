using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace VirtuMart_5
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        String connectionString = WebConfigurationManager.ConnectionStrings["virtumart"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TryLogin(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                String query = "select username, password from userinfo where username = @username";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("username", usernameTxt.Text);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count == 0)
                {
                    Response.Write("<script>alert('Incorrect username or password');</script>");
                }
                else if (dt.Rows.Count > 0)
                {
                    String typedPassword = passwordTxt.Text;
                    String storedPassword = dt.Rows[0]["password"].ToString();
                    if (storedPassword == typedPassword)
                    {
                        Response.Redirect("HomePage.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Incorrect Password');</script>");
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>console.log('" + ex.Message + "')</script>");
            }
        }
    }
}