=begin

Text Analyzer - Sandwich Code

Fill out the rest of the Ruby code below so that print output like that shown in
"Sample Output." You should read the text from a simple text file that you
provide. (We also supply some example text below, but try the program with your
text as well.)

Read the text file in the #process method and pass the text to the block
provided in each call. Everything you need to work on is either part of the
#process method or part of the blocks. You need no other additions or changes.

The text you use does not have to produce the same numbers as the sample output
but should have the indicated format.

class TextAnalyzer
  def process
    # your implementation
  end
end

analyzer = TextAnalyzer.new
analyzer.process { puts # your implementation }
analyzer.process { puts # your implementation }
analyzer.process { puts # your implementation }

Sample Text File:

Sample Output:

3 paragraphs
15 lines
126 words

=end

class TextAnalyzer
  def initialize(fname)
    @fname = fname
  end

  def process
    text = File.read(@fname)
    yield(text)
  end

  # Alternatively doing a `sandwich code` between #open and #close
  def process2
    file = File.open(@fname, 'r')
    yield(file.read)
    file.close
  end
end

# Eiusmod non aute commodo excepteur amet consequat ex elit. Ut excepteur ipsum
# enim nulla aliqua fugiat quis dolore do minim non. Ad ex elit nulla commodo
# aliqua eiusmod aliqua duis officia excepteur eiusmod veniam. Enim culpa laborum
# nisi magna esse nulla ipsum ex consequat. Et enim et quis excepteur tempor ea
# sit consequat cupidatat.
#
# Esse commodo magna dolore adipisicing Lorem veniam quis ut labore pariatur quis
# aliquip labore ad. Voluptate ullamco aliquip cillum cupidatat id in sint ipsum
# pariatur nisi adipisicing exercitation id adipisicing qui. Nulla proident ad
# elit dolore exercitation cupidatat mollit consequat enim cupidatat tempor
# aliqua ea sunt ex nisi non.
#
# Officia dolore labore non labore irure nisi ad minim consectetur non irure
# veniam dolor. Laboris cillum fugiat reprehenderit elit consequat ullamco veniam
# commodo.

analyzer = TextAnalyzer.new('sample.txt')
analyzer.process { |str| puts  "#{str.split("\n\n").size} paragraphs"}
analyzer.process { |str| puts  "#{str.split("\n").size} lines"}
analyzer.process { |str| puts  "#{str.split(' ').size} words"}

# 3 paragraphs
# 15 lines
# 126 words

# In particle physics, asymptotic freedom is a property of some gauge theories
# that causes interactions between particles to become asymptotically weaker as
# the energy scale increases and the corresponding length scale decreases.
#
# Asymptotic freedom is a feature of quantum chromodynamics (QCD), the quantum
# field theory of the strong interaction between quarks and gluons, the
# fundamental constituents of nuclear matter. Quarks interact weakly at high
# energies, allowing perturbative calculations. At low energies the interaction
# becomes strong, leading to the confinement of quarks and gluons within composite
# hadrons.
#
# The asymptotic freedom of QCD was discovered in 1973 by David Gross and Frank
# Wilczek,[1] and independently by David Politzer in the same year.[2] For this
# work all three shared the 2004 Nobel Prize in Physics.[3]
puts
analyzer = TextAnalyzer.new('sample2.txt')
analyzer.process { |str| puts  "#{str.split("\n\n").size} paragraphs"}
analyzer.process { |str| puts  "#{str.split("\n").size} lines"}
analyzer.process { |str| puts  "#{str.split(' ').size} words"}

# 3 paragraphs
# 14 lines
# 122 words
