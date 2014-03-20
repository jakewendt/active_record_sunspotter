#namespace :app do
#	task :import => :environment do
#		f = File.open('TheKingJamesBible.txt','r')
#		{} until( ( line = f.gets ) =~ /^The First Book of Moses:  Called Genesis\s*$/ )
#		puts line
#		f.close	#	File.open('TheKingJamesBible.txt','r')
#	end	#	task :import => :environment do
#end	#	namespace :app do
namespace :app do
	task :import => :environment do
		File.open('data/TheKingJamesBible.txt','r') do |f|
			until ( line = f.gets ).match(/^\*\*\*/) 
			#	skip
			end
			while ( line = f.gets ).match(/^\s*$/)
			#	skip
			end
			puts line 
			#	=> The Old Testament of the King James Version of the Bible

			chapter_num = verse_num = book = chapter = verse = nil
			new_line_counter = 0
			book_counter = 0
			buffer = ''


#	basic expectations ...
#
#	book ends with >4 new lines but can include new lines (<=2 only)
#	first verse is after >2 new lines

			while cval = f.getc
				next if cval == "\r"	#13

				if cval == "\n"	#10
					new_line_counter += 1
					buffer << ' '
					next
				end


				if new_line_counter > 4 && book && chapter && verse && !buffer.blank?
					#	last verse of book
					puts "-- CH:#{chapter_num}:V:#{verse_num}:#{buffer}"
					verse.body = buffer.squish
					verse.save
					buffer = ''
					chapter_num = verse_num = book = chapter = verse = nil
				end

#	2 new lines isn't just for new books
#	some chapters are separated by 2 new lines
#	so need more somehow.  Psalms is causing the problem with the extra new line between chapters
#	manually removed them
				if new_line_counter > 2 && !buffer.blank?
					puts "\n\nLooks like a new book is here:#{buffer.squish}:\n"
					book_counter += 1
					#book = buffer.squish
					book = Book.create(:title => buffer.squish)
					buffer = ''
				end

				buffer << cval	#.chr

				if buffer.match(/^([\D]*)(\d+):(\d+)\s+/) #or ( buffer =~ /^([\D]*)End of the Project Gutenberg EBook/ )
					text = $1	#	previous verse
					if chapter_num && verse_num && text
						puts "CH:#{chapter_num}:V:#{verse_num}:#{text}"
						verse.body = text.squish
						verse.save
					end
					#chapter = $2.squish #if $2
					chapter = book.chapters.find_or_create_by(:position => $2.to_i)
					chapter_num = $2.squish #if $2
##	I guess that the verse number is just going to be the position?
##	relax self!  just a demo!
					#verse = $3.squish #if $3
					verse = chapter.verses.new(:position => $3.to_i)	#create(:body => $3)
					verse_num = $3.squish #if $3
					buffer= ''
				end

				break if buffer =~ /End of the Project Gutenberg EBook/

				#	reset counter (perhaps way too often)
				new_line_counter = 0 if cval != "\n"	#	10
			end
			puts book_counter
		end	#	File
	end	#	task

end	#	namespace

__END__


40:38 For the cloud of the LORD was upon the tabernacle by day, and
fire was on it by night, in the sight of all the house of Israel,
throughout all their journeys.




The Third Book of Moses:  Called Leviticus


1:1 And the LORD called unto Moses, and spake unto him out of the
tabernacle of the congregation, saying, 1:2 Speak unto the children of
Israel, and say unto them, If any man of you bring an offering unto
the LORD, ye shall bring your offering of the cattle, even of the
herd, and of the flock.



CH:40:V:37:But if the cloud were not taken up, then they journeyed not till the day that it was taken up.  
create new book with title:For the cloud of the LORD was upon the tabernacle by day, and fire was on it by night, in the sight of all the house of Israel, throughout all their journeys.  :
create new book with title:   The Third Book of Moses:  Called Leviticus  :
CH:1:V:1:And the LORD called unto Moses, and spake unto him out of the tabernacle of the congregation, saying, 
CH:1:V:2:Speak unto the children of Israel, and 


The First Book of Moses:  Called Genesis


1:1 In the beginning God created the heaven and the earth.

1:2 And the earth was without form, and void; and darkness was upon
the face of the deep. And the Spirit of God moved upon the face of the
waters.

FYI, some verses actually have multiple "paragraphs" .

Also, some verses are merged on the same line?

3:1 Now the serpent was more subtil than any beast of the field which
the LORD God had made. And he said unto the woman, Yea, hath God said,
Ye shall not eat of every tree of the garden?  3:2 And the woman said
unto the serpent, We may eat of the fruit of the trees of the garden:
3:3 But of the fruit of the tree which is in the midst of the garden,
God hath said, Ye shall not eat of it, neither shall ye touch it, lest
ye die.




50:26 So Joseph died, being an hundred and ten years old: and they
embalmed him, and he was put in a coffin in Egypt.




The Second Book of Moses:  Called Exodus


1:1 Now these are the names of the children of Israel, which came
into Egypt; every man and his household came with Jacob.

1:2 Reuben, Simeon, Levi, and Judah, 1:3 Issachar, Zebulun, and
Benjamin, 1:4 Dan, and Naphtali, Gad, and Asher.

1:5 And all the souls that came out of the loins of Jacob were seventy
souls: for Joseph was in Egypt already.

1:6 And Joseph died, and all his brethren, and all that generation.

1:7 And the children of Israel were fruitful, and increased
abundantly, and multiplied, and waxed exceeding mighty; and the land
was filled with them.

1:8 Now there arose up a new king over Egypt, which knew not Joseph.

1:9 And he said unto his people, Behold, the people of the children of
Israel are more and mightier than we: 1:10 Come on, let us deal wisely
with them; lest they multiply, and it come to pass, that, when there
falleth out any war, they join also unto our enemies, and fight
against us, and so get them up out of the land.

1:11 Therefore they did set over them taskmasters to afflict them with
their burdens. And they built for Pharaoh treasure cities, Pithom and
Raamses.

1:12 But the more they afflicted them, the more they multiplied and
grew.

And they were grieved because of the children of Israel.






4:5 Behold, I will send you Elijah the prophet before the coming of
the great and dreadful day of the LORD: 4:6 And he shall turn the
heart of the fathers to the children, and the heart of the children to
their fathers, lest I come and smite the earth with a curse.


***




The New Testament of the King James Bible




The Gospel According to Saint Matthew


1:1 The book of the generation of Jesus Christ, the son of David, the
son of Abraham.


