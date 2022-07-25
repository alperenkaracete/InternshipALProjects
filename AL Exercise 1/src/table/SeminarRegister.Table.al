table 50183 "Seminar Register"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = CustomerContent;

        }
        field(2; "From Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = "Seminar Ledger Entry";

        }
        field(3; "To Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = "Seminar Ledger Entry";

        }
        field(4; "Creation Date"; Date)
        {
            DataClassification = CustomerContent;

        }
        field(5; "Source Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Source Code";
        }
        field(6; "User ID"; Code[20])
        {

            TableRelation = User."User Name";
            DataClassification = CustomerContent;
            TestTableRelation = false;

        }

        field(7; "Journal Batch Name"; Code[10])
        {
            DataClassification = CustomerContent;

        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Creation Date")
        {

        }
        key(Key3; "Source Code", "Creation Date")
        {

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