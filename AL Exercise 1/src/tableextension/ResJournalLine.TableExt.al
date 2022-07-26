tableextension 50183 "ResJournalLine" extends "Res. Journal Line"
{
    fields
    {
        field(60003; "Seminar No."; Code[20])
        {

            TableRelation = Seminar;
        }

        field(60004; "Seminar Registration No."; Code[20])
        {

            TableRelation = "Posted Seminar Reg. Header";
        }
    }

    var
        myInt: Integer;
}