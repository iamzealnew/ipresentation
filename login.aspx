<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs"  Inherits="WebApplication6.login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
      <title></title>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css"/>
      <style>
         body{            
         justify-content:center;
         align-items:center;
         display:flex;
         margin-top:80px;
         }
         #pwd{
         display:none;
         }
         p{
         padding:6px;
         }
         .spinner {
         opacity: 0;
         display:none;
         width: 20px;
         height:10px;
         -webkit-transition: opacity 0.25s, max-width 0.45s;
         -moz-transition: opacity 0.25s, max-width 0.45s;
         -o-transition: opacity 0.25s, max-width 0.45s;
         transition: opacity 0.25s, max-width 0.45s;
         /* Duration fixed since we animate additional hidden width */
         }
         .has-spinner.active {
         cursor:progress;
         }
         .has-spinner.active .spinner {
         display:inline-block;
         opacity: 1;
         max-width: 50px;
         /* More than it will ever come, notice that this affects on animation duration */
         }
      </style>
      <script>
         function show() {
             var Cbtn = document.getElementById('<%= clientBtn.ClientID %>'); 
             Cbtn.className = Cbtn.className + 'active' + 'w3-blue';
         }
         
         function swap() {             
             document.getElementById('username').style.visibility="hidden";
             document.getElementById('username').style.opacity="0";
             document.getElementById('username').style.transition = "visibility 0s, opacity 1.5s linear";
             var usrname = document.getElementById('<%= txtUserName.ClientID %>');              
             var error = document.getElementById('<%= uerror.ClientID %>');
             if(error !== null)
             error.style.opacity = "0";         
             var newuser = document.getElementById('<%= txtUserHidden1.ClientID %>'); 
             newuser.value = username.value;         
             document.getElementById('username').style.display = "none";         
             var Cbtn = document.getElementById('<%= clientBtn.ClientID %>');          
             var btn = document.getElementById('<%= btn.ClientID %>');          
             Cbtn.style.display = "none";
             btn.style.display = "block";                                    
             document.getElementById('pwd').style.display = "block";
             document.getElementById('back-arrow').style.display = "block";
             document.getElementById('back-arrow').style.transitionDelay = "display 3s";         
             return false;
         }
         
      </script>
   </head>
   <body>
      <form class="w3-container" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
               <asp:HiddenField id="txtUserHidden1" runat="server"/>
               <div>
                  <div class="w3-label" style="text-align:center; font-size:medium;">
                     <p style="margin-top:3px;">Sign in to continue to Admin Portal</p>
                     <br />
                  </div>
                  <div class="w3-card-8" style="width:500px; height:400px;" >
                     <div class="w3-container w3-blue">
                        <h2>Login</h2>
                     </div>
                     <img id="back-arrow" aria-label="Back"  style="padding-top:19px;padding-left:19px; display:none;"
                        alt="Back" src="https://www.gstatic.com/images/icons/material/system/1x/arrow_back_grey600_24dp.png"/>
                     <div id="username" style="padding-top:30px;">
                        <p >
                           <label class="w3-validate w3-label ">User Name</label>
                           <asp:TextBox class="w3-input"  runat="server" ID="txtUserName"></asp:TextBox>
                        </p>
                     </div>
                     <div id="pwd" class="w3-animate-right">
                        <p >
                           <label class="w3-validate w3-label">Password</label>
                           <asp:TextBox class="w3-input" runat="server" ID="txtUserPass"></asp:TextBox>
                        </p>
                     </div>
                     <asp:Label style="color:red" Text="Sorry, We don't recognize that username." ID="uerror" runat="server" Visible="false"> </asp:Label>
                     <asp:Label style="color:red" Text="The email and password you entered don't match." ID="nomatch" runat="server" Visible="false"> </asp:Label>
                     <asp:Button ID="clientBtn"  runat="server" style="width:472px; margin:10px; align-self:center;" Text="Next" CssClass=" w3-blue w3-btn w3-blue" OnClick="clientBtn_Click1" OnClientClick="show()"/>
                     <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                           <div class="w3-center">
                              <img src="http://assets2.bostonlogic.com/images/spinner.gif" width="20" height="20">
                           </div>
                        </ProgressTemplate>
                     </asp:UpdateProgress>
                     <asp:Button  id="btn"  style="  display:none; width:472px; margin:10px; align-self:center;" Text="Submit" OnClick="btn_Click" CssClass="w3-btn w3-blue" runat="server"/>
                     <br />
                     <div class="w3-container">
                        <code style="color:ActiveCaption">To demonstrate the update progress spinner we're delaying the system thread by 2000 mili-seconds. Spinner is to ensure clients with slow internet connectivity are also served with seemless UX. This message and forced delay will only appear in demo copy.[ver 1.3.001]</code>
                     </div>
                  </div>
               </div>
            </ContentTemplate>
         </asp:UpdatePanel>
      </form>
   </body>
</html>