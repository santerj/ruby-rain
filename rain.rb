#!/usr/bin/ruby

def get_terminal_size()
	stream = %x|tput cols|
	$WIDTH = stream.chomp.to_i - 1
	stream = %x|tput lines|
	$HEIGHT = stream.chomp.to_i - 1
end

def animation()
	$db = []
	for i in (0..$WIDTH)
		$db.push(Array.new($HEIGHT, " "))
	end

	while true
		
		# pop the last (bottom) symbol from array,
		# insert random symbol at 0

		for x in (0..$WIDTH)
			$db[x].pop
			case rand(100)
			when 0
				$db[x].unshift("|")
			when 1
				$db[x].unshift(":")
			else
				$db[x].unshift(" ")
			end
		end

		# make the rain fall

		for y in (0..$db[0].size-1)
			for x in (0..$db.size-1)
				print $db[x][y]
			end
			puts ""
		end

	sleep(0.02)

	end

end

get_terminal_size
animation()
