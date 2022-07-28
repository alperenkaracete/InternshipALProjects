pageextension 50185 "ResourceLedgerEntries" extends "Resource Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {

            field("Seminar No."; Rec."Seminar No.")
            {

                ApplicationArea = All;
                Caption = 'Seminar No.';
            }
            field("Seminar Registratio No."; Rec."Seminar Registration No.")
            {

                ApplicationArea = All;
                Caption = 'Seminar Registration No.';
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