class LineAnalyzer

  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number
  
  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    calculate_word_frequency()
  end
  def calculate_word_frequency()
    @highest_wf_words = []
    hash = Hash.new(0)
    @content.downcase.split.each do |word|
      hash[word] += 1
    end
    @highest_wf_count = hash.values.max
    hash.keys.select do |key| 
      if hash[key] == @highest_wf_count
        @highest_wf_words.push(key)
      end
    end
    
  end
  
end


class Solution


  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  
  def initialize
    @analyzers = Array.new
  end
  def analyze_file()
    line_count = 0
    File.foreach("test.txt") do |line|
      line_count += 1
      @analyzers.push(LineAnalyzer.new(line, line_count))
    end
  end
  def calculate_line_with_highest_frequency
    array_v = []
    @highest_count_words_across_lines = []
    @analyzers.each do  |element| array_v.push (element.highest_wf_count)
    end
    @highest_count_across_lines = array_v.max
    
    @analyzers.each do |element| if element.highest_wf_count == @highest_count_across_lines
      @highest_count_words_across_lines.push (element)
    end
  end
end

def print_highest_word_frequency_across_lines
  p @highest_count_words_across_lines
end
end