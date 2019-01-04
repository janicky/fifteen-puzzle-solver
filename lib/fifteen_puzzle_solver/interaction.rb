class FifteenPuzzleSolver::Interaction
  def self.read_char
    begin
      old_state = `stty -g`
      system "stty raw -echo"
      c = STDIN.getc.chr

      if c == "\e"
        extra_thread = Thread.new {
          c = c + STDIN.getc.chr
          c = c + STDIN.getc.chr
        }
        extra_thread.join(0.00001)
        extra_thread.kill
      end
    rescue => exception
      puts exception.backtrace
    ensure
      system "stty #{old_state}"
    end
    c
  end
end
