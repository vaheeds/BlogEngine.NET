<%@ Page Language="C#" MasterPageFile="account.master" AutoEventWireup="true" ClientIDMode="Static" Inherits="Account.Login" CodeBehind="login.aspx.cs" enableSessionState="true" %>

<%@ MasterType VirtualPath="~/Account/account.master" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false" OnAuthenticate="LoginUser_OnAuthenticate">
        <LayoutTemplate>
            <h1 class="account-title" dir="rtl">
                <asp:Label runat="server" ID="lblTitle" Text="<%$Resources:labels,login %>" />
            </h1>
            <div class="account-body" dir="rtl">
                <div class="form-group">
                    <label>نام کاربری</label>
                    <asp:TextBox ID="UserName" runat="server" AutoCompleteType="None" CssClass="textEntry ltr-dir"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>رمز عبور</label>
                    <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry ltr-dir" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group with-icon">
                    <span class="icon-form-group">
                        <asp:CheckBox ID="RememberMe" runat="server" /></span>
                    <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="label-title "><%=Resources.labels.rememberMe %></asp:Label>
                </div>
            
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn btn-success btn-block btn-lg" Text="<%$Resources:labels,login %>" OnClientClick="return ValidateLogin();" />
                <div class="small-link ">
                    <asp:PlaceHolder ID="phResetPassword" runat="server">
                        <asp:HyperLink runat="server" ID="linkForgotPassword" CssClass="text-muted" Text="<%$ Resources:labels,forgotPassword %>" />
                    </asp:PlaceHolder>
                </div>
            </div>
            
        </LayoutTemplate>
        
    </asp:Login>
    <% if (BlogEngine.Core.BlogSettings.Instance.EnableSelfRegistration)
       { %>
     <hr />
                
                
    <div id="LoginRegister" class="text-center account-body text-uppercase">
       
        <%=Resources.labels.dontHaveAccount %>
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false" />
    </div>
    <% } %>
    <div class="form-group">
        <asp:Image ID="Image1" runat="server" Height="55px" ImageUrl="Turing.aspx" src="botdetect-captcha-graffiti.jpg" Width="186px" />  
        <asp:TextBox ID="txtTuring" runat="server"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("input[name$='UserName']").focus();
        });
    </script>
</asp:Content>
