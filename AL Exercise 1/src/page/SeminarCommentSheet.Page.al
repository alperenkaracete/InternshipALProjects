page 50161 "Seminar Comment Sheet"
{
    CaptionML = ENU = 'Seminar Comment Sheet';
    UsageCategory = Lists;
    ApplicationArea = All;
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
                Caption = 'GroupName';
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    Caption = 'Date';
                }
                field(Comment; Rec."Comment")
                {
                    ApplicationArea = all;
                    Caption = 'Comment';
                }
                field("Code"; Rec."Code")
                {
                    Visible = false;
                    ApplicationArea = all;
                    Caption = 'Code';
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
                Caption = 'ActionName';

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}