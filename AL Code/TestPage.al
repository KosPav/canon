page 50015 "Kop test"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "Vendor Ledger Entry";

    layout
    {
        area(Content)
        {
            repeater(test)
            {
                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = All;

                }
                field("Accepted Pmt. Disc. Tolerance"; "Accepted Pmt. Disc. Tolerance")
                {
                    ApplicationArea = All;

                }
                field("Remaining Pmt. Disc. Possible"; "Remaining Pmt. Disc. Possible")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("fill the table")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    VendLedgEntr: Record "Vendor Ledger Entry";

                begin
                    VendLedgEntr.SetFilter("Vendor No.", '10000');
                    VendLedgEntr.FindSet();
                    repeat
                        VendLedgEntr."Remaining Pmt. Disc. Possible" := -5;
                        VendLedgEntr."Accepted Pmt. Disc. Tolerance" := true;
                        VendLedgEntr.Modify();
                    until VendLedgEntr.Next() = 0;
                    Message('done');
                end;
            }
        }
    }

}