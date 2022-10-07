object dm: Tdm
  OldCreateOrder = False
  Height = 420
  Width = 636
  object Conexao: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database='
      'RoleName=RoleName'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    BeforeConnect = ConexaoBeforeConnect
    Left = 32
    Top = 8
  end
  object sqlUsuario: TSQLDataSet
    CommandText = 'select * from CadPessoa'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 512
    Top = 176
    object sqlUsuarioID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlUsuarioNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 188
    end
    object sqlUsuarioTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Required = True
      Size = 188
    end
    object sqlUsuarioCPF: TStringField
      FieldName = 'CPF'
      Required = True
      Size = 188
    end
    object sqlUsuarioCIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Size = 188
    end
    object sqlUsuarioEMAIL: TStringField
      FieldName = 'EMAIL'
      Required = True
      Size = 40
    end
    object sqlUsuarioESTADO: TStringField
      FieldName = 'ESTADO'
      Required = True
      Size = 15
    end
  end
  object dprUsuario: TDataSetProvider
    DataSet = sqlUsuario
    Options = [poFetchDetailsOnDemand, poIncFieldProps, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dprUsuarioBeforeUpdateRecord
    Left = 512
    Top = 240
  end
  object cdsUsuario: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dprUsuario'
    OnNewRecord = cdsUsuarioNewRecord
    Left = 512
    Top = 304
    object cdsUsuarioID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUsuarioNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 188
    end
    object cdsUsuarioTELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '(00) 00000-0000'
      Size = 188
    end
    object cdsUsuarioCPF: TStringField
      FieldName = 'CPF'
      Required = True
      EditMask = '999.999.999-99'
      Size = 188
    end
    object cdsUsuarioCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 188
    end
    object cdsUsuarioEMAIL: TStringField
      FieldName = 'EMAIL'
      Required = True
      Size = 40
    end
    object cdsUsuarioESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 15
    end
  end
  object SqlAux: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 416
    Top = 248
  end
  object SqlCidade: TSQLDataSet
    CommandText = 
      'SELECT ID_PESSOA, NOME, TELEFONE, CIDADE AS CIDADE'#13#10'FROM CADPESS' +
      'OA '#13#10'GROUP BY CIDADE, NOME, ID_PESSOA, TELEFONE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 320
    Top = 184
  end
  object dprCidade: TDataSetProvider
    DataSet = SqlCidade
    Left = 320
    Top = 248
  end
  object cdsCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dprCidade'
    Left = 320
    Top = 304
  end
end
