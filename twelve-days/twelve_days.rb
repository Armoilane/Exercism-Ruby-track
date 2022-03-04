class TwelveDays

  GIFTS = {
    first:    'a Partridge in a Pear Tree.',
    second:   'two Turtle Doves, and ',
    third:    'three French Hens, ',
    fourth:   'four Calling Birds, ',
    fifth:    'five Gold Rings, ',
    sixth:    'six Geese-a-Laying, ',
    seventh:  'seven Swans-a-Swimming, ',
    eighth:   'eight Maids-a-Milking, ',
    ninth:    'nine Ladies Dancing, ',
    tenth:    'ten Lords-a-Leaping, ',
    eleventh: 'eleven Pipers Piping, ',
    twelfth:  'twelve Drummers Drumming, '
  }

  SETUPLINE = "On the %s day of Christmas my true love gave to me: %s\n\n"

  def self.song
    lyrics ||= ''
    gift_sumup ||= ''

    GIFTS.each do |nth_day, gift_of_the_day|
      gift_sumup = "#{gift_of_the_day}" + "#{gift_sumup}"
      lyrics << format(SETUPLINE, nth_day, gift_sumup)
    end

    lyrics.chomp

  end

end
