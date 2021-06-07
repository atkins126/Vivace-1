{==============================================================================
         _       ve'va'CHe
  __   _(_)_   ____ _  ___ ___ ™
  \ \ / / \ \ / / _` |/ __/ _ \
   \ V /| |\ V / (_| | (_|  __/
    \_/ |_| \_/ \__,_|\___\___|
                   game toolkit

 Copyright © 2020 tinyBigGAMES™ LLC
 All rights reserved.

 website: https://tinybiggames.com
 email  : support@tinybiggames.com

 LICENSE: zlib/libpng

 Vivace Game Toolkit is licensed under an unmodified zlib/libpng license,
 which is an OSI-certified, BSD-like license that allows static linking
 with closed source software:

 This software is provided "as-is", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.

 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it
 freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software in
     a product, an acknowledgment in the product documentation would be
     appreciated but is not required.

  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.

  3. This notice may not be removed or altered from any source distribution.

============================================================================== }

unit Vivace.Allegro;

interface

const
  ALLEGRO_VERSION = 5;
  ALLEGRO_SUB_VERSION = 2;
  ALLEGRO_WIP_VERSION = 6;
  ALLEGRO_UNSTABLE_BIT = 0;
  ALLEGRO_RELEASE_NUMBER = 1;
  ALLEGRO_VERSION_STR = '5.2.6';
  ALLEGRO_DATE_STR = '2020';
  ALLEGRO_DATE = 20200207;
  ALLEGRO_VERSION_INT = ((ALLEGRO_VERSION shl 24) or (ALLEGRO_SUB_VERSION shl 16) or (ALLEGRO_WIP_VERSION shl 8) or ALLEGRO_RELEASE_NUMBER or ALLEGRO_UNSTABLE_BIT);

type
  atexit_ptr_ = Pointer;
  al_install_system_atexit_ptr = function(p1: atexit_ptr_): Integer; cdecl;

var
  al_install_system: function(version: Integer; atexit_ptr: al_install_system_atexit_ptr): Boolean; cdecl;
  al_uninstall_system: procedure; cdecl;
  al_get_time: function: Double; cdecl;
  al_init: function: LongBool; cdecl;

implementation

uses
  Vivace.CLibs,
  Vivace.MemoryModule;

procedure BindToAllegro;
begin
  @al_install_system := ViMemoryGetProcAddress(ViCLibsDLL, 'al_install_system');
  @al_init := ViMemoryGetProcAddress(ViCLibsDLL, 'al_init');
  @al_uninstall_system := ViMemoryGetProcAddress(ViCLibsDLL, 'al_uninstall_system');
  @al_get_time := ViMemoryGetProcAddress(ViCLibsDLL, 'al_get_time');
end;

initialization
begin
  BindToAllegro;
end;

finalization
begin

end;

end.
