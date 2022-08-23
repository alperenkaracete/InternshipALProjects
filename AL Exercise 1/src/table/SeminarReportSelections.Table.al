table 50201 "Seminar Report Selections"
{
    DataClassification = ToBeClassified;
    Caption = 'Seminar Report Selections';

    fields
    {
        field(1; Usage; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Registration";
            Caption = 'Usage';

        }
        field(2; Sequence; Code[10])
        {
            DataClassification = ToBeClassified;
            Numeric = true;
            Caption = 'Sequence';
        }


        field(3; "Report ID"; Integer)
        {

            DataClassification = ToBeClassified;

            TableRelation = AllObjWithCaption."Object ID" WHERE("Object Type" = CONST("Report"));
            Caption = 'Report ID';
            trigger OnValidate()
            BEGIN
                CALCFIELDS("Report Name");
            END;


        }
        field(4; "Report Name"; Text[249])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(AllObjWithCaption."Object Caption" WHERE("Object Type" = CONST("Report"), "Object ID" = FIELD("Report ID")));
            Caption = 'Report Name';

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