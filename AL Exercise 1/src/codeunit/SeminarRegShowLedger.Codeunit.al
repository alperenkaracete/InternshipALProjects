codeunit 50187 "Seminar Reg.-Show Ledger"
{
    TableNo = "Seminar Register";
    trigger OnRun()
    begin
        SeminarLedgerEntry.SETRANGE("Entry No.", Rec."From Entry No.", Rec."To Entry No.");
        PAGE.RUN(PAGE::"Seminar Ledger Entries", SeminarLedgerEntry);
    end;

    var
        SeminarLedgerEntry: Record "Seminar Ledger Entry";
}