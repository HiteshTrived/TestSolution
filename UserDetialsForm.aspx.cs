using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ServiceReference1;

public partial class UserDetialsForm : System.Web.UI.Page
{
    ServiceReference1.Service1Client objServiceClientobjService = new ServiceReference1.Service1Client();
    protected void Page_Load(object sender, EventArgs e)
    {
        clearRadioSelection();
    }
    //this function Convert to Encord your Password 
    public static string EncodePasswordToBase64(string password)
    {
        try
        {
            byte[] encData_byte = new byte[password.Length];
            encData_byte = System.Text.Encoding.UTF8.GetBytes(password);
            string encodedData = Convert.ToBase64String(encData_byte);
            return encodedData;
        }
        catch (Exception ex)
        {
            throw new Exception("Error in base64Encode" + ex.Message);
        }
    } //this function Convert to Decord your Password
    public string DecodeFrom64(string encodedData)
    {
        System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
        System.Text.Decoder utf8Decode = encoder.GetDecoder();
        byte[] todecode_byte = Convert.FromBase64String(encodedData);
        int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
        char[] decoded_char = new char[charCount];
        utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
        string result = new String(decoded_char);
        return result;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        UserDetails userInfo = new UserDetails();
        DateTime dt = System.DateTime.Now.Date;
        string keyUserandTime = txtUserName.Text + Convert.ToString(dt);
        string key = EncodePasswordToBase64(keyUserandTime);
        userInfo.Key = key;
        userInfo.UserName = txtUserName.Text;
       string encrptPassword = EncodePasswordToBase64(txtPassword.Text);
       userInfo.Password = encrptPassword;
        userInfo.PhoneNumber = Convert.ToInt32(txtPhoneNumber.Text);
        if (rdbMale.Checked)
        {
            userInfo.Gender = rdbMale.Text;
        }
        else if (rdbFemale.Checked)
        {
            userInfo.Gender = rdbFemale.Text;
        }
        else
        {
            userInfo.Gender = rdbOthers.Text;
        }
     //   userInfo.Email = .Text;
        string result = objServiceClientobjService.InsertUserDetails(userInfo);
        LabelMessage.Text = result;
    }
    public void clearRadioSelection()
    {
        if (rdbMale.Checked){
            lblerror.Visible = false;
            rdbFemale.Checked = false;
            rdbOthers.Checked = false;
        }
        else if(rdbFemale.Checked){
            lblerror.Visible = false;
            rdbMale.Checked = false;
            rdbOthers.Checked = false;
        }
        else if (rdbOthers.Checked )
        {
            lblerror.Visible = false;
            rdbMale.Checked = false;
            rdbFemale.Checked = false;
        }
        else{
            lblerror.Visible = true;
            lblerror.Text = "Please select the Gender"
        }
    }
}