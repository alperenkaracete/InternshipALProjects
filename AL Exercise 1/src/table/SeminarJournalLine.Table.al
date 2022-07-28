table 50180 "Seminar Journal Line"
{
    DataClassification = CustomerContent;
    Caption = 'Seminar Journal Line';

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Journal Template Name';

        }
        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';

        }
        field(3; "Seminar No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Seminar;
            Caption = 'Seminar No.';

        }
        field(4; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Validate("Document Date", "Posting Date");
            end;

        }
        field(5; "Document Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Document Date';

        }
        field(6; "Entry Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "Registration","Cancelation";
            OptionCaption = 'Registration,Cancelation';
            Caption = 'Entry Type';
        }
        field(7; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';

        }
        field(8; "Description"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';

        }
        field(9; "Bill-to Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;
            Caption = 'Bill-to Customer No.';

        }
        field(10; "Charge Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "Instructor","Room","Participant","Charge";
            OptionCaption = 'Instructor,Room,Participant,Charge';
            Caption = 'Charge Type';
        }
        field(11; "Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "Resource","G/L Account";
            OptionCaption = 'Resource,G/L Account';
            Caption = 'Type';

        }
        field(12; "Quantity"; Decimal)
        {
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
            Caption = 'Quantity';

        }
        field(13; "Unit Price"; Decimal)
        {
            DataClassification = CustomerContent;
            AutoFormatType = 2;
            Caption = 'Unit Price';

        }
        field(14; "Total Price"; Decimal)
        {
            DataClassification = CustomerContent;
            AutoFormatType = 1;
            Caption = 'Total Price';

        }
        field(15; "Participant Contact No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Contact;
            Caption = 'Participant Contact No.';

        }
        field(16; "Participant Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Participant Name';

        }
        field(17; "Chargeable"; Boolean)
        {
            DataClassification = CustomerContent;
            InitValue = true;
            Caption = 'Chargeable';

        }
        field(18; "Room Resource No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Resource WHERE(Type = CONST(Machine));
            Caption = 'Room Resource No.';

        }
        field(19; "Instructor Resource No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Resource WHERE(Type = CONST(Person));
            Caption = 'Instructor Resource No.';

        }
        field(20; "Starting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Starting Date';

        }
        field(21; "Seminar Registration No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Seminar Registration No.';

        }
        field(22; "Res. Ledger Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = "Res. Ledger Entry";
            Caption = 'Res. Ledger Entry No.';

        }
        field(23; "Source Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ","Seminar";
            OptionCaption = ' ,Seminar';
            Caption = 'Source Type';

        }
        field(24; "Source No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = IF ("Source Type" = CONST(Seminar)) Seminar;
            Caption = 'Source No.';

        }
        field(25; "Journal Batch Name"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Journal Batch Name';

        }
        field(26; "Source Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Source Code";
            Caption = 'Source Code';

        }
        field(27; "Reason Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Reason Code";
            Caption = 'Reason Code';

        }
        field(28; "Posting No. Series"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Posting No. Series';

        }

    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        UserSetup: Record "User Setup";
        GLSetup: Record "General Ledger Setup";

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

    procedure EmptyLine(): Boolean
    var
        myInt: Integer;
    begin
        EXIT(
    ("Seminar No." = '') AND (Quantity = 0))
    end;

}