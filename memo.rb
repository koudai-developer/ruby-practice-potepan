require 'csv'

# 新しいメモを作るメソッド
def create_new_file
  puts "新しいファイル名を入力してください（拡張子不要）"
  file_name = gets.chomp + ".csv"
  if File.exist?(file_name)
    puts "ファイルが既に存在します。別の名前を入力してください。"
    return
  end
  puts "メモしたい内容を記入してください（終了:Ctrl+D）"
  content = $stdin.read
  CSV.open(file_name, "w") do |csv|
    csv << [content]
  end
  puts "#{file_name} が作成されました。"
end

# メモを編集するメソッド
def edit_existing_file
  puts "編集したいファイル名を入力してください（拡張子不要）："
  file_name = gets.chomp + ".csv"
  unless File.exist?(file_name)
    puts "指定されたファイルが見つかりません。新しいファイルを作成してください。"
    return
  end
  puts "追加するメモの内容を入力してください（終了:Ctrl+D）"
  content = $stdin.read
  CSV.open(file_name, "a") do |csv|
    csv << [content]
  end
  puts "#{file_name} に内容が追加されました。"
end

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

input = gets.chomp
case input
  when "1"
    create_new_file
  when "2"
    edit_existing_file
  else
    puts "1か2を入力してください。"
end