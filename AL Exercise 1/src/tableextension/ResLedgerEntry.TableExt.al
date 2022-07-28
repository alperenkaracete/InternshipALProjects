tableextension 50182 "ResLedgerEntry" extends "Res. Ledger Entry"
{
    fields
    {
        field(60000; "Seminar No."; Code[20])
        {

            TableRelation = Seminar;
            Caption = 'Seminar No.';
        }

        field(60001; "Seminar Registration No."; Code[20])
        {

            TableRelation = "Posted Seminar Reg. Header";
            Caption = 'Seminar Registration No.';
        }
    }

    var
        myInt: Integer;
}