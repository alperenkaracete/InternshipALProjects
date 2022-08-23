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
        field(3; "<Control4>"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
            TableRelation = Seminar.Name;

        }
        field(4; "<Control5>"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Duration';
            TableRelation = Seminar."Seminar Duration";
        }
        field(5; "<Control6>"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Price';
            TableRelation = Seminar."Seminar Price";
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