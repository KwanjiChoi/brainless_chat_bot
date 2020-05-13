require 'gtk3'
require './brainless.rb'

window = Gtk::Window.new
#タイトル設定
window.set_title('人工無能チャットボット　ちんぱん')
#ウィンドウのサイズ設定
window.set_size_request(580, 350)
#ウィンドウの背景設定
cyan = Gdk::RGBA::new(0.2, 0.6, 0.2, 0.7)
window.override_background_color(:normal, cyan)
@noby = Unmo.new('noby')

def put_text(entry, textview)
  if entry.text == ''
    textview.buffer.text += "  ちんぱん> ちょっと何言ってるかわかりません\n\n"
  else
    response = @noby.dialogue(entry.text)
    textview.buffer.text += "  > #{entry.text}\n"
    textview.buffer.text += "  ちんぱん> #{response}\n\n"  # Entryの内容をTextVeiwのテキストに追加
    entry.text = ''     # Entryの文字を消す
    entry.grab_focus    # ボタンをクリックしてもフォーカスをEntryに戻す
  end
end

text_area1 = Gtk::TextView.new
text_area1.buffer.text += "  ちんぱん> こんにちはちんぱんです！\n"

text_area2 = Gtk::TextView.new
text_area2.set_size_request(275, 60)

entry_area = Gtk::Entry.new
entry_area.set_size_request(350, -1)
entry_area.signal_connect("activate") do
  put_text(entry_area, text_area1)
end


#ボタンの実装
button = Gtk::Button.new
button.set_label('Button')
button.signal_connect("clicked") do
  put_text(entry_area, text_area1)
  #ボタンが押されたらテキストの最後にスクロールする
  end_mark = text_area1.buffer.create_mark(nil, text_area1.buffer.end_iter, true)
  text_area1.scroll_to_mark(end_mark, 0.0, false, 0.0, 1.0)
end


#スクロールバーの実装
scrolled_area = Gtk::ScrolledWindow.new
scrolled_area.set_size_request(220, 260)
scrolled_area.set_policy(:never, :always)  # スクロールバー；横は無し、縦は常に表示
scrolled_area.add(text_area1)

#imageの実装
img = Gtk::Image.new(file: "images/チンパンジー.jpeg")
img.set_size_request(50,50)

#ウィンドウコンテンツの位置指定
fixed = Gtk::Fixed.new
fixed.put(text_area2, 20,220)
fixed.put(img,  20,20)
fixed.put(scrolled_area,  330,  20)
fixed.put(entry_area, 20, 300)
fixed.put(button,    380, 300)

entry_area.grab_focus     # フォーカスをEntryに

window.add(fixed)
window.show_all
window.signal_connect("destroy") { Gtk.main_quit }
Gtk.main
