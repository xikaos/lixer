defmodule Lixer do
  @moduledoc """
  Documentation for Lixer.
  """

  def spit_log(filename) do
    {:ok, log} = File.read filename
    String.split(log, "\n", trim: true)
  end

  def color_time(str) do
    str = Regex.run(~r/(\d{2}:\d{2}:\d{2})/, str, capture: :first) |> to_string
    IO.ANSI.white <> str
  end

  def color_src(str) do
    if Regex.match?(~r/IP\s(?<src>.*)\s>/, str) do
      IO.ANSI.green <> (Regex.named_captures(~r/IP\s(?<src>.*)\s>/, str))["src"]
    else 
      ""
    end
  end

  def color_dst(str) do
    if Regex.match?(~r/>\s(?<dst>.*):/, str) do
      IO.ANSI.red <> (Regex.named_captures(~r/>\s(?<dst>.*):\s/, str))["dst"]
    else 
      ""
    end
  end

  def color_flag(str) do
    if Regex.match?(~r/Flags\s\[(?<flag>.){1,2}\]/,str)  do
      IO.ANSI.blue <> "Flags: [" <> (Regex.named_captures(~r/Flags\s\[(?<flag>[F,P]?.){1,2}\]/, str))["flag"] <> "]"
    else 
      IO.ANSI.yellow <> "UDP" <> " "
    end 
  end
end
      log = Lixer.spit_log('tcp.log')
      color = Enum.map(log, fn(l) -> 
        Lixer.color_time(l) <> "\s" 
        <> Lixer.color_src(l) <> "\s" 
        <> Lixer.color_dst(l) <> "\s"
        <> Lixer.color_flag(l) <> "\n"
      end)
      IO.puts color
      
      
      
      
