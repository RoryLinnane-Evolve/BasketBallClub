<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmPaymentScreen.aspx.cs" Inherits="BasketBallRegistration.frmPaymentScreen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="smart-button-container">
      <div style="text-align: center;">
        <div id="paypal-button-container"></div>
      </div>
    </div>
    <asp:ScriptManager ID="Script1" runat="server"></asp:ScriptManager>
    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>



  
    <asp:Button ID="HiddenBtn" ClientIDMode="Inherit" runat="server" Text="Button" OnClick="HiddenBtn_Click" Visible="true"/>
    <script type="text/javascript" src="https://www.paypal.com/sdk/js?client-id=ATr_ffVPgBwyN4yhPKrWHQJCSBHL4x3vVbEfaHLjJDmpaYr27M0YBlaS-77GCLyDHp0K-ZXD_7F8VsT2&enable-funding=venmo&currency=EUR" data-sdk-integration-source="button-factory"></script>
  <script type="text/javascript">

      //-----------------------------------------------------------------------------+
      // jQuery call AJAX Page Method                                                |
      //-----------------------------------------------------------------------------+
      function PageMethod(fn, paramArray, successFn, errorFn) {
          var pagePath = window.location.pathname;
          //-------------------------------------------------------------------------+
          // Create list of parameters in the form:                                  |
          // {"paramName1":"paramValue1","paramName2":"paramValue2"}                 |
          //-------------------------------------------------------------------------+
          var paramList = '';
          if (paramArray.length > 0) {
              for (var i = 0; i < paramArray.length; i += 2) {
                  if (paramList.length > 0) paramList += ',';
                  paramList += '"' + paramArray[i] + '":"' + paramArray[i + 1] + '"';
              }
          }
          paramList = '{' + paramList + '}';
          //Call the page method
          $.ajax({
              type: "POST",
              url: pagePath + "/" + fn,
              contentType: "application/json; charset=utf-8",
              data: paramList,
              dataType: "json",
              success: successFn,
              error: errorFn
          });
      }

      function initPayPalButton() {
          var price =<%=Price%>;
          paypal.Buttons({
              style: {
                  shape: 'rect',
                  color: 'gold',
                  layout: 'vertical',
                  label: 'paypal',
              },

              createOrder: function (data, actions) {
                  return actions.order.create({
                      purchase_units: [{ "description": "Registration fee", "amount": { "currency_code": "EUR", "value": price } }]
                  });
              },

              onApprove: function (data, actions) {
                  PageMethod('UpdatePlayerStatus', [], alert("success"), alert("error"))
                  return actions.order.capture().then(function (orderData) {

                      // Full available details
                      console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
                      // Show a success message within this page, e.g.
                      const element = document.getElementById('paypal-button-container');
                      element.innerHTML = '';
                      element.innerHTML = '<h3>Thank you for your payment!</h3>';

                      // Or go to another URL:  actions.redirect('thank_you.html');

                  });
              },

              onError: function (err) {
                  console.log(err);
              }
          }).render('#paypal-button-container');
      }
      initPayPalButton();
  </script>    
</asp:Content>
