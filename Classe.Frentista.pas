unit Classe.Frentista;

interface
type
  TFrentista = class
  private
    FNomeFrentista: string;
    FID: integer;
    FPercComissao: double;
    procedure SetID(const Value: integer);
    procedure SetNomeFrentista(const Value: string);
    procedure SetPercComissao(const Value: double);
  published
    property ID: integer read FID write SetID;
    property NomeFrentista: string read FNomeFrentista write SetNomeFrentista;
    property PercComissao: double read FPercComissao write SetPercComissao;
  end;

implementation

{ TFrentista }

procedure TFrentista.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TFrentista.SetNomeFrentista(const Value: string);
begin
  FNomeFrentista := Value;
end;

procedure TFrentista.SetPercComissao(const Value: double);
begin
  FPercComissao := Value;
end;

end.
