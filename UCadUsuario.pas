unit UCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Phys.IBBase, Vcl.ComCtrls, ppDB, ppDBPipe, ppParameter,
  ppDesignLayer, ppBands, ppCtrls, Vcl.Imaging.pngimage, ppPrnabl, ppClass,
  ppVar, ppCache, ppComm, ppRelatv, ppProd, ppReport, raCodMod, ppModule,
  Vcl.Menus, Vcl.Buttons;

type
  TForm_CadUsuario = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    BtCancelar: TButton;
    BtSalvar: TButton;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BtExcluir: TButton;
    BtAlterar: TButton;
    BtIncluir: TButton;
    EdtId: TDBEdit;
    EdtNome: TDBEdit;
    EdtTelefone: TDBEdit;
    EdtCPF: TDBEdit;
    EdtCidade: TDBEdit;
    EdtEmail: TDBEdit;
    Label3: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    DsCadUsuario: TDataSource;
    Estados: TDBComboBox;
    ppRelUsuario: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine3: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppDBPipeline1: TppDBPipeline;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    BtImprimir: TButton;
    ppRelCidade: TppReport;
    ppParameterList2: TppParameterList;
    ppCidade: TppDBPipeline;
    PopupMenu1: TPopupMenu;
    ImprimirLista1: TMenuItem;
    ListaporCidade1: TMenuItem;
    ppHeaderBand2: TppHeaderBand;
    ppSystemVariable4: TppSystemVariable;
    ppLine4: TppLine;
    ppImage2: TppImage;
    ppLabel7: TppLabel;
    ppLine5: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel12: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLine7: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText8: TppDBText;
    ppLabel11: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine6: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel13: TppLabel;
    ppDBCalc1: TppDBCalc;
    raCodeModule1: TraCodeModule;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    BitBtn1: TBitBtn;
    procedure BtIncluirClick(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtAlterarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DsUsuarioDataChange(Sender: TObject; Field: TField);
    procedure ImprimirLista1Click(Sender: TObject);
    procedure ListaporCidade1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadUsuario: TForm_CadUsuario;

implementation

{$R *.dfm}
uses Udm,UMenuPricipal;

procedure TForm_CadUsuario.BtAlterarClick(Sender: TObject);
begin
 TabSheet2.TabVisible := True;
 TabSheet2.Show;
 TabSheet1.TabVisible := False;
 dm.cdsUsuario.Edit;
 EdtNome.SetFocus;
end;

procedure TForm_CadUsuario.BtCancelarClick(Sender: TObject);
begin
 dm.cdsUsuario.Cancel;
 TabSheet1.TabVisible := True;
 TabSheet1.Show;
 TabSheet2.TabVisible := False;
end;

procedure TForm_CadUsuario.BtExcluirClick(Sender: TObject);
begin

if (Application.MessageBox('Deseja realmente excluir este registro?',
  'Confirmação', MB_ICONQUESTION + MB_USEGLYPHCHARS) = mrYes) then
  begin
    dm.cdsUsuario.Delete;
    BtSalvar.Click;
  end;
end;



procedure TForm_CadUsuario.BtIncluirClick(Sender: TObject);
begin
  TabSheet2.TabVisible := True;
  TabSheet2.Show;
  TabSheet1.TabVisible := False;
  dm.cdsUsuario.Append;
  EdtNome.SetFocus;

end;

procedure TForm_CadUsuario.BtSalvarClick(Sender: TObject);
begin
  begin
//    if dm.cdsUsuario.FieldByName('ID_PESSOA').AsString = '' then
//      begin
//         MessageDlg('O Campo Id deve ser preenchido! Favor informe o campo Id!!!', MtInformation, [MbOK], 0);
//         EdtId.SetFocus;
//        Abort;
//      end;
      if dm.cdsUsuario.FieldByName('NOME').AsString = '' Then
      begin
        MessageDlg('O Campo nome deve ser preenchido! Favor informe o campo nome!!!', MtInformation, [MbOK], 0);
        EdtNome.SetFocus;
        Abort;
      end;

      if (dm.cdsUsuario.FieldByName('CPF').AsString = '') or (dm.cdsUsuario.FieldByName('CPF').AsString = '   .   .   -') then
      begin
         MessageDlg('O Campo CPF deve ser preenchido! Favor informe o campo CPF!!!', MtInformation, [MbOK], 0);
         EdtCPF.SetFocus;
        Abort;

      end;
      if dm.cdsUsuario.FieldByName('Email').AsString = '' Then
      begin
        MessageDlg('O Campo E-mail deve ser preenchido! Favor informe o campo E-mail!!!', MtInformation, [MbOK], 0);
        Abort;
         EdtEmail.SetFocus;
      end;

      IF (dm.cdsUsuario.State in [dsInsert, dsEdit]) THEN
           dm.cdsUsuario.Post;

      if not dm.Conexao.InTransaction then
      dm.Conexao.StartTransaction(TD);

      if dm.cdsUsuario.ChangeCount > 0 then
      erros :=dm.cdsUsuario.ApplyUpdates(-1);

      if Erros = 0 then
      begin
      // comitar
      dm.Conexao.Commit(TD);
      MessageDlg('Registro Gravado com Sucesso!!!', MtInformation, [MbOK], 0);
      BtCancelar.Click;
      end
      else
      begin
      //Fazer RollBack
      dm.Conexao.Rollback(TD);
      MessageDlg('Erro ao Gravar o Registro!!!', MtError, [MbOK], 0);
      //Exit;
    end;

  end;

end;



procedure TForm_CadUsuario.DBGrid1DblClick(Sender: TObject);
begin
BtAlterar.Click;
end;

procedure TForm_CadUsuario.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//    if not odd(dm.cdsUsuario.RecNo) then
//    if not (gdSelected in State) then
//      begin
//      DBGrid1.Canvas.Brush.Color := clMoneyGreen;
//      DBGrid1.Canvas.FillRect(Rect);
//      DBGrid1.DefaultDrawDataCell(rect,Column.Field,state);
//    end;
if gdSelected in State then
begin
  DBGrid1.Canvas.Font.Color := clHighlightText;
  DBGrid1.Canvas.Brush.Color:= clHighlight;
end
else
begin
  if odd(dm.cdsUsuario.RecNo) then
  begin
    DBGrid1.Canvas.Font.Color := clWhite;
    DBGrid1.Canvas.Brush.Color:= clGray;
  end
  else
begin
DBGrid1.Canvas.Font.Color := clBlack;
DBGrid1.Canvas.Brush.Color:= clWhite;
end;
end;

DBGrid1.Canvas.FillRect(Rect);
DBGrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top, Column.Field.AsString);
end;

