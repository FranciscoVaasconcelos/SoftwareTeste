program SoftwarePosto;

uses
  Vcl.Forms,
  uFormInicial in 'uFormInicial.pas' {frmInicial},
  uDataModule in 'uDataModule.pas' {DM: TDataModule},
  uFormBase in 'uFormBase.pas' {frmBase},
  uFormLogin in 'uFormLogin.pas' {frmLogin},
  uFormSimpleCrud in 'uFormSimpleCrud.pas' {frmSimpleCrud},
  uFormCadUsuarios in 'uFormCadUsuarios.pas' {frmCadUsuarios},
  uFormCadFrentistas in 'uFormCadFrentistas.pas' {frmCadFrentistas},
  uFormVendaCombustivel in 'uFormVendaCombustivel.pas' {frmVendaCombustivel},
  uFormCadBombas in 'uFormCadBombas.pas' {frmCadBombas},
  uFormCadBicosCombustivel in 'uFormCadBicosCombustivel.pas' {frmCadBicosCombustivel},
  uFormCadTanquesCombustivel in 'uFormCadTanquesCombustivel.pas' {frmCadTanques},
  uFormCadCombustivel in 'uFormCadCombustivel.pas' {frmCadCombustivel},
  Classe.Frentista in 'Classe.Frentista.pas',
  uFormEntradas in 'uFormEntradas.pas' {frmEntradas},
  uFormCadEntradas in 'uFormCadEntradas.pas' {frmCadEntrada},
  uFormRelatorios in 'uFormRelatorios.pas' {frmRelatorios},
  uFormRelTotalGeral in 'uFormRelTotalGeral.pas' {frmRelTotalGeral},
  uFormRelLucroPeriodo in 'uFormRelLucroPeriodo.pas' {frmRelLucroPeriodo},
  uFormRelComissao in 'uFormRelComissao.pas' {frmRelComissao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmInicial, frmInicial);
  Application.Run;
end.
