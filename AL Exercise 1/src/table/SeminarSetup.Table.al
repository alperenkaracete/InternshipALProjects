table 50155 "Seminar Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;

        }
        field(2; "Seminar Nos."; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";

        }
        field(3; "Seminar Registration Nos."; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";

        }
        field(4; "Posted Seminar Reg. Nos."; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";

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