procedure TForm_CadUsuario.DsUsuarioDataChange(Sender: TObject;
  Field: TField);
begin
      EdtNome.Enabled := dm.cdsUsuario.State in [dsInsert, dsEdit];
      EdtCPF.Enabled := dm.cdsUsuario.State in [dsInsert, dsEdit];
      EdtEmail.Enabled := dm.cdsUsuario.State in [dsInsert, dsEdit];
      EdtTelefone.Enabled := dm.cdsUsuario.State in [dsInsert, dsEdit];
      EdtCidade.Enabled := dm.cdsUsuario.State in [dsInsert, dsEdit];


      BtIncluir.Enabled := not (dm.cdsUsuario.State in [dsInsert, dsEdit]);
      BtAlterar.Enabled := ((not (dm.cdsUsuario.State in [dsInsert, dsEdit])) and
      (not (dm.cdsUsuario.IsEmpty)));
      BtExcluir.Enabled := ((not (dm.cdsUsuario.State in [dsInsert, dsEdit])) and
      (not (dm.cdsUsuario.IsEmpty)));
      BtSalvar.Enabled := dm.cdsUsuario.State in [dsInsert, dsEdit];
      BtCancelar.Enabled := dm.cdsUsuario.State in [dsInsert, dsEdit];
end;


procedure TForm_CadUsuario.FormCreate(Sender: TObject);
begin
dm.cdsUsuario.Close;
dm.cdsUsuario.Open;
end;

procedure TForm_CadUsuario.ImprimirLista1Click(Sender: TObject);
begin
  ppRelUsuario.Print;
end;

procedure TForm_CadUsuario.ListaporCidade1Click(Sender: TObject);
begin
     ppRelCidade.Print;
end;

end.
