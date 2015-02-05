require 'rails_helper'

describe Node do
  describe '.sorted' do
    before do
      Seeds.load
    end

    it 'returns nodes in the correct order' do
      expect(described_class.sorted.map(&:name)).to eq %w{
        Home
        A
        B
        C
        D
        E
        F
        G
        H
        I
        J
        K
        L
        M
        N
        O
        P
        Q
        R
        S
        T
        U
        V
        W
        X
      }
    end
  end
end
