table 50183 "Seminar Register"
{
    DataClassification = CustomerContent;
    Caption = 'Seminar Register';

    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'No.';

        }
        field(2; "From Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = "Seminar Ledger Entry";
            Caption = 'From Entry No.';

        }
        field(3; "To Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = "Seminar Ledger Entry";
            Caption = 'To Entry No.';

        }
        field(4; "Creation Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Creation Date';

        }
        field(5; "Source Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Source Code";
            Caption = 'Source Code';
        }
        field(6; "User ID"; Code[20])
        {

            TableRelation = User."User Name";
            DataClassification = CustomerContent;
            TestTableRelation = false;
            Caption = 'User ID';

        }

        field(7; "Journal Batch Name"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Journal Batch Name';

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