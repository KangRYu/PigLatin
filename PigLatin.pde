char[] vowels = new char[]{'a', 'e', 'i', 'o', 'u'};

public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  	System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord)
{
	for(int i = 0; i < sWord.length(); i++) {
		for(int j = 0; j < vowels.length; j++) {
			if(sWord.charAt(i) == vowels[j]) {
				return i;
			}
		}
	}
	return -1;
}

public String moveQu(String sWord) {
	if(sWord.length() >= 2) {
		if(sWord.substring(0, 2).equals("qu")) {
			sWord = sWord.substring(2) + "qu";
		}
	}
	return sWord;
}

public String moveConsonants(String sWord) {
	for(int i = 0; i < sWord.length(); i++) {
		boolean consanant = true;
		for(char c : vowels) {
			if(sWord.charAt(0) == c) {
				consanant = false;
			}
		}
		if(consanant) {
			sWord += sWord.substring(0, 1);
			sWord = sWord.substring(1);
		}
		else {
			break;
		}
	}
	return sWord;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(sWord.length() == 0) {
		return "";
	}
	if(findFirstVowel(sWord) != 0)
	{
		sWord = moveQu(sWord);
		sWord = moveConsonants(sWord);
		return sWord + "ay";
	}
	else {
		sWord = moveQu(sWord);
		sWord = moveConsonants(sWord);
		return sWord + "way";
	}
}
