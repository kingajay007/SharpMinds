using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SharpMinds.BAL
{
    public abstract class BasePage : Page
    {
        public enum NotifyType { Success,Error};

        private void Notification(NotifyType type, string message)
        {
            Label lblStatus = this.Master.FindControl(string.Format("lblNotification{0}",type)) as Label;
            lblStatus.Visible = true;
            lblStatus.Text = message;
        }

        public void SuccessNotification(string message)
        {
            Notification(NotifyType.Success,message);
        }

        public void ErrorNotification(string message)
        {
            Notification(NotifyType.Error, message);
        }

        public string CheckQueryString(string key)
        {
            string queryString = Request.QueryString[key];
            return queryString;
        }
    }
}
