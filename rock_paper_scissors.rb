
winner = 0 #0:あいこ,1:自分の勝ち,2:相手の勝ち,3:じゃんけんからやり直し
RPS_CHOISE = ['グー', 'チョキ', 'パー']
POINTING_CHOISE = ['上','下','左','右']
RESULTS = [
    'あいこで...', 
    "あなたの勝ち\n------------------------------------------",
    "あなたの負け\n------------------------------------------",
    'じゃんけん...'
]

def result_comment(auto_selected,selected,choise)
    <<~TEXT
    ------------------------------------------
    相手：#{choise[auto_selected]}を選びました
    あなた：#{choise[selected]}を選びました
    ------------------------------------------
    TEXT
end

def pointing(winner)

    pointing_auto_selected = rand(0..3)
    puts "あっちむいて〜\n0(上)\ 1(下)\ 2(左)\ 3(右)\ 4(戦わない)"
    pointing_selected = gets.chomp

    case pointing_selected 
    when /^[0-3]$/
        pointing_selected = pointing_selected.to_i
        unless pointing_selected == pointing_auto_selected
            winner = 3
        end
        puts result_comment(pointing_auto_selected, pointing_selected, POINTING_CHOISE)
        winner
    when '4'
        puts 'あっち向いてホイを終了します。'
        exit
    else
        raise '0,1,2,3のうちいずれかを選択してください。'
    end
end

puts "じゃんけん..."
while winner == 0 || winner == 3
    puts "0(グー)\ 1(チョキ)\ 2(パー)\ 3(戦わない)"
    rps_selected = gets.chomp
    rps_auto_selected = rand(0..2)

    case rps_selected 
    when /^[0-2]$/
        puts 'ほい!'
        rps_selected = rps_selected.to_i
        puts result_comment(rps_auto_selected, rps_selected, RPS_CHOISE)
        case rps_selected
        when rps_auto_selected + 2, rps_auto_selected - 1
            winner = 1
            winner = pointing(winner)
        when rps_auto_selected
            winner = 0
        else
            winner = 2
            winner = pointing(winner)
        end
    when '3'
        puts 'あっち向いてホイを終了します'
        exit
    else
        raise "0,1,2,3のいずれかを入力してください!"
    end
    puts RESULTS[winner]
end