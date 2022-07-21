table 50155 "Seminar Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Seminar Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key';

        }
        field(2; "Seminar Nos."; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Seminar Nos.';

        }
        field(3; "Seminar Registration Nos."; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Seminar Registration Nos.';

        }
        field(4; "Posted Seminar Reg. No."; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Posted Seminar Reg. Nos.';

        }
    }

    keys
    {
        key("Key1"; "Primary Key")
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