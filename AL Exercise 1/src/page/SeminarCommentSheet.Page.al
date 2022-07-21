page 50161 "Seminar Comment Sheet"
{
    CaptionML = ENU = 'Seminar Comment Sheet';
    MultipleNewLines = true;
    LinksAllowed = false;
    SourceTable = "Seminar Comment Line";
    DelayedInsert = true;
    DataCaptionFields = "No.";
    PageType = List;
    AutoSplitKey = true;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec."Comment")
                {
                    ApplicationArea = all;
                }
                field("Code"; Rec."Code")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}