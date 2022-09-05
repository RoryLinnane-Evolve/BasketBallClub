<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmPaymentScreen.aspx.cs" Inherits="BasketBallRegistration.frmPaymentScreen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="smart-button-container">
      <div style="text-align: center;">
        <div id="paypal-button-container"></div>
      </div>
    </div>



  <script type="text/javascript" src="https://www.paypal.com/sdk/js?client-id=ATr_ffVPgBwyN4yhPKrWHQJCSBHL4x3vVbEfaHLjJDmpaYr27M0YBlaS-77GCLyDHp0K-ZXD_7F8VsT2&enable-funding=venmo&currency=EUR" data-sdk-integration-source="button-factory"></script>
  <script type="text/javascript">
      function UpdatePayedStatus() {
        //fix function to call C# method
        $.ajax({
            type: "POST",
            url: 'frmPaymentScreen.aspx/UpdatePlayerStatus',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                alert(msg);
            },
            error: function (msg) {
                alert("Something Wrong.");
            }
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
                  UpdatePayedStatus();
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
