RSpec.describe Diamond do

  let(:instance) { described_class.new }

  describe '#build' do
    subject { instance.build(input) }

    context "when given an A character" do
      let(:input) { 'A' }
      it { is_expected.to eq("A\n") }
    end

    context "when given a B character" do
      let(:input) { 'B' }
      it { is_expected.to eq("_A_\nB_B\n_A_\n") }
    end

    context "when given a C character" do
      let(:input) { 'C' }
      it { is_expected.to eq("__A__\n_B_B_\nC___C\n_B_B_\n__A__\n") }
    end

    context "when given a J character" do
      let(:input) { 'J' }
      it { is_expected.to eq(<<~EXAMPLE) }
        _________A_________
        ________B_B________
        _______C___C_______
        ______D_____D______
        _____E_______E_____
        ____F_________F____
        ___G___________G___
        __H_____________H__
        _I_______________I_
        J_________________J
        _I_______________I_
        __H_____________H__
        ___G___________G___
        ____F_________F____
        _____E_______E_____
        ______D_____D______
        _______C___C_______
        ________B_B________
        _________A_________
      EXAMPLE
    end

    # Custom tests
    context "when given the alphabet letter" do
      ('A'..'z').to_a.each do |letter|
        it "#{letter}, should have #{(letter.upcase.ord - 'A'.ord) * 2 + 1} lines" do
          subject = described_class.new

          expect(subject.build(letter).lines.count).to eql((letter.upcase.ord - 'A'.ord) * 2 + 1)
        end
      end
    end

    context "when given an empty string" do
      let(:input) { '' }

      it { is_expected.to eq('') }
    end

    context "when given a non string input" do
      let(:input) { 1 }

      it { is_expected.to eq('') }
    end
  end
end
