pageextension 50152 "ResourceList" extends "Resource List"
{
    layout
    {
        addafter(Type)
        {

            field("Internal/External"; "Internal/External")
            {

                ApplicationArea = All;
            }
            field("Maximum Participants"; "Maximum Participants")
            {

                ApplicationArea = All;
                Visible = showMaxParticipants;
            }

        }

        modify(Type)
        {

            Visible = showType;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    var

    begin
        //CSD1.00>
        FILTERGROUP(3);
        ShowType := GETFILTER(Type) = '';
        ShowMaxParticipants := GETFILTER(Type) = FORMAT(Type::Machine);
        FILTERGROUP(0);
        //CSD1.00<
    end;


    var
        [InDataSet]
        showType: Boolean;
        [InDataSet]
        showMaxParticipants: Boolean;

}