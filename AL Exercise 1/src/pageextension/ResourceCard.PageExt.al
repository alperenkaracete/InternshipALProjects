pageextension 51150 "ResourceCard" extends "Resource Card"
{

    layout
    {
        addlast(General)
        {

            field("Internal/External"; Rec."Internal/External")
            {

                ApplicationArea = All;
                Caption = 'Internal-External Operations';

            }
            field("Quantity Per Day"; Rec."Quantity Per Day")
            {

                ApplicationArea = All;
                Caption = 'Quantity Per Day';

            }


        }

        addlast(content)
        {

            group(Room)
            {
                Caption = 'Room';

                field("Maximum Participants"; Rec."Maximum Participants")
                {

                    ApplicationArea = All;
                    Caption = 'Maximum Participants';
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