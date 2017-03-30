VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cUnZipMil"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Public Enum ZN�velDeMensagem
    All = 0
    Less = 1
    NoMessages = 2
End Enum
Public Enum ZExtractType
    Extract = 0
    ListContents = 1
End Enum
Public Enum ZPrivilege
    Ignore = 0
    ACL = 1
    Privileges = 2
End Enum

Private miExtrairRecente     As Integer  ' 1 = Extract Only Newer, Else 0
Private miSpaceUnderScore  As Integer  ' 1 = Convert Space To Underscore, Else 0
Private miProntoRegravar  As Integer  ' 1 = Prompt To Overwrite Required, Else 0
Private miQuiet            As ZN�velDeMensagem  ' 2 = No Messages, 1 = Less, 0 = All
Private miWriteStdOut      As Integer  ' 1 = Write To Stdout, Else 0
Private miTestarZip          As Integer  ' 1 = Test Zip File, Else 0
Private miListarExtra��o      As ZExtractType  ' 0 = Extract, 1 = List Contents
Private miExtrairS�Recentes As Integer  ' 1 = Extract Only Newer, Else 0
Private miExibirComent�rios   As Integer  ' 1 = Display Zip File Comment, Else 0
Private miHonorDirectories As Integer  ' 1 = Honor Directories, Else 0
Private miSobregravarArquivos   As Integer  ' 1 = Overwrite Files, Else 0
Private miConverterCR_CRLF   As Integer  ' 1 = Convert CR To CRLF, Else 0
Private miVerbose          As Integer  ' 1 = Zip Info Verbose
Private miSensibilidadeCaracter  As Integer  ' 1 = Case Insensitivity, 0 = Case Sensitivity
Private miPrivilege        As ZPrivilege  ' 1 = ACL, 2 = Privileges, Else 0
Private msNomeDoZip      As String   ' The Zip File Name
Private msPastaExtra��o       As String   ' Extraction Directory, Null If Current Directory

Public Property Get ExtrairRecente() As Boolean
    ExtrairRecente = miExtrairRecente = 1
End Property

Public Property Let ExtrairRecente(ByVal bExtrairRecente As Boolean)
    miExtrairRecente = IIf(bExtrairRecente, 1, 0)
End Property

Public Property Get SpaceToUnderScore() As Boolean
    SpaceToUnderScore = miSpaceUnderScore = 1
End Property

Public Property Let SpaceToUnderScore(ByVal bConvert As Boolean)
    miSpaceUnderScore = IIf(bConvert, 1, 0)
End Property

Public Property Get ProntoRegravar() As Boolean
    ProntoRegravar = miProntoRegravar = 1
End Property

Public Property Let ProntoRegravar(ByVal bPrompt As Boolean)
    miProntoRegravar = IIf(bPrompt, 1, 0)
End Property

Public Property Get N�velDeMensagem() As ZN�velDeMensagem
    N�velDeMensagem = miQuiet
End Property

Public Property Let N�velDeMensagem(ByVal iLevel As ZN�velDeMensagem)
    miQuiet = iLevel
End Property

Public Property Get WriteToStdOut() As Boolean
    WriteToStdOut = miWriteStdOut = 1
End Property

Public Property Let WriteToStdOut(ByVal bWrite As Boolean)
    miWriteStdOut = IIf(bWrite, 1, 0)
End Property

Public Property Get TestarZip() As Boolean
    TestarZip = miTestarZip = 1
End Property

Public Property Let TestarZip(ByVal bTest As Boolean)
    miTestarZip = IIf(bTest, 1, 0)
End Property

Public Property Get ListarExtra��o() As ZExtractType
    ListarExtra��o = miListarExtra��o
End Property

Public Property Let ListarExtra��o(ByVal zExType As ZExtractType)
    miListarExtra��o = zExType
End Property

Public Property Get ExtrairS�Recentes() As Boolean
    ExtrairS�Recentes = miExtrairS�Recentes = 1
End Property

Public Property Let ExtrairS�Recentes(ByVal bOnlyNewer As Boolean)
    miExtrairS�Recentes = IIf(bOnlyNewer, 1, 0)
End Property

