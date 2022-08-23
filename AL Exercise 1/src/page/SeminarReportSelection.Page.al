page 50205 "Seminar Report Selection"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seminar Report Selections";
    SaveValues = true;
    Caption = 'Seminar Report Selection';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'GroupName';
                field(Usage; ReportUsage2)
                {
                    ApplicationArea = All;
                    Caption = 'ReportUsage2';
                    ToolTip = 'Specifies the value of the ReportUsage2 field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        SetUsageFilter;
                        ReportUsage2OnAfterValidate;
                    end;

                }

            }
            repeater(asd)
            {
                Caption = 'asd';
                field(Sequence; Rec.Sequence)
                {
                    ApplicationArea = All;
                    Caption = 'Sequence';
                    ToolTip = 'Specifies the value of the Sequence field.';
                }
                field("Report ID"; Rec."Report ID")
                {
                    ApplicationArea = All;
                    LookupPageId = 358;
                    Caption = 'Report ID';
                    ToolTip = 'Specifies the value of the Report ID field.';
                }
                field("Report Name"; Rec."Report Name")
                {
                    ApplicationArea = All;
                    DrillDown = false;
                    LookupPageID = 358;
                    Caption = 'Report Name';
                    ToolTip = 'Specifies the value of the Report Name field.';
                }

            }


        }

        area(FactBoxes)
        {
            systempart(Notes; Notes)
            {

                ApplicationArea = All;
                Visible = false;
            }


            systempart(RecordLinks; Links)
            {

                ApplicationArea = All;
                Visible = false;
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
        ReportUsage2: Option "Registration";


    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        SetUsageFilter();
    end;

    trigger OnNewRecord(bool: Boolean)
    var
        myInt: Integer;
    begin
        Rec.NewRecord;
    end;

    LOCAL PROCEDURE SetUsageFilter();
    BEGIN
        Rec.FILTERGROUP(2);
        CASE ReportUsage2 OF
            ReportUsage2::Registration:
                Rec.SETRANGE(Usage, Rec.Usage::Registration);
        END;
        Rec.FILTERGROUP(0);
    END;

    LOCAL PROCEDURE ReportUsage2OnAfterValidate();
    BEGIN
        CurrPage.UPDATE;
    END;
}