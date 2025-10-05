# ASP.NET Web Forms

ASP.NET Web Forms is the original ASP.NET framework that provides a component-based approach to web development, similar to Windows Forms development.

## Page Structure

### ASPX Page (.aspx)

```html
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyApp.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Web Forms Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblMessage" runat="server" Text="Welcome!"></asp:Label>
            <br />
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>
```

### Code-Behind (.aspx.cs)

```csharp
using System;
using System.Web.UI;

namespace MyApp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize page - runs only on first load
                lblMessage.Text = "Page loaded for the first time!";
            }
            else
            {
                // Runs on postbacks
                lblMessage.Text = "Page posted back!";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            lblMessage.Text = $"Hello, {name}!";
        }
    }
}
```

## Page Lifecycle

### Lifecycle Events

```csharp
public partial class LifecycleDemo : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        // Theme and master page can be set here
        Response.Write("1. PreInit<br/>");
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        // Controls are initialized
        Response.Write("2. Init<br/>");
    }

    protected void Page_InitComplete(object sender, EventArgs e)
    {
        // All controls are initialized
        Response.Write("3. InitComplete<br/>");
    }

    protected void Page_PreLoad(object sender, EventArgs e)
    {
        // Before view state is loaded
        Response.Write("4. PreLoad<br/>");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // View state is loaded, controls are accessible
        Response.Write("5. Load<br/>");
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        // All controls are loaded
        Response.Write("6. LoadComplete<br/>");
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        // Before rendering
        Response.Write("7. PreRender<br/>");
    }

    protected void Page_PreRenderComplete(object sender, EventArgs e)
    {
        // After PreRender, before rendering
        Response.Write("8. PreRenderComplete<br/>");
    }

    protected void Page_Unload(object sender, EventArgs e)
    {
        // Cleanup - Response object not available
        // Response.Write("9. Unload<br/>"); // This won't work
    }
}
```

## Server Controls

### Standard Controls

```html
<form id="form1" runat="server">
    <!-- Text Input -->
    <asp:TextBox ID="txtName" runat="server" MaxLength="50"></asp:TextBox>

    <!-- Password Input -->
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

    <!-- Multi-line Text -->
    <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>

    <!-- Buttons -->
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />

    <!-- Labels -->
    <asp:Label ID="lblResult" runat="server"></asp:Label>

    <!-- Checkboxes -->
    <asp:CheckBox ID="chkAgree" runat="server" Text="I agree to terms" />

    <!-- Radio Buttons -->
    <asp:RadioButton ID="rdoOption1" runat="server" GroupName="Options" Text="Option 1" />
    <asp:RadioButton ID="rdoOption2" runat="server" GroupName="Options" Text="Option 2" />

    <!-- DropDownList -->
    <asp:DropDownList ID="ddlCountries" runat="server">
        <asp:ListItem Text="Select Country" Value="" />
        <asp:ListItem Text="USA" Value="US" />
        <asp:ListItem Text="Canada" Value="CA" />
    </asp:DropDownList>

    <!-- ListBox -->
    <asp:ListBox ID="lstItems" runat="server" SelectionMode="Multiple">
        <asp:ListItem Text="Item 1" Value="1" />
        <asp:ListItem Text="Item 2" Value="2" />
    </asp:ListBox>

    <!-- Hidden Field -->
    <asp:HiddenField ID="hfUserId" runat="server" />
</form>
```

### Data-Bound Controls

```csharp
protected void Page_Load(object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        // Bind DropDownList
        ddlCountries.DataSource = GetCountries();
        ddlCountries.DataTextField = "Name";
        ddlCountries.DataValueField = "Code";
        ddlCountries.DataBind();

        // Bind GridView
        gvProducts.DataSource = GetProducts();
        gvProducts.DataBind();
    }
}

private List<Country> GetCountries()
{
    return new List<Country>
    {
        new Country { Code = "US", Name = "United States" },
        new Country { Code = "CA", Name = "Canada" },
        new Country { Code = "UK", Name = "United Kingdom" }
    };
}
```

### GridView Control

```html
<asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="false"
    OnRowCommand="gvProducts_RowCommand" DataKeyNames="Id">
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Product Name" />
        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
        <asp:BoundField DataField="Category" HeaderText="Category" />

        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditProduct"
                    CommandArgument='<%# Eval("Id") %>' />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteProduct"
                    CommandArgument='<%# Eval("Id") %>' OnClientClick="return confirm('Are you sure?');" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
```

```csharp
protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
{
    int productId = Convert.ToInt32(e.CommandArgument);

    switch (e.CommandName)
    {
        case "EditProduct":
            Response.Redirect($"EditProduct.aspx?id={productId}");
            break;
        case "DeleteProduct":
            DeleteProduct(productId);
            gvProducts.DataBind(); // Refresh grid
            break;
    }
}
```

## Validation Controls

### Required Field Validator

```html
<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvName" runat="server"
    ControlToValidate="txtName"
    ErrorMessage="Name is required"
    Display="Dynamic"
    ForeColor="Red">
</asp:RequiredFieldValidator>
```

### Range Validator

