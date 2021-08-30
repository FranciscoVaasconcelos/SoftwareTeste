unit uFormRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RLReport, Vcl.ComCtrls;

type
  TfrmRelatorios = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLBand3: TRLBand;
    lbPeriodo1: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDraw1: TRLDraw;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDraw2: TRLDraw;
    RLLabel6: TRLLabel;
    ds1: TDataSource;
    RLLabel7: TRLLabel;
    RLDBText5: TRLDBText;
    RLReport2: TRLReport;
    RLBand4: TRLBand;
    lbPeriodo2: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel14: TRLLabel;
    RLBand5: TRLBand;
    ds2: TDataSource;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLBand6: TRLBand;
    RLLabel8: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLReport3: TRLReport;
    RLBand7: TRLBand;
    lbPeriodo3: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLDraw5: TRLDraw;
    RLBand8: TRLBand;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDraw6: TRLDraw;
    RLBand9: TRLBand;
    RLLabel20: TRLLabel;
    RLDBResult3: TRLDBResult;
    ds3: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

uses
  uFormRelLucroPeriodo, uFormRelTotalGeral, uFormRelComissao;

{$R *.dfm}

end.
