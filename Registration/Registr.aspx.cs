using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Registration
{
    public partial class Registr : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Tworzenie połączenia bazy danych i aplikacji internetowych
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conect = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            
            //Obsługa wyjątków
            try
            {
                //polecenie wpisy dane
                conect.Open();
                string command = "INSERT INTO Uzytkowniky(Imie,email,Passw,Numer,Kategoria) VALUES(@Imie,@email,@Passw,@Numer,@Kategoria)";
                SqlCommand cmd = new SqlCommand(command, conect);

                cmd.Parameters.AddWithValue("@Imie", txtImie.Text);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@Passw", txtpassw.Text);
                cmd.Parameters.AddWithValue("@Numer", txtNumer.Text);
                cmd.Parameters.AddWithValue("@Kategoria", txtWybierz.Text);

                cmd.ExecuteNonQuery();
                Label1.Visible = true;
            }
            catch (Exception)
            {
                //ręcznie generujemy wyjątki
                Label1.Text = "Coś poszło nie tak.Spróbuj powtórzyć!";
                throw;
            }
            finally
            {
                //Zamykamy poląnczenia
                conect.Close();
            }

        }
    }
}
