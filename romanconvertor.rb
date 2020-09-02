Roman_Map = {
	1000 => "M",
	900 => "CM",
	500 => "D",
	400 => "CD",
	100 => "C",
	90 => "XC",
	50 => "L",
	40 => "XL",
	10 => "X",
	9 => "IX",
	5 => "V",
	4 => "IV",
	1 => "I"
}

def fromRoman(romanNumber)
	# Replace the following line with the actual code!
	if not romanNumber.match? /\A[IVXLCDM]*\z/
		raise TypeError
	end
	toReturn = 0
	Roman_Map.values.each do |roman|
		while romanNumber.start_with?(roman)
			toReturn += Roman_Map.invert[roman]
			romanNumber = romanNumber.slice(roman.length, romanNumber.length)
		end
	end
	return toReturn
end

def toRoman(arabicNumber)
	if arabicNumber >3999 or arabicNumber <1
		raise RangeError
	end
	
	# Replace the following line with the actual code!
	toReturn = ""
	Roman_Map.keys.each do |diff|
		q, m = arabicNumber.divmod(diff)
		toReturn << Roman_Map[diff] * q
		arabicNumber = m
	end
	return toReturn
end