pageextension 50152 "ResourceList" extends "Resource List"
{
    layout
    {
        addafter(Type)
        {

            field("Internal/External"; Rec."Internal/External")
            {

                ApplicationArea = All;
                Caption = 'Internal-External Operations';
            }
            field("Maximum Participants"; Rec."Maximum Participants")
            {

                ApplicationArea = All;
                Visible = showMaxParticipants;
                Caption = 'Maximum Participants';
            }

        }

        modify(Type)
        {

            Visible = showType;
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    var

    begin
        //CSD1.00>
        Rec.FILTERGROUP(3);
        ShowType := Rec.GETFILTER(Type) = '';
        ShowMaxParticipants := Rec.GETFILTER(Type) = FORMAT(Rec.Type::Machine);
        Rec.FILTERGROUP(0);
        //CSD1.00<
    end;


    var
        [InDataSet]
        ShowType: Boolean;
        [InDataSet]
        ShowMaxParticipants: Boolean;

}