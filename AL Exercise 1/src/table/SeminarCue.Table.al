table 51000 "Seminar Cue"
{
    DataClassification = ToBeClassified;
    Caption = 'Seminar Cue';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Primary Key';

        }
        field(2; Planned; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Seminar Registration Header" WHERE(Status = CONST(Planning)));
            Caption = 'Planned';

        }
        field(3; Registered; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Seminar Registration Header" WHERE(Status = CONST(Registration)));
            Caption = 'Registered';

        }
        field(4; Closed; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Seminar Registration Header" WHERE(Status = CONST(Closed)));
            Caption = 'Closed';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

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

}