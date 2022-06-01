<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registr.aspx.cs" Inherits="Registration.Registr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
	<title>Logowania uzytkownika</title> //Tytuł strony 

    <link href="Style.css" rel="stylesheet" />

    <style>
    	@import url("https://fonts.googleapis.com/css?family=Lobster&amp;subset=cyrillic");
    </style>


</head>
<body>
    <form id="form1" runat="server">
       <section>

           
               // Służy do wyświetlania strony responsywnej
                <div class ="Login">
                     <h3>Logowania</h3>
			
                  //Pola dla podania użytkownikiem danych 
                   <asp:TextBox ID="txtImie" placeholder="Imie Uzytkownika " runat="server" ></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Font-Size="Medium" ForeColor="Red" Display="Dynamic" ControlToValidate="txtImie" ErrorMessage="Proszę podać nazwę użytkownika"></asp:RequiredFieldValidator>

                    <asp:TextBox ID="txtemail" placeholder="E-mail" runat="server" ></asp:TextBox>
				    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Font-Size="Medium" ForeColor="Red" Display="Dynamic" ControlToValidate="txtemail" ErrorMessage="Proszę podać Email"></asp:RequiredFieldValidator>

                    <asp:TextBox ID="txtpassw" placeholder="Hasło" TextMode="Password" runat="server"></asp:TextBox>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtpassw" ErrorMessage="Hasło musi być 3-10 znaków" Font-Size="Medium" ForeColor="Red" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,15}$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtpassw" Font-Size="Medium" ForeColor="Red" Display="Dynamic" ErrorMessage="Podaj hasło"></asp:RequiredFieldValidator> 

                    <asp:TextBox ID="txtcoppass" placeholder="Powtórz Hasło" TextMode="Password" runat="server"></asp:TextBox>
                     <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" Font-Size="Medium" ForeColor="Red" Display="Dynamic" ControlToValidate="txtcoppass" ControlToCompare="txtpassw" ErrorMessage="Hasło nie pasuje."></asp:CompareValidator>
                    <br />
                    
                   <asp:TextBox ID="txtNumer" placeholder="Numer Telefona" runat="server"></asp:TextBox>
                   <asp:DropDownList ID="txtWybierz" CssClass="list" runat="server">
                        <asp:ListItem Text="Służbowy" />
                        <asp:ListItem Text="Prywatny" />
                        <asp:ListItem Text="Inny" />
                        </asp:DropDownList>
               
                          
                        
                    //Button logowania uzytkownika
                   <asp:Button ID="Button1" OnClick="Button1_Click"  runat="server" CssClass="btn" Text="Zalogoj Sie" />

                    <asp:Label ID="Label1" Visible="False" runat="server" Text="Pomyślnie zarejestrowali się."></asp:Label>

                </div>

          
       </section>
    </form>
	//Dodaje bazy danych jaką stworzyłem 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Uzytkowniky]"></asp:SqlDataSource>
</body>
 </html>
