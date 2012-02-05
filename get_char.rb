def get_char
        # return char from input or C-? C-A-?. 
        key = ""
        begin
                  system("stty raw -echo")
                  f = STDIN.getc
                  if (1..26) === f
                          key = "C-" + (f + 96).chr
                  elsif f == ?\e
                        c = STDIN.getc
                        if (1..26) === c
                                key = "C-A-" + (c + 96).chr
                        else
                                key = "A-" + c.chr
                        end
                  else
                          if f >= 208
                                  key = f.chr + STDIN.getc.chr
                          else
                                  key = f.chr
                          end
                  end
        ensure
                  system("stty -raw -brkint -ignpar -istrip iutf8 echo")
        end
        key
end

