page 50101 "My Seminars"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "My Seminar";
    Caption = 'My Seminars';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                Caption = 'GroupName';
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    Caption = 'User ID';
                    ToolTip = 'Specifies the value of the User ID field.';

                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar No.';
                    ToolTip = 'Specifies the value of the Seminar No. field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        GetSeminar;
                    end;
                }
                field("<Control4>"; Rec."<Control4>")
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("<Control5>"; Rec."<Control5>")
                {
                    ApplicationArea = All;
                    Caption = 'Duration';
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("<Control6>"; Rec."<Control6>")
                {
                    ApplicationArea = All;
                    Caption = 'Price';
                    ToolTip = 'Specifies the value of the Price field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Open)
            {
                ApplicationArea = All;
                Caption = 'Open';
                Image = Edit;
                ShortcutKey = 'Return';
                ToolTip = 'Executes the Open action.';

                trigger OnAction()
                begin
                    OpenSeminarCard();
                end;

            }
        }
    }

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        GetSeminar;
    end;

    trigger OnNewRecord(bool: Boolean)
    var
        myInt: Integer;
    begin
        Clear(Seminar);
    end;

    var
        Seminar: Record Seminar;

    procedure GetSeminar()
    var
        myInt: Integer;
    begin
        CLEAR(Seminar);
        IF Seminar.GET(Rec."Seminar No.") THEN;
    end;

    procedure OpenSeminarCard()
    var
        myInt: Integer;
    begin
        IF Seminar.GET(Rec."Seminar No.") THEN
            PAGE.RUN(PAGE::"Seminar Card", Seminar);

    end;
}