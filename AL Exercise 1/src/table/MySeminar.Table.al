table 50101 "My Seminar"
{
    DataClassification = ToBeClassified;
    Caption = 'My Seminar';

    fields
    {
        field(1; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            Caption = 'User ID';

        }
        field(2; "Seminar No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Seminar;
            Caption = 'Seminar No.';
        }
    }

    keys
    {
        key(Key1; "User ID", "Seminar No.")
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