class HighScores

  private

  def initialize(scores)
    reset(scores)
  end

  def scores=(scores)
    reset(scores)
    self
  end

  public

  attr_reader :scores,
              :latest,
              :personal_top_three,
              :personal_best,
              :latest_is_personal_best # latest_is_personal_best?

  alias latest_is_personal_best? latest_is_personal_best
  undef latest_is_personal_best

  def reset(scores)
    @scores = scores
    @latest = scores.last
    @personal_top_three = scores.max(3)
    @personal_best = personal_top_three.max
    @latest_is_personal_best = latest == personal_best
    self
  end

  def add score
    reset([*scores, score])
  end

  alias + add
  alias << add

end


if defined? MiniTest

  describe 'Mentor Augmented Tests' do

    it 'must not keep method latest_is_personal_best after query method is created' do
      expected = false
      actual = HighScores.instance_methods(false)
      expect(actual).wont_include :latest_is_personal_best, "\n\tCleanup non-query latest_is_personal_best method\n\n"
    end

  end

  describe 'User Augmented Tests' do

    it 'must append the lastest score and update the object using +' do
      game = HighScores.new [20, 80, 30]
      game + 3
      actual = game.scores
      expected = [20, 80, 30, 3]
      expect(actual).must_equal expected
    end

    it 'must append the lastest score and update the object using <<' do
      game = HighScores.new [20, 80, 30]
      game << 3
      actual = game.scores
      expected = [20, 80, 30, 3]
      expect(actual).must_equal expected
    end

    it 'must append the lastest score and update the object using add' do
      game = HighScores.new [20, 80, 30]
      game.add 3
      actual = game.scores
      expected = [20, 80, 30, 3]
      expect(actual).must_equal expected
    end

    it 'must be the same object when we reset it' do
      original = HighScores.new [40,30,300]
      id = original.object_id
      expected = id
      actual = original.reset([1, 1, 1]).object_id
      expect(actual).must_equal expected
    end

    def test_list_of_scores
      scores = [30, 50, 20, 70]
      expected = [30, 50, 20, 70]
      assert_equal expected, HighScores.new(scores).scores
    end

    def test_list_of_scores_updating

      scores = [30, 50, 20, 70]
      expected = [30, 50, 20, 70]
      game = HighScores.new(scores)
      assert_equal expected, game.scores

      # Update game.scores and then compare
      # it to the list it was updated with.

      scores2 = [10, 100, 20, 80]
      expected2 = [10, 100, 20, 80]
      game.reset scores2
      assert_equal expected2, game.scores

      # Tests for other attributes once scores has updated.

      expected_latest = 80
      assert_equal expected_latest, game.latest

      expected_top_three = [100, 80, 20]
      assert_equal expected_top_three, game.personal_top_three

      expected_personal_best = 100
      assert_equal expected_personal_best, game.personal_best

      refute game.latest_is_personal_best?
    end

  end

end
