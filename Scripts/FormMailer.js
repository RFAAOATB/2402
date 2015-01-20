
var rowcount = 1;
var TMItem1 = '<tr><td><input type="number" name="inputItemNumber';
var TMItem2 = '" /> </td><td>';
var Status1 = '<select name="inputStatus';
var Status2 = '"> <option  value=" "> <option/> <option  value="X">X<option/> <option  value="CircledX">&#x24cd;<option/> <option value="Dash">-<option/> <option value="Diagonal">/<option/></select> </td> <td colspan="3">';
var Deficiencies1 = '<input type="text"  name="inputDeficiencies';
var Deficiencies2 = '" /></td><td colspan="2">';
var CorrectiveAction1 = '<input type="text" name="inputCorrectiveAction';
var CorrectiveAction2 = '"  runat="server"/></td><td>';
var Initials1 = '<input type="text" name="inputInitials';
var Initials2 = '"  runat="server"/></td> </tr>';
var deficienciesRow =   TMItem1 + rowcount + TMItem2
                        + Status1 + rowcount + Status2
                        + Deficiencies1 + rowcount + Deficiencies2
                        + CorrectiveAction1 + rowcount + CorrectiveAction2
                        + Initials1 + rowcount + Initials2;

$(document).ready(function() {
    $("#addRow").click(function() {
        
        deficienciesRow = TMItem1 + rowcount + TMItem2
                        + Status1 + rowcount + Status2
                        + Deficiencies1 + rowcount + Deficiencies2
                        + CorrectiveAction1 + rowcount + CorrectiveAction2
                        + Initials1 + rowcount + Initials2;
        console.log(deficienciesRow);
            $("#DeficienciesTable").append(deficienciesRow);
            rowcount++;
        }
    );


});
