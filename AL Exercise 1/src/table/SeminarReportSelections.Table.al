table 50201 "Seminar Report Selections"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Usage; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Regitration";

        }
        field(2; Sequence; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Report ID"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = Object.ID WHERE("Type" = CONST("Report"));
            trigger OnValidate()
            BEGIN
                CALCFIELDS("Report Name");
            END;


        }
        field(4; "Report Name"; Text[80])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(AllObjWithCaption."Object Caption" WHERE("Object Type" = CONST("Report"), "Object ID" = FIELD("Report ID")));

        }
    }

    keys
    {
        key(Key1; Usage, Sequence)
        {
            Clustered = true;
        }
    }

    var
        ReportSelection2: Record "Seminar Report Selections";

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    PROCEDURE NewRecord();
    BEGIN
        ReportSelection2.SETRANGE(Usage, Usage);
        IF ReportSelection2.FIND('+') AND (ReportSelection2.Sequence <> '') THEN
            Sequence := INCSTR(ReportSelection2.Sequence)
        ELSE
            Sequence := '1';
    END;


}