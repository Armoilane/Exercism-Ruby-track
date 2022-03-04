class TwoFer
  TWO_FER =
    {
      English: 'One for %<name>s, one for me.',
      Chinese: '一個給%<name>s, 一個給我',
      Dutch:   'Eén voor %<name>s, één voor mij.',
      German:  'Einer für den %<name>s, einer für mich.',
      Spanish: 'Uno para el %<name>s, uno para mí.',
      Finnish: 'Yksi %<name>slle, yksi minulle.'
    }

  def self.two_fer(name = 'you', language = :English)
    TWO_FER[language] % { name: name }
  end
end

if $PROGRAM_NAME == __FILE__
  puts TwoFer.two_fer
  puts TwoFer.two_fer 'Jorge', :Spanish
  puts TwoFer.two_fer 'Bjorn', :Dutch
  puts TwoFer.two_fer 'George'
  puts TwoFer.two_fer 'Ari', :Finnish
end
