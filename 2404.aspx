<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="2404.aspx.cs" Inherits="SimpleMailer.WebForm1" %>

<!DOCTYPE html>
<!-- http://asp.net-tutorials.com/validation/regular-expression-validator/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Simple Web Form Mailer</title>
     <link rel="stylesheet" type="text/css" href="Simple.css" /> 
    <script type="text/javascript" src="Scripts/jquery-1.10.2.min.js"> </script>
    <script type="text/javascript" src="Scripts/FormMailer.js"> </script>
</head>
<body>



    <asp:Label runat="server" ID="HelloWorldLabel">Hello <% Response.Write(System.Security.Principal.WindowsIdentity.GetCurrent().Name);%></asp:Label>

    <form id="form1" runat="server">
    <div>
        <table id="DeficienciesTable">
                <tr>
                    <td colspan="8" class="center">
                        <h3>EQUIPMENT INSPECTION AND MAINTENANCE WORKSHEET</h3>
                        <h4>For use of this form, see DA PAM 750-8; the proponent agency is DCS, G-4.</h4>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        1. Organization: <br /><asp:TextBox type="text" id="inputOrganization" list="organizations"  runat="server"/>
                        <datalist id="organizations">
                            <option value="297th Battlefield Surveillance Brigade"></option>
                            <option value="38th Troop Command"></option>
                            <option value="761st Military Police Batalion"></option>
                            <option value="297th Military Police Company"></option>
                            <option value="1st Battalion, 207th Aviation Regiment"></option>
                            <option value="49th Missile Defense Battalion, 100th Missile Defense Brigade"></option>
                            <option value="103rd WMD Civil Support Team"></option>
                        </datalist>
                        <asp:RequiredFieldValidator runat="server" ID="reqOrganization" ControlToValidate="inputOrganization" ErrorMessage="Organization is Required."/>
                    </td>
                    <td colspan="4">
                        2. Nomenclature and Model: <br /><asp:TextBox type="text" id="inputModel" list="Models" runat="server" />
                        <datalist id="Models">
                            <option value="1151"></option>
                            <option value="SUS-V"></option>
                        </datalist>
                        <asp:RequiredFieldValidator runat="server" ID="reqModel" ControlToValidate="inputOrganization" ErrorMessage="Model is Required." />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">3. Registration/Serial/NSN: <br /><asp:TextBox type="text" id="inputNSN"  runat="server"/></td>
                    <asp:RequiredFieldValidator runat="server" ID="reqNSN" ControlToValidate="inputNSN" ErrorMessage="Registration/Serial/NSN is required." />
                    <td>4a. Miles: <br /><input type="number" id="inputMiles" /></td>
                    <td>b. Hours: <br /><input type="number" id="inputHours" /></td>
                    <td>c. Rounds Fired: <br /><input type="number" id="inputRoundsFired" /></td>
                    <td>d. Hot Starts: <br /><input type="number" id="inputHotStarts" /></td>
                    <td>5. Date: <br /><asp:TextBox runat="server" ID="inputDate" ></asp:TextBox></td>
                    <asp:RequiredFieldValidator runat="server" ID="reqDate" ControlToValidate="inputDate" ErrorMessage="Date is Required." />
                    <td>
                        6. Type Inspection: <br /><asp:TextBox type="text" id="inputInspection" list="InspectionType"  runat="server"/>
                        <datalist id="InspectionType">
                            <option value="Before"></option>
                            <option value="During"></option>
                            <option value="After"></option>
                            <option value="Weekly"></option>
                            <option value="Monthly"></option>
                        </datalist>
                        <asp:RequiredFieldValidator runat="server" ID="reqInspection" ControlToValidate="inputInspection" ErrorMessage="Inspection Type is Required." />
                    </td>
                </tr>
                <tr><td>7.</td><td class="center" colspan=" 6"> APPLICABLE REFERENCE</td><td></td></tr>
                <tr>
                    <td colspan="2">TM Number:  <br />   <asp:TextBox type="text" ID="inputTM1" list="TM"  runat="server"/></td>
                    <td colspan="2">TM Date:    <br />   <asp:TextBox type="text" ID="inputTMD1" list="TMD"  runat="server"/></td>
                    <!-- only one TM Number/TM Date is required -->
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="inputTM1" ErrorMessage="At least one TM Number is required." />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="inputTMD1" ErrorMessage="At least one TM Date is required." />
                    <td colspan="2">TM Number:  <br />   <asp:TextBox type="text" ID="inputTM2" list="TM"  runat="server"/></td>
                    <td colspan="2">TM Date:    <br />   <asp:TextBox type="text" ID="inputTMD2" list="TMD"  runat="server"/></td>
                    <datalist id="TM">
                        <option value="TM9-2320-387-10"></option>
                    </datalist>
                    <datalist id="TMD">
                        <option value="OCTOBER 1997"></option>
                    </datalist>
                </tr>
                <tr>
                    <td colspan="4">COLUMN a - Enter TM item number.<br />COLUMN b - Enter the applicable consition status symbol.<br />COLUMN c - Enter deficiencies and shortcomings.<br /></td>
                    <td colspan="4">COLUMN d - Show corrective action for deficience or shortcoming listed in Column c.<br />COLUMN e - Individual ascertaining completed corrective action initial in this column.<br /></td>
                </tr>
                <tr><td colspan="8" class="center">STATUS SYMBOLS</td></tr>
                <tr>
                    <td colspan="4">"X" - Indicates a deficiency in the equipment that places is in an inoperable status.<br />CIRCLED "X" - Indicates a deficiency, however, the equipment may be operated under specific limitations as directed by higher authority or as prescribed locally, until corrective action can be accomplished.<br />HORIZONTAL DASH "(-)" - Indicated that a required inspection, component replacement, maintenance operation check, or test flight is due but has not been accomplished, or an overdue MWO has not been accomplished.</td>
                    <td colspan="4">DIAGONAL "(/)" - Indicates a material defect other than a deficiency which must be corrected to increase efficiency or to make the item completely serviceable. <br />LAST NAME INITIAL IN BLACK, BLUE-BLACK INK, OR PENCIL - Indicates that a completely satisfactory condition exists.<br />FOR AIRCRAFT - Status symbols will be recorded in red.</td>
                </tr>
                <tr>
                    <td colspan="3">8a.) SIGNATURE (Person(s) performing inspection): <br /><asp:TextBox type="text" ID="inputSig1"  runat="server"/></td>
                    <td>8b) TIME <br /><asp:TextBox type="time" ID="inputTime1"  runat="server"/></td>
                    <td colspan="2">9a.) SIGNATURE (Maintenance Supervisor): <br /><asp:TextBox type="text" ID="inputSig2"  runat="server"/> </td>
                    <td>9b) TIME <br /><asp:TextBox type="time" ID="inputTime2"  runat="server"/></td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="inputSig1" ErrorMessage="Signature is Required." />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="inputTime1" ErrorMessage="Time is Required." />
                    <td>10.) Manhours Required <br /><asp:TextBox type="number" ID="inputManHours"  runat="server"/></td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="inputManHours" ErrorMessage="Man Hours is Required." />
                </tr>


                <tr><td class="center">TM ITEM NO.<br />a</td>      <td class="center">STATUS<br />b</td><td class="center" colspan="3">DEFICIENCIES AND SHORTCOMINGS<br />c</td><td class="center" colspan="2">CORRECTIVE ACTION<br />d</td><td class="center">INITIAL WHEN CORRECTED<br />e</td></tr>
                <div id="deficiencyRows">
                
                    <tr>
                    <td><asp:TextBox type="number"  ID="inputItemNumber" runat="server"/> </td>
                    <td>
                        <asp:DropDownList runat="server" ID="inputStatus" AutoPostBack="True">
                            <asp:ListItem  value=" "> </asp:ListItem>
                            <asp:ListItem  value="X">X</asp:ListItem>
                            <asp:ListItem  value="CircledX">&#x24cd;</asp:ListItem>
                            <asp:ListItem  value="Dash">-</asp:ListItem>
                            <asp:ListItem  value="Diagonal">/</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td colspan="3"><asp:TextBox type="text" ID="inputDeficiencies"  runat="server" Width="370px"/></td>
                    <td colspan="2"><asp:TextBox type="text" ID="inputCorrectiveAction"  runat="server" Width="237px"/></td>
                    <td><asp:TextBox type="text" ID="inputInitials"  runat="server"/></td>
                </tr> </div>
            </table>
            <asp:Button runat="server" id="addRow" Text="Add Row!"/>
            <br />Send form to:<asp:TextBox runat="server" ID="emailTo" Width="180px">???</asp:TextBox>
            <asp:Button type="submit" name="SendMail" runat="server" OnClick="SendMailButton_Click" Text="Send Email."/>
    </div>
    </form>
    
</body>
</html>