Public Property Get ExibirComent�rios() As Boolean
    ExibirComent�rios = miExibirComent�rios = 1
End Property

Public Property Let ExibirComent�rios(ByVal bDisplay As Boolean)
    miExibirComent�rios = IIf(bDisplay, 1, 0)
End Property

Public Property Get HonorDirectories() As Boolean
    HonorDirectories = miHonorDirectories = 1
End Property

Public Property Let HonorDirectories(ByVal bHonor As Boolean)
    miHonorDirectories = IIf(bHonor, 1, 0)
End Property

Public Property Get SobregravarArquivos() As Boolean
    SobregravarArquivos = miSobregravarArquivos = 1
End Property

Public Property Let SobregravarArquivos(ByVal bOverWrite As Boolean)
    miSobregravarArquivos = IIf(bOverWrite, 1, 0)
End Property

Public Property Get ConverterCRparaCRLF() As Boolean
    ConverterCRparaCRLF = miConverterCR_CRLF = 1
End Property

Public Property Let ConverterCRparaCRLF(ByVal bConvert As Boolean)
    miConverterCR_CRLF = IIf(bConvert, 1, 0)
End Property

Public Property Get Verbose() As Boolean
    Verbose = miVerbose = 1
End Property

Public Property Let Verbose(ByVal bVerbose As Boolean)
    miVerbose = IIf(bVerbose, 1, 0)
End Property

Public Property Get Sens�velCaracter() As Boolean
    Sens�velCaracter = miSensibilidadeCaracter = 1
End Property

Public Property Let Sens�velCaracter(ByVal bSens�velCaracter As Boolean)
    miSensibilidadeCaracter = IIf(bSens�velCaracter, 1, 0)
End Property

Public Property Get Privilege() As ZPrivilege
    Privilege = miPrivilege
End Property

Public Property Let Privilege(ByVal zPriv As ZPrivilege)
    miPrivilege = zPriv
End Property

Public Property Get NomeDoZip() As String
    NomeDoZip = msNomeDoZip
End Property

Public Property Let NomeDoZip(ByVal sNomeDoZip As String)
    msNomeDoZip = sNomeDoZip
End Property

Public Property Get PastaExtra��o() As String
    PastaExtra��o = msPastaExtra��o
End Property

Public Property Let PastaExtra��o(ByVal sPastaExtra��o As String)
    msPastaExtra��o = sPastaExtra��o
End Property

Public Function UnZipar(Optional sNomeDoZip As String, _
    Optional sPastaExtra��o As String) As Long
    
On Error GoTo vbErrorHandler

    Dim lRet As Long
    
    If Len(sNomeDoZip) > 0 Then
        msNomeDoZip = sNomeDoZip
    End If
    
    If Len(sPastaExtra��o) > 0 Then
        msPastaExtra��o = sPastaExtra��o
    End If
    
    
    lRet = VBUnzip(msNomeDoZip, msPastaExtra��o, miExtrairRecente, _
        miSpaceUnderScore, miProntoRegravar, CInt(miQuiet), _
        miWriteStdOut, miTestarZip, CInt(miListarExtra��o), _
        miExtrairS�Recentes, miExibirComent�rios, miHonorDirectories, _
        miSobregravarArquivos, miConverterCR_CRLF, miVerbose, _
        miSensibilidadeCaracter, CInt(miPrivilege))
    
    UnZipar = lRet
    
    Exit Function

vbErrorHandler:
    Err.Raise Err.Number, "UnZipMil::UnZipar", Err.Description

End Function

Private Sub Class_Initialize()
    miExtrairRecente = 0
    miSpaceUnderScore = 0
    miProntoRegravar = 0
    miQuiet = NoMessages
    miWriteStdOut = 0
    miTestarZip = 0
    miListarExtra��o = Extract
    miExtrairS�Recentes = 0
    miExibirComent�rios = 0
    miHonorDirectories = 1
    miSobregravarArquivos = 1
    miConverterCR_CRLF = 0
    miVerbose = 0
    miSensibilidadeCaracter = 1
    miPrivilege = Ignore
End Sub

Public Function �ltimaMensagem() As String
    �ltimaMensagem = msOutput
End Function


