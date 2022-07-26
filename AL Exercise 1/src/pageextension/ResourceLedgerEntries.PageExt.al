pageextension 50185 "ResourceLedgerEntries" extends "Resource Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {

            field("Seminar No."; Rec."Seminar No.")
            {

                ApplicationArea = All;
            }
            field("Seminar Registratio No."; Rec."Seminar Registration No.")
            {

                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}