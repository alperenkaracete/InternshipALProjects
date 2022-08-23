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
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Comment; Rec."Comment")
                {
                    ApplicationArea = all;
                    Caption = 'Comment';
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Code"; Rec."Code")
                {
                    Visible = false;
                    ApplicationArea = all;
                    Caption = 'Code';
                    ToolTip = 'Specifies the value of the Code field.';
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
                ToolTip = 'Executes the ActionName action.';

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}