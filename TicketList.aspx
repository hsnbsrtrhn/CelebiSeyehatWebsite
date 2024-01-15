<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="TicketList.aspx.cs" Inherits="Çelebi_Seyahat_Acentesi.TicketList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Ticket List</title>
        <link href="Content/TicketList.css" rel="stylesheet" />
        <script type="text/javascript">
                    function showModal(ticketInfo)
                    {
                       document.getElementById('modalText').innerHTML = ticketInfo + " biletini rezerve etmek istediğinize emin misiniz?";
                       document.getElementById('<%= pnlConfirmModal.ClientID %>').style.display = 'block';
                    }
                    function hideModal()
                    {
                        document.getElementById('<%= pnlConfirmModal.ClientID %>').style.display = 'none';
                    }
                    function confirmReservation()
                    {
                        var modalContent = document.getElementById('modalContent');
                        modalContent.innerHTML = '<div class="reservation-confirmation"><span class="checkmark">&#10003;</span> Rezervasyonunuz oluşturuldu.</div>';
                        
                        setTimeout(function () 
                        {
                            document.getElementById('<%= pnlConfirmModal.ClientID %>').style.display = 'none'
                         __doPostBack('ConfirmReservation','');   
                        }, 3000);
                        
                    }
        </script>
    </head>
    <body>
            <div class="container-ticket-list">
                <h2 class="section-title-ticket-list">Bilet Satın Al</h2>
                <asp:GridView ID="gvTicketList" runat="server" AutoGenerateColumns="False" CssClass="ticket-list">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" />
                        <asp:BoundField DataField="Company" HeaderText="Şirket" />
                        <asp:BoundField DataField="Time" HeaderText="Tarih" />
                        <asp:BoundField DataField="ExitPoint" HeaderText="Çıkış Noktası" />
                        <asp:BoundField DataField="DestinationPoint" HeaderText="Varış Noktası" />
                        <asp:BoundField DataField="Price" HeaderText="Fiyat" />
                        <asp:TemplateField HeaderText="Müsait">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkPurchasable" runat="server" Checked='<%# Eval("isPurchasable") %>' Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Rezervasyon Oluştur">
                            <ItemTemplate>
                                <asp:Button ID="btnReserve" runat="server" Text="Rezerve Et" 
                                           CommandArgument='<%# Eval("Id") %>' 
                                           OnClick="btnReserve_Click" 
                                           OnClientClick='<%# "showModal(\"" + Eval("Company") + " - " + Eval("Time") + "\"); return false;" %>' 
                                           Visible='<%# Convert.ToBoolean(Eval("isPurchasable")) %>' />

                            </ItemTemplate>
                        </asp:TemplateField>
                      
                    </Columns>
                    
                </asp:GridView>
                
                <asp:Panel ID="pnlConfirmModal" runat="server" CssClass="modal" style="display:none;">
                            <div class="modal-content" id = "modalContent">
                                <span class="close-button" onclick="hideModal();">&times;</span>
                                <h2>Rezervasyon Onayı</h2>
                                <p id="modalText">Bu bileti rezerve etmek istediğinize emin misiniz?</p>
                                <button class="confirm-button" onclick="confirmReservation();">Evet</button>
                                <button class="cancel-button" onclick="hideModal();">Hayır</button>
                            </div>
                    </asp:Panel>
                
            </div>
    </body>
    </html>
</asp:Content>
