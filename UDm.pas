unit UDm;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.FMTBcd, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr,inifiles,Vcl.Forms,
  IBX.IBDatabase, Vcl.Dialogs;

type
  Tdm = class(TDataModule)
    Conexao: TSQLConnection;
    sqlUsuario: TSQLDataSet;
    dprUsuario: TDataSetProvider;
    cdsUsuario: TClientDataSet;
    sqlUsuarioID_PESSOA: TIntegerField;
    sqlUsuarioNOME: TStringField;
    sqlUsuarioTELEFONE: TStringField;
    sqlUsuarioCPF: TStringField;
    sqlUsuarioCIDADE: TStringField;
    sqlUsuarioEMAIL: TStringField;
    sqlUsuarioESTADO: TStringField;
    cdsUsuarioID_PESSOA: TIntegerField;
    cdsUsuarioNOME: TStringField;
    cdsUsuarioTELEFONE: TStringField;
    cdsUsuarioCPF: TStringField;
    cdsUsuarioCIDADE: TStringField;
    cdsUsuarioEMAIL: TStringField;
    cdsUsuarioESTADO: TStringField;
    SqlAux: TSQLQuery;
    SqlCidade: TSQLDataSet;
    dprCidade: TDataSetProvider;
    cdsCidade: TClientDataSet;
    procedure dprUsuarioBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure cdsUsuarioNewRecord(DataSet: TDataSet);
    procedure ConexaoBeforeConnect(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;
  TD : TTransactionDesc;
  Erros : Integer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.cdsUsuarioNewRecord(DataSet: TDataSet);
begin
cdsUsuario.FieldByName('ID_PESSOA').AsInteger := 0;
end;

procedure Tdm.ConexaoBeforeConnect(Sender: TObject);
var iniConfig : Tinifile;
    Caminho, ipServidor, Porta : string;
begin
     try
      iniConfig  := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'configuracao.ini');
      ipServidor := iniConfig.ReadString('FIREBIRD','Server','');
      Porta      := iniConfig.ReadString('FIREBIRD','Porta','');
      Caminho    := iniConfig.ReadString('FIREBIRD','Database','');
      Conexao.Params.Values['Database'] := ipServidor + '/' + Porta + ':'+ Caminho;
     except
     MessageDlg('Configure seu arquivo INI para a conexão do banco de dados',mtInformation,[mbok],0);

//     [FIREBIRD]
//Server=localhost
//Porta=3055
//User=SYSDBA
//Password=masterkey
//Database=D:\Olinto\Estudos\CrudDelphiSQLDataSet\Banco\BancoTeste.FDB

     end;
end;

procedure Tdm.dprUsuarioBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
begin
 if UpdateKind in [ukInsert] then
  begin
    if DeltaDS.FieldByName('ID_PESSOA').NewValue <= 0 then
    begin
      sqlAux.Close;
      sqlAux.CommandText := 'SELECT GEN_ID(gen_Usuario, 1) FROM CADPESSOA';
      sqlAux.Open;
      DeltaDS.FieldByName('ID_PESSOA').NewValue := sqlAux.Fields[0].AsInteger;
      sqlAux.Close;
    end;
  end;
end;

end.
