<%@ Page Title="" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="frmPaymentScreen.aspx.cs" Inherits="BasketBallRegistration.frmPaymentScreen" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">
    <%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">--%>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <div>
    <div id="smart-button-container" style="margin-left: 17%">
        <br />
<br />
<br />
<br />
        <div class="card" style="width:inherit">
            <div class="card-header"><h1>Your Cart:</h1></div>
            <div class="card-body" id="receipt">
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <div>
            <div id="paypal-button-container"></div>
        </div>
    </div>
        </div>
     <script type="text/javascript" src="https://www.paypal.com/sdk/js?client-id=ATr_ffVPgBwyN4yhPKrWHQJCSBHL4x3vVbEfaHLjJDmpaYr27M0YBlaS-77GCLyDHp0K-ZXD_7F8VsT2&enable-funding=venmo&currency=EUR" data-sdk-integration-source="button-factory"></script>
    

    <script type="text/javascript">

        function UpdateStatus() {
            $.ajax({
                url: "frmPaymentScreen.aspx/Complete",
                data: "{}",
                contentType: "Application/json; charset=utf-8",
                responseType: "json",
                method: "POST",
                success: function (response) {
                    alert('success');
                },
                error: function (xhr) {
                    alert("There was a problem Updating the payed status of your players.")
                },
                Failure: function (response) {
                    alert("failure")
                }
            });
        }

        function initPayPalButton() {
            const receipt = document.getElementById('receipt');
            receipt.innerHTML = '<%=unpaidPlayersList%>';
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
                        purchase_units: [{
                            "description": "Registration fee",
                            "amount": { "currency_code": "EUR", "value": price }
                        }]
                    });
                },

                onApprove: function (data, actions) {
                    UpdateStatus();
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
