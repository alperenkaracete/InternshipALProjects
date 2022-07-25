pageextension 50180 "SourceCodeSetup" extends "Source Code Setup"
{
    layout
    {
        addafter("Cost Accounting")
        {

            group("Seminar Management")
            {

                field(Seminar; Rec.Seminar)
                {

                    ApplicationArea = All;
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