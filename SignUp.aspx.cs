using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data.Common;

namespace VirtuMart_5
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        String connectionString = WebConfigurationManager.ConnectionStrings["virtumart"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddUser(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (!UserAlreadyExists())
                {
                    if (AddMember())
                    {
                        Response.Write("<script>alert('Member added sucessfully !!!');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('An Error Occured while trying to add the new member !!!');</script>");

                    }
                }
                else
                {
                    Response.Write("<script>alert('A Member With the same UserName Already Exists Try Logging In ??');</script>");
                }
            }
        }

        private bool UserAlreadyExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                { 
                    con.Open();
                }

                String query = "select * from userinfo where username=@username";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("username", usernameTxt.Text);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable(); 
                da.Fill(dt);

                if (dt.Rows.Count == 0) 
                {
                    return false; 
                }
                else 
                {
                    return true;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>console.log('"+ex.Message+"');</script>");
                return false;
            }
        }

        protected bool AddMember()
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionString);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                String query = "insert into userinfo(username, password, email, phone) values(@username, @password, @email, @phone)";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("username", usernameTxt.Text);
                cmd.Parameters.AddWithValue("password", confirmPasswordTxt.Text);
                cmd.Parameters.AddWithValue("email", emailTxt.Text);
                cmd.Parameters.AddWithValue("phone", phoneTxt.Text);

                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            catch (Exception ex)
            {
                Response.Write("<script>console.log(' SignUp Page"+ ex.Message +"')</script>");
                return false;
            }
        }
    }
}