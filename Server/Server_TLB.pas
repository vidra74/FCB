unit Server_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 34747 $
// File generated on 19.12.2013. 22:38:18 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Delphi_XE_Projekti\DataSnap_TcpIp\Server\Server (1)
// LIBID: {9BFFC120-AC42-4069-8A16-21BA0DA5B59F}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 Midas, (midas.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, OleServer, StdVCL, Variants;



// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ServerMajorVersion = 1;
  ServerMinorVersion = 0;

  LIBID_Server: TGUID = '{9BFFC120-AC42-4069-8A16-21BA0DA5B59F}';

  IID_IApsy: TGUID = '{A59F3834-7C53-48D1-AA0E-4B18440AACF2}';
  CLASS_Apsy: TGUID = '{D4980FB3-9756-4306-902E-1C0BC9C327F8}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IApsy = interface;
  IApsyDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  Apsy = IApsy;


// *********************************************************************//
// Interface: IApsy
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A59F3834-7C53-48D1-AA0E-4B18440AACF2}
// *********************************************************************//
  IApsy = interface(IAppServer)
    ['{A59F3834-7C53-48D1-AA0E-4B18440AACF2}']
    function PingServer(const vTko: WideString; vId: Integer; var vPoruka: WideString): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IApsyDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A59F3834-7C53-48D1-AA0E-4B18440AACF2}
// *********************************************************************//
  IApsyDisp = dispinterface
    ['{A59F3834-7C53-48D1-AA0E-4B18440AACF2}']
    function PingServer(const vTko: WideString; vId: Integer; var vPoruka: WideString): Integer; dispid 301;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer;
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer;
                           Options: Integer; const CommandText: WideString; var Params: OleVariant;
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer;
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString;
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoApsy provides a Create and CreateRemote method to
// create instances of the default interface IApsy exposed by
// the CoClass Apsy. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoApsy = class
    class function Create: IApsy;
    class function CreateRemote(const MachineName: string): IApsy;
  end;

implementation

uses ComObj;

class function CoApsy.Create: IApsy;
begin
  Result := CreateComObject(CLASS_Apsy) as IApsy;
end;

class function CoApsy.CreateRemote(const MachineName: string): IApsy;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Apsy) as IApsy;
end;

end.