```html
<asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
<asp:RangeValidator ID="rvAge" runat="server"
    ControlToValidate="txtAge"
    MinimumValue="1"
    MaximumValue="120"
    Type="Integer"
    ErrorMessage="Age must be between 1 and 120"
    Display="Dynamic"
    ForeColor="Red">
</asp:RangeValidator>
```

### Regular Expression Validator

```html
<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator ID="revEmail" runat="server"
    ControlToValidate="txtEmail"
    ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
    ErrorMessage="Invalid email format"
    Display="Dynamic"
    ForeColor="Red">
</asp:RegularExpressionValidator>
```

### Custom Validator

```html
<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
<asp:CustomValidator ID="cvPassword" runat="server"
    ControlToValidate="txtPassword"
    OnServerValidate="cvPassword_ServerValidate"
    ErrorMessage="Password must be at least 8 characters and contain numbers"
    Display="Dynamic"
    ForeColor="Red">
</asp:CustomValidator>
```

```csharp
protected void cvPassword_ServerValidate(object source, ServerValidateEventArgs args)
{
    string password = args.Value;

    // Custom validation logic
    if (password.Length < 8)
    {
        args.IsValid = false;
        return;
    }

    if (!password.Any(char.IsDigit))
    {
        args.IsValid = false;
        return;
    }

    args.IsValid = true;
}
```

### Validation Summary

```html
<asp:ValidationSummary ID="vsSummary" runat="server"
    HeaderText="Please correct the following errors:"
    DisplayMode="BulletList"
    ForeColor="Red" />
```

## Master Pages

### Master Page (.master)

```html
<%@ Master Language="C#" AutoEventWireup="true" CodeBehind="Site.master.cs" Inherits="MyApp.Site" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><asp:ContentPlaceHolder ID="TitleContent" runat="server">My Application</asp:ContentPlaceHolder></title>
    <link href="~/Content/Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <h1>My Application</h1>
            <asp:ContentPlaceHolder ID="HeaderContent" runat="server">
                <!-- Default header content -->
            </asp:ContentPlaceHolder>
        </div>

        <div class="navigation">
            <ul>
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="About.aspx">About</a></li>
                <li><a href="Contact.aspx">Contact</a></li>
            </ul>
        </div>

        <div class="content">
            <asp:ContentPlaceHolder ID="MainContent" runat="server">
                <!-- Default content -->
            </asp:ContentPlaceHolder>
        </div>

        <div class="footer">
            <p>&copy; 2023 My Application</p>
        </div>
    </form>
</body>
</html>
```

### Content Page (.aspx)

```html
<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyApp.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home - My Application
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome to our website!</h2>
    <p>This is the main content of the home page.</p>

    <asp:Label ID="lblWelcome" runat="server"></asp:Label>
</asp:Content>
```

## User Controls

### Creating a User Control (.ascx)

```html
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="MyApp.Controls.LoginControl" %>

<div class="login-control">
    <h3>Login</h3>
    <asp:Label ID="lblUsername" runat="server" Text="Username:" AssociatedControlID="txtUsername"></asp:Label>
    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
    <br />

    <asp:Label ID="lblPassword" runat="server" Text="Password:" AssociatedControlID="txtPassword"></asp:Label>
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    <br />

    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
</div>
```

```csharp
using System;

namespace MyApp.Controls
{
    public partial class LoginControl : System.Web.UI.UserControl
    {
        public event EventHandler<LoginEventArgs> UserLoggedIn;

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Validate credentials (simplified)
            if (username == "admin" && password == "password")
            {
                lblMessage.Text = "Login successful!";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                // Raise event
                UserLoggedIn?.Invoke(this, new LoginEventArgs(username));
            }
            else
            {
                lblMessage.Text = "Invalid credentials!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    public class LoginEventArgs : EventArgs
    {
        public string Username { get; }

        public LoginEventArgs(string username)
        {
            Username = username;
        }
    }
}
```

### Using a User Control

```html
<%@ Register Src="~/Controls/LoginControl.ascx" TagName="LoginControl" TagPrefix="uc" %>

<uc:LoginControl ID="loginControl" runat="server" OnUserLoggedIn="loginControl_UserLoggedIn" />
```

```csharp
protected void loginControl_UserLoggedIn(object sender, LoginEventArgs e)
{
    // Handle successful login
    Session["Username"] = e.Username;
    Response.Redirect("Dashboard.aspx");
}
```

## Themes and Skins

### Creating a Theme

1. Create a folder `App_Themes/Default`
2. Add CSS files and skin files

### Skin File (.skin)

```html
<!-- Controls.skin -->
<asp:TextBox runat="server" CssClass="textbox" />
<asp:Button runat="server" CssClass="button" />
<asp:Label runat="server" CssClass="label" />
```

### Applying Themes

```csharp
// In Page_PreInit
protected void Page_PreInit(object sender, EventArgs e)
{
    Page.Theme = "Default";
}

// Or in Web.config
<configuration>
  <system.web>
    <pages theme="Default" />
  </system.web>
</configuration>
```

## Summary

ASP.NET Web Forms provides a rapid development environment with server controls, event-driven programming, and a familiar component model. While it has been largely superseded by ASP.NET Core, it remains relevant for maintaining legacy applications and scenarios requiring quick development with rich UI controls.
