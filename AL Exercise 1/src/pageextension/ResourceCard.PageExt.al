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
                ToolTip = 'Specifies the value of the Internal-External Operations field.';

            }
            field("Quantity Per Day"; Rec."Quantity Per Day")
            {

                ApplicationArea = All;
                Caption = 'Quantity Per Day';
                ToolTip = 'Specifies the value of the Quantity Per Day field.';

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
                    ToolTip = 'Specifies the value of the Maximum Participants field.';
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