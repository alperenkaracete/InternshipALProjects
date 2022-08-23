page 50162 "Seminar Comment List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seminar Comment Line";
    Description = 'Seminar Comment List';
    Caption = 'Seminar Comment List';
    Editable = false;
    LinksAllowed = false;
    DataCaptionFields = "No.";


    layout
    {
        area(Content)
        {
            repeater("Comment List")
            {
                Caption = 'Comment List';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    ToolTip = 'Specifies the value of the No. field.';


                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    Caption = 'Date';
                    ToolTip = 'Specifies the value of the Date field.';

                }
                field("Comment"; Rec."Comment")
                {
                    ApplicationArea = All;
                    Caption = 'Comment';
                    ToolTip = 'Specifies the value of the Comment field.';


                }
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
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
