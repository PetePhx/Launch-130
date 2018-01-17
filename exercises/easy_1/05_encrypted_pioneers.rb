=begin

Encrypted Pioneers

The following list contains the names of individuals who are pioneers in the
field of computing or that have had a significant influence on the field. The
names are in an encrypted form, though, using a simple (and incredibly weak)
form of encryption called Rot13.

Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

Write a program that deciphers and prints each of these names .

=end

def decipher_rot(str, rot = 13)
  str.chars.map do |ch|
    case ch
    when 'a'..'z' then ((ch.ord - 'a'.ord - rot ) % 26 + 'a'.ord).chr
    when 'A'..'Z' then ((ch.ord - 'A'.ord - rot ) % 26 + 'A'.ord).chr
    else ch
    end
  end.join
end

str =
'Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu'

puts decipher_rot(str)

# Ada Lovelace
# Grace Hopper
# Adele Goldstine
# Alan Turing
# Charles Babbage
# Abdullah Muhammad bin Musa al-Khwarizmi
# John Atanasoff
# Lois Haibt
# Claude Shannon
# Steve Jobs
# Bill Gates
# Tim Berners-Lee
# Steve Wozniak
# Konrad Zuse
# Sir Antony Hoare
# Marvin Minsky
# Yukihiro Matsumoto
# Hayyim Slonimski
# Gertrude Blanch
