# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []
    lines = []
    tsv.each_line { |line| lines << line.chomp }
    keys = lines[0].split("\t")

    (1..lines.length - 1).each do |num|
      values = lines[num].split("\t")
      result = {}
      keys.each_with_index { |key, idx| result[key] = values[idx] }
      @data << result
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    string = ''
    string <<  'date	student_id	languages	'
    string <<  "best_language	app_experience	tech_experience\n"
    @data.each do |hash|
      hash.each_with_index do |(_, value), idx|
        string << (idx == (hash.length - 1) ? value.to_s : value.to_s + "\t")
      end
      string << "\n"
    end
    string
  end
end
