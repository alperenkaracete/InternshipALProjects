page 50100 "Seminar Manager Activities"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Seminar Cue";
    Caption = 'Seminar Manager Activities';


    layout
    {
        area(Content)
        {
            cuegroup(Registration)
            {
                Caption = 'Registration';
                field(Planned; Rec.Planned)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Seminar Registration List";
                    Caption = 'Planned';
                    ToolTip = 'Specifies the value of the Planned field.';

                }
                field(Registered; Rec.Registered)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Seminar Registration List";
                    Caption = 'Registered';
                    ToolTip = 'Specifies the value of the Registered field.';

                }

                actions
                {

                    action(New)
                    {
                        ApplicationArea = All;
                        RunPageMode = Create;
                        RunObject = Page "Seminar Registration";
                        Caption = 'New';
                        ToolTip = 'Executes the New action.';

                        trigger OnAction()
                        begin

                        end;
                    }
                }
            }

            cuegroup("For Posting")
            {
                Caption = 'For Posting';
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Seminar Registration List";
                    Caption = 'Closed';
                    ToolTip = 'Specifies the value of the Closed field.';

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

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Rec.RESET;
        IF NOT Rec.GET THEN BEGIN
            Rec.INIT;
            Rec.INSERT;
        END;
    end;
}