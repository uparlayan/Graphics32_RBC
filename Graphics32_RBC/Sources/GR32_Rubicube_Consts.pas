{-----------------------------------------------------------------------------------
 Unit Name    : GR32_Rubicube_Consts.pas                                           /
 Author       : Uğur PARLAYAN / uparlayan <ugurparlayan@gmail.com>                 /
 Copyright    : 2018 by Uğur PARLAYAN. All rights reserved.                        /
 Component Set: Graphics32_RBC                                                     /
                                                                                   /
 Purpose      : Visual graphics for Business Intelligence applications on VCL      /
 Created      : 2018-05-01                                                         /
 Version      : 1.0.0.0 beta                                                       /
 Required     : https://github.com/graphics32/graphics32                           /
 Source Codes : https://github.com/uparlayan/Graphics32_RBC                        /
 Overview     : This Component Kit provides visual graphics for business           /
                intelligence applications. Allows you to create Dashboard objects  /
                for your applications. The codes contained here include a light    /
                version of the actual component set. Please contact the author for /
                more advanced options.                                             /
-----------------------------------------------------------------------------------}

unit GR32_Rubicube_Consts;

interface

uses
    GR32
  , GR32_Polygons
  , GR32_VectorUtils
  , VCL.Graphics                //  TColor
  , System.Classes              //  TList
  ;

const
  clRbcMavi         = TColor($00D67F01); // Ana Renkler                      //
  clRbcTurkuaz      = TColor($00E7E1FA);
  clRbcYesil        = TColor($0058BF00);
  clRbcAcikYesil    = TColor($00E7F5D9);
  clRbcFistik       = TColor($0001C19C);
  clRbcPortakal     = TColor($00419CFF);
  clRbcAcikPortakal = TColor($00E3F0FF);
  clRbcKiremit      = TColor($005B35D5);
  clRbcAcikKiremit  = TColor($00E7E1FA);
  clRbcMor          = TColor($00BD35AB); // Gri'nin Tonları                  //
  clRbcFume         = TColor($00564237);
  clRbcAcikFume     = TColor($00664C3C);
  clRbcKoyuGri      = TColor($00806453);
  clRbcGri          = TColor($00A99283);
  clRbcKirliGumus   = TColor($00CAB9AC);
  clRbcGumus        = TColor($00E0D4CA);
  clRbcKirliBeyaz   = TColor($00F4EFEC);

type
  TclRbcColors = ( RbcMavi
                 , RbcTurkuaz
                 , RbcYesil
                 , RbcAcikYesil
                 , RbcFistik
                 , RbcPortakal
                 , RbcAcikPortakal
                 , RbcKiremit
                 , RbcAcikKiremit
                 , RbcMor
                 , RbcFume
                 , RbcAcikFume
                 , RbcKoyuGri
                 , RbcGri
                 , RbcKirliGumus
                 , RbcGumus
                 , RbcKirliBeyaz
                 );
  TclRbcColors_Helper = record helper for TclRbcColors
    public
      function ToColor: TColor;
      function ToColor32: TColor32;
  end;

implementation

{ TclRbcColors_Helper }

function TclRbcColors_Helper.ToColor: TColor;
begin
  case  Self  of
        RbcMavi           : Result := clRbcMavi           ;
        RbcTurkuaz        : Result := clRbcTurkuaz        ;
        RbcYesil          : Result := clRbcYesil          ;
        RbcAcikYesil      : Result := clRbcAcikYesil      ;
        RbcFistik         : Result := clRbcFistik         ;
        RbcPortakal       : Result := clRbcPortakal       ;
        RbcAcikPortakal   : Result := clRbcAcikPortakal   ;
        RbcKiremit        : Result := clRbcKiremit        ;
        RbcAcikKiremit    : Result := clRbcAcikKiremit    ;
        RbcMor            : Result := clRbcMor            ;
        RbcFume           : Result := clRbcFume           ;
        RbcAcikFume       : Result := clRbcAcikFume       ;
        RbcKoyuGri        : Result := clRbcKoyuGri        ;
        RbcGri            : Result := clRbcGri            ;
        RbcKirliGumus     : Result := clRbcKirliGumus     ;
        RbcGumus          : Result := clRbcGumus          ;
        RbcKirliBeyaz     : Result := clRbcKirliBeyaz     ;
  end;
end;

function TclRbcColors_Helper.ToColor32: TColor32;
begin
  Result := Color32(Self.ToColor);
end;

end.

