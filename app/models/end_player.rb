class EndPlayer < ApplicationRecord
  def self.guest
    find_or_create_by!(email: 'g@g') do |end_player|
      end_player.password = gggggg
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
end
