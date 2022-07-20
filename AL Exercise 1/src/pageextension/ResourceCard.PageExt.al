pageextension 51150 "ResourceCard" extends "Resource Card"
{

    layout
    {
        addlast(General)
        {

            field("Internal/External"; "Internal/External")
            {

                ApplicationArea = All;

            }
            field("Quantity Per Day"; "Quantity Per Day")
            {

                ApplicationArea = All;

            }


        }

        addlast(content)
        {

            group(Room)
            {

                field("Maximum Participants"; "Maximum Participants")
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