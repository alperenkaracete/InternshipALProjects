page 50205 "Seminar Report Selection"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seminar Report Selections";
    SaveValues = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Usage; ReportUsage2)
                {
                    ApplicationArea = All;
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
                field(Sequence; Sequence)
                {
                    ApplicationArea = All;
                }
                field("Report ID"; "Report ID")
                {
                    ApplicationArea = All;
                    LookupPageId = 358;
                }
                field("Report Name"; "Report Name")
                {
                    ApplicationArea = All;
                    DrillDown = false;
                    LookupPageID = 358;
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
        NewRecord;
    end;

    LOCAL PROCEDURE SetUsageFilter();
    BEGIN
        FILTERGROUP(2);
        CASE ReportUsage2 OF
            ReportUsage2::Registration:
                SETRANGE(Usage, Usage::Registration);
        END;
        FILTERGROUP(0);
    END;

    LOCAL PROCEDURE ReportUsage2OnAfterValidate();
    BEGIN
        CurrPage.UPDATE;
    END;
}