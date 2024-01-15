using Çelebi_Seyahat_Acentesi.Model;
using Çelebi_Seyahat_Acentesi.Service;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Çelebi_Seyahat_Acentesi
{
    public partial class TicketList : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckUserAccess();
                DisplayTicketList();
            }
        }

        private void DisplayTicketList()
        {
            List<Ticket> tickets = TicketService.getTickets();

            gvTicketList.DataSource = tickets;
            gvTicketList.DataBind();
        }

        private void CheckUserAccess()
        {
            User currentUser = (User)Session["CurrentUser"];

            if (currentUser == null)
            {
                Response.Redirect("Auth.aspx");
            }
        }

        protected void btnReserve_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            string ticketId = gvTicketList.DataKeys[gvr.RowIndex].Values["Id"].ToString();
            Session["ReservedTicketId"] = ticketId;
        }

        protected override void RaisePostBackEvent(IPostBackEventHandler sourceControl, string eventArgument)
        {
            base.RaisePostBackEvent(sourceControl, eventArgument);
            if (eventArgument == "ConfirmReservation" )
            {
                var reservedTicketId = Session["ReservedTicketId"];
                if (reservedTicketId != null)
                {
                   
                }
            }
        }
    }
}