# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def chomped_lines(tsv)
    tsv.each_line.map(&:chomp)
  end

  def take_tsv(tsv)
    lines = chomped_lines(tsv)
    keys = lines[0].split("\t")
    @data = (1..lines.length - 1).map do |num|
      values = lines[num].split("\t")
      keys.zip(values).to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    title = @data[0].keys.join("\t") + "\n"
    string = @data.map do |hash|
      hash.values.join("\t")
    end
    title + string.join("\n") + "\n"
  end
end
