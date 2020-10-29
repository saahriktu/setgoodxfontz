(* setgoodxfontz v0.2
 Program which extracts ~/.config/fontconfig/fonts.conf
 Under GNU GPLv3
 2020 (c) saahriktu *)
program setgoodxfontz;
{$codepage UTF8}
uses cwstring, sysutils;
var
   usrhouse, fntcfgdir, fntcfgfile : UnicodeString;
   fptr				   : TextFile;
begin
   usrhouse := GetEnvironmentVariable('HOME');
   fntcfgdir := usrhouse + '/.config/fontconfig';
   fntcfgfile := fntcfgdir + '/fonts.conf';
   if ForceDirectories(fntcfgdir) = False then begin
      writeln('Error: access denied');
      exit;
   end;
   assign(fptr, fntcfgfile);
   rewrite(fptr);
   writeln(fptr, '<?xml version=''1.0''?>');
   writeln(fptr, '<!DOCTYPE fontconfig SYSTEM ''fonts.dtd''>');
   writeln(fptr, '<fontconfig>');
   writeln(fptr, '	<match target="font">');
   writeln(fptr, '		<edit mode="assign" name="antialias">');
   writeln(fptr, '			<bool>true</bool>');
   writeln(fptr, '		</edit>');
   writeln(fptr, '		<edit mode="assign" name="embeddedbitmap">');
   writeln(fptr, '			<bool>false</bool>');
   writeln(fptr, '		</edit>');
   writeln(fptr, '		<edit mode="assign" name="hinting">');
   writeln(fptr, '			<bool>true</bool>');
   writeln(fptr, '		</edit>');
   writeln(fptr, '		<edit mode="assign" name="hintstyle">');
   writeln(fptr, '			<const>hintslight</const>');
   writeln(fptr, '		</edit>');
   writeln(fptr, '		<edit mode="assign" name="lcdfilter">');
   writeln(fptr, '			<const>lcdlegacy</const>');
   writeln(fptr, '		</edit>');
   writeln(fptr, '		<edit mode="assign" name="rgba">');
   writeln(fptr, '			<const>none</const>');
   writeln(fptr, '		</edit>');
   writeln(fptr, '	</match>');
   writeln(fptr, '</fontconfig>');
   close(fptr);
end.

