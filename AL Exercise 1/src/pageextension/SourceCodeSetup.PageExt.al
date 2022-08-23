pageextension 50180 "SourceCodeSetup" extends "Source Code Setup"
{
    layout
    {
        addafter("Cost Accounting")
        {

            group("Seminar Management")
            {
                Caption = 'Seminar Management';

                field(Seminar; Rec.Seminar)
                {

                    ApplicationArea = All;
                    Caption = 'Seminar';
                    ToolTip = 'Specifies the value of the Seminar field.';
                }
